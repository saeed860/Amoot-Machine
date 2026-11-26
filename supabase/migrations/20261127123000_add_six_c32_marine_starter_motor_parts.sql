WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('308-1365','استاتور آلترناتور شارژ ۲۴ ولت Cat 308-1365','استاتور ثابت آلترناتور شامل هسته آهنی لایه‌ای و سیم‌پیچ‌های مسی عایق‌شده برای تولید برق و شارژ باتری در زمان کار موتور؛ صفحه رسمی Cat سازگاری C32 MARINE را در Marine Engine درج می‌کند.','موتور دریایی - برق - استاتور آلترناتور','https://parts.cat.com/en/catcorp/product/308-1365','{"component":"24V Charging Alternator Stator","materials":["Laminated Iron Core","Copper Windings"]}'::jsonb),
('3T-4709','صفحه عایق جاروبک موتور استارت Cat 3T-4709','صفحه عایق موتور استارت برای ایجاد جداسازی الکتریکی میان نگهدارنده جاروبک و بدنه موتور؛ طول 1.36، عرض 0.59 و ضخامت 0.02 اینچ طبق Cat.','موتور دریایی - استارت - صفحه عایق جاروبک','https://parts.cat.com/en/catcorp/product/3T-4709','{"component":"Electric Starting Motor Insulated Brush Plate","length_in":1.36,"width_in":0.59,"thickness_in":0.02}'::jsonb),
('6T-0371','عایق آلومینیومی صفحه جاروبک با ضخامت ۳.۱۷۵ میلی‌متر Cat 6T-0371','عایق آلومینیومی صفحه جاروبک برای جداسازی الکتریکی جاروبک‌ها از بدنه موتور و کمک به دفع حرارت؛ قطر داخلی 2.37 و ضخامت 0.12 اینچ.','موتور دریایی - استارت - عایق صفحه جاروبک','https://parts.cat.com/en/catcorp/product/6T-0371','{"component":"Brush Plate Aluminum Insulator","thickness_mm":3.175,"inside_diameter_in":2.37,"material":"Alloy Aluminum"}'::jsonb),
('2L-6679','صفحه عایق نگهدارنده جاروبک با ضخامت ۰.۰۹ اینچ Cat 2L-6679','صفحه عایق غیررسانا برای جداسازی نگهدارنده جاروبک از بدنه موتور استارت و جلوگیری از اتصال کوتاه؛ طول 1.8، عرض 1.0 و ضخامت 0.09 اینچ.','موتور دریایی - استارت - صفحه عایق نگهدارنده','https://parts.cat.com/en/catcorp/product/2L-6679','{"component":"Brush Holder Insulator Plate","length_in":1.8,"width_in":1.0,"thickness_in":0.09,"material":"Tin"}'::jsonb),
('3T-4710','صفحه جاروبک اتصال زمین استارت Cat 3T-4710','صفحه فولاد زنگ‌نزن برای ایجاد اتصال زمین مطمئن در مجموعه جاروبک موتور استارت؛ طول 1.36، عرض 0.59 و ضخامت 0.06 اینچ.','موتور دریایی - استارت - صفحه اتصال زمین جاروبک','https://parts.cat.com/en/catcorp/product/3T-4710','{"component":"Electric Starting Motor Grounded Brush Plate","length_in":1.36,"width_in":0.59,"thickness_in":0.06,"material":"Stainless Steel"}'::jsonb),
('6T-0363','مجموعه نگهدارنده جاروبک استارت Cat 6T-0363','مجموعه نگهدارنده جاروبک سنگین برای تثبیت جاروبک‌ها و حفظ تماس الکتریکی با کموتاتور؛ جنس استنلس‌استیل و ابعاد طول 1.6، عرض 1.5 و ارتفاع 0.8 اینچ.','موتور دریایی - استارت - نگهدارنده جاروبک','https://parts.cat.com/en/catcorp/product/6T-0363','{"component":"Brush Holder Assembly","length_in":1.6,"width_in":1.5,"height_in":0.8,"material":"Stainless Steel"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public listing explicitly includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('3081365','3T4709','6T0371','2L6679','3T4710','6T0363')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;