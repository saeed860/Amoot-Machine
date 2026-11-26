-- C32 Marine starter, heat exchanger, oil pump and intake seal references.
-- Public Cat listings are discovery evidence only, not exact SIS fitment approval.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('575-7525','کیت اورهال استارتر هوایی Cat 575-7525','Air starter overhaul kit for the T6 integrated turbine air starting system, including air motor, relay valve, solenoid valve and control module as an integrated unit. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم استارت - کیت اورهال استارتر',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/575-7525','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm installed T6 starter configuration and contents, then verify serial prefix and arrangement in Cat SIS.','{"component":"Air Starter Overhaul Kit","system":"T6 Integrated Turbine Air Starting System","materials":["Fluoroelastomer (FKM) Rubber","Carbon Steel"]}'::jsonb),
 ('579-3853','براکت سمت راست مبدل حرارتی آب دریا Cat 579-3853','Right-hand steel mounting bracket positioning and securing the seawater heat exchanger to the marine engine block. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم خنک‌کاری - براکت مبدل حرارتی',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/579-3853','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify heat-exchanger variant, serial prefix and arrangement in Cat SIS.','{"component":"Sea Water Heat Exchanger Right Hand Mount Bracket","materials":["Carbon Steel","Structural Steel"]}'::jsonb),
 ('278-0513','کیت محرک استارتر هوایی Cat 278-0513','Starter drive kit used to service and repair a T50-P turbine air starting motor. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم استارت - کیت محرک',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/278-0513','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm T50-P starter model and exact serial prefix/arrangement in Cat SIS.','{"component":"Starter Drive Kit","starter_model":"T50-P Turbine Air Starter"}'::jsonb),
 ('520-2923','پمپ روغن موتور Cat 520-2923','Engine oil pump circulating pressurized lubricating oil through moving engine components. Cat lists C32 MARINE under Marine Engine and separately under Engine.','موتورهای دریایی - سیستم روغن‌کاری - پمپ روغن',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/520-2923','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Other C32 generator/industrial applications are not inferred. Verify serial prefix and arrangement in Cat SIS.','{"component":"Engine Oil Pump"}'::jsonb),
 ('365-4457','آب‌بند فشاری افترکولر Cat 365-4457','EPDM press-in-place seal for the aftercooler, designed to retain in its groove and prevent leakage and contamination. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم هوارسانی - آب‌بند افترکولر',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/365-4457','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm seal location, mating surfaces and fluid compatibility, then verify serial prefix and arrangement in Cat SIS.','{"component":"Press-In-Place Aftercooler Seal","inside_diameter_in":17.7,"cross_section_height_in":0.29,"cross_section_width_in":0.16,"material":"EPDM","service_temperature_C":"-55 to 121"}'::jsonb)
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
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number='595-4299'
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5757525','5793853','2780513','5202923','3654457','5954299')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;