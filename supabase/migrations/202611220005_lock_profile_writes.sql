-- Customer profile mutations must pass through the authenticated Edge API.
-- The API uses service_role after validating the caller and only updates allowed fields.
drop policy if exists "profiles update own basic fields" on public.profiles;
revoke insert, update, delete on public.profiles from anon, authenticated;
