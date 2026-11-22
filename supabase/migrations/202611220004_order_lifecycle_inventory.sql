-- Enforce valid order lifecycle transitions and restore inventory exactly once on cancellation.
create or replace function public.amoot_update_order_status(
  p_order_number text,
  p_status public.order_status
)
returns table(order_number text, status public.order_status, total_irr bigint)
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_order public.orders%rowtype;
  v_allowed boolean := false;
begin
  select * into v_order
  from public.orders
  where public.orders.order_number = p_order_number
  for update;

  if not found then
    raise exception 'ORDER_NOT_FOUND';
  end if;

  if v_order.status = p_status then
    return query select v_order.order_number, v_order.status, v_order.total_irr;
    return;
  end if;

  v_allowed := case v_order.status
    when 'PENDING' then p_status in ('CONFIRMED','CANCELLED')
    when 'CONFIRMED' then p_status in ('PROCESSING','CANCELLED')
    when 'PROCESSING' then p_status in ('SHIPPED','CANCELLED')
    when 'SHIPPED' then p_status = 'DELIVERED'
    else false
  end;

  if not v_allowed then
    raise exception 'INVALID_ORDER_TRANSITION';
  end if;

  if p_status = 'CANCELLED' then
    update public.products as p
    set stock = p.stock + items.quantity
    from (
      select oi.product_id, sum(oi.quantity)::integer as quantity
      from public.order_items as oi
      where oi.order_id = v_order.id
      group by oi.product_id
    ) as items
    where p.id = items.product_id;
  end if;

  update public.orders as o
  set status = p_status
  where o.id = v_order.id
  returning o.order_number, o.status, o.total_irr
  into order_number, status, total_irr;

  return next;
end;
$$;

revoke all on function public.amoot_update_order_status(text, public.order_status) from public, anon, authenticated;
grant execute on function public.amoot_update_order_status(text, public.order_status) to service_role;
