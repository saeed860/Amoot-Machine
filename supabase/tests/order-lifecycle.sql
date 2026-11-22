-- Runs against a disposable CI database after all Supabase migrations.
\set ON_ERROR_STOP on
insert into auth.users(id,email,raw_user_meta_data)
values ('11111111-1111-4111-8111-111111111111','ci-customer@example.test','{"display_name":"CI Customer"}'::jsonb);

insert into public.products(sku,name,category,price_irr,stock,status)
values ('CI-LIFECYCLE','CI lifecycle test product','CI',1000,10,'ACTIVE')
on conflict (sku) do update set price_irr=1000,stock=10,status='ACTIVE';

do $$
declare
  v_order record;
  v_stock integer;
  v_cancelled record;
  v_replay record;
  v_delivery record;
  v_movement_count integer;
  v_receipt record;
begin
  select * into v_order from public.amoot_create_order(
    '11111111-1111-4111-8111-111111111111',
    'ci-cancel-key-0001',
    '[{"sku":"CI-LIFECYCLE","quantity":2}]'::jsonb,
    '{"recipient":"CI","phone":"123456789","province":"CI","city":"CI","addressLine":"CI test address"}'::jsonb
  );
  select stock into v_stock from public.products where sku='CI-LIFECYCLE';
  if v_stock <> 8 then raise exception 'Expected stock 8 after order, got %',v_stock; end if;
  select count(*) into v_movement_count from public.inventory_movements
    where sku='CI-LIFECYCLE' and movement_type='ORDER' and reference=v_order.order_number
      and quantity_delta=-2 and stock_before=10 and stock_after=8;
  if v_movement_count <> 1 then raise exception 'Order stock movement was not recorded exactly once'; end if;

  -- A retry with the exact same key and payload returns the original order without charging stock twice.
  select * into v_replay from public.amoot_create_order(
    '11111111-1111-4111-8111-111111111111',
    'ci-cancel-key-0001',
    '[{"sku":"CI-LIFECYCLE","quantity":2}]'::jsonb,
    '{"recipient":"CI","phone":"123456789","province":"CI","city":"CI","addressLine":"CI test address"}'::jsonb
  );
  if v_replay.order_number <> v_order.order_number then
    raise exception 'Idempotent retry returned a different order';
  end if;
  select stock into v_stock from public.products where sku='CI-LIFECYCLE';
  if v_stock <> 8 then raise exception 'Idempotent retry reduced stock twice: %',v_stock; end if;

  -- Reusing the same key with a changed payload must be rejected.
  begin
    perform * from public.amoot_create_order(
      '11111111-1111-4111-8111-111111111111',
      'ci-cancel-key-0001',
      '[{"sku":"CI-LIFECYCLE","quantity":1}]'::jsonb,
      '{"recipient":"CI","phone":"123456789","province":"CI","city":"CI","addressLine":"CI test address"}'::jsonb
    );
    raise exception 'Expected changed idempotency payload to be rejected';
  exception when others then
    if sqlerrm not like '%IDEMPOTENCY_CONFLICT%' then raise; end if;
  end;

  select * into v_cancelled from public.amoot_update_order_status(v_order.order_number,'CANCELLED');
  select stock into v_stock from public.products where sku='CI-LIFECYCLE';
  if v_stock <> 10 then raise exception 'Expected stock restored to 10, got %',v_stock; end if;
  select count(*) into v_movement_count from public.inventory_movements
    where sku='CI-LIFECYCLE' and movement_type='CANCELLATION' and reference=v_order.order_number
      and quantity_delta=2 and stock_before=8 and stock_after=10;
  if v_movement_count <> 1 then raise exception 'Cancellation stock movement was not recorded exactly once'; end if;

  -- Repeating the same terminal state must not restore stock twice.
  perform * from public.amoot_update_order_status(v_order.order_number,'CANCELLED');
  select stock into v_stock from public.products where sku='CI-LIFECYCLE';
  if v_stock <> 10 then raise exception 'Cancellation replay changed stock: %',v_stock; end if;

  -- Terminal cancellation cannot be reversed.
  begin
    perform * from public.amoot_update_order_status(v_order.order_number,'CONFIRMED');
    raise exception 'Expected cancelled order transition to be rejected';
  exception when others then
    if sqlerrm not like '%INVALID_ORDER_TRANSITION%' then raise; end if;
  end;

  select * into v_delivery from public.amoot_create_order(
    '11111111-1111-4111-8111-111111111111',
    'ci-delivery-key-0001',
    '[{"sku":"CI-LIFECYCLE","quantity":1}]'::jsonb,
    '{"recipient":"CI","phone":"123456789","province":"CI","city":"CI","addressLine":"CI test address"}'::jsonb
  );
  perform * from public.amoot_update_order_status(v_delivery.order_number,'CONFIRMED');
  perform * from public.amoot_update_order_status(v_delivery.order_number,'PROCESSING');
  perform * from public.amoot_update_order_status(v_delivery.order_number,'SHIPPED');
  perform * from public.amoot_update_order_status(v_delivery.order_number,'DELIVERED');

  begin
    perform * from public.amoot_update_order_status(v_delivery.order_number,'CANCELLED');
    raise exception 'Expected delivered order transition to be rejected';
  exception when others then
    if sqlerrm not like '%INVALID_ORDER_TRANSITION%' then raise; end if;
  end;
  select stock into v_stock from public.products where sku='CI-LIFECYCLE';
  if v_stock <> 9 then raise exception 'Delivered order stock must remain consumed, got %',v_stock; end if;
  update public.products set stock=stock+3 where sku='CI-LIFECYCLE';
  select count(*) into v_movement_count from public.inventory_movements
    where sku='CI-LIFECYCLE' and movement_type='ADJUSTMENT' and quantity_delta=3
      and stock_before=9 and stock_after=12;
  if v_movement_count <> 1 then raise exception 'Manual stock adjustment was not recorded'; end if;

  select * into v_receipt from public.amoot_receive_inventory(
    'CI-WR-0001','CI Supplier','CI-INVOICE-1','Automated receipt integration test',
    '11111111-1111-4111-8111-111111111111',
    '[{"sku":"CI-LIFECYCLE","quantity":5}]'::jsonb
  );
  select stock into v_stock from public.products where sku='CI-LIFECYCLE';
  if v_stock <> 17 then raise exception 'Expected stock 17 after warehouse receipt, got %',v_stock; end if;
  select count(*) into v_movement_count from public.inventory_movements
    where sku='CI-LIFECYCLE' and movement_type='IN' and reference='CI-WR-0001'
      and quantity_delta=5 and stock_before=12 and stock_after=17;
  if v_movement_count <> 1 then raise exception 'Warehouse receipt movement was not recorded exactly once'; end if;
  if v_receipt.receipt_number <> 'CI-WR-0001' or v_receipt.line_count <> 1 then
    raise exception 'Warehouse receipt RPC returned an unexpected result';
  end if;
