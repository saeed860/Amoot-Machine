-- C32 Marine: add verified public Cat model-listing references and enrich existing rows.
-- Public catalog applicability is not serial/arrangement verification; all unverified rows remain inactive.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('307-1988','دسته‌سیم سنسور سطح مایع خنک‌کننده Cat 307-1988','Engine Coolant Level Sensor Wiring Harness. Cat lists C32 for Generator Set, Marine Engine and Marine Auxiliary applications.','موتورهای دریایی - برق و الکترونیک - دسته‌سیم سنسور سطح آب',ARRAY['C32 GENERATOR SET','C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[],'https://parts.cat.com/en/catcorp/product/307-1988','Official Cat Parts Store explicitly lists C32 under GENERATOR SET, MARINE ENGINE and MARINE AUXILIARY. Exact serial-prefix and arrangement fitment must be checked in Cat SIS.','{"component":"Engine Coolant Level Sensor Wiring Harness"}'::jsonb),
 ('368-4962','مجموعه دسته‌سیم Cat 368-4962','Harness Assembly. Cat lists C32 for Generator Set, Marine Auxiliary and Marine Engine applications.','موتورهای دریایی - برق و الکترونیک - مجموعه دسته‌سیم',ARRAY['C32 GENERATOR SET','C32 MARINE AUXILIARY','C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/368-4962','Official Cat Parts Store explicitly lists C32 under GENERATOR SET, MARINE AUXILIARY and MARINE ENGINE. Exact serial-prefix and arrangement fitment must be checked in Cat SIS.','{"component":"Harness Assembly"}'::jsonb),
 ('616-7767','مجموعه درپوش پرکن روغن Cat 616-7767','Oil filler group. Cat Parts Store lists C32 Marine under Marine Engine applications.','موتورهای دریایی - سیستم روغن‌کاری - درپوش پرکن',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/616-7767','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. No Marine Auxiliary application inferred. Exact serial-prefix and arrangement fitment must be checked in Cat SIS.','{"component":"Filler Group - Oil"}'::jsonb)
), inserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store compatible-model listing only; exact serial-prefix and arrangement fitment not verified.',s.source_url,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications,updated_at=now()
 RETURNING part_number
), refreshed AS (
 UPDATE public.part_catalog p SET
 compatible_models=CASE p.part_number
  WHEN '487-0039' THEN ARRAY['C32 GENERATOR SET','C32 MARINE ENGINE','C32 ENGINE']::text[]
  WHEN '655-9018' THEN ARRAY['C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[]
  WHEN '6N-0163' THEN ARRAY['C32 GENERATOR SET','C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[]
  WHEN '519-7628' THEN ARRAY['C32 GENERATOR SET','C32 MARINE ENGINE','C32 ENGINE','C32B MARINE AUXILIARY','C32B MARINE ENGINE']::text[]
  ELSE p.compatible_models END,
 engine_models=CASE WHEN p.part_number IN ('487-0039','655-9018','6N-0163','519-7628') THEN ARRAY['C32','C32B']::text[] ELSE p.engine_models END,
 source_name='Cat Parts Store',
 source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_evidence='Official Cat Parts Store model listing; exact serial-prefix and arrangement fitment not verified.',
 application_type=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.application_type ELSE 'UNVERIFIED' END,
 verification_status=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.verification_status ELSE 'NEEDS_SERIAL_CHECK' END,
 is_active=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.is_active ELSE false END,
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('487-0039','655-9018','6N-0163','519-7628')
 RETURNING p.part_number
), safety AS (
 UPDATE public.part_catalog
 SET is_active=false,verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',
 source_note=concat_ws(E'\n',nullif(source_note,''),'Safety sweep: public C32 Marine model listing does not establish exact serial/arrangement fitment.'),
 updated_at=now()
 WHERE brand ILIKE '%cat%' AND is_active=true AND coalesce(application_type,'')<>'OEM_VERIFIED'
 AND (compatible_models && ARRAY['C32 MARINE ENGINE','MARINE ENGINE C32','C32 MARINE AUXILIARY','MARINE AUXILIARY C32','C32 MARINE','MARINE C32']::text[])
 RETURNING part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 (SELECT upper(regexp_replace(part_number,'[^A-Za-z0-9]','','g')) FROM inserted
  UNION SELECT upper(regexp_replace(part_number,'[^A-Za-z0-9]','','g')) FROM refreshed)
 RETURNING p.id
)
SELECT (SELECT count(*) FROM inserted) AS new_references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM safety) AS unsafe_active_catalog_rows_deactivated,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;
