-- C32 Marine water-line adapter and engine wiring connector references.
-- Cat public model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('6N-0008','آداپتور خطوط آب موتور Cat 6N-0008','آداپتور چدنی مدار آب با دو شیار اورینگ، قطر رابط ورودی 100.38 میلی‌متر و قطر رابط خروجی 113.08 میلی‌متر؛ برای اتصال خطوط آب در سیستم خنک‌کاری.','موتورهای دریایی - خنک‌کاری - آداپتور خطوط آب','Official Cat Parts Store lists C32 MARINE under Marine Engine and Engine. Verify port interfaces, O-ring profiles, water circuit and serial/arrangement in Cat SIS.','{"component":"Engine Water Lines Adapter","inlet_interface_diameter_mm":100.38,"outlet_interface_diameter_mm":113.08,"length_in":1.56,"inner_diameter_in":3.38,"outer_diameter_in":4.63,"material":"Gray Flake Iron","oring_grooves":2}'::jsonb),
 ('383-6321','سوکت کانکتور دسته‌سیم موتور Cat 383-6321','سوکت کانکتور سیم‌کشی موتور برای اتصال ایمن سیگنال و برق میان واحد کنترل، حسگرها و عملگرها؛ دارای آب‌بندی سیلیکونی در برابر رطوبت و آلودگی.','موتورهای دریایی - برق - کانکتور دسته‌سیم','Official Cat Parts Store lists C32 MARINE under Marine Engine and Engine. Verify connector keying, terminal count, mating plug and harness revision in Cat SIS.','{"component":"Engine Wiring Connector Plug","material":"Silicone / MQ / VMQ / PMQ Rubber"}'::jsonb)
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
 WHERE p.part_number IN ('524-1350','592-8620')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6N0008','3836321','5241350','5928620')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;