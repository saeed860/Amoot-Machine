-- C32 Marine air/exhaust sealing references; move unverified active O-ring to quarantine.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('428-9129','گسکت مارپیچی گرافیت و فلز با مقطع 3.2 میلی‌متر Cat 428-9129','گسکت با مقطع مستطیلی، عرض 0.13 اینچ، ارتفاع 0.12 اینچ و قطر داخلی 3.82 اینچ از گرافیت منبسط‌شده و ترکیب فلزی برای آب‌بندی اتصال.','موتورهای دریایی - آب‌بندها - گسکت مارپیچی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify joint dimensions and exact arrangement in Cat SIS.','{"component":"Spiral Wound Rectangular Gasket","cross_section_width_in":0.13,"cross_section_height_in":0.12,"inside_diameter_in":3.82,"materials":["Expanded Graphite","Mixed Metal"]}'::jsonb),
 ('4N-4352','زانویی چدنی خطوط هوای ورودی و اگزوز Cat 4N-4352','زانویی چدنی خطوط هوا با طول 11.7 اینچ و ارتفاع 11 اینچ برای تغییر مسیر هوای ورودی/اگزوز؛ فهرست رسمی Cat مدل C32 MARINE را در Marine Engine نشان می‌دهد.','موتورهای دریایی - هوارسانی و اگزوز - زانویی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify connection geometry and exact application in Cat SIS.','{"component":"Air Lines Exhaust Elbow","length_in":11.7,"height_in":11.0,"material":"Gray Cast Iron"}'::jsonb),
 ('4L-7636','گسکت لاستیکی EPDM گرد با ضخامت 1.57 میلی‌متر Cat 4L-7636','گسکت گرد از لاستیک EPDM برای آب‌بندی اتصال دو سطح و جلوگیری از نشتی و آلودگی؛ در فهرست عمومی Cat برای C32 MARINE درج شده است.','موتورهای دریایی - آب‌بندها - گسکت EPDM','Official Cat Parts Store lists C32 MARINE under Engine. Verify groove, coolant/oil compatibility and serial/arrangement in Cat SIS.','{"component":"Round Rubber Gasket","thickness_mm":1.57,"material":"EPDM Rubber"}'::jsonb)
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
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/109-0076',
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Cat public listing includes C32 MARINE; serial-prefix/arrangement fitment not confirmed. Quarantined pending Cat SIS.'),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],application_type='UNVERIFIED',
 application_evidence='Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 application_source_url='https://parts.cat.com/en/catcorp/product/109-0076',updated_at=now()
 WHERE p.part_number='109-0076' RETURNING p.part_number
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM quarantine) AS existing_references_quarantined;