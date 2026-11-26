WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('4N-9968','پیچ تخلیه کارتل روغن موتور Cat 4N-9968','پیچ تخلیه آلومینیومی برای بستن دهانه تخلیه روغن کارتل؛ صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - روغن‌کاری - پیچ تخلیه کارتل','https://parts.cat.com/en/catcorp/product/4N-9968','{"component":"Engine Oil Pan Plug","material":"Alloy Aluminum"}'::jsonb),
('581-9068','گسکت کارتل روغن ۰.۴۹ میلی‌متری Cat 581-9068','گسکت کارتل روغن از ترکیب لاستیک و فولاد با 38 سوراخ نصب به قطر 10.3 میلی‌متر؛ برای آب‌بندی اتصال کارتل و بلوک و جلوگیری از نشت روغن طراحی شده است.','موتور دریایی - روغن‌کاری - گسکت کارتل','https://parts.cat.com/en/catcorp/product/581-9068','{"component":"Oil Pan Gasket","thickness_mm":0.49,"mounting_holes":38,"mounting_hole_diameter_mm":10.3,"material":"Rubber & Steel Gasket"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4N9968','5819068')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;