-- C32 Marine O-ring and fastener references; quarantine previously active unverified O-ring.
-- Cat public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('2H-3928','اورینگ NBR با قطر داخلی 107.54 میلی‌متر Cat 2H-3928','اورینگ NBR با قطر داخلی 107.54 میلی‌متر، قطر مقطع 3.53 میلی‌متر و سختی 75A برای آب‌بندی اتصالات استاتیک و برخی اتصالات دینامیک موتور.','موتورهای دریایی - آب‌بندها - اورینگ NBR','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify groove dimensions, fluid compatibility and serial/arrangement in Cat SIS.','{"component":"O-Ring","inside_diameter_mm":107.54,"cross_section_mm":3.53,"hardness":"75A","material":"NBR Nitrile Rubber","dash_size":244}'::jsonb),
 ('1D-4538','پیچ شش‌گوش فولادی با طول ساق 57.15 میلی‌متر Cat 1D-4538','پیچ سرشش‌گوش فولادی با طول ساق 57.15 میلی‌متر برای اتصال و تثبیت اجزای موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - پیچ سرشش‌گوش','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread pitch, grip length, grade and mounting location in Cat SIS.','{"component":"External Hexagonal Bolt","shank_length_mm":57.15,"material":"Steel"}'::jsonb),
 ('0T-0573','پیچ سرشش‌گوش Cat 0T-0573','پیچ سرشش‌گوش برای اتصال اجزای موتور و سازه‌های متعلقه؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - پیچ و مهره','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, length, grade and exact mounting position in Cat SIS.','{"component":"Cap Screw"}'::jsonb)
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
 WHERE p.part_number IN ('9M-9647','081-5622','420-3225','603-6733','486-7965')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('2H3928','1D4538','0T0573','9M9647','0815622','4203225','6036733','4867965')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;