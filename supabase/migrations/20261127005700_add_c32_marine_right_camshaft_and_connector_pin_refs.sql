-- C32 Marine camshaft and electrical connector references; quarantine unverified active fuel check valve.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('421-0155','میل‌بادامک سمت راست موتور Cat 421-0155','میل‌بادامک فولادی سمت راست موتور برای زمان‌بندی باز و بسته‌شدن سوپاپ‌های ورودی و خروجی سیلندرهای سمت راست؛ فهرست رسمی Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - قطار سوپاپ - میل‌بادامک','Official Cat Parts Store lists C32 MARINE under Engine and Marine Engine. Verify bank, timing marks and serial/arrangement in Cat SIS.','{"component":"Engine Cylinder Right Bank Camshaft","material":"Carbon Steel"}'::jsonb),
 ('7T-0093','پین کانکتور نیکل‌اندود 21 میلی‌متری Cat 7T-0093','پین ترمینال کانکتور با آبکاری نیکل، مناسب سیم 12 تا 14 AWG و جریان تا 25 آمپر برای اتصال دسته‌سیم به تجهیزات؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - برق و الکترونیک - پین کانکتور','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify connector family, pin cavity and harness application in Cat SIS.','{"component":"Nickel Plated Connector Pin","wire_gauge_AWG":"12-14","current_rating_A":25,"length_in":0.8,"diameter_in":0.19,"material":"Alloy Brass","plating":"Nickel"}'::jsonb)
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
 name='سوکت کانکتور 19.7 میلی‌متری Cat 7T-0094',
 description='سوکت ترمینال کانکتور نیکل‌اندود برای سیم 12 تا 14 AWG با ظرفیت جریان تا 20 آمپر؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.',
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/7T-0094',
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Official Cat Parts Store lists C32 MARINE under Marine Engine; exact connector cavity and harness fitment remain unverified.'),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],application_type='UNVERIFIED',
 application_evidence='Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 application_source_url='https://parts.cat.com/en/catcorp/product/7T-0094',
 specifications='{"component":"Connector Socket","wire_gauge_AWG":"12-14","current_rating_A":20,"length_mm":19.7,"diameter_in":0.19,"material":"Alloy Brass","plating":"Nickel"}'::jsonb,
 updated_at=now()
 WHERE p.part_number='7T-0094' RETURNING p.part_number
), quarantine AS (
 UPDATE public.part_catalog p SET
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/420-1796',
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Cat public listing includes C32 MARINE; serial-prefix/arrangement fitment not confirmed. Quarantined pending Cat SIS.'),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],application_type='UNVERIFIED',
 application_evidence='Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 application_source_url='https://parts.cat.com/en/catcorp/product/420-1796',
 specifications='{"component":"Fuel Filter Check Valve","fitting_size_in":"-8 Male 37° Flare; -8 Male STOR","hex_size_in":1.0,"length_in":1.7,"thread":"3/4-16 both ends","material":"Steel / Carbon Steel"}'::jsonb,
 updated_at=now()
 WHERE p.part_number='420-1796' RETURNING p.part_number
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM quarantine) AS active_reference_quarantined;