-- C32 Marine seal, washer and exhaust gasket references.
-- Cat public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('331-3521','اورینگ FKM سایز 3.53 × 170 میلی‌متر Cat 331-3521','اورینگ FKM با سختی 75A، قطر مقطع 3.53 میلی‌متر و قطر داخلی 170 میلی‌متر برای آب‌بندی استاتیک و برخی کاربردهای دینامیک؛ مقاوم در برابر سیالات نفتی و تغییر شکل فشاری.','موتورهای دریایی - آب‌بندها - اورینگ FKM','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify groove dimensions, fluid, temperature and serial/arrangement in Cat SIS.','{"component":"O-Ring","cross_section_mm":3.53,"inside_diameter_mm":170,"hardness":"75A","material":"FKM Fluorocarbon Rubber"}'::jsonb),
 ('436-2548','واشر آب‌بندی اگزوز ضخامت 1.6 میلی‌متر Cat 436-2548','واشر فولاد و گرافیت برای آب‌بندی اتصال منیفولد اگزوز با قطر خارجی 8.5 اینچ و ضخامت 0.06 اینچ.','موتورهای دریایی - اگزوز - واشر منیفولد','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify manifold joint, bore pattern, temperature duty and serial/arrangement in Cat SIS.','{"component":"Exhaust Gasket","outer_diameter_in":8.5,"thickness_in":0.06,"weight_lb":0.02,"material":"Steel and Graphite"}'::jsonb),
 ('141-3983','واشر تخت آب‌بندی Cat 141-3983','واشر تخت بدون رزوه با پوشش روی و سوراخ مرکزی 0.433 اینچ؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - واشر تخت','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify bolt size, washer thickness and joint stack-up in Cat SIS.','{"component":"Flat Washer","center_hole_in":0.433,"coating":"Zinc","center_hole_form":"Non-Threaded"}'::jsonb),
 ('310-3954','اورینگ FKM با قطر داخلی 123.19 میلی‌متر Cat 310-3954','اورینگ FKM با قطر مقطع 5.33 میلی‌متر و قطر داخلی 123.19 میلی‌متر، سختی 75A؛ برای آب‌بندی اتصالات مجموعه پمپ آب دریای کمکی.','موتورهای دریایی - پمپ آب دریا - اورینگ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump housing groove and serial/arrangement in Cat SIS.','{"component":"O-Ring","cross_section_mm":5.33,"inside_diameter_mm":123.19,"hardness":"75A","material":"FKM Fluorocarbon Rubber"}'::jsonb),
 ('8M-9024','واشر با قطر داخلی 10.2 میلی‌متر Cat 8M-9024','واشر با قطر داخلی 10.2 میلی‌متر برای اتصال و آب‌بندی مجموعه‌های موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - واشر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify washer dimensions, bolt size and joint stack-up in Cat SIS.','{"component":"Washer","inside_diameter_mm":10.2}'::jsonb),
 ('7X-0772','واشر با قطر داخلی 10.2 میلی‌متر Cat 7X-0772','واشر با قطر داخلی 10.2 میلی‌متر برای اتصالات موتور و مجموعه‌های مکانیکی؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - واشر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify washer dimensions, bolt size and joint stack-up in Cat SIS.','{"component":"Washer","inside_diameter_mm":10.2}'::jsonb),
 ('134-4126','واشر با قطر داخلی 4.52 میلی‌متر Cat 134-4126','واشر با قطر داخلی 4.52 میلی‌متر برای اتصالات و آب‌بندی موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - واشر کوچک','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify washer dimensions, fastener and joint stack-up in Cat SIS.','{"component":"Washer","inside_diameter_mm":4.52}'::jsonb)
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
 WHERE p.part_number IN ('7N-2533')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('3313521','4362548','1413983','3103954','8M9024','7X0772','1344126','7N2533')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;