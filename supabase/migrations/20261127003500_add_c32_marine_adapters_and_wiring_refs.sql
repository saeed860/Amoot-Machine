-- C32 Marine fluid adapters, wiring adapter and sealing references.
-- Public Cat model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('281-8668','آداپتور دسته‌سیم تغذیه موتور Cat 281-8668','آداپتور دسته‌سیم برق موتور برای ایجاد اتصال مطمئن و توزیع توان و ارتباط میان دسته‌سیم موتور و تجهیزات الکتریکی؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - برق - آداپتور دسته‌سیم','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify harness revision, connector keying, pinout and electrical configuration in Cat SIS.','{"component":"Engine Power Wiring Harness Adapter"}'::jsonb),
 ('030-8193','آداپتور مستقیم فولادی Cat 030-8193','آداپتور مستقیم از فولاد آبکاری‌شده برای اتصال خطوط و مجموعه‌های سیال؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات خطوط سیال - آداپتور مستقیم','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, sealing interface, port dimensions and serial/arrangement in Cat SIS.','{"component":"Straight Adapter","material":"Plated Carbon Steel"}'::jsonb),
 ('5P-8998','آداپتور مستقیم 36.8 میلی‌متری Cat 5P-8998','آداپتور مستقیم با طول 36.8 میلی‌متر برای اتصال خطوط سیال و لوله‌های موتور؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - اتصالات خطوط سیال - آداپتور','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread form, sealing face, port size and serial/arrangement in Cat SIS.','{"component":"Straight Adapter","length_mm":36.8}'::jsonb),
 ('6V-3250','اورینگ EPDM با ابعاد 1.98 × 11.89 میلی‌متر Cat 6V-3250','اورینگ EPDM با قطر مقطع 1.98 میلی‌متر، قطر داخلی 11.89 میلی‌متر و سختی 70A برای آب‌بندی اتصالات موتور و مدارهای سیال.','موتورهای دریایی - آب‌بندها - اورینگ EPDM','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify groove dimensions, fluid compatibility and serial/arrangement in Cat SIS.','{"component":"O-Ring","cross_section_mm":1.98,"inside_diameter_mm":11.89,"hardness":"70A","material":"EPDM Rubber"}'::jsonb),
 ('5P-6944','آداپتور مستقیم اورینگی با رزوه 3/4-16 Cat 5P-6944','آداپتور مستقیم با رزوه 3/4-16 و آب‌بندی اورینگی برای اتصال خطوط هیدرولیک و سیال؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - اتصالات خطوط سیال - آداپتور اورینگی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, O-ring size, pressure rating and mating port in Cat SIS.','{"component":"O-Ring Straight Adapter","thread":"3/4-16"}'::jsonb),
 ('030-7935','آداپتور مستقیم 1-5/16 اینچ Cat 030-7935','آداپتور مستقیم با اتصال 1-5/16 اینچ برای خطوط سیال و اتصالات موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات خطوط سیال - آداپتور','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, sealing face, port size and serial/arrangement in Cat SIS.','{"component":"Straight Adapter","thread_size_in":"1-5/16"}'::jsonb),
 ('281-5977','مجموعه آداپتور Cat 281-5977','مجموعه آداپتور برای اتصال و یکپارچه‌سازی مسیرهای سیال در مجموعه‌های موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات خطوط سیال - مجموعه آداپتور','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify mating assembly, port geometry and serial/arrangement in Cat SIS.','{"component":"Adapter Assembly"}'::jsonb),
 ('5P-3166','سه‌راهی آداپتور فلر ۳۷ درجه Cat 5P-3166','آداپتور سه‌راهی با اتصال فلر 37 درجه برای انشعاب و اتصال خطوط سیال؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات خطوط سیال - سه‌راهی فلر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify flare angle, branch size, thread and pressure rating in Cat SIS.','{"component":"37 Degree Flared Tee Adapter","flare_angle_deg":37}'::jsonb)
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
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('081-5622')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('2818668','0308193','5P8998','6V3250','5P6944','0307935','2815977','5P3166','0815622')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;