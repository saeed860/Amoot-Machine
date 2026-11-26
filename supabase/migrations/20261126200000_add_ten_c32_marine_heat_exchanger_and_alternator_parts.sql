WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('610-1302','مجموعه مبدل حرارتی Cat 610-1302','مجموعه مبدل حرارتی آلومینیومی برای انتقال حرارت میان دو سیال؛ فهرست رسمی Cat سازگاری C32 MARINE را به‌صورت صریح نشان می‌دهد.','موتور دریایی - خنک‌کاری - مبدل حرارتی','https://parts.cat.com/en/catcorp/product/610-1302','{"component":"Heat Exchanger Group","material":"Alloy Aluminum"}'::jsonb),
('587-1664','صفحه انتهایی مبدل حرارتی Cat 587-1664','صفحه انتهایی برای آب‌بندی و محصورکردن یک سمت مبدل حرارتی و جلوگیری از اختلاط دو جریان سیال؛ جنس فلز آلیاژی است.','موتور دریایی - مبدل حرارتی - صفحات انتهایی','https://parts.cat.com/en/catcorp/product/587-1664','{"component":"Heat Exchanger End Plate","material":"Alloy Mixed Metal"}'::jsonb),
('579-3853','براکت نصب مبدل حرارتی آب دریا Cat 579-3853','براکت فولادی برای نگهداری و تثبیت مبدل حرارتی آب دریا در سمت راست مجموعه؛ طراحی‌شده برای تحمل بارهای عملیاتی محیط دریایی.','موتور دریایی - مبدل حرارتی - براکت نصب','https://parts.cat.com/en/catcorp/product/579-3853','{"component":"Heat Exchanger Mount Bracket","position":"Right Hand Side","materials":["Carbon Steel","Structural Steel"]}'::jsonb),
('587-1668','صفحه انتهایی مبدل حرارتی Cat 587-1668','صفحه فلزی انتهایی برای ایجاد محفظه آب‌بندی‌شده در مبدل حرارتی و کنترل جدایی دو جریان سیال.','موتور دریایی - مبدل حرارتی - صفحات انتهایی','https://parts.cat.com/en/catcorp/product/587-1668','{"component":"Heat Exchanger End Plate","material":"Alloy Mixed Metal"}'::jsonb),
('609-1189','فریم پشتی مبدل حرارتی آب دریا Cat 609-1189','فریم پشتی برای پشتیبانی ساختاری از مبدل حرارتی آب دریا و حفظ پایداری آن در شرایط کاری دریایی.','موتور دریایی - مبدل حرارتی - فریم پشتی','https://parts.cat.com/en/catcorp/product/609-1189','{"component":"Sea Water Heat Exchanger Rear Frame"}'::jsonb),
('353-9028','هوزینگ مبدل حرارتی Cat 353-9028','محفظه آلومینیومی برای حفاظت و نگهداری اجزای مبدل حرارتی و فراهم‌کردن مسیرهای ورودی و خروجی سیالات.','موتور دریایی - مبدل حرارتی - هوزینگ','https://parts.cat.com/en/catcorp/product/353-9028','{"component":"Heat Exchanger Housing","material":"Alloy Aluminum"}'::jsonb),
('353-9029','مغزی مسی مبدل حرارتی Cat 353-9029','مغزی مبدل حرارتی با طول 334 میلی‌متر و جنس مس آلیاژی برای انتقال حرارت بین دو جریان سیال.','موتور دریایی - مبدل حرارتی - مغزی','https://parts.cat.com/en/catcorp/product/353-9029','{"component":"Heat Exchanger Core","length_mm":334,"material":"Alloy Copper"}'::jsonb),
('353-9037','مغزی مبدل حرارتی روغن موتور Cat 353-9037','مغزی مسی مبدل حرارتی برای خنک‌کردن روغن موتور؛ آزمون نشتی با فشار هوای 400 کیلوپاسکال در اطلاعات رسمی ذکر شده است.','موتور دریایی - روغن‌کاری - خنک‌کن روغن','https://parts.cat.com/en/catcorp/product/353-9037','{"component":"Engine Heat Exchanger Core","material":"Alloy Copper","air_leak_test_kpa":400}'::jsonb),
('586-1393','بونت مبدل حرارتی Cat 586-1393','بونت مسی برای محصورکردن و محافظت از مغزی یا اجزای داخلی مبدل حرارتی و حفظ هم‌راستایی آن‌ها.','موتور دریایی - مبدل حرارتی - بونت','https://parts.cat.com/en/catcorp/product/586-1393','{"component":"Heat Exchanger Bonnet","material":"Alloy Copper"}'::jsonb),
('362-0732','آلترناتور شارژ ۲۴ ولت ۷۰ آمپر Cat 362-0732','آلترناتور شارژ 24 ولت و 70 آمپر برای تولید برق و شارژ باتری سامانه الکتریکی موتور؛ Cat سازگاری C32 MARINE را در Marine Engine درج کرده است.','موتور دریایی - برق - آلترناتور شارژ','https://parts.cat.com/en/catcorp/product/362-0732','{"component":"Charging Alternator","voltage":24,"current_amp":70}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6101302','5871664','5793853','5871668','6091189','3539028','3539029','3539037','5861393','3620732')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;