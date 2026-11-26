WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('207-6890','بست V شکل نصب المان فیلتر هوای Cat 207-6890','بست V شکل فولادی با عرض 0.63 و قطر گیج 12.13 اینچ برای تثبیت المان فیلتر هوا و ایجاد اتصال محکم در مجموعه هواکش موتور؛ Cat سازگاری C32 MARINE را درج کرده است.','موتور دریایی - هوارسانی - بست فیلتر هوا','https://parts.cat.com/en/catcorp/product/207-6890','{"component":"Air Cleaner Element Mounting V Band Clamp","clamp_width_in":0.63,"gage_diameter_in":12.13,"material":"Steel"}'::jsonb),
('9L-8412','پلاگ چهارگوش داخلی هوزینگ توربوشارژر ۳/۴ اینچ Cat 9L-8412','پلاگ لوله‌ای چهارگوش داخلی با رزوه 3/4 اینچ از فولاد آبکاری‌شده برای بستن مجرای داخلی هوزینگ توربوشارژر؛ فهرست رسمی Cat، C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - توربوشارژر - پلاگ هوزینگ','https://parts.cat.com/en/catcorp/product/9L-8412','{"component":"Turbocharger Housing Internal Square Pipe Plug","nominal_size_in":0.75,"material":"Plated Steel"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('2076890','9L8412')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;