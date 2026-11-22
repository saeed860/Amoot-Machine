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
