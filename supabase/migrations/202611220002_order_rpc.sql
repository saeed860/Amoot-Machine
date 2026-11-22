-- Atomic, server-only order creation. Execute after the initial schema migration.
create or replace function public.amoot_create_order(
  p_user_id uuid,
  p_idempotency_key text,
  p_items jsonb,
  p_shipping jsonb
) returns public.orders
language plpgsql
security definer
set search_path = public
as $$
declare
  existing public.orders;
  created public.orders;
  item jsonb;
  product_row public.products;
  qty integer;
  total bigint := 0;
  line_total bigint;
  order_id uuid;
  order_no text := 'AM-' || upper(substr(replace(gen_random_uuid()::text,'-',''),1,10));
begin
  perform pg_advisory_xact_lock(hashtextextended(p_idempotency_key, 0));
  if length(coalesce(p_idempotency_key,'')) < 8 or length(p_idempotency_key) > 120 then
    raise exception 'INVALID_IDEMPOTENCY_KEY';
  end if;
  select * into existing from public.orders where idempotency_key = p_idempotency_key for update;
  if found then
    if existing.user_id <> p_user_id then raise exception 'IDEMPOTENCY_CONFLICT'; end if;
    return existing;
  end if;
  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) < 1 or jsonb_array_length(p_items) > 40 then
    raise exception 'INVALID_ITEMS';
  end if;
  insert into public.orders(order_number,user_id,total_irr,recipient,phone,province,city,postal_code,address_line,notes,idempotency_key)
  values(order_no,p_user_id,0,
    p_shipping->>'recipient',p_shipping->>'phone',p_shipping->>'province',p_shipping->>'city',
    nullif(p_shipping->>'postalCode',''),p_shipping->>'addressLine',nullif(p_shipping->>'notes',''),p_idempotency_key)
  returning * into created;
  order_id := created.id;
  for item in select value from jsonb_array_elements(p_items) loop
    qty := (item->>'quantity')::integer;
    if qty < 1 or qty > 100 then raise exception 'INVALID_QUANTITY'; end if;
    select * into product_row from public.products where sku = item->>'sku' and status = 'ACTIVE' for update;
    if not found then raise exception 'PRODUCT_NOT_FOUND'; end if;
    if product_row.price_irr is null or product_row.price_irr <= 0 then raise exception 'QUOTE_REQUIRED'; end if;
    if product_row.stock < qty then raise exception 'OUT_OF_STOCK'; end if;
    line_total := product_row.price_irr * qty;
    total := total + line_total;
    update public.products set stock = stock - qty where id = product_row.id;
    insert into public.order_items(order_id,product_id,sku_snapshot,name_snapshot,quantity,unit_price_irr,line_total_irr)
    values(order_id,product_row.id,product_row.sku,product_row.name,qty,product_row.price_irr,line_total);
  end loop;
  update public.orders set total_irr = total where id = order_id returning * into created;
  return created;
end;
$$;
revoke all on function public.amoot_create_order(uuid,text,jsonb,jsonb) from public, anon, authenticated;
grant execute on function public.amoot_create_order(uuid,text,jsonb,jsonb) to service_role;
