-- Immutable audit ledger for every product stock change.
create table public.inventory_movements (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete restrict,
  sku text not null,
  product_name text not null,
  movement_type text not null check (movement_type in ('IN','OUT','ADJUSTMENT','ORDER','CANCELLATION')),
  quantity_delta integer not null check (quantity_delta <> 0),
  stock_before integer not null check (stock_before >= 0),
  stock_after integer not null check (stock_after >= 0),
  reference text,
  note text,
  actor_profile_id uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now()
);
create index inventory_movements_created_idx on public.inventory_movements(created_at desc);
create index inventory_movements_sku_created_idx on public.inventory_movements(sku,created_at desc);
alter table public.inventory_movements enable row level security;
revoke all on public.inventory_movements from anon, authenticated;
grant select on public.inventory_movements to service_role;
grant insert on public.inventory_movements to service_role;

create or replace function public.amoot_log_inventory_movement()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_reason text;
  v_reference text;
  v_actor uuid;
  v_delta integer;
begin
  if new.stock is not distinct from old.stock then return new; end if;
  v_delta := new.stock - old.stock;
  v_reason := coalesce(nullif(current_setting('amoot.inventory_reason', true), ''), 'ADJUSTMENT');
  if v_reason not in ('IN','OUT','ADJUSTMENT','ORDER','CANCELLATION') then v_reason := 'ADJUSTMENT'; end if;
  v_reference := nullif(current_setting('amoot.inventory_reference', true), '');
  begin
    v_actor := nullif(current_setting('amoot.inventory_actor', true), '')::uuid;
  exception when others then v_actor := null;
  end;
  insert into public.inventory_movements(
    product_id,sku,product_name,movement_type,quantity_delta,stock_before,stock_after,reference,actor_profile_id
  ) values (
    new.id,new.sku,new.name,v_reason,v_delta,old.stock,new.stock,v_reference,v_actor
  );
  return new;
end;
$$;
revoke all on function public.amoot_log_inventory_movement() from public, anon, authenticated;
create trigger products_inventory_movement
after update of stock on public.products
for each row when (old.stock is distinct from new.stock)
execute function public.amoot_log_inventory_movement();

-- Classify order deductions and cancellation restorations inside their atomic transactions.
create or replace function public.amoot_create_order(
  p_user_id uuid,
  p_idempotency_key text,
  p_items jsonb,
  p_shipping jsonb
)
returns table(order_number text, total_irr bigint, status public.order_status, created_at timestamptz)
language plpgsql security definer set search_path = ''
as $$
declare
  v_hash text;
  v_existing public.orders%rowtype;
  v_order_id uuid;
  v_order_number text;
  v_total bigint := 0;
  v_item record;
  v_product public.products%rowtype;
  v_qty integer;
  v_line bigint;
