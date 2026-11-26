WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('469-6273','مجموعه سوپاپ Cat 469-6273','Stainless-steel valve group; Cat compatibility includes C32 Marine, C32 and C32B under Marine Engine, and C32 under Marine Auxiliary.','موتورهای دریایی - سوپاپ‌ها - مجموعه سوپاپ',ARRAY['C32 Marine','C32','C32B']::text[],'https://parts.cat.com/en/catcorp/product/469-6273','Cat compatibility lists MARINE ENGINE / C32 MARINE / C32 / C32B and MARINE AUXILIARY / C32B / C32. Exact valve function and assembly position need SIS/diagram confirmation.'),
 ('613-4661','شیر بای‌پس گاز اگزوز Cat 613-4661','Exhaust bypass valve; Cat lists C32 Marine under Marine Engine. Official page marks the part DISCONTINUED.','موتورهای دریایی - کنترل اگزوز - شیر بای‌پس',ARRAY['C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/613-4661','Cat compatibility explicitly lists MARINE ENGINE / C32 MARINE. Cat page marks DISCONTINUED; retain as historical reference only, not a purchasable offer.'),
 ('588-6302','پین پایینی صفحه شیر بای‌پس اگزوز Cat 588-6302','Alloy-steel lower pin for exhaust gas bypass valve plate; Cat lists C32 Marine under Marine Engine.','موتورهای دریایی - کنترل اگزوز - پین شیر بای‌پس',ARRAY['C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/588-6302','Cat compatibility explicitly lists MARINE ENGINE / C32 MARINE. Confirm exact bypass valve assembly and serial range.'),
 ('384-1366','مجموعه بازوی اسبک سوپاپ Cat 384-1366','Rocker arm assembly; Cat lists C32 under Marine Engine and Marine Auxiliary. Official page marks the part DISCONTINUED.','موتورهای دریایی - سرسیلندر - مجموعه اسبک',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/384-1366','Cat compatibility lists MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Cat page marks DISCONTINUED; historical reference only, not a purchasable offer.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store compatibility listing; serial-prefix and arrangement-level fitment not verified.',s.source_url
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
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
SELECT (SELECT count(*) FROM upserted) AS c32_valve_exhaust_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;