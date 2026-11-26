WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('353-9030','بونت برگشت مبدل حرارتی آب دریا Cat 353-9030','بونت برگشت برای هدایت آب دریا پس از جذب گرما به مسیر بازگشت مبدل حرارتی؛ طراحی‌شده برای تحمل فشار آب تا 240 کیلوپاسکال.','موتور دریایی - مبدل حرارتی - بونت برگشت','https://parts.cat.com/en/catcorp/product/353-9030','{"component":"Heat Exchanger Return Bonnet","water_pressure_kpa":240,"fluid":"Seawater"}'::jsonb),
('353-9034','اسپیسر ۴ میلی‌متری هوزینگ مبدل حرارتی Cat 353-9034','اسپیسر مسی با ضخامت 4 میلی‌متر برای حفظ فاصله و هم‌راستایی بین هوزینگ مبدل حرارتی و بونت و توزیع یکنواخت بار.','موتور دریایی - مبدل حرارتی - اسپیسر هوزینگ','https://parts.cat.com/en/catcorp/product/353-9034','{"component":"Heat Exchanger Housing Spacer","thickness_mm":4,"material":"Alloy Copper"}'::jsonb),
('353-9036','بونت مبدل حرارتی آب دریا Cat 353-9036','بونت مسی در بخش بالایی مبدل حرارتی برای ایجاد محفظه آب‌بندی‌شده و جلوگیری از نشت سیالات؛ فشار آب طراحی تا 240 کیلوپاسکال.','موتور دریایی - مبدل حرارتی - بونت','https://parts.cat.com/en/catcorp/product/353-9036','{"component":"Sea Water Heat Exchanger Bonnet","material":"Alloy Copper","water_pressure_kpa":240}'::jsonb),
('347-8906','اسپیسر ۴ میلی‌متری مبدل حرارتی Cat 347-8906','اسپیسر برنجی و مسی بین هوزینگ مبدل حرارتی و بونت برگشت برای ایجاد فاصله دقیق، حفظ هم‌راستایی و آب‌بندی مجموعه.','موتور دریایی - مبدل حرارتی - اسپیسر','https://parts.cat.com/en/catcorp/product/347-8906','{"component":"Heat Exchanger Spacer","thickness_mm":4,"materials":["Alloy Brass","Alloy Copper"]}'::jsonb),
('135-2654','اورینگ HNBR با قطر داخلی ۱۵۸.۳۴ میلی‌متر Cat 135-2654','اورینگ HNBR با مقطع 3.53 میلی‌متر، قطر داخلی 158.34 میلی‌متر و سختی 78A؛ مناسب آب‌بندی اتصالات ثابت و برخی کاربردهای دینامیکی.','موتور دریایی - مبدل حرارتی - اورینگ','https://parts.cat.com/en/catcorp/product/135-2654','{"component":"O-Ring Seal","cross_section_mm":3.53,"inside_diameter_mm":158.34,"hardness":"78A","polymer":"HNBR"}'::jsonb),
('586-1398','آب‌بند U شکل ۶ میلی‌متری بونت عقب Cat 586-1398','آب‌بند U شکل لاستیکی برای دیواره بونت مبدل حرارتی آب دریا با طول 158.4، عرض 6 و ارتفاع 9 میلی‌متر؛ برای جلوگیری از جریان متقاطع و خوردگی.','موتور دریایی - مبدل حرارتی - آب‌بند U','https://parts.cat.com/en/catcorp/product/586-1398','{"component":"Rear Bonnet U Seal","length_mm":158.4,"width_mm":6,"height_mm":9,"material":"Rubber"}'::jsonb),
('385-4584','مجموعه بست توربین توربوشارژر Cat 385-4584','بست فولادی توربین توربوشارژر با طول 8.6 و ارتفاع 1 اینچ برای مهار اتصال مجموعه توربین و تحمل بارهای عملیاتی.','موتور دریایی - توربوشارژر - بست توربین','https://parts.cat.com/en/catcorp/product/385-4584','{"component":"Turbocharger Turbine Clamp Assembly","length_in":8.6,"height_in":1.0,"material":"Carbon Steel"}'::jsonb),
('189-5124','بست کمپرسور توربوشارژر با قطر ۲۴۴.۱ میلی‌متر Cat 189-5124','بست استنلس‌استیل با قطر 244.1 میلی‌متر برای مهار کارتریج کمپرسور توربوشارژر؛ طول 10.6 و ارتفاع 1.9 اینچ.','موتور دریایی - توربوشارژر - بست کمپرسور','https://parts.cat.com/en/catcorp/product/189-5124','{"component":"Turbocharger Compressor Clamp","diameter_mm":244.1,"length_in":10.6,"height_in":1.9,"material":"Stainless Steel"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('3539030','3539034','3539036','3478906','1352654','5861398','3854584','1895124')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;