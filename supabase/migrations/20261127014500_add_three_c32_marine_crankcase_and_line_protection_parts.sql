WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('383-1373','پد فیلتر بخارات ۶.۳۵ میلی‌متری Cat 383-1373','پد فیلتر برای جذب بخارات و ذرات حاصل از فرآیند روغن‌کاری؛ جنس لایه‌ها شامل چسب اکریلیک و لاستیک کلروپرن است و C32 MARINE در فهرست Marine Engine درج شده است.','موتور دریایی - تهویه کارتر - پد فیلتر بخارات','https://parts.cat.com/en/catcorp/product/383-1373','{"component":"Fumes Disposal Filter Pad","thickness_mm":6.35,"materials":["Acrylic Adhesive","Chloroprene (CR) Rubber"]}'::jsonb),
('532-4636','کاور جداکننده فیلتر بخارات Cat 532-4636','کاور آلومینیومی جداکننده فیلتر بخارات برای محصورکردن و محافظت از المان فیلتر در برابر گردوغبار، رطوبت و ذرات محیطی؛ C32 MARINE در گروه Marine Engine فهرست شده است.','موتور دریایی - تهویه کارتر - کاور جداکننده','https://parts.cat.com/en/catcorp/product/532-4636','{"component":"Fumes Disposal Filter Separator Cover","material":"Alloy Aluminum"}'::jsonb),
('237-3860','نوار ضدپاشش ۵۰ میلی‌متری Cat 237-3860','نوار ضدپاشش از پارچه لمینیت‌شده با چسب سیلیکونی مقاوم به دما برای ایجاد پوشش محافظ روی خطوط سیال؛ طول رول 32.8 فوت، عرض 1.97 اینچ و ضخامت 0.013 اینچ است.','موتور دریایی - محافظت خطوط سیال - نوار ضدپاشش','https://parts.cat.com/en/catcorp/product/237-3860','{"component":"Anti-Splash Tape","length_ft":32.8,"width_in":1.97,"thickness_in":0.013,"materials":["Foil-backed Cloth","Film","High-temperature Silicone Adhesive"]}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('3831373','5324636','2373860')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;