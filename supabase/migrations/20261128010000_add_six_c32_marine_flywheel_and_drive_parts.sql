WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('4P-2543','پلانجر موقعیت‌یاب کاور فلایویل Cat 4P-2543','پلانجر موقعیت‌یاب فنردار برای تعیین دقیق محل و نگهداری کاور فلایویل؛ بدنه با قطر 0.36، قطر فلنج 0.75، قطر سر 0.83 و طول کلی 2.2 اینچ.','موتور دریایی - فلایویل - پلانجر موقعیت‌یاب','https://parts.cat.com/en/catcorp/product/4P-2543','{"component":"Flywheel Cover Indexing Plunger","body_diameter_in":0.36,"flange_diameter_in":0.75,"head_diameter_in":0.83,"overall_length_in":2.2,"materials":["Nylon","Carbon Steel"],"type":"Cam Lock"}'::jsonb),
('225-1242','گسکت هوزینگ فلایویل Cat 225-1242','گسکت لاستیک و فولاد برای آب‌بندی اتصال هوزینگ فلایویل و جلوگیری از نشت سیال و ورود آلودگی؛ صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - فلایویل - گسکت هوزینگ','https://parts.cat.com/en/catcorp/product/225-1242','{"component":"Flywheel Housing Gasket","material":"Rubber & Steel Gasket"}'::jsonb),
('7N-2432','آداپتور محرک پمپ هیدرولیک Cat 7N-2432','آداپتور محرک برای انتقال گشتاور از شفت موتور به شفت ورودی پمپ هیدرولیک و حفظ هم‌راستایی اجزا؛ از چدن خاکستری ساخته شده و برای فشار روغن 35 psi طراحی شده است.','موتور دریایی - محرک پمپ کمکی - آداپتور','https://parts.cat.com/en/catcorp/product/7N-2432','{"component":"Hydraulic Pump Drive Adapter","material":"Gray (Flake) Iron","oil_pressure_psi":35}'::jsonb),
('5L-2017','مهره شش‌گوش کلاچ ۱ و ۳/۴ اینچ Cat 5L-2017','مهره شش‌گوش رزوه 1-3/4-16 برای تثبیت اجزای رزوه‌دار مجموعه کلاچ و مقاومت در برابر شل‌شدن ناشی از لرزش و بارهای دورانی.','موتور دریایی - کلاچ و فلایویل - مهره شش‌گوش','https://parts.cat.com/en/catcorp/product/5L-2017','{"component":"Clutch Hex Nut","thread":"1-3/4-16"}'::jsonb),
('224-1221','شفت واسط با قطر ۷۰.۹۵۲ میلی‌متر Cat 224-1221','شفت واسط برای انتقال حرکت دورانی و گشتاور میان اجزای محرک در هوزینگ فلایویل؛ قطر شفت 70.952 میلی‌متر و فهرست رسمی Cat شامل C32 MARINE است.','موتور دریایی - فلایویل - شفت واسط','https://parts.cat.com/en/catcorp/product/224-1221','{"component":"Flywheel Housing Rear Gear Stub Shaft","shaft_diameter_mm":70.952}'::jsonb),
('4W-8689','پین داول بوش محرک پمپ هیدرولیک Cat 4W-8689','پین داول فولاد کربنی برای موقعیت‌دهی دقیق بوش محرک پمپ هیدرولیک در هوزینگ و هم‌مرکز نگه‌داشتن شفت؛ قطر خارجی 0.622، قطر داخلی 0.354 و طول 0.512 اینچ.','موتور دریایی - محرک پمپ کمکی - پین داول','https://parts.cat.com/en/catcorp/product/4W-8689','{"component":"Hydraulic Pump Drive Bushing Dowel Pin","outside_diameter_in":0.622,"inside_diameter_in":0.354,"length_in":0.512,"material":"Carbon Steel"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4P2543','2251242','7N2432','5L2017','2241221','4W8689')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;