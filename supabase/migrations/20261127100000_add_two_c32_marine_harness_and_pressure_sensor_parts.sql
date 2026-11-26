WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('276-7597','مجرای انعطاف‌پذیر محافظ دسته‌سیم Cat 276-7597','مجرای انعطاف‌پذیر از پلی‌آمید برای پوشش و نظم‌دهی سیم‌کشی موتور؛ از دسته‌سیم در برابر سایش، ضربه، لرزش، رطوبت و مواد شیمیایی محافظت می‌کند.','برق موتور دریایی - دسته‌سیم - مجرای محافظ انعطاف‌پذیر','https://parts.cat.com/en/catcorp/product/276-7597','{"component":"Wiring Harness Flexible Bulk Conduit","material":"Polyamide Plastic","protection":["Abrasion","Vibration","Impact","Moisture","Chemical exposure"]}'::jsonb),
('416-6999','حسگر فشار ۶۰۰ کیلوپاسکال Cat 416-6999','حسگر فشار 600 کیلوپاسکال با رزوه M14×1.5، اتصال سه‌پین Ampseal و تغذیه تنظیم‌شده 5 ولت DC؛ برای پایش فشار سیالات و ارسال سیگنال به واحد کنترل موتور.','موتور دریایی - پایش و کنترل - حسگر فشار','https://parts.cat.com/en/catcorp/product/416-6999','{"component":"Pressure Sensor","maximum_pressure_kpa":600,"thread":"M14x1.5","connector":"3-pin Ampseal","supply":"5 V DC regulated","material":"Alloy Brass"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('2767597','4166999')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;