begin
  if p_user_id is null or length(coalesce(p_idempotency_key,'')) < 8 then raise exception 'VALIDATION_ERROR'; end if;
  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) < 1 or jsonb_array_length(p_items) > 40 then raise exception 'VALIDATION_ERROR'; end if;
  v_hash := md5(jsonb_build_object(
    'items',(select jsonb_agg(jsonb_build_object('sku',x.sku,'quantity',x.qty) order by x.sku)
      from (select btrim(value->>'sku') sku,sum((value->>'quantity')::integer)::integer qty
        from jsonb_array_elements(p_items) group by btrim(value->>'sku')) x),
    'shipping',p_shipping)::text);
  perform pg_advisory_xact_lock(hashtextextended(p_idempotency_key,0));
  select * into v_existing from public.orders where idempotency_key=p_idempotency_key;
  if found then
    if v_existing.user_id<>p_user_id or v_existing.request_hash<>v_hash then raise exception 'IDEMPOTENCY_CONFLICT'; end if;
    return query select v_existing.order_number,v_existing.total_irr,v_existing.status,v_existing.created_at; return;
  end if;
  for v_item in
    select btrim(value->>'sku') sku,sum((value->>'quantity')::integer)::integer qty
    from jsonb_array_elements(p_items) group by btrim(value->>'sku') order by btrim(value->>'sku')
  loop
    select * into v_product from public.products p where p.sku=v_item.sku and p.status='ACTIVE' for update;
    if not found then raise exception 'PRODUCT_NOT_FOUND'; end if;
    if v_product.price_irr is null or v_product.price_irr<=0 then raise exception 'QUOTE_REQUIRED'; end if;
    if v_product.stock<v_item.qty then raise exception 'OUT_OF_STOCK'; end if;
    v_total:=v_total+(v_product.price_irr*v_item.qty);
  end loop;
  v_order_number:='AM-'||upper(substr(replace(gen_random_uuid()::text,'-',''),1,12));
  insert into public.orders(order_number,user_id,status,total_irr,recipient,phone,province,city,postal_code,address_line,notes,idempotency_key,request_hash)
  values(v_order_number,p_user_id,'PENDING',v_total,left(coalesce(p_shipping->>'recipient',''),100),
    left(coalesce(p_shipping->>'phone',''),20),left(coalesce(p_shipping->>'province',''),80),
    left(coalesce(p_shipping->>'city',''),80),nullif(left(coalesce(p_shipping->>'postalCode',''),20),''),
    left(coalesce(p_shipping->>'addressLine',''),1000),nullif(left(coalesce(p_shipping->>'notes',''),1000),''),
    p_idempotency_key,v_hash)
  on conflict(idempotency_key) do nothing returning id into v_order_id;
  if v_order_id is null then
    select * into v_existing from public.orders where idempotency_key=p_idempotency_key;
    if v_existing.user_id<>p_user_id or v_existing.request_hash<>v_hash then raise exception 'IDEMPOTENCY_CONFLICT'; end if;
    return query select v_existing.order_number,v_existing.total_irr,v_existing.status,v_existing.created_at; return;
  end if;
  perform set_config('amoot.inventory_reason','ORDER',true);
  perform set_config('amoot.inventory_reference',v_order_number,true);
  perform set_config('amoot.inventory_actor',p_user_id::text,true);
  for v_item in
    select btrim(value->>'sku') sku,sum((value->>'quantity')::integer)::integer qty
    from jsonb_array_elements(p_items) group by btrim(value->>'sku') order by btrim(value->>'sku')
  loop
    select * into v_product from public.products p where p.sku=v_item.sku for update;
    v_qty:=v_item.qty; v_line:=v_product.price_irr*v_qty;
    update public.products set stock=stock-v_qty where id=v_product.id;
    insert into public.order_items(order_id,product_id,sku_snapshot,name_snapshot,quantity,unit_price_irr,line_total_irr)
    values(v_order_id,v_product.id,v_product.sku,v_product.name,v_qty,v_product.price_irr,v_line);
  end loop;
  return query select o.order_number,o.total_irr,o.status,o.created_at from public.orders o where o.id=v_order_id;
end;
$$;
revoke all on function public.amoot_create_order(uuid,text,jsonb,jsonb) from public,anon,authenticated;
grant execute on function public.amoot_create_order(uuid,text,jsonb,jsonb) to service_role;

create or replace function public.amoot_update_order_status(p_order_number text,p_status public.order_status)
returns table(order_number text,status public.order_status,total_irr bigint)
language plpgsql security definer set search_path = ''
as $$
declare v_order public.orders%rowtype; v_allowed boolean:=false;
begin
  select * into v_order from public.orders where public.orders.order_number=p_order_number for update;
  if not found then raise exception 'ORDER_NOT_FOUND'; end if;
  if v_order.status=p_status then return query select v_order.order_number,v_order.status,v_order.total_irr; return; end if;
  v_allowed:=case v_order.status
    when 'PENDING' then p_status in ('CONFIRMED','CANCELLED')
    when 'CONFIRMED' then p_status in ('PROCESSING','CANCELLED')
    when 'PROCESSING' then p_status in ('SHIPPED','CANCELLED')
    when 'SHIPPED' then p_status='DELIVERED'
    else false end;
  if not v_allowed then raise exception 'INVALID_ORDER_TRANSITION'; end if;
  if p_status='CANCELLED' then
    perform set_config('amoot.inventory_reason','CANCELLATION',true);
    perform set_config('amoot.inventory_reference',v_order.order_number,true);
    update public.products as p set stock=p.stock+items.quantity
    from (select oi.product_id,sum(oi.quantity)::integer quantity from public.order_items oi where oi.order_id=v_order.id group by oi.product_id) items
    where p.id=items.product_id;
  end if;
  update public.orders o set status=p_status where o.id=v_order.id
  returning o.order_number,o.status,o.total_irr into order_number,status,total_irr;
  return next;
end;
$$;
revoke all on function public.amoot_update_order_status(text,public.order_status) from public,anon,authenticated;
grant execute on function public.amoot_update_order_status(text,public.order_status) to service_role;
