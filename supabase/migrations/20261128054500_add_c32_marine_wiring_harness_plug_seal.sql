WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('8T-8737','پلاگ آب‌بند ۱۷.۵ میلی‌متری کانکتور دسته‌سیم Cat 8T-8737','پلاگ آب‌بند نایلونی برای مسدودکردن خانه‌های استفاده‌نشده کانکتور دسته‌سیم و جلوگیری از ورود رطوبت، گردوغبار و ذرات؛ مقاوم در برابر آب، روغن و سوخت. صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine درج می‌کند.','برق موتور دریایی - دسته‌سیم - پلاگ آب‌بند کانکتور','https://parts.cat.com/en/catcorp/product/8T-8737','{"component":"Wiring Harness Plug Seal","length_mm":17.5,"diameter_in":0.16,"materials":["Nylon 6","Nylon 6/12","Nylon 6/6","Thermoplastic"],"resistance":["Water","Oil","Fuel"]}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public compatible-model listing explicitly includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('8T8737')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;