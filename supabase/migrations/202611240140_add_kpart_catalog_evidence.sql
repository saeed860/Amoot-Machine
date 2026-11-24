-- K-Part is an independent third-party diagram catalog.
-- Keep its serial-prefix-scoped evidence separate from OEM-confirmed part_catalog rows.
create table if not exists public.kpart_catalog_evidence (
  evidence_key text generated always as (
    md5(upper(part_number) || '|' || upper(model_name) || '|' || upper(serial_prefix) || '|' ||
        upper(group_name) || '|' || upper(coalesce(diagram_ref,'')))
  ) stored primary key,
  part_number text not null,
  name text not null,
  model_name text not null,
  serial_prefix text not null,
  group_name text not null,
  diagram_ref text,
  quantity integer check (quantity is null or quantity between 1 and 100000),
  source_name text not null default 'K-Part (third-party)',
  source_url text not null check (source_url ~ '^https://([^/]+\\.)?k-part\\.com(/|$)'),
  source_note text,
  review_state text not null default 'CANDIDATE'
    check (review_state in ('CANDIDATE','CHECKED','REJECTED')),
  source_accessed_at timestamptz not null default now(),
  reviewed_at timestamptz,
  reviewed_by text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists kpart_evidence_part_number_idx
  on public.kpart_catalog_evidence (upper(regexp_replace(part_number,'[^A-Za-z0-9]','','g')));
create index if not exists kpart_evidence_model_prefix_idx
  on public.kpart_catalog_evidence (model_name,serial_prefix);
create index if not exists kpart_evidence_review_state_idx
  on public.kpart_catalog_evidence (review_state,source_accessed_at desc);
revoke all on public.kpart_catalog_evidence from public, anon, authenticated;
grant select, insert, update on public.kpart_catalog_evidence to service_role;
