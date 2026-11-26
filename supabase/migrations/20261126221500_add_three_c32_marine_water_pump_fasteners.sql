WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('2H-5549','حلقه نگهدارنده داخلی Cat 2H-5549','حلقه نگهدارنده داخلی از فولاد کربنی برای ثابت نگه‌داشتن اجزا داخل بور؛ ابعاد و کاربرد باید با نقشه مجموعه پمپ تطبیق داده شود.','موتور دریایی - پمپ آب - حلقه‌های نگهدارنده','https://parts.cat.com/en/catcorp/product/2H-5549','{"component":"Internal Retaining Ring","bore_diameter_in":2.83,"thickness_in":0.093,"material":"Carbon Steel"}'::jsonb),
('5M-2894','واشر تخت فولادی ۳/۸ اینچ Cat 5M-2894','واشر تخت سخت‌کاری‌شده با قطر داخلی 0.402 و قطر خارجی 0.728 اینچ، ضخامت 0.098 اینچ و پوشش فسفات روی و روغن.','موتور دریایی - پمپ آب - واشر و اتصالات','https://parts.cat.com/en/catcorp/product/5M-2894','{"component":"Flat Washer","fits_bolt_in":0.375,"inside_diameter_in":0.402,"outside_diameter_in":0.728,"thickness_in":0.098,"material":"Hardened Steel","coating":"Zinc Phosphate + Oil"}'::jsonb),
('9X-6458','واشر تخت سخت‌کاری‌شده ۳/۸ اینچ Cat 9X-6458','واشر تخت سخت‌کاری‌شده با قطر داخلی 0.402 و قطر خارجی 0.886 اینچ، ضخامت 0.118 اینچ و پوشش فسفات روی و روغن.','موتور دریایی - اتصالات - واشر تخت','https://parts.cat.com/en/catcorp/product/9X-6458','{"component":"Flat Hard Washer","fits_bolt_in":0.375,"inside_diameter_in":0.402,"outside_diameter_in":0.886,"thickness_in":0.118,"materials":["Hardened Steel","Low Alloy Steel","Alloy Zinc"],"coating":"Zinc Phosphate + Oil"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('2H5549','5M2894','9X6458')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;