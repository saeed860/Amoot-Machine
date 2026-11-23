-- Preserve traceable, serial-specific evidence for Cat SIS fitment claims.
alter table public.part_catalog
  add column if not exists source_serial_number text,
  add column if not exists arrangement_number text,
  add column if not exists source_document_ref text,
  add column if not exists source_accessed_at timestamptz;

alter table public.part_catalog
  drop constraint if exists part_catalog_oem_verified_evidence_check;

alter table public.part_catalog
  add constraint part_catalog_oem_verified_evidence_check
  check (
    verification_status <> 'OEM_VERIFIED'
    or (
      source_name ~* 'cat[[:space:]]*(sis|sis2go)'
      and coalesce(length(trim(source_serial_number)),0) >= 3
      and coalesce(length(trim(arrangement_number)),0) >= 2
      and coalesce(length(trim(source_document_ref)),0) >= 3
    )
  );

comment on column public.part_catalog.source_serial_number is
  'Equipment/engine serial number used to verify this part in authorized Cat SIS/SIS2GO.';
comment on column public.part_catalog.arrangement_number is
  'Cat SIS arrangement number supporting the serial-specific fitment.';
comment on column public.part_catalog.source_document_ref is
  'SIS illustration, group, document or reference identifier; never store credentials or session tokens.';
