WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('418-2037','چرخ‌دنده ۴۳ دندانه پمپ آب Cat 418-2037','43-tooth low-alloy-steel water pump gear used in auxiliary sea water pump; Cat lists C32 Marine and C32B under Marine Engine and C32 under Marine Auxiliary.','موتورهای دریایی - خنک‌کاری - چرخ‌دنده پمپ آب',ARRAY['C32 Marine','C32B']::text[],'https://parts.cat.com/en/catcorp/product/418-2037','Cat compatibility lists MARINE ENGINE / C32 MARINE / C32B and MARINE AUXILIARY / C32. Verify pump arrangement and tooth match.'),
 ('438-4475','شفت پمپ آب Cat 438-4475','Stainless-steel water pump shaft; Cat lists C32 under Marine Engine.','موتورهای دریایی - خنک‌کاری - شفت پمپ آب',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/438-4475','Cat compatibility lists MARINE ENGINE / C32. Verify shaft length, pump group and arrangement.'),
 ('20R-3434','پمپ آب بازسازی‌شده Cat Reman 20R-3434','Cat Reman water pump for C32; Cat lists C32 under Marine Engine and Marine Auxiliary; genuine Cat alternative 395-3467 and basic water pump 541-2494 are shown.','موتورهای دریایی - خنک‌کاری - پمپ آب بازسازی‌شده',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/20R-3434','Cat explicitly recommends C32 and lists MARINE ENGINE / C32. Confirm serial and exchange-core conditions.'),
 ('324-6210','کیت بازسازی پمپ آب Cat 324-6210','Water pump rebuild kit; Cat lists C32 under Marine Engine. Kit includes auxiliary pump group 296-9886.','موتورهای دریایی - خنک‌کاری - کیت تعمیر پمپ آب',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/324-6210','Cat compatibility lists MARINE ENGINE / C32. Kit contents show 296-9886 pump group; verify exact pump assembly and serial.'),
 ('328-2560','شفت پمپ آب Cat 328-2560','13-inch stainless-steel water pump shaft; Cat lists C32 Marine under Marine Engine.','موتورهای دریایی - خنک‌کاری - شفت پمپ آب',ARRAY['C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/328-2560','Cat compatibility lists MARINE ENGINE / C32 MARINE. Verify pump arrangement and supersession.'),
 ('328-2561','کیت پروانه پمپ آب Cat 328-2561','Water pump impeller repair kit; includes 153-9124 O-ring seal and 322-8595 10-vane impeller; Cat lists C32 and 3412E under Marine Engine.','موتورهای دریایی - خنک‌کاری - کیت پروانه پمپ آب',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/328-2561','Cat compatibility lists MARINE ENGINE / C32. Confirm impeller vane count and pump variant by serial.'),
 ('278-0593','لوله مدار آب ترموستات Cat 278-0593','38 mm diameter carbon-steel thermostat water-lines tube; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - خنک‌کاری - لوله مدار ترموستات',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/278-0593','Cat compatibility lists MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Confirm tube routing and arrangement.'),
 ('599-5309','زانویی خط آب ترموستات Cat 599-5309','Gray iron thermostat water-lines elbow; Cat lists C32 Marine and C32B under Marine Engine.','موتورهای دریایی - خنک‌کاری - زانویی مدار ترموستات',ARRAY['C32 Marine','C32B']::text[],'https://parts.cat.com/en/catcorp/599-5309','Cat compatibility lists MARINE ENGINE / C32 MARINE / C32B. Confirm orientation and connected line arrangement.'),
 ('520-2924','پمپ روغن موتور Cat 520-2924','Engine oil pump; Cat lists C32 under Marine Engine and Marine Auxiliary, among many other applications.','موتورهای دریایی - روغن‌کاری - پمپ روغن موتور',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/520-2924','Cat compatibility lists MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Exact gear section and engine arrangement must be verified.'),
 ('557-7650','پمپ روغن موتور Cat 557-7650','Engine oil pump; Cat lists C32 Marine and C32B under Marine Engine.','موتورهای دریایی - روغن‌کاری - پمپ روغن موتور',ARRAY['C32 Marine','C32B']::text[],'https://parts.cat.com/en/catcorp/product/557-7650','Cat compatibility lists MARINE ENGINE / C32 MARINE / C32B. Verify pump configuration and serial range.'),
 ('116-2699','مجموعه لوله خروجی پمپ روغن Cat 116-2699','Engine oil pump discharge tube assembly; Cat lists C32 and C32 Marine under Marine Engine.','موتورهای دریایی - روغن‌کاری - لوله خروجی پمپ روغن',ARRAY['C32','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/116-2699','Cat compatibility lists MARINE ENGINE / C32 / C32 MARINE. Verify tube routing and engine arrangement.'),
 ('20R-1512','پمپ روغن موتور بازسازی‌شده Cat Reman 20R-1512','Two-section gear Cat Reman engine oil pump for C32; candidate pending marine application/serial confirmation.','موتورهای دریایی - روغن‌کاری - پمپ روغن بازسازی‌شده',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/20R-1512','Cat product title identifies C32, but marine-specific compatibility not confirmed in the retrieved listing. Keep quarantined until SIS confirms marine application.')
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
SELECT (SELECT count(*) FROM upserted) AS c32_oiling_cooling_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;