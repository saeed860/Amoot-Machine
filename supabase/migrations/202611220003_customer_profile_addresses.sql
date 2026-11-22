-- Persist customer profile fields and address default selection.
alter table public.profiles
  add column if not exists company text,
  add column if not exists national_id text,
  add column if not exists phone text,
  add column if not exists birth_date text;

alter table public.addresses
  add column if not exists is_default boolean not null default false;

create unique index if not exists addresses_one_default_per_user_idx
  on public.addresses(user_id) where is_default = true;
