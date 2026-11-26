WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('4P-1650','کاور هوزینگ جلوی موتور Cat 4P-1650','کاور پلاستیکی برای محافظت از هوزینگ جلوی موتور در برابر گردوغبار، رطوبت و آلودگی در زمان حمل یا نگهداری؛ طول 5.23، ارتفاع 0.74 و قطر خارجی 3.76 اینچ.','موتور دریایی - هوزینگ موتور - کاور محافظ','https://parts.cat.com/en/catcorp/product/4P-1650','{"component":"Engine Front Housing Cover","thickness_mm":7.8,"length_in":5.23,"height_in":0.74,"outside_diameter_in":3.76,"materials":["Plastic","Nylon 6","Nylon 6/12","Nylon 6/6"]}'::jsonb),
('326-6181','پولی محرک پمپ هیدرولیک Cat 326-6181','پولی چدنی برای انتقال نیروی دورانی موتور به پمپ هیدرولیک از طریق تسمه؛ قطر و هندسه شیارها باید با آرایش محرک تجهیزات تطبیق داده شود.','موتور دریایی - محرک پمپ هیدرولیک - پولی','https://parts.cat.com/en/catcorp/product/326-6181','{"component":"Hydraulic Pump Drive Pulley","material":"Gray (Flake) Iron"}'::jsonb),
('369-4019','یاتاقان محرک پمپ با قطر داخلی ۷۶.۳۱ میلی‌متر Cat 369-4019','یاتاقان محرک پمپ برای پشتیبانی از شفت و کاهش اصطکاک در مجموعه محرک متعلقات؛ قطر داخلی 76.31 میلی‌متر و جنس اعلام‌شده در صفحه Cat آلومینیوم آلیاژی است.','موتور دریایی - محرک پمپ - یاتاقان','https://parts.cat.com/en/catcorp/product/369-4019','{"component":"Pump Drive Bearing","inside_diameter_mm":76.31,"material":"Alloy Aluminum"}'::jsonb),
('9H-8872','گسکت پمپ هیدرولیک با ضخامت ۰.۸ میلی‌متر Cat 9H-8872','گسکت پمپ هیدرولیک برای آب‌بندی اتصال پمپ و سطوح مجاور؛ طول 9 اینچ، ضخامت 0.03125 اینچ، فاصله پیچ‌ها 5.75 اینچ و مواد لاستیک-چوب‌پنبه و لاستیک-الیاف.','موتور دریایی - محرک پمپ هیدرولیک - گسکت','https://parts.cat.com/en/catcorp/product/9H-8872','{"component":"Hydraulic Pump Gasket","length_in":9,"thickness_in":0.03125,"bolt_size_in":0.5625,"bolt_spacing_in":5.75,"height_in":0.02,"materials":["Rubber & Cork","Rubber & Fiber Gasket"]}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4P1650','3266181','3694019','9H8872')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;