-- C32 Marine fuel delivery, exhaust sealing, cooling and turbo installation references.
-- Public Cat model listings are not serial/arrangement proof: retain all candidates quarantined.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('306-0398','مجموعه لوله برگشت سوخت Cat 306-0398','Fuel supply/return line tube assembly; Cat lists C32 under Marine Engine and Marine Auxiliary, and Petroleum Engine.','موتورهای دریایی - سیستم سوخت - خطوط سوخت',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/306-0398','Official Cat Parts Store lists C32 MARINE ENGINE and MARINE AUXILIARY; also Petroleum Engine. Verify exact routing, serial number and arrangement.','{"component":"Fuel supply/return lines tube assembly","fuel_pressure_kpa":240}'::jsonb),
 ('297-1507','مجموعه لوله سوخت Cat 297-1507','Fuel lines tube assembly connecting the fuel filter line and heat exchanger line; Cat lists C32 Marine Engine and Marine Auxiliary.','موتورهای دریایی - سیستم سوخت - خطوط سوخت',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/297-1507','Official Cat Parts Store lists C32 MARINE ENGINE and MARINE AUXILIARY. Verify line routing, serial number and arrangement.','{"component":"Fuel lines tube assembly","inner_diameter_mm":10.22,"fuel_pressure_kpa":1000}'::jsonb),
 ('297-1512','مجموعه لوله خط سوخت Cat 297-1512','Fuel line tube assembly; Cat lists C32 Marine Engine and Marine Auxiliary.','موتورهای دریایی - سیستم سوخت - خطوط سوخت',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/297-1512','Official Cat Parts Store lists C32 MARINE ENGINE and MARINE AUXILIARY. Verify line routing, serial number and arrangement.','{"component":"Fuel line tube assembly","inner_diameter_mm":10.22,"fuel_pressure_kpa":1000}'::jsonb),
 ('364-5897','مجموعه لوله سوخت فیلتر Cat 364-5897','Fuel line tube assembly used in the fuel filter circuit; Cat lists C32 Generator Set, Marine Auxiliary and Marine Engine.','موتورهای دریایی - سیستم سوخت - خطوط فیلتر',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/364-5897','Official Cat Parts Store lists C32 MARINE ENGINE and MARINE AUXILIARY, as well as GENERATOR SET. Verify exact filter circuit, serial number and arrangement.','{"component":"Fuel filter line tube assembly","connection":"13/16-16"}'::jsonb),
 ('588-5919','واشر اگزوز توربوشارژر Cat 588-5919','Turbocharger exhaust gasket; Cat lists C32 Marine Engine.','موتورهای دریایی - سیستم اگزوز - واشر توربو',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/588-5919','Official Cat Parts Store lists C32 MARINE ENGINE. Verify turbocharger group, serial number and arrangement.','{"component":"Turbocharger exhaust gasket","material":"Steel and graphite"}'::jsonb),
 ('395-3466','پوسته واترپمپ Cat 395-3466','Water pump housing; Cat lists C32 Marine Engine and Marine Auxiliary, with additional generator and industrial applications.','موتورهای دریایی - سیستم خنک‌کاری - پوسته واترپمپ',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/395-3466','Official Cat Parts Store lists C32 MARINE ENGINE and MARINE AUXILIARY among multiple applications. Verify pump group, serial number and arrangement.','{"component":"Water pump housing","material":"Gray flake iron","length_in":14.8,"height_in":5.5}'::jsonb),
 ('459-9902','کیت نصب واشر توربوشارژر Cat 459-9902','Turbocharger installation gasket kit; Cat lists C32 and C30 Marine Engine. Kit contents and applicability must be checked against the exact turbo arrangement.','موتورهای دریایی - سیستم هوا و اگزوز - کیت نصب توربو',ARRAY['C32','C30']::text[],'https://parts.cat.com/en/catcorp/product/459-9902','Official Cat Parts Store lists C30 and C32 MARINE ENGINE. Kit is stated to apply to turbo kit part numbers 317-8751 and up; verify exact engine/turbo arrangement.','{"component":"Turbocharger installation gasket kit","contents":"Gaskets, seals, locknuts, studs"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store compatible-model listing; serial-prefix and exact arrangement fitment not verified.',s.source_url,s.specifications
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
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 FROM upserted u
 WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g'))=upper(regexp_replace(u.part_number,'[^A-Za-z0-9]','','g'))
 AND p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 RETURNING p.id
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;