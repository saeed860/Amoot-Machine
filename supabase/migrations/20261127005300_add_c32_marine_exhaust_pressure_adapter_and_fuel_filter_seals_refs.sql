-- C32 Marine exhaust, pressure-adapter and fuel-filter sealing references.
-- Public Cat model listings are not serial/arrangement confirmation; all new references remain inactive.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('6N-0561','بست فولادی زانویی اگزوز آب‌خنک Cat 6N-0561','بست فولادی با ضخامت 4.78 میلی‌متر و سوراخ 10.72 میلی‌متر، مناسب سخت‌افزار M10 (3/8 اینچ) برای اتصال زانویی منیفولد اگزوز آب‌خنک.','موتورهای دریایی - اگزوز - بست زانویی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify clip position, fastener and manifold arrangement in Cat SIS.','{"component":"Exhaust Elbow Clip","thickness_mm":4.78,"hole_size_mm":10.72,"fastener":"M10 / 3/8 inch","material":"Steel"}'::jsonb),
 ('255-6863','گسکت الیافی مارپیچی با ضخامت 3.8 میلی‌متر Cat 255-6863','گسکت الیافی برای آب‌بندی اتصال دو سطح و جلوگیری از نشت و آلودگی؛ فهرست رسمی Cat مدل C32 MARINE را در Marine Engine نشان می‌دهد.','موتورهای دریایی - آب‌بندها - گسکت الیافی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify joint profile, bolt pattern and operating fluid in Cat SIS.','{"component":"Spiral Wound Gasket","thickness_mm":3.8,"material":"Fiber Gasket"}'::jsonb),
 ('362-1142','آداپتور نصب سنسور فشار روغن 1/8 NPTF به 1/2 اینچ Cat 362-1142','آداپتور فولاد آلیاژی برای اتصال سنسور فشار روغن با تبدیل رزوه 1/8 اینچ NPTF به 1/2 اینچ و ایجاد اتصال هم‌راستا و آب‌بندی‌شده.','موتورهای دریایی - روانکاری - آداپتور سنسور فشار','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread standards, sensor port and pressure application in Cat SIS.','{"component":"Oil Pressure Sensor Mounting Adapter","inlet_thread":"1/8 NPTF","outlet_size_in":0.5,"material":"Alloy Steel"}'::jsonb),
 ('129-9452','گسکت منیفولد اگزوز فولاد و گرافیت با ضخامت 1.9 میلی‌متر Cat 129-9452','گسکت فولاد و گرافیت با ضخامت 1.9 میلی‌متر برای آب‌بندی منیفولد اگزوز و کاهش نشت گاز در اتصال سطوح.','موتورهای دریایی - اگزوز - گسکت منیفولد','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify port pattern, cylinder bank and serial/arrangement in Cat SIS.','{"component":"Exhaust Manifold Gasket","thickness_mm":1.9,"length_in":8.0,"material":"Steel and Graphite Gasket"}'::jsonb),
 ('567-8392','سوپاپ اگزوز موتور Cat 567-8392','سوپاپ اگزوز موتور؛ در کاتالوگ عمومی Cat برای C32 MARINE در گروه Marine Engine فهرست شده است. ابعاد ساق، قطر بشقاب و مشخصات متریال باید از روی SIS بررسی شود.','موتورهای دریایی - سرسیلندر و سوپاپ - سوپاپ اگزوز','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify valve dimensions, material and serial/arrangement in Cat SIS.','{"component":"Exhaust Valve"}'::jsonb)
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
 name='گسکت خطوط فیلتر سوخت با ضخامت 1.2 میلی‌متر Cat 1P-0436',
 description='گسکت لاستیکی با ضخامت 1.2 میلی‌متر برای آب‌بندی اتصال خطوط فیلتر سوخت؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.',
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/1P-0436',
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Official Cat Parts Store also lists C32 MARINE under Marine Engine; exact serial/arrangement fitment remains unverified.'),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],application_type='UNVERIFIED',
 application_evidence='Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 application_source_url='https://parts.cat.com/en/catcorp/product/1P-0436',
 specifications='{"component":"Fuel Filter Lines Gasket","thickness_mm":1.2,"length_in":8.0,"height_in":0.8,"material":"Rubber Gasket"}'::jsonb,
 updated_at=now()
 WHERE p.part_number='1P-0436' RETURNING p.part_number
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed;