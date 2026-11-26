WITH src(part_number,name,description,technical_group,source_url,source_note,specifications) AS (VALUES
('552-3119','اورینگ FKM سایز 3×188 میلی‌متر Cat 552-3119','اورینگ FKM با سختی 75A، قطر مقطع 3 میلی‌متر و قطر داخلی 188 میلی‌متر؛ فهرست رسمی Cat مدل C32 MARINE را در Marine Engine نشان می‌دهد.','موتور دریایی - پمپ آب - آب‌بندها','https://parts.cat.com/vi/catcorp/product/552-3119','Official Cat Parts Store listing in Vietnamese includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"O-Ring Seal","cross_section_mm":3,"inside_diameter_mm":188,"hardness":"75A","polymer":"FKM"}'::jsonb),
('552-3120','اورینگ FKM سایز 3×88 میلی‌متر Cat 552-3120','اورینگ FKM با سختی 75A، قطر مقطع 3 میلی‌متر و قطر داخلی 88 میلی‌متر؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - پمپ آب - آب‌بندها','https://parts.cat.com/ja/catcorp/product/552-3120','Official Cat Parts Store listing in Japanese includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"O-Ring Seal","cross_section_mm":3,"inside_diameter_mm":88,"hardness":"75A","polymer":"FKM"}'::jsonb),
('170-7106','اورینگ FKM سایز 3.53×152 میلی‌متر Cat 170-7106','اورینگ FKM با سختی 90A، قطر مقطع 3.53 میلی‌متر و قطر داخلی 152 میلی‌متر؛ صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - آب‌بندی - اورینگ','https://parts.cat.com/en/catcorp/product/170-7106','Official Cat Parts Store listing includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"O-Ring Seal","cross_section_mm":3.53,"inside_diameter_mm":152,"hardness":"90A","polymer":"FKM"}'::jsonb),
('432-5229','حسگر دور القایی ۲۲ ولت Cat 432-5229','حسگر سرعت پسیو با خروجی AC متناسب با سرعت هدف؛ قطر سوراخ 0.73 اینچ، طول کلی 2.7 اینچ و طول سیم 12.2 اینچ.','موتور دریایی - برق و پایش - حسگر سرعت','https://parts.cat.com/en/catcorp/product/432-5229','Official Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Low Variable Reluctance Speed Sensor","nominal_voltage":22,"bore_diameter_in":0.73,"overall_length_in":2.7,"wire_length_in":12.2,"material":"Polyamide Plastic"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,s.source_note,
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5523119','5523120','1707106','4325229')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;