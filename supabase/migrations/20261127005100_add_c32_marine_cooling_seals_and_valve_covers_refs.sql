-- C32 Marine cooling, sealing and valve-cover component references.
-- Cat public model listings are not serial/arrangement confirmation; all new references remain inactive.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('291-8144','اورینگ EPDM سایز 1.83 × 10.52 میلی‌متر Cat 291-8144','اورینگ EPDM با قطر مقطع 1.83 میلی‌متر، قطر داخلی 10.52 میلی‌متر، سختی 70A و رزوه مستقیم STOR سایز 1/2-20 برای آب‌بندی خطوط آب پمپ.','موتورهای دریایی - آب‌بندها - اورینگ EPDM','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify exact water-line port and serial/arrangement in Cat SIS.','{"component":"O-Ring","cross_section_mm":1.83,"inside_diameter_mm":10.52,"hardness":"70A","material":"EPDM","fitting_size":"1/2-20","type":"Straight Thread O-ring (STOR)","dash_size":905}'::jsonb),
 ('233-4877','درپوش چدنی پمپ آب Cat 233-4877','درپوش چدنی پمپ آب برای پوشش و محافظت از اجزای داخلی پمپ و حفظ هم‌محوری و مونتاژ ایمن؛ در فهرست Cat برای C32 MARINE درج شده است.','موتورهای دریایی - خنک‌کاری - درپوش پمپ آب','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump variant, bolt pattern and serial/arrangement in Cat SIS.','{"component":"Water Pump Cover","length_in":18.8,"height_in":5.9,"material":"Gray Cast Iron"}'::jsonb),
 ('101-2749','آداپتور چدنی ورودی پمپ آب Cat 101-2749','آداپتور ورودی پمپ آب از چدن خاکستری با قطر داخلی 3.39 اینچ و قطر خارجی 7.48 اینچ برای هدایت سیال به پروانه پمپ؛ فهرست Cat شامل C32 MARINE است.','موتورهای دریایی - خنک‌کاری - آداپتور پمپ آب','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump arrangement, flange and serial/arrangement in Cat SIS.','{"component":"Water Pump Adapter","inner_diameter_in":3.39,"outer_diameter_in":7.48,"width_in":0.93,"height_in":0.93,"material":"Gray Cast Iron"}'::jsonb),
 ('349-2654','آب‌بند مکانیکی شفت پمپ آب با قطر 19.05 میلی‌متر Cat 349-2654','مجموعه آب‌بند مکانیکی شفت پمپ آب از فولاد ضدزنگ با قطر داخلی بوش 19.10 میلی‌متر و قطر خارجی پوسته 40.17 میلی‌متر، همراه اورینگ و واشر آب‌بندی.','موتورهای دریایی - خنک‌کاری - آب‌بند مکانیکی پمپ آب','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify shaft diameter, pump design and serial/arrangement in Cat SIS.','{"component":"Mechanical Water Pump Shaft Seal","sleeve_inside_diameter_mm":19.10,"shell_outside_diameter_mm":40.17,"material":"Stainless Steel","includes":["O-ring","Gasket"]}'::jsonb),
 ('293-8248','درپوش آلومینیومی مکانیزم سوپاپ Cat 293-8248','درپوش آلومینیومی مجموعه مکانیزم سوپاپ برای محافظت از اجزای قطار سوپاپ؛ فهرست عمومی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - سرسیلندر و سوپاپ - درپوش مکانیزم سوپاپ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify cover side, gasket and serial/arrangement in Cat SIS.','{"component":"Valve Mechanism Cover","material":"Alloy Aluminum"}'::jsonb),
 ('293-8247','درپوش آلومینیومی مکانیزم سوپاپ Cat 293-8247','درپوش آلومینیومی مکانیزم سوپاپ؛ قطعه هم‌گروه با درپوش 293-8248 که در فهرست رسمی Cat برای C32 MARINE نیز آمده است. سمت نصب و تفاوت مجموعه باید از نقشه قطعات تعیین شود.','موتورهای دریایی - سرسیلندر و سوپاپ - درپوش مکانیزم سوپاپ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify cover side, gasket and serial/arrangement in Cat SIS.','{"component":"Valve Mechanism Cover","material":"Alloy Aluminum"}'::jsonb)
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