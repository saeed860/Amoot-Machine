WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('550-4890','زانویی سمت چپ خطوط آب با قطر داخلی ۴۵ میلی‌متر Cat 550-4890','زانویی چدنی سمت چپ خطوط آب برای تغییر مسیر مایع خنک‌کننده و حفظ گردش روان سیال؛ طراحی‌شده برای فشار آب 240 کیلوپاسکال و شرایط دمایی مدار خنک‌کاری.','موتور دریایی - خنک‌کاری - زانویی خطوط آب','https://parts.cat.com/en/catcorp/product/550-4890','{"component":"Left-Hand Water Lines Elbow","inside_diameter_mm":45,"material":"Gray (Flake) Iron","water_pressure_kpa":240}'::jsonb),
('5P-5598','اورینگ FKM با مقطع ۳.۵۳ و قطر داخلی ۱۵.۴۷ میلی‌متر Cat 5P-5598','اورینگ FKM با مقطع 3.53 میلی‌متر، قطر داخلی 15.47 میلی‌متر و سختی 75A برای آب‌بندی اتصالات سیال و جلوگیری از نشت در مدار موتور.','موتور دریایی - آب‌بندی - اورینگ FKM','https://parts.cat.com/en/catcorp/product/5P-5598','{"component":"O-Ring Seal","cross_section_mm":3.53,"inside_diameter_mm":15.47,"hardness":"75A","polymer":"FKM"}'::jsonb),
('491-1378','مجموعه لوله فولادی Cat 491-1378','مجموعه لوله فولادی کربنی برای انتقال سیال یا هوا در مسیری که به انعطاف‌پذیری شیلنگ نیاز ندارد؛ فهرست رسمی Cat، C32 MARINE را در Marine Engine نشان می‌دهد.','موتور دریایی - خطوط سیال - لوله فولادی','https://parts.cat.com/en/catcorp/product/491-1378','{"component":"Steel Tube Assembly","material":"Carbon Steel","application":"Rigid fluid or air line"}'::jsonb),
('8T-1703','اورینگ EPDM با مقطع ۳.۵۳ و قطر داخلی ۵۶.۷۴ میلی‌متر Cat 8T-1703','اورینگ EPDM با مقطع 3.53 میلی‌متر، قطر داخلی 56.74 میلی‌متر و سختی 70A؛ برای آب‌بندی اتصالات آب و سیالات سازگار با EPDM استفاده می‌شود.','موتور دریایی - خنک‌کاری - اورینگ EPDM','https://parts.cat.com/en/catcorp/product/8T-1703','{"component":"O-Ring Seal","cross_section_mm":3.53,"inside_diameter_mm":56.74,"hardness":"70A","polymer":"EPDM"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5504890','5P5598','4911378','8T1703')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;