end $;

do $check$
begin
  if has_function_privilege('anon','public.amoot_create_order(uuid,text,jsonb,jsonb)','EXECUTE') then
    raise exception 'anon must not execute order creation RPC';
  end if;
  if has_function_privilege('authenticated','public.amoot_create_order(uuid,text,jsonb,jsonb)','EXECUTE') then
    raise exception 'authenticated must not execute order creation RPC directly';
  end if;
  if not has_function_privilege('service_role','public.amoot_create_order(uuid,text,jsonb,jsonb)','EXECUTE') then
    raise exception 'service_role must execute order creation RPC';
  end if;
  if has_function_privilege('anon','public.amoot_receive_inventory(text,text,text,text,uuid,jsonb)','EXECUTE') then
    raise exception 'anon must not execute warehouse receiving RPC';
  end if;
  if has_function_privilege('authenticated','public.amoot_receive_inventory(text,text,text,text,uuid,jsonb)','EXECUTE') then
    raise exception 'authenticated must not execute warehouse receiving RPC';
  end if;
  if not has_function_privilege('service_role','public.amoot_receive_inventory(text,text,text,text,uuid,jsonb)','EXECUTE') then
    raise exception 'service_role must execute warehouse receiving RPC';
  end if;
  if has_function_privilege('anon','public.amoot_update_order_status(text,public.order_status)','EXECUTE') then
    raise exception 'anon must not execute order status RPC';
  end if;
  if has_function_privilege('authenticated','public.amoot_update_order_status(text,public.order_status)','EXECUTE') then
    raise exception 'authenticated must not execute order status RPC';
  end if;
  if not has_function_privilege('service_role','public.amoot_update_order_status(text,public.order_status)','EXECUTE') then
    raise exception 'service_role must execute order status RPC';
  end if;
  if has_table_privilege('anon','public.profiles','INSERT') or
     has_table_privilege('anon','public.profiles','UPDATE') or
     has_table_privilege('anon','public.profiles','DELETE') then
    raise exception 'anon must not mutate profiles directly';
  end if;
  if has_table_privilege('authenticated','public.profiles','INSERT') or
     has_table_privilege('authenticated','public.profiles','UPDATE') or
     has_table_privilege('authenticated','public.profiles','DELETE') then
    raise exception 'authenticated users must not mutate profiles directly';
  end if;
end $check$;

select 'PASS: inventory ledger order/cancellation/adjustment/warehouse receipt entries; idempotent retry; conflicting key rejected; restricted RPC privileges; cancellation restores stock once; legal transitions enforced' as result;
