-- Manual shipment tracking details; carrier integration is intentionally not implied.
alter table public.orders
  add column if not exists shipping_carrier varchar(100),
  add column if not exists tracking_number varchar(100),
  add column if not exists shipped_at timestamptz;

do $$ begin
  if not exists (select 1 from pg_constraint where conname='orders_shipping_carrier_length') then
    alter table public.orders add constraint orders_shipping_carrier_length
      check (shipping_carrier is null or length(shipping_carrier) between 1 and 100);
  end if;
  if not exists (select 1 from pg_constraint where conname='orders_tracking_number_length') then
    alter table public.orders add constraint orders_tracking_number_length
      check (tracking_number is null or length(tracking_number) between 1 and 100);
  end if;
end $$;

create or replace function public.set_order_shipped_at()
returns trigger language plpgsql as $$
begin
  if new.status = 'SHIPPED' and old.status is distinct from 'SHIPPED' then
    new.shipped_at = coalesce(new.shipped_at, now());
  end if;
  return new;
end;
$$;
drop trigger if exists orders_set_shipped_at on public.orders;
create trigger orders_set_shipped_at before update of status on public.orders
for each row execute function public.set_order_shipped_at();
