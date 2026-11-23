-- The Edge Function reads the product inventory with the service_role client.
-- RLS bypass does not replace PostgreSQL table privileges.
grant select on table public.products to service_role;
