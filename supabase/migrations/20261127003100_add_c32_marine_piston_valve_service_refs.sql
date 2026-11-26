-- C32 Marine piston, connecting rod, valve and service label references.
-- Public Cat listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('361-5742','پیستون فولادی نسبت تراکم 16.5:1 Cat 361-5742','بدنه پیستون فولادی برای مجموعه پیستون و شاتون با نسبت تراکم 16.5:1؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - بلوک سیلندر - پیستون','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify compression ratio, piston bowl, pin and engine arrangement in Cat SIS.','{"component":"Steel Piston Body","compression_ratio":"16.5:1","material":"Alloy Steel"}'::jsonb),
 ('232-3232','شاتون پیستون موتور Cat 232-3232','مجموعه شاتون پیستون شامل پین داول و یاتاقان برای اتصال پیستون به میل‌لنگ؛ طول 22 اینچ و ارتفاع 3.5 اینچ.','موتورهای دریایی - بلوک سیلندر - شاتون','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify rod length, bearing grade, pin and crankshaft arrangement in Cat SIS.','{"component":"Piston Connecting Rod","included_components":["Dowel Pin","Bearing"],"length_in":22.0,"height_in":3.5}'::jsonb),
 ('522-3955','شیر برقی ۲۴ ولت سیال اگزوز دیزل Cat 522-3955','شیر برقی 24 ولت برای کنترل برگشت سیال اگزوز دیزل به مخزن در مجموعه پمپ DEF؛ محدوده دمای کاری اعلام‌شده منفی 40 تا مثبت 60 درجه سانتی‌گراد.','موتورهای دریایی - پس‌پالایش - شیر برقی DEF','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify DEF return circuit, voltage, connector and serial/arrangement in Cat SIS.','{"component":"Solenoid Valve","voltage_V":24,"temperature_range_C":[-40,60],"material":"Carbon Steel"}'::jsonb),
 ('7N-0911','شیر کنترل مدار روانکاری Cat 7N-0911','شیر کنترل چدنی با طول 196.12 میلی‌متر و قطر 3 اینچ، دارای شیارهای خار و شیار اورینگ؛ برای کاربردهای سیستم روانکاری.','موتورهای دریایی - روانکاری - شیر کنترل','Official Cat Parts Store lists C32 MARINE under Marine Engine and Engine. Verify valve bore, keyways, oil circuit and serial/arrangement in Cat SIS.','{"component":"Control Valve","length_mm":196.12,"diameter_in":3.0,"material":"Gray Flake Iron","keyway_count":5}'::jsonb),
 ('359-3527','برچسب راهنمای شیر دوبل فیلتر روغن Cat 359-3527','برچسب راهنمای موقعیت اهرم کنترل شیر دوبل فیلتر روغن موتور برای نمایش مسیر جریان و وضعیت صحیح عملکرد؛ ساخته‌شده از PVC و PET.','موتورهای دریایی - روانکاری - برچسب راهنمای شیر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify duplex filter group and correct label revision/placement in Cat SIS.','{"component":"Engine Oil Filter Duplex Valve Film","materials":["PVC","Polyethylene Terephthalate Plastic"]}'::jsonb)
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
 WHERE p.part_number IN ('501-4085','361-5744')
 RETURNING p.part_number
), discontinued_off AS (
 UPDATE public.part_catalog p SET is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Cat Parts Store identifies this part as DISCONTINUED; retained for historical/reference purposes only, not for sale.'),
 updated_at=now()
 WHERE p.part_number='613-4661'
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('3615742','2323232','5223955','7N0911','3593527','5014085','3615744','6134661')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM discontinued_off) AS discontinued_references_locked,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;