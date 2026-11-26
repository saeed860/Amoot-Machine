-- C32 Marine integrated batch: aftercooler, fuel filter lines and exhaust manifold elbows.
-- Public Cat listings are discovery evidence, not serial/arrangement fitment certification.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('297-1511','لوله مجموعه فیلتر سوخت Cat 297-1511','Fuel Filter Lines Tube carrying filtered fuel from the fuel filter to the cylinder head. Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - سیستم سوخت - لوله فیلتر',ARRAY['C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[],'https://parts.cat.com/en/catcorp/product/297-1511','Official Cat Parts Store lists C32 under MARINE ENGINE and MARINE AUXILIARY. Verify serial prefix and arrangement in Cat SIS.','{"component":"Fuel Filter Lines Tube","material":"Alloy Copper"}'::jsonb),
 ('4N-5073','زانویی منیفولد اگزوز Cat 4N-5073','Exhaust manifold elbow. Cat lists C32 under Marine Engine and Marine Auxiliary, among other engine families.','موتورهای دریایی - سیستم اگزوز - زانویی منیفولد',ARRAY['C32 MARINE ENGINE','C32 MARINE AUXILIARY','C30 MARINE ENGINE','3412 MARINE ENGINE','3408 MARINE ENGINE','3412C MARINE ENGINE','3412E MARINE ENGINE','3412D MARINE ENGINE','3408B MARINE ENGINE','3408C MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/4N-5073','Official Cat Parts Store lists C32 under MARINE ENGINE and MARINE AUXILIARY. C32B is not listed in those two categories on the source page. Verify serial prefix and arrangement in Cat SIS.','{"component":"Exhaust Manifold Elbow","material":"Cast Iron, Gray (Flake) Iron"}'::jsonb),
 ('605-7519','پوسته افترکولر Cat 605-7519','Aftercooler housing protecting the aftercooler assembly. Cat lists C32 Marine under Marine Engine.','موتورهای دریایی - سیستم هوارسانی - پوسته افترکولر',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/605-7519','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE only. No Marine Auxiliary application inferred. Verify serial prefix and arrangement in Cat SIS.','{"component":"Aftercooler Housing","material":"Alloy Aluminum"}'::jsonb)
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
  WHEN '349-7034' THEN ARRAY['C32 MARINE ENGINE']::text[]
  WHEN '364-8678' THEN ARRAY['C32 GENERATOR SET','C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[]
  WHEN '364-9372' THEN ARRAY['C32 GENERATOR SET','C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[]
  WHEN '596-9253' THEN ARRAY['C32 MARINE ENGINE']::text[]
  ELSE p.compatible_models END,
 engine_models=CASE WHEN p.part_number IN ('349-7034','364-8678','364-9372','596-9253') THEN ARRAY['C32']::text[] ELSE p.engine_models END,
 source_name='Cat Parts Store',
 source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_evidence='Official Cat Parts Store compatible-model/category listing; exact serial-prefix and arrangement fitment not verified.',
 application_type=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.application_type ELSE 'UNVERIFIED' END,
 verification_status=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.verification_status ELSE 'NEEDS_SERIAL_CHECK' END,
 is_active=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.is_active ELSE false END,
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('349-7034','364-8678','364-9372','596-9253')
 RETURNING p.part_number
), safety AS (
 UPDATE public.part_catalog
 SET is_active=false,verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',
 source_note=concat_ws(E'\n',nullif(source_note,''),'Safety sweep: Cat public model listing does not establish exact serial/arrangement fitment; kept inactive.'),
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
