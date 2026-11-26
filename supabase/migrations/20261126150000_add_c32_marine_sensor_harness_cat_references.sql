-- C32 Marine sensor and interface harness references from official Cat Parts Store.
-- All candidates are quarantined pending exact Cat SIS serial/arrangement verification.
WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('588-5406','دسته‌سیم موتور Cat 588-5406','Engine wiring harness; Cat Parts Store lists C32 under Marine Engine. Harness applications include coolant pressure/level alarm and exhaust stack temperature sensor circuits.','موتورهای دریایی - برق و کنترل - دسته‌سیم موتور',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/588-5406','Official Cat compatible-model listing: MARINE ENGINE / C32. Exact arrangement and harness branch configuration require Cat SIS check.'),
 ('304-4509','دسته‌سیم رابط سنسور دمای هوای Cat 304-4509','Air temperature sensor jumper harness; Cat lists C32 in Generator Set, Marine Auxiliary and Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم سنسور دمای هوا',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/304-4509','Official Cat compatible-model listing includes MARINE ENGINE / C32. Verify sensor type, connector and serial range.'),
 ('633-4943','دسته‌سیم سنسور فشار Cat 633-4943','Pressure sensor wiring harness; Cat lists C32 Marine, C32 and C32B under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم سنسور فشار',ARRAY['C32 Marine','C32','C32B']::text[],'https://parts.cat.com/en/catcorp/product/633-4943','Official Cat compatible-model listing includes MARINE ENGINE / C32 MARINE / C32. Confirm pressure sensor and harness variant.'),
 ('445-1049','دسته‌سیم رابط موتور Cat 445-1049','Interface wiring harness connecting key switch, oil pressure, coolant temperature and air inlet temperature circuits; Cat lists C32 and C32B under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم رابط',ARRAY['C32','C32B']::text[],'https://parts.cat.com/en/catcorp/product/445-1049','Official Cat compatible-model listing includes MARINE ENGINE / C32 / C32B. Confirm exact interface and engine arrangement.')
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
