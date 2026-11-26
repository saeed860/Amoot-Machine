-- C32 Marine steel tube, oil flange, pump coupling and protective sleeve references.
-- Public Cat model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('483-9659','مجموعه لوله فولادی Cat 483-9659','مجموعه لوله فولادی صلب از فلز آلیاژی برای انتقال سیال یا هوا در مسیرهایی که اتصال انعطاف‌پذیر لازم نیست؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - خطوط سیال - مجموعه لوله فولادی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify routing, bends, end fittings and serial/arrangement in Cat SIS.','{"component":"Steel Tube Assembly","material":"Alloy Mixed Metal"}'::jsonb),
 ('6N-4481','فلنج اتصال شیلنگ فیلتر روغن Cat 6N-4481','فلنج فولادی با پوشش روی برای اتصال و تثبیت لوله/شیلنگ فیلتر روغن به بدنه یا محفظه موتور و جلوگیری از نشتی روغن.','موتورهای دریایی - روانکاری - فلنج شیلنگ فیلتر روغن','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify flange pattern, bore, fasteners and oil-filter group in Cat SIS.','{"component":"Engine Oil Filter Hose Flange","materials":["Carbon Steel","Alloy Zinc"]}'::jsonb),
 ('324-9704','غلاف عایق حرارتی و ضدشعله Cat 324-9704','غلاف فایبرگلاس با پوشش سیلیکونی برای محافظت شیلنگ‌های هیدرولیک در معرض گرما و شعله؛ قطر داخلی 15.9 میلی‌متر و واحد فروش سانتی‌متر.','موتورهای دریایی - حفاظت حرارتی - غلاف شیلنگ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify hose OD, length, heat/flame exposure and installation arrangement in Cat SIS.','{"component":"Thermal Protective Sleeve","inside_diameter_mm":15.9,"material":"Silicone Coated Fiberglass","bulk_unit":"CM"}'::jsonb),
 ('7N-2550','کوپلینگ ۱۳ دندانه محرک پمپ Cat 7N-2550','کوپلینگ فولادی سخت‌کاری‌شده با هزارخار داخلی 13 دندانه، قطر خارجی 3.5 اینچ و طول 1.412 اینچ برای اتصال پمپ به مجموعه محرک کمکی.','موتورهای دریایی - محرک پمپ - کوپلینگ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify spline count, drive gear, mounting hardware and serial/arrangement in Cat SIS.','{"component":"Pump Drive Coupling","internal_spline_teeth":13,"outside_diameter_in":3.5,"length_in":1.412,"material":"Low Alloy Steel","mounting_hardware":"3/8 inch"}'::jsonb)
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
), refreshed AS (
 UPDATE public.part_catalog p SET
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('8T-2442','420-8979','453-1611','486-7965','611-5564')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('4839659','6N4481','3249704','7N2550','8T2442','4208979','4531611','4867965','6115564')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;