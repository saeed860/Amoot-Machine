-- C32 Marine batch: oil level, fuel delivery, exhaust sensing and shutdown protection.
-- Public Cat fitment listings are reference evidence, not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('616-7398','گیج سطح روغن موتور Cat 616-7398','Engine oil level gauge for monitoring engine lubricant quantity and helping prevent operation with insufficient oil. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم روغن‌کاری - نشانگر سطح روغن',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/616-7398','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify serial prefix and arrangement in Cat SIS.','{"component":"Engine Oil Level Gauge","weight_lb":0.73}'::jsonb),
 ('593-7485','لوله سوخت Cat 593-7485','12.58 mm inner-diameter fuel tube for controlled fuel delivery from the injection system toward the engine. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم سوخت - لوله انتقال سوخت',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/593-7485','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify serial prefix and arrangement in Cat SIS.','{"component":"Fuel Tube","inner_diameter_mm":12.58,"minimum_burst_pressure_kPa":4000}'::jsonb),
 ('570-1260','سنسور اکسید نیتروژن اگزوز Cat 570-1260','Exhaust NOx sensor with probe and electronic control/cable assembly; communicates exhaust nitrogen-oxide measurements over J1939 for aftertreatment feedback. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم اگزوز - سنسور آلایندگی NOx',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/570-1260','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Marine Auxiliary C32B listing is not generalized. Verify serial prefix, emissions package and arrangement in Cat SIS.','{"component":"NOx Exhaust Sensor","sensor_type":"NOx","connector":"Ampseal 16","connector_pin_count":6,"thread":"M20","supply_voltage_range_V":"10.8-32","wire_length_in":36}'::jsonb),
 ('657-1343','کلید قطع اضطراری دمای بالای آب Cat 657-1343','High water temperature shutdown switch monitoring coolant temperature and signaling shutdown protection when the configured temperature limit is exceeded. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم خنک‌کاری - کلید قطع دمای آب',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/657-1343','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify exact temperature calibration, serial prefix and arrangement in Cat SIS.','{"component":"High Water Temperature Shutdown Switch","connector_pin_count":4,"thread":"M18x1.5","temperature_range_F":"158-248","weight_lb":0.31}'::jsonb),
 ('422-0109','فیلم محافظ مجموعه تزریق سوخت Cat 422-0109','Fuel injection film component listed by Cat for C32 MARINE under Marine Engine. The public listing provides limited descriptive detail; confirm the diagram position and exact application before ordering.','موتورهای دریایی - سیستم تزریق سوخت - فیلم محافظ',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/422-0109','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Product description is limited; verify diagram position, serial prefix and arrangement in Cat SIS.','{"component":"Film-Fuel Injection","material":["PVC","Polyethylene Terephthalate Plastic"]}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',s.source_url,s.specifications
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
 name='رگولاتور دمای آب Cat 593-7750',
 description='Water temperature regulator (thermostat) regulating engine coolant temperature. Cat lists C32 MARINE under Marine Engine; other C32/C32B applications remain distinct.',
 technical_group='موتورهای دریایی - سیستم خنک‌کاری - ترموستات',
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/593-7750',
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Exact serial prefix and arrangement must be verified in Cat SIS.'),
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 application_evidence='Official Cat Parts Store model listing only; exact serial-prefix and arrangement fitment not verified.',
 application_source_url='https://parts.cat.com/en/catcorp/product/593-7750',
 specifications='{"component":"Water Temperature Regulator","materials":["Stainless Steel","Nitrile Rubber"]}'::jsonb,
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number='593-7750'
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6167398','5937485','5701260','6571343','4220109','5937750')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;