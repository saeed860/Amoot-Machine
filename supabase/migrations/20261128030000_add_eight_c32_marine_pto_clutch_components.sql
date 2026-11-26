WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('5B-2410','شیلنگ کوپلینگ کلاچ با دو زانویی Cat 5B-2410','شیلنگ کوپلینگ کلاچ با دو اتصال زانویی برای انتقال سیال یا فشار کنترلی به مکانیزم درگیری و آزادسازی کلاچ؛ طول کلی 15 اینچ و سازگاری C32 MARINE در گروه Marine Engine درج شده است.','موتور دریایی - کلاچ PTO - شیلنگ کوپلینگ','https://parts.cat.com/en/catcorp/product/5B-2410','{"component":"Two Elbow Clutch Coupling Hose","overall_length_in":15.0}'::jsonb),
('4W-2653','اهرم دستی کلاچ PTO Cat 4W-2653','اهرم دستی برای درگیر و آزادکردن کلاچ انتقال توان کمکی؛ امکان کنترل مستقیم انتقال نیروی دورانی موتور به شفت PTO و تجهیزات جانبی را فراهم می‌کند.','موتور دریایی - انتقال توان کمکی - اهرم کلاچ','https://parts.cat.com/en/catcorp/product/4W-2653','{"component":"Power Take-Off Clutch Hand Lever"}'::jsonb),
('2L-8259','اهرم کلاچ موتور و فلایویل Cat 2L-8259','اهرم کلاچ برای درگیرکردن و آزادسازی اتصال میان فلایویل موتور و سامانه انتقال قدرت؛ برای کنترل انتقال توان و کاهش تنش مکانیکی هنگام تعویض وضعیت طراحی شده است.','موتور دریایی - فلایویل و کلاچ - اهرم','https://parts.cat.com/en/catcorp/product/2L-8259','{"component":"Engine and Flywheel Clutch Lever"}'::jsonb),
('3N-7952','صفحه محرک کلاچ PTO با ضخامت ۱۱.۱۳ میلی‌متر Cat 3N-7952','صفحه محرک برای اتصال و قطع انتقال توان از موتور به تجهیزات متصل؛ دارای 72 دندانه هزارخار خارجی، قطر خارجی 310.97، قطر داخلی 158.95 و ضخامت 11.13 میلی‌متر.','موتور دریایی - PTO - صفحه محرک کلاچ','https://parts.cat.com/en/catcorp/product/3N-7952','{"component":"Power Take-Off Clutch Drive Plate","external_spline_teeth":72,"outside_diameter_mm":310.97,"inside_diameter_mm":158.95,"thickness_mm":11.13}'::jsonb),
('6L-3966','پین اتصال اهرم کلاچ با قطر ۹.۵۲ میلی‌متر Cat 6L-3966','پین اتصال از فولاد کربنی با سوراخ عرضی برای نصب اشپیل؛ قطر 9.52، طول 57 و قطر سر 12.7 میلی‌متر برای اتصال و موقعیت‌دهی اجزای لینک کلاچ.','موتور دریایی - کلاچ PTO - پین اتصال','https://parts.cat.com/en/catcorp/product/6L-3966','{"component":"Linkage Clevis Pin","pin_diameter_mm":9.52,"pin_length_mm":57,"head_diameter_mm":12.7,"head_height_mm":3,"pin_type":"Cross Hole","materials":["Carbon Steel","Alloy Zinc"]}'::jsonb),
('5B-5251','لینک اتصال مکانیزم کلاچ Cat 5B-5251','لینک مکانیکی برای انتقال حرکت اهرم به مجموعه کلاچ و هماهنگ‌سازی درگیری و آزادسازی؛ صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - کلاچ PTO - لینک اتصال','https://parts.cat.com/en/catcorp/product/5B-5251','{"component":"Clutch Link"}'::jsonb),
('2L-8262','حلقه تنظیم کلاچ با ضخامت ۰.۶ اینچ Cat 2L-8262','حلقه تنظیم برای تنظیم موقعیت و لقی مجموعه کلاچ و کمک به درگیری پایدار و جلوگیری از لغزش؛ ضخامت 0.6 اینچ و سازگاری C32 MARINE در Marine Engine درج شده است.','موتور دریایی - کلاچ PTO - حلقه تنظیم','https://parts.cat.com/en/catcorp/product/2L-8262','{"component":"Clutch Adjusting Ring","thickness_in":0.6}'::jsonb),
('6L-3965','پین دوشاخه‌ای کلاچ با قطر ۰.۳۱۱ اینچ Cat 6L-3965','پین دوشاخه‌ای با سوراخ عرضی برای اتصال اجزای مکانیزم کلاچ؛ قطر 0.311 و طول 0.94 اینچ و سازگاری C32 MARINE در گروه Marine Engine درج شده است.','موتور دریایی - کلاچ PTO - پین دوشاخه‌ای','https://parts.cat.com/en/catcorp/product/6L-3965','{"component":"Clevis Pin","pin_diameter_in":0.311,"pin_length_in":0.94,"pin_type":"Cross Hole"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5B2410','4W2653','2L8259','3N7952','6L3966','5B5251','2L8262','6L3965')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;