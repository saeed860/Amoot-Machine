WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('568-4079','میل‌بادامک موتور Cat 568-4079','Carbon-steel camshaft; Cat lists C32 Marine and C32B under Marine Engine and C32 under Marine Auxiliary/Generator Set.','موتورهای دریایی - تایمینگ - میل‌بادامک',ARRAY['C32 Marine','C32B','C32']::text[],'https://parts.cat.com/en/catcorp/product/568-4079','Cat compatibility explicitly includes MARINE ENGINE / C32B / C32 MARINE. Also lists C32 in marine auxiliary. Exact bank and arrangement require SIS check.'),
 ('421-0119','میل‌بادامک موتور Cat 421-0119','Cat camshaft; compatible models include C32 under Marine Engine and C32B under Engine. Cat Reman alternative 20R-4511 is displayed.','موتورهای دریایی - تایمینگ - میل‌بادامک',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/421-0119','Cat compatibility lists MARINE ENGINE / C32. Verify bank, arrangement and serial range.'),
 ('20R-4511','میل‌بادامک بازسازی‌شده Cat Reman 20R-4511','Cat Reman C32 camshaft, right bank; shown as an alternative to 421-0119.','موتورهای دریایی - تایمینگ - میل‌بادامک بازسازی‌شده',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/421-0119','Listed by Cat as Cat Reman C32 Camshaft (Right Bank) alternate to 421-0119. Marine fitment and bank/serial applicability require SIS confirmation.'),
 ('20R-1891','میل‌بادامک بازسازی‌شده Cat Reman 20R-1891','Cat Reman C32 camshaft, right bank; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - تایمینگ - میل‌بادامک بازسازی‌شده',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/20R-1891','Cat compatibility lists MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Verify bank, arrangement and serial range.'),
 ('331-6188','چرخ‌دنده میل‌بادامک ۵۶ دندانه Cat 331-6188','56-tooth engine camshaft gear; Cat lists C32, C32 Marine and C32B under Marine Engine and Marine Auxiliary.','موتورهای دریایی - تایمینگ - چرخ‌دنده میل‌بادامک',ARRAY['C32','C32 Marine','C32B']::text[],'https://parts.cat.com/en/catcorp/product/331-6188','Cat compatibility lists MARINE ENGINE / C32B / C32 / C32 MARINE and MARINE AUXILIARY / C32B / C32. Verify gear train arrangement and tooth match.'),
 ('560-0202','چرخ‌دنده هرزگرد تایمینگ Cat 560-0202','Low-alloy-steel idler gear; Cat lists C32 Marine and C32B under Marine Engine.','موتورهای دریایی - تایمینگ - چرخ‌دنده هرزگرد',ARRAY['C32 Marine','C32B']::text[],'https://parts.cat.com/en/catcorp/product/560-0202','Cat compatibility lists MARINE ENGINE / C32 MARINE / C32B. Description and exact gear-train position need SIS/diagram confirmation.'),
 ('490-7199','سوپاپ ورودی هوا Cat 490-7199','Alloy chromium/alloy steel engine intake valve; Cat lists C32 and C32 Marine under Marine Engine and C32 under Marine Auxiliary.','موتورهای دریایی - سرسیلندر - سوپاپ ورودی',ARRAY['C32','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/490-7199','Cat compatibility lists MARINE ENGINE / C32 / C32 MARINE and MARINE AUXILIARY / C32. Confirm valve dimensions, stem and head arrangement.'),
 ('639-0345','بازوی اسبک سوپاپ Cat 639-0345','Valve rocker arm; Cat lists C32 under Marine Engine. Cat Reman NWC alternative 11R-2442 is displayed.','موتورهای دریایی - سرسیلندر - اسبک سوپاپ',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/639-0345','Cat compatibility lists MARINE ENGINE / C32. Verify rocker geometry and serial range.'),
 ('11R-2442','اسبک سوپاپ بازسازی‌شده Cat Reman 11R-2442','Cat Reman new-with-core valve rocker arm shown by Cat as alternative to 639-0345.','موتورهای دریایی - سرسیلندر - اسبک بازسازی‌شده',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/639-0345','Listed by Cat as Cat Reman NWC alternative to 639-0345. Marine fitment depends on exact C32 arrangement; serial check required.'),
 ('524-3708','مجموعه بازوی اسبک سوپاپ Cat 524-3708','Rocker arm group; Cat compatibility list includes C32 Marine and C32/C32B engine applications.','موتورهای دریایی - سرسیلندر - مجموعه اسبک',ARRAY['C32 Marine','C32','C32B']::text[],'https://parts.cat.com/en/catcorp/product/524-3708','Cat compatibility list includes C32 MARINE in engine applications. Confirm whether this is the correct rocker group for the specific marine arrangement.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store compatibility listing; serial-prefix, arrangement and parts-diagram position not verified.',s.source_url
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
SELECT (SELECT count(*) FROM upserted) AS c32_valvetrain_timing_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;