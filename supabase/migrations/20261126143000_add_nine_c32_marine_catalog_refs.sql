WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('457-1546','مجموعه صفحه Cat 457-1546','مجموعه صفحه فلزی از فلز آلیاژی و فولاد زنگ‌نزن؛ Cat سازگاری مدل C32 MARINE را در Marine Engine درج کرده است.','سازه موتور دریایی - مجموعه صفحه','https://parts.cat.com/en/catcorp/product/457-1546','{"component":"Plate Assembly","materials":["Alloy Mixed Metal","Stainless Steel"]}'::jsonb),
('596-5772','مجموعه خطوط روغن هیبریدی Cat 596-5772','خطوط روغن هیبریدی با قطر داخلی 9.4 میلی‌متر برای انتقال سیالات روغن‌کاری؛ جنس‌های فهرست‌شده شامل فولاد کربنی و مس آلیاژی است.','موتور دریایی - روغن‌کاری - خطوط روغن','https://parts.cat.com/en/catcorp/product/596-5772','{"component":"Hybrid Oil Lines","inside_diameter_mm":9.4,"materials":["Carbon Steel","Alloy Copper","Other Hose"]}'::jsonb),
('466-5531','کلید الکتریکی Cat 466-5531','کلید Cat با جنس پلی‌ایمید؛ فهرست سازگاری رسمی، C32 MARINE را در گروه Marine Engine نشان می‌دهد؛ نوع عملکرد و محل نصب باید از دیاگرام تأیید شود.','برق موتور دریایی - کلیدها','https://parts.cat.com/en/catcorp/product/466-5531','{"component":"Switch","material":"Polyimide Plastic","function":"Requires parts diagram confirmation"}'::jsonb),
('469-6273','مجموعه سوپاپ Cat 469-6273','مجموعه سوپاپ از فولاد زنگ‌نزن؛ در فهرست رسمی Cat برای C32 MARINE در گروه Marine Engine درج شده است.','موتور دریایی - سوپاپ‌ها','https://parts.cat.com/en/catcorp/product/469-6273','{"component":"Valve Group","material":"Stainless Steel"}'::jsonb),
('264-1420','کلید قطع‌کن دمای بالای آب Cat 264-1420','کلید قطع‌کن دمای بالای آب با تأیید کاربرد دریایی؛ از کلیدهای دمایی بیمتال برای تغییر وضعیت مدار در نقطه دمایی مشخص استفاده می‌شود.','موتور دریایی - برق و پایش - کلید دما','https://parts.cat.com/en/catcorp/product/264-1420','{"component":"High Water Temperature Shutdown Switch","marine_approved":true}'::jsonb),
('603-6733','شفت پروانه پمپ آب دریا کمکی Cat 603-6733','شفت استنلس‌استیل برای مجموعه پمپ آب دریا کمکی؛ Cat سازگاری C32 MARINE را در Marine Engine فهرست کرده است.','موتور دریایی - خنک‌کاری - پمپ آب دریا','https://parts.cat.com/en/catcorp/product/603-6733','{"component":"Auxiliary Sea Water Pump Impeller Shaft","material":"Stainless Steel"}'::jsonb),
('479-8318','یاتاقان نیم‌پوسته شاتون Cat 479-8318','یاتاقان شاتون با پشت‌بند فولادی و لایه مس-سرب برای توزیع بارهای تناوبی و اتصال شاتون به میل‌لنگ؛ سازگاری C32 MARINE در فهرست Marine Engine آمده است.','موتور دریایی - مجموعه میل‌لنگ - یاتاقان شاتون','https://parts.cat.com/en/catcorp/product/479-8318','{"component":"Connecting Rod Bearing","width_mm":41,"material":"Steel Backed Copper-Lead Bearing"}'::jsonb),
('377-0250','کلید قفل انتخابگر Cat 377-0250','کلید قفل انتخابگر دو یا سه‌حالته؛ جنس پلی‌ایمید و فهرست رسمی شامل C32 MARINE در گروه Marine Engine است.','برق موتور دریایی - کلیدهای کنترلی','https://parts.cat.com/en/catcorp/product/377-0250','{"component":"Selector Lock Switch","positions":"2 or 3","material":"Polyimide Plastic"}'::jsonb),
('3N-1400','کلید Cat 3N-1400','کلید با بدنه فولاد کربنی؛ صفحه رسمی Cat شرح عملکرد تفصیلی ندارد اما C32 MARINE را در گروه Marine Engine فهرست می‌کند؛ تعیین کارکرد دقیق نیازمند بررسی دیاگرام است.','برق موتور دریایی - کلیدها','https://parts.cat.com/en/catcorp/product/3N-1400','{"component":"Switch","material":"Carbon Steel","description_status":"Not provided by Cat public listing"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public listing includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
 s.source_url,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET name=EXCLUDED.name,description=EXCLUDED.description,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=EXCLUDED.source_note,verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_accessed_at=now(),compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications
 RETURNING part_number
), product_safety AS (
 UPDATE public.products p SET status='INACTIVE'
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4571546','5965772','4665531','4696273','2641420','6036733','4798318','3770250','3N1400')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;