WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('526-1329','بازوی اسبک سوپاپ موتور Cat 526-1329','بازوی اسبک برای انتقال حرکت بادامک به ساق سوپاپ و کنترل باز و بسته‌شدن سوپاپ‌های ورودی و خروجی؛ Cat سازگاری C32 MARINE را در گروه Marine Engine درج کرده است.','موتور دریایی - سرسیلندر - بازوی اسبک','https://parts.cat.com/en/catcorp/product/526-1329','{"component":"Engine Rocker Arm","application":"Valve actuation"}'::jsonb),
('497-5514','پیچ استاد ۳/۸ اینچ درپوش میل‌بادامک Cat 497-5514','پیچ استاد برای تثبیت درپوش میل‌بادامک و حفظ هم‌راستایی و آب‌بندی مجموعه؛ جنس فولاد کربنی با پوشش فلز روی است.','موتور دریایی - میل‌بادامک - پیچ استاد درپوش','https://parts.cat.com/en/catcorp/product/497-5514','{"component":"Camshaft Cover Stud Bolt","nominal_size_in":0.375,"materials":["Alloy Zinc","Carbon Steel"]}'::jsonb),
('556-0416','بلبرینگ ساچمه‌ای Cat 556-0416','بلبرینگ ساچمه‌ای از فولاد آلیاژی برای کاهش اصطکاک و پشتیبانی از حرکت دورانی در مجموعه موتور؛ Cat مدل C32 MARINE را در فهرست Marine Engine نشان می‌دهد.','موتور دریایی - یاتاقان‌ها - بلبرینگ','https://parts.cat.com/en/catcorp/product/556-0416','{"component":"Ball Bearing","material":"Alloy Steel"}'::jsonb),
('274-4051','کاور میل‌بادامک آلومینیومی Cat 274-4051','کاور آلومینیومی میل‌بادامک با شیار آب‌بند PIP؛ آب‌بند به‌صورت جداگانه تهیه می‌شود. برای پیچ و مهره ۳/۸ اینچ طراحی شده و قطر خارجی 12.2 و ارتفاع 0.8 اینچ دارد.','موتور دریایی - میل‌بادامک - کاور','https://parts.cat.com/en/catcorp/product/274-4051','{"component":"Camshaft Cover","material":"Alloy Aluminum","outside_diameter_in":12.2,"height_in":0.8,"hole_size_in":["0.4 (2X)","0.5 (1X)"],"pip_seal_included":false}'::jsonb),
('224-1214','چرخ‌دنده میل‌لنگ ۴۹ دندانه Cat 224-1214','چرخ‌دنده ۴۹ دندانه میل‌لنگ برای انتقال حرکت دورانی و هماهنگ‌سازی زمان‌بندی اجزای موتور؛ صفحه رسمی Cat مدل C32 MARINE را در گروه Marine Engine فهرست می‌کند.','موتور دریایی - میل‌لنگ - چرخ‌دنده','https://parts.cat.com/en/catcorp/product/224-1214','{"component":"Crankshaft Gear","teeth":49}'::jsonb),
('479-8317','صفحه کنترل لقی محوری میل‌لنگ Cat 479-8317','صفحه تراست میل‌لنگ از مس آلیاژی برای کنترل حرکت محوری میل‌لنگ و کاهش سایش سطوح مجاور؛ فهرست رسمی Cat سازگاری C32 MARINE را در Marine Engine نشان می‌دهد.','موتور دریایی - میل‌لنگ - صفحه تراست','https://parts.cat.com/en/catcorp/product/479-8317','{"component":"Crank Shaft Thrust Plate","material":"Alloy Copper"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5261329','4975514','5560416','2744051','2241214','4798317')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;