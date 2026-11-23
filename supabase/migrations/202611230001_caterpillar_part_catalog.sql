-- Searchable Caterpillar part-reference catalog. References are not inventory items.
create table if not exists public.part_catalog (
  id uuid primary key default gen_random_uuid(),
  brand text not null default 'Caterpillar',
  part_number text not null,
  part_number_normalized text generated always as (upper(regexp_replace(part_number, '[^A-Za-z0-9]', '', 'g'))) stored,
  name text not null,
  description text,
  engine_models text[] not null default '{}',
  technical_group text,
  source_name text not null,
  source_url text not null,
  source_note text,
  verification_status text not null default 'REFERENCE' check (verification_status in ('REFERENCE','OEM_VERIFIED','NEEDS_SERIAL_CHECK')),
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint part_catalog_part_number_unique unique (part_number)
);
create index if not exists part_catalog_part_number_normalized_idx on public.part_catalog(part_number_normalized);
create index if not exists part_catalog_engine_models_gin_idx on public.part_catalog using gin(engine_models);
create index if not exists part_catalog_active_idx on public.part_catalog(is_active, brand);
revoke all on public.part_catalog from public, anon, authenticated;
grant select, insert, update on public.part_catalog to service_role;
