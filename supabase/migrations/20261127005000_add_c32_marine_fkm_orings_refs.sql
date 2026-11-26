-- C32 Marine FKM O-ring references.
-- Public Cat model association is not serial/arrangement confirmation; all records remain inactive.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('258-8735','اورینگ FKM با قطر داخلی 132.72 میلی‌متر Cat 258-8735','اورینگ FKM با قطر داخلی 5.225 اینچ، قطر مقطع 0.21 اینچ، سختی 75A و سایز Dash 355 برای آب‌بندی اتصالات موتور.','موتورهای دریایی - آب‌بندها - اورینگ FKM','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify groove, fluid, temperature and serial/arrangement in Cat SIS.','{"component":"O-Ring","cross_section_in":0.21,"inside_diameter_in":5.225,"hardness":"75A","material":"FKM Fluoroelastomer","dash_size":355}'::jsonb),
 ('109-0092','اورینگ Cat با قطر داخلی 75.57 میلی‌متر Cat 109-0092','اورینگ برای آب‌بندی استاتیک و برخی کاربردهای دینامیک؛ کاتالوگ عمومی Cat مدل C32 MARINE را در گروه Marine Engine فهرست می‌کند. ترکیب مواد و ابعاد شیار باید با قطعه مقابل تطبیق داده شود.','موتورهای دریایی - آب‌بندها - اورینگ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify material, groove and exact serial/arrangement in Cat SIS.','{"component":"O-Ring","inside_diameter_mm":75.57,"material":"Not fully specified in public listing"}'::jsonb)
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
)
SELECT count(*) AS references_upserted FROM upserted;