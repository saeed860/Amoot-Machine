-- Assign the explicitly designated primary administrator.
-- Existing account is promoted now; future signup with this exact email is promoted by the auth trigger.
update public.profiles
set role = 'ADMIN', is_active = true, updated_at = now()
where lower(identifier) = 'saeed.qafouri@gmail.com';

create or replace function public.handle_new_auth_user()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  insert into public.profiles(id, identifier, display_name, role)
  values (
    new.id,
    lower(coalesce(new.email, new.phone, new.raw_user_meta_data->>'identifier', new.id::text)),
    coalesce(new.raw_user_meta_data->>'display_name', ''),
    case
      when lower(coalesce(new.email, '')) = 'saeed.qafouri@gmail.com' then 'ADMIN'::public.user_role
      else 'CUSTOMER'::public.user_role
    end
  )
  on conflict (id) do update
    set role = case
      when lower(coalesce(new.email, '')) = 'saeed.qafouri@gmail.com' then 'ADMIN'::public.user_role
      else public.profiles.role
    end;
  return new;
end;
$$;
