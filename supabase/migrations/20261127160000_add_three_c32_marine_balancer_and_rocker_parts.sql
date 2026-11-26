WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('526-1344','غلتک بازوی اسبک Cat 526-1344','غلتک بازوی اسبک برای کاهش اصطکاک تماس با سطح بادامک و انتقال نرم حرکت به مکانیزم سوپاپ؛ جنس فولاد کم‌آلیاژ، قطر خارجی 1.38، قطر داخلی 0.79 و ارتفاع 0.55 اینچ.','موتور دریایی - سوپاپ‌ها - غلتک بازوی اسبک','https://parts.cat.com/en/catcorp/product/526-1344','{"component":"Rocker Arm Roller","outside_diameter_in":1.38,"inside_diameter_in":0.79,"height_in":0.55,"materials":["Steel","Low Alloy Steel"]}'::jsonb),
('223-9135','چرخ‌دنده میل‌لنگ ۹۹ دندانه Cat 223-9135','چرخ‌دنده سخت‌کاری‌شده ۹۹ دندانه برای انتقال توان میل‌لنگ به مجموعه زمان‌بندی موتور؛ ابعاد کلی طول 6.81، عرض 4.36 و ارتفاع 1.75 اینچ و وزن 1.1 پوند.','موتور دریایی - میل‌لنگ - چرخ‌دنده زمان‌بندی','https://parts.cat.com/en/catcorp/product/223-9135','{"component":"Crankshaft Gear","teeth":99,"overall_height_in":1.75,"overall_length_in":6.81,"overall_width_in":4.36,"weight_lb":1.1,"materials":["Steel","Low Alloy Steel"]}'::jsonb),
('101-1365','صفحه تراست بالانسر موتور Cat 101-1365','صفحه تراست بالانسر برای حفظ هم‌راستایی و پایداری بالانسر جلویی و توزیع نیروهای وارد بر بلوک موتور؛ از جابه‌جایی و لرزش بیش از حد جلوگیری می‌کند.','موتور دریایی - بالانسر - صفحه تراست','https://parts.cat.com/en/catcorp/product/101-1365','{"component":"Balancer Thrust Plate","application":"Front balancer alignment and axial load distribution"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public listing explicitly identifies C32 MARINE in compatible models; exact serial-prefix and arrangement fitment not verified.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing includes C32 MARINE; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5261344','2239135','1011365')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;