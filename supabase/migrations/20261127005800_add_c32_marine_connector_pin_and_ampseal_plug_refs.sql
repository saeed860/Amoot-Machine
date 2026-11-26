-- C32 Marine connector pins/plugs and socket references.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('436-3407','پین کانکتور 7.5 آمپری Cat 436-3407','پین کانکتور با اجزای برنجی و آلیاژ برنج، برای اتصال الکتریکی دسته‌سیم؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - برق و الکترونیک - پین کانکتور','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify connector family, cavity and circuit rating in Cat SIS.','{"component":"Connector Pin","inner_diameter_in":0.94,"outer_diameter_in":1.14,"thickness_in":0.08,"weight_lb":0.01,"materials":["Brass","Alloy Brass"]}'::jsonb),
 ('297-5487','پلاگ کانکتور سه‌پین Ampseal 16 Cat 297-5487','پلاگ کانکتور Ampseal 16 با سه پین، بدنه پلی‌آمید و سازگار با سیم 20 تا 14 AWG برای اتصال دسته‌سیم موتور؛ فهرست Cat مدل C32 MARINE را در گروه Engine نشان می‌دهد.','موتورهای دریایی - برق و الکترونیک - پلاگ کانکتور','Official Cat Parts Store lists C32 MARINE under Engine. Verify connector gender, keying and mating harness in Cat SIS.','{"component":"Connector Plug","connector_type":"Ampseal 16 Low Pin Count","pin_count":3,"wire_gauge_AWG":"20-14","length_in":1.48,"width_in":0.93,"height_in":0.98,"materials":["Nylon","Polyamide Plastic"]}'::jsonb)
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
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/126-1768',
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Official Cat Parts Store lists C32 MARINE under Marine Engine; exact socket/circuit fitment remains unverified.'),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],application_type='UNVERIFIED',
 application_evidence='Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 application_source_url='https://parts.cat.com/en/catcorp/product/126-1768',
 specifications='{"component":"Connector Socket","wire_gauge_AWG":"14-16","length_in":0.8,"diameter_in":0.14,"material":"Gold Plated Brass"}'::jsonb,
 updated_at=now()
 WHERE p.part_number='126-1768' RETURNING p.part_number
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed;