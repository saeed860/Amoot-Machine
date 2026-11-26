-- Expanded C32 Marine batch: fuel injection, oil cooling/lubrication, cooling lines, fuel hoses and turbo references.
-- Cat Parts Store model listings are not serial/arrangement fitment confirmation. Unverified references stay inactive.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('232-1167','گروه انژکتور سوخت Cat 232-1167','Fuel injector group. Cat Parts Store lists C32 and C30 under Marine Engine applications.','موتورهای دریایی - سیستم سوخت - انژکتور',ARRAY['C32 MARINE ENGINE','C30 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/232-1167','Official Cat Parts Store lists C30 and C32 under MARINE ENGINE. No Marine Auxiliary applicability inferred. Verify serial prefix, fuel system configuration and arrangement in Cat SIS.','{"component":"Injector Group - Fuel","length_in":14.2,"height_in":5.3,"material":"Oil Fluid"}'::jsonb),
 ('641-7872','لوله فیلتر روغن موتور Cat 641-7872','Engine oil filter tube. Cat lists C32 under Generator Set and Marine Engine; C32B appears separately under Marine Engine and Marine Auxiliary.','موتورهای دریایی - سیستم روغن‌کاری - لوله فیلتر روغن',ARRAY['C32 GENERATOR SET','C32 MARINE ENGINE','C32B MARINE ENGINE','C32B MARINE AUXILIARY']::text[],'https://parts.cat.com/en/catcorp/product/641-7872','Official Cat Parts Store lists C32 under GENERATOR SET and MARINE ENGINE; C32B is separately listed under MARINE ENGINE and MARINE AUXILIARY. Do not infer C32 Marine Auxiliary. Verify exact serial prefix and arrangement in Cat SIS.','{"component":"Engine Oil Filter Tube","inside_diameter_mm":4.57}'::jsonb)
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
  WHEN '204-4363' THEN ARRAY['C32B MARINE ENGINE','C30 MARINE ENGINE','C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[]
  WHEN '278-0593' THEN ARRAY['C32 GENERATOR SET','C32 MARINE AUXILIARY','C32 MARINE ENGINE','C32B ENGINE','C32 PETROLEUM ENGINE']::text[]
  WHEN '297-1506' THEN ARRAY['C32 MARINE AUXILIARY','C32 MARINE ENGINE','C32 PETROLEUM ENGINE']::text[]
  WHEN '364-5893' THEN ARRAY['SR5 GENERATOR','C32 GENERATOR SET','C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[]
  WHEN '628-0362' THEN ARRAY['C32 MARINE ENGINE']::text[]
  WHEN '641-7871' THEN ARRAY['C32 GENERATOR SET','C32B MARINE AUXILIARY','C32B MARINE ENGINE','C32 MARINE ENGINE']::text[]
  WHEN '647-0750' THEN ARRAY['C32 MARINE ENGINE','C32 MARINE AUXILIARY','C18 MARINE ENGINE']::text[]
  ELSE p.compatible_models END,
 engine_models=CASE WHEN p.part_number IN ('204-4363','278-0593','297-1506','364-5893','628-0362','641-7871','647-0750') THEN
  CASE WHEN p.part_number='204-4363' THEN ARRAY['C30','C32','C32B']::text[]
       WHEN p.part_number='641-7871' THEN ARRAY['C32','C32B']::text[]
       WHEN p.part_number='647-0750' THEN ARRAY['C18','C32']::text[]
       ELSE ARRAY['C32']::text[] END
  ELSE p.engine_models END,
 source_name='Cat Parts Store',
 source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_evidence='Official Cat Parts Store compatible-model/category listing; exact serial-prefix and arrangement fitment not verified.',
 application_type=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.application_type ELSE 'UNVERIFIED' END,
 verification_status=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.verification_status ELSE 'NEEDS_SERIAL_CHECK' END,
 is_active=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.is_active ELSE false END,
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('204-4363','278-0593','297-1506','364-5893','628-0362','641-7871','647-0750')
 RETURNING p.part_number
), safety AS (
 UPDATE public.part_catalog
 SET is_active=false,verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',
 source_note=concat_ws(E'\n',nullif(source_note,''),'Safety sweep: public Cat model listing is not exact serial/arrangement verification; kept inactive.'),
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
