-- Add the official public C18 injector-group reference missing from the CI seed assertions.
-- This is a catalog reference only; it does not assert serial-specific fitment or direct interchangeability.
insert into public.part_catalog
  (brand, part_number, name, description, engine_models, technical_group,
   source_name, source_url, source_note, verification_status, is_active,
   source_accessed_at, specifications, compatible_models, application_type,
   application_evidence, application_source_url)
values
  ('Caterpillar',
   '540-6824',
   'Injector Group',
   'Cat Parts Store identifies 540-6824 as an Injector Group. Public page does not publish independent technical specifications. Listed compatible equipment: BS3GII track loader, SR4B generator and C18 generator set variants.',
   array['C18']::text[],
   'Fuel System / Injectors',
   'Cat Parts Store (official)',
   'https://parts.cat.com/ru/catcorp/product/540-6824',
   'Official public listing identifies Injector Group; specifications are not yet published. Compatible models shown: BS3GII, SR4B, C18 GEN SE, C18, C18 GENERATOR SET, C18 GENSET. 30R-0251 appears as a Cat Reman alternative on the page; verify interchangeability with Cat dealer before treating it as a direct replacement.',
   'REFERENCE',
   true,
   now(),
   '{}'::jsonb,
   array['BS3GII','SR4B','C18 GEN SE','C18','C18 GENERATOR SET','C18 GENSET']::text[],
   'UNVERIFIED',
   'Official Cat Parts Store compatible-model listing; serial/arrangement verification still required.',
   'https://parts.cat.com/ru/catcorp/product/540-6824')
on conflict (part_number) do update set
  name = excluded.name,
  description = excluded.description,
  engine_models = excluded.engine_models,
  technical_group = excluded.technical_group,
  source_name = excluded.source_name,
  source_url = excluded.source_url,
  source_note = excluded.source_note,
  verification_status = excluded.verification_status,
  is_active = true,
  source_accessed_at = now(),
  specifications = excluded.specifications,
  compatible_models = excluded.compatible_models,
  application_type = excluded.application_type,
  application_evidence = excluded.application_evidence,
  application_source_url = excluded.application_source_url,
  updated_at = now();
