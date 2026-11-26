WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('493-9461','اهرم کلاچ موتور Cat 493-9461','اهرم دستی برای درگیر و آزادکردن کلاچ و کنترل انتقال توان از موتور به مجموعه انتقال قدرت؛ طول 2.44، عرض 0.94 و ارتفاع 1.75 اینچ و جنس فولاد کربنی.','موتور دریایی - کلاچ - اهرم کنترل','https://parts.cat.com/en/catcorp/product/493-9461','{"component":"Engine Clutch Lever","length_in":2.44,"width_in":0.94,"height_in":1.75,"hole_sizes_in":[0.38,0.31],"material":"Carbon Steel"}'::jsonb),
('8M-6755','چرخ‌دنده رینگی استارت فلایویل ۱۳۶ دندانه Cat 8M-6755','چرخ‌دنده رینگی فلایویل با 136 دندانه برای درگیری با دنده استارت و انتقال گشتاور به میل‌لنگ؛ سطح دندانه‌ها با شعله سخت‌کاری شده و اتصال جوشی لب‌به‌لب دارد. قطر خارجی 22.8 و ارتفاع 0.9 اینچ.','موتور دریایی - فلایویل و استارت - رینگ‌گیر','https://parts.cat.com/en/catcorp/product/8M-6755','{"component":"Flywheel Starter Ring Gear","teeth":136,"outside_diameter_in":22.8,"height_in":0.9,"surface_treatment":"Flame Hardened","joint":"Butt Weld"}'::jsonb),
('273-8703','کاور پنل دسترسی هوزینگ فلایویل Cat 273-8703','کاور پنل دسترسی برای محافظت از دهانه سرویس هوزینگ فلایویل و جلوگیری از ورود گردوغبار و آلودگی به مجموعه چرخ‌دنده و فلایویل؛ Cat سازگاری C32 MARINE را در گروه Marine Engine فهرست می‌کند.','موتور دریایی - فلایویل - کاور پنل دسترسی','https://parts.cat.com/en/catcorp/product/273-8703','{"component":"Flywheel Housing Access Panel Cover"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4939461','8M6755','2738703')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;