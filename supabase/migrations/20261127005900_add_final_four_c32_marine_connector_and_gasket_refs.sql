-- Final four C32 Marine public-catalog references to reach the 4,200 catalog target.
-- Cat Parts Store model listing alone does not verify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('4N-1684','گسکت لاستیکی با ضخامت 0.8 میلی‌متر Cat 4N-1684','گسکت لاستیکی با ضخامت 0.8 میلی‌متر برای آب‌بندی اتصال دو سطح و جلوگیری از نشت و آلودگی؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - آب‌بندها - گسکت لاستیکی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify joint profile, material compatibility and serial/arrangement in Cat SIS.','{"component":"Gasket","thickness_mm":0.8,"material":"Rubber Gasket"}'::jsonb),
 ('305-5090','مهره بکشل دسته‌سیم با رزوه 1-18 اینچ Cat 305-5090','مهره رزوه‌ای بکشل برای اتصال محکم پوسته پشتی کانکتور و ایجاد مهار کششی کابل و آب‌بندی محیطی رابط دسته‌سیم؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - برق و الکترونیک - مهره بکشل دسته‌سیم','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify connector backshell family, thread and harness arrangement in Cat SIS.','{"component":"Wiring Harness Backshell Nut","thread":"1-18","materials":["Mixed Plastic","Carbon Steel"]}'::jsonb),
 ('331-3594','پلاگ کانکتور الکتریکی 31 پین Cat 331-3594','پلاگ کانکتور الکتریکی 31 پین با بدنه پلاستیکی نایلون برای اتصال ایمن کابل‌های دسته‌سیم و جلوگیری از جداشدن ناخواسته؛ در فهرست Cat برای C32 MARINE درج شده است.','موتورهای دریایی - برق و الکترونیک - پلاگ کانکتور 31 پین','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify mating receptacle, keying and harness circuit assignment in Cat SIS.','{"component":"31 Pin Electrical Connector Plug","pin_count":31,"material":"Nylon / Polyamide Plastic"}'::jsonb),
 ('8T-8729','پین برنجی کانکتور با قطر خارجی 3.30 میلی‌متر Cat 8T-8729','پین کانکتور از برنج با قطر خارجی 3.30 میلی‌متر برای ایجاد اتصال الکتریکی مطمئن در دسته‌سیم؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - برق و الکترونیک - پین کانکتور برنجی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify connector series, wire gauge, cavity and harness use in Cat SIS.','{"component":"Brass Connector Pin","outer_diameter_mm":3.30,"material":"Brass"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',
 'https://parts.cat.com/en/catcorp/product/'||s.part_number,
 s.source_note||' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 'https://parts.cat.com/en/catcorp/product/'||s.part_number,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=EXCLUDED.source_note,verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_accessed_at=now(),compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications,updated_at=now()
 RETURNING part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4N1684','3055090','3313594','8T8729')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;