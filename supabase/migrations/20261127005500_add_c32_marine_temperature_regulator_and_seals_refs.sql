-- C32 Marine water-temperature regulator and EPDM sealing references.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('248-5513','رگولاتور دمای آب موتور Cat 248-5513','رگولاتور دمای مایع خنک‌کننده که تا رسیدن موتور به دمای کاری، جریان بین بلوک موتور و رادیاتور را محدود می‌کند؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - خنک‌کاری - رگولاتور دما','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify opening temperature, dimensions and serial/arrangement in Cat SIS.','{"component":"Engine Water Temperature Regulator","length_in":2.8,"height_in":3.6,"materials":["Stainless Steel","Nitrile Rubber"]}'::jsonb),
 ('6V-6609','اورینگ EPDM با قطر داخلی 16.36 میلی‌متر Cat 6V-6609','اورینگ EPDM با قطر داخلی 16.36 میلی‌متر، قطر مقطع 2.21 میلی‌متر و سختی 70A برای اتصال رزوه‌ای STOR؛ فهرست Cat شامل C32 MARINE است.','موتورهای دریایی - آب‌بندها - اورینگ EPDM','Official Cat Parts Store lists C32 MARINE under Engine. Verify fitting thread, fluid and exact serial/arrangement in Cat SIS.','{"component":"O-Ring","cross_section_mm":2.21,"inside_diameter_mm":16.36,"hardness":"70A","material":"EPDM","dash_size":908,"type":"STOR"}'::jsonb),
 ('4N-5073','زانویی چدنی منیفولد اگزوز Cat 4N-5073','زانویی اگزوز چدنی با فلنج دو سوراخه در دو انتها، ارتفاع 2.69 اینچ و عرض 4.01 اینچ؛ فهرست رسمی Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - اگزوز - زانویی منیفولد','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify flange orientation and serial/arrangement in Cat SIS.','{"component":"Exhaust Manifold Elbow","flange":"Two-hole at both ends","overall_height_in":2.69,"overall_width_in":4.01,"material":"Gray Cast Iron"}'::jsonb)
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
), quarantine AS (
 UPDATE public.part_catalog p SET
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Cat public listing includes C32 MARINE; serial-prefix/arrangement fitment not confirmed. Quarantined pending Cat SIS.'),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],application_type='UNVERIFIED',
 application_evidence='Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,updated_at=now()
 WHERE p.part_number IN ('248-5513','6V-6609') RETURNING p.part_number
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM quarantine) AS existing_references_quarantined;