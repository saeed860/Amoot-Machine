-- C32 Marine ECM, fuel line and sensor references from official Cat Parts Store.
-- All references remain quarantined pending exact Cat SIS serial/arrangement confirmation.
WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('328-5412','دسته‌سیم آپشن ECM موتور Cat 328-5412','ECM option engine harness; Cat lists C32 under Marine Engine and Marine Auxiliary. Connects engine sensors and actuators to ECM.','موتورهای دریایی - برق و کنترل - دسته‌سیم ECM',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/328-5412','Official Cat compatible-model listing: MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Verify harness option and arrangement.'),
 ('298-2022','مجموعه لوله‌های سوخت Cat 298-2022','Fuel lines tube assembly; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - سیستم سوخت - لوله‌های سوخت',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/298-2022','Official Cat compatible-model listing: MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Verify routing and serial range.'),
 ('380-1093','سنسور دمای موتور Cat 380-1093','4-pin temperature sensor for low oil pressure shutdown monitoring; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - برق و کنترل - سنسور دما',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/380-1093','Official Cat compatible-model listing includes MARINE ENGINE / C32. Confirm intended sensor circuit and engine arrangement.'),
 ('655-9018','محفظه سنسور دمای آب موتور Cat 655-9018','Engine coolant temperature sensor thermowell; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - سیستم خنک‌کاری - محفظه سنسور دما',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/655-9018','Official Cat compatible-model listing: MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Verify thread, sensor and arrangement.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store compatible-model listing; serial-prefix and exact arrangement fitment not verified.',s.source_url
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=concat_ws(E'\\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,updated_at=now()
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
