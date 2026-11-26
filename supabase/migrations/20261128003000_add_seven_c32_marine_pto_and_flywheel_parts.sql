WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('5N-3790','کلاچ انتقال توان PTO موتور Cat 5N-3790','کلاچ PTO برای درگیر و آزادکردن انتقال توان میان موتور و تجهیزات کمکی؛ طراحی‌شده برای تحمل گشتاور، نیروهای دورانی، حرارت و چرخه‌های مکرر درگیری و آزادسازی.','موتور دریایی - انتقال توان کمکی - کلاچ PTO','https://parts.cat.com/en/catcorp/product/5N-3790','{"component":"Power Take-Off Clutch","function":"Engage and disengage auxiliary power transmission"}'::jsonb),
('4B-4756','شفت اهرم دستی کلاچ PTO Cat 4B-4756','شفت اهرم دستی برای تنظیم و انتقال حرکت به مکانیزم درگیری کلاچ PTO؛ فهرست رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine درج می‌کند.','موتور دریایی - انتقال توان کمکی - شفت اهرم کلاچ','https://parts.cat.com/en/catcorp/product/4B-4756','{"component":"Power Take-Off Clutch Hand Lever Shaft"}'::jsonb),
('1K-2811','بوش یقه‌ای شفت کلاچ فلایویل Cat 1K-2811','بوش یقه‌ای برای حفظ هم‌راستایی و جلوگیری از حرکت محوری شفت کلاچ در محل اتصال به فلایویل؛ به پایداری دوران مجموعه کمک می‌کند.','موتور دریایی - فلایویل و کلاچ - بوش شفت','https://parts.cat.com/en/catcorp/product/1K-2811','{"component":"Engine Flywheel Clutch Shaft Collar"}'::jsonb),
('1N-7513','خار کلاچ فلایویل Cat 1N-7513','خار کلاچ فلایویل برای ایجاد اتصال مکانیکی دقیق میان فلایویل و شفت کلاچ و جلوگیری از لغزش نسبی اجزا؛ Cat مدل C32 MARINE را در فهرست Marine Engine درج می‌کند.','موتور دریایی - فلایویل و کلاچ - خار','https://parts.cat.com/en/catcorp/product/1N-7513','{"component":"Flywheel Clutch Key"}'::jsonb),
('356-3465','کاور پنل دسترسی هوزینگ فلایویل Cat 356-3465','کاور فولاد کربنی برای پوشاندن پنل دسترسی هوزینگ فلایویل و محافظت از مجموعه در برابر گردوغبار، رطوبت و آسیب مکانیکی؛ فهرست رسمی Cat سازگاری C32 MARINE را نشان می‌دهد.','موتور دریایی - فلایویل - کاور پنل دسترسی','https://parts.cat.com/en/catcorp/product/356-3465','{"component":"Flywheel Housing Access Panel Cover","material":"Carbon Steel"}'::jsonb),
('230-4157','کاور عقب هوزینگ فلایویل Cat 230-4157','کاور فولاد کربنی برای محافظت از فلایویل و بخش عقب هوزینگ در برابر آلودگی، رطوبت و آسیب مکانیکی؛ به استحکام سازه‌ای و حفظ هم‌راستایی کمک می‌کند.','موتور دریایی - فلایویل - کاور عقب هوزینگ','https://parts.cat.com/en/catcorp/product/230-4157','{"component":"Flywheel Housing Rear Cover","material":"Carbon Steel"}'::jsonb),
('493-9462','حلقه تنظیم کلاچ PTO Cat 493-9462','حلقه تنظیم برای تنظیم دقیق کلاچ PTO و پشتیبانی از درگیری یکنواخت و پایدار کلاچ در انتقال توان به تجهیزات کمکی.','موتور دریایی - انتقال توان کمکی - حلقه تنظیم کلاچ','https://parts.cat.com/en/catcorp/product/493-9462','{"component":"Power Take-Off Clutch Adjusting Ring"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public compatible-model listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment not verified.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5N3790','4B4756','1K2811','1N7513','3563465','2304157','4939462')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;