WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('593-3534','میل‌لنگ Cat 593-3534','Crankshaft A; Cat Parts Store explicitly lists C32 Marine under Marine Engine.','موتورهای دریایی - موتور پایه - میل‌لنگ',ARRAY['C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/593-3534','Direct Cat compatible-model listing: MARINE ENGINE / C32 MARINE. Exact arrangement and supersession must be checked.'),
 ('213-3203','میل‌لنگ Cat 213-3203','Crankshaft A; Cat lists C32 under Marine Engine.','موتورهای دریایی - موتور پایه - میل‌لنگ',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/213-3203','Direct Cat compatible-model listing: MARINE ENGINE / C32. Confirm serial range and crankshaft configuration.'),
 ('384-9908','میل‌لنگ موتور Cat 384-9908','Engine crankshaft; Cat lists C32 Marine under Engine and C32 under Generator Set.','موتورهای دریایی - موتور پایه - میل‌لنگ',ARRAY['C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/384-9908','Direct Cat compatible-model listing includes ENGINE / C32 MARINE. Confirm arrangement and replacement chain.'),
 ('479-8319','یاتاقان میل‌لنگ Cat 479-8319','138.6 mm OD crankshaft bearing, steel-backed copper-lead; Cat lists C32 Marine and C32B under Marine Engine.','موتورهای دریایی - موتور پایه - یاتاقان ثابت',ARRAY['C32 Marine','C32B']::text[],'https://parts.cat.com/en/catcorp/product/479-8319','Direct Cat compatible-model listing includes MARINE ENGINE / C32 MARINE / C32B. Bearing grade and journal size must be verified.'),
 ('232-3226','یاتاقان شاتون Cat 232-3226','104.90 mm OD connecting-rod bearing, steel-backed copper-lead; Cat lists C32 and C32 Marine under Marine Engine.','موتورهای دریایی - موتور پایه - یاتاقان متحرک',ARRAY['C32','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/232-3226','Direct Cat compatible-model listing includes MARINE ENGINE / C32 / C32 MARINE. Confirm bearing grade and crankpin size.'),
 ('361-5744','پیستون فولادی C32 نسبت تراکم ۱۵:۱ Cat 361-5744','C32/15:1 CR steel piston body; Cat lists C32 Marine and C32 under Marine Engine. Cat parts diagram associates piston rings and connecting-rod bearing.','موتورهای دریایی - موتور پایه - پیستون',ARRAY['C32 Marine','C32']::text[],'https://parts.cat.com/en/catcorp/product/361-5744','Direct Cat compatible-model listing includes MARINE ENGINE / C32 MARINE / C32. 15:1 compression ratio is critical; verify engine build.'),
 ('356-1373','مجموعه انژکتور Cat 356-1373','Fuel injector group; Cat lists C32 under Marine Engine; dimensions 14.8 in length and 3.0 in height.','موتورهای دریایی - سیستم سوخت - انژکتور',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/356-1373','Direct Cat compatible-model listing: MARINE ENGINE / C32. Verify engine rating, injector calibration and serial range.'),
 ('462-0470','گروه انژکتور Cat 462-0470','Injector group; Cat lists C32 Marine and C32 under Marine Engine; alternate Cat Reman reference 30R-1990 is shown.','موتورهای دریایی - سیستم سوخت - انژکتور',ARRAY['C32 Marine','C32']::text[],'https://parts.cat.com/en/catcorp/product/462-0470','Direct Cat compatible-model listing includes MARINE ENGINE / C32 MARINE / C32. Reman alternative 30R-1990 shown by Cat; exact serial calibration required.'),
 ('499-7376','انژکتور سوخت Cat 499-7376','Fuel injector with valve; Cat application text identifies C32 Tier 3 ACERT for D11 Dozer and Marine applications.','موتورهای دریایی - سیستم سوخت - انژکتور',ARRAY['C32 Tier 3 ACERT']::text[],'https://parts.cat.com/en/catcorp/product/499-7376','Cat application statement explicitly identifies C32 Tier 3 ACERT for Marine applications; serial/rating and injector calibration remain unverified.'),
 ('20R-0193','مجموعه سیلندر بازسازی‌شده Cat Reman 20R-0193','Cat Reman C32 cylinder pack with 16.5:1 compression ratio; Cat lists C32 under Marine Auxiliary and Marine Engine.','موتورهای دریایی - موتور پایه - مجموعه سیلندر بازسازی‌شده',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/20R-0193','Direct Cat compatible-model listing includes MARINE ENGINE / C32 and MARINE AUXILIARY / C32. 16.5:1 compression ratio must match engine build.'),
 ('20R-5353','انژکتور بازسازی‌شده Cat Reman 20R-5353','Cat Reman fuel injector, E1550, C32, EUI, ACERT; shown by Cat as alternate for 356-1373.','موتورهای دریایی - سیستم سوخت - انژکتور بازسازی‌شده',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/356-1373','Cat page for 356-1373 shows 20R-5353 as Reman alternative; verify serial applicability and exchange core conditions.'),
 ('349-2568','رینگ بالایی پیستون Cat 349-2568','130 mm gage-diameter piston top ring; listed in Cat parts diagram for C32/15:1 piston 361-5744.','موتورهای دریایی - موتور پایه - رینگ پیستون',ARRAY['C32/15:1 piston assembly']::text[],'https://parts.cat.com/en/catcorp/product/361-5744','Associated component in Cat parts diagram for 361-5744, not independently confirmed for all C32 serials. Verify ring pack and bore.'),
 ('344-5153','رینگ میانی پیستون Cat 344-5153','144.97 mm gage-diameter intermediate piston ring; listed in Cat parts diagram for C32/15:1 piston 361-5744.','موتورهای دریایی - موتور پایه - رینگ پیستون',ARRAY['C32/15:1 piston assembly']::text[],'https://parts.cat.com/en/catcorp/product/361-5744','Associated component in Cat parts diagram for 361-5744, not independently confirmed for all C32 serials. Verify ring pack and bore.'),
 ('246-5659','رینگ روغنی پیستون Cat 246-5659','145 mm gage-diameter piston oil ring; listed in Cat parts diagram for C32/15:1 piston 361-5744.','موتورهای دریایی - موتور پایه - رینگ روغنی پیستون',ARRAY['C32/15:1 piston assembly']::text[],'https://parts.cat.com/en/catcorp/product/361-5744','Associated component in Cat parts diagram for 361-5744, not independently confirmed for all C32 serials. Verify ring pack and bore.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store product compatibility or parent parts-diagram association; serial-prefix and arrangement fitment not verified.',s.source_url
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
SELECT (SELECT count(*) FROM upserted) AS c32_internal_engine_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;