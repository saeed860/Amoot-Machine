-- C32 Marine hose, coolant, pump seal and fitting references.
-- Cat public model listings are not serial/arrangement fitment certification.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('557-5423','مجموعه شیلنگ تفلونی فشار متوسط و دمای بالا Cat 557-5423','General-purpose medium-pressure, high-temperature PTFE-lined hose with stainless-steel wire braid; 0.25 in ID and 43.307 in overall length. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - شیلنگ‌ها - شیلنگ تفلونی فشار متوسط',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/557-5423','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm hose circuit, end fittings, pressure and routing; verify serial prefix and arrangement in Cat SIS.','{"component":"Medium Pressure High Temperature Teflon Lined Hose Assembly","hose_id_in":0.25,"overall_length_in":43.307,"hose_type":"PTFE Lined High Temperature Hose"}'::jsonb),
 ('611-5564','شیلنگ مخزن خنک‌کننده Cat 611-5564','9.52 mm inner-diameter coolant tank hose connecting the coolant reservoir to the engine cooling system. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم خنک‌کاری - شیلنگ مخزن آب',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/611-5564','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify tank/circuit routing, hose length and serial arrangement in Cat SIS.','{"component":"Coolant Tank Hose","inner_diameter_mm":9.52,"material":"Coolant Hose"}'::jsonb),
 ('081-5622','رابط مستقیم 9/16 به 3/8 اینچ Cat 081-5622','Straight carbon-steel adapter with associated sealing interfaces, listed by Cat for C32 MARINE under Marine Engine. Confirm exact connection purpose and mating parts from the diagram.','موتورهای دریایی - اتصالات و رابط‌ها - آداپتور مستقیم',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/081-5622','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify thread standards, mating fittings and exact diagram position before ordering; confirm serial/arrangement in Cat SIS.','{"component":"Straight Adapter","nominal_sizes_in":["9/16","3/8"],"material":"Carbon Steel"}'::jsonb),
 ('212-7265','آب‌بند شفت پمپ آب Cat 212-7265','28.58 mm shaft-diameter water-pump seal protecting bearing assemblies from coolant and abrasive contaminants. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - پمپ آب - آب‌بند شفت',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/212-7265','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm pump variant and shaft size before ordering; verify serial prefix and arrangement in Cat SIS.','{"component":"Water Seal","shaft_diameter_mm":28.58,"length_in":2.8,"height_in":2.4}'::jsonb),
 ('486-7965','آداپتور مستقیم شیلنگ Cat 486-7965','Straight hose adapter made of carbon steel; Cat lists C32 MARINE under Marine Engine. Confirm thread, connection geometry and hose assembly before ordering.','موتورهای دریایی - شیلنگ‌ها و اتصالات - آداپتور مستقیم',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/486-7965','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Public listing gives limited connection details; verify dimensions and mating assembly in Cat SIS.','{"component":"Straight Adapter","material":"Carbon Steel","public_specification":"Limited"}'::jsonb),
 ('8T-2442','بست فلزی لوله یا شیلنگ Cat 8T-2442','57 mm internal-diameter steel clip/clamp for tube or hose retention; Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - بست‌ها و نگهدارنده‌ها - کلیپ فلزی',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/8T-2442','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm tube/hose outside diameter, mating clip and mounting geometry before ordering; verify serial/arrangement in Cat SIS.','{"component":"Steel Clip","internal_diameter_mm":57,"bolt_hole_mm":14.29,"bolt_to_tube_centerline_mm":60,"mating_part_number":"8T-2441","material":"Carbon Steel, Alloy Zinc"}'::jsonb)
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
), safety AS (
 UPDATE public.part_catalog p SET
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/555-8355',
 application_source_url='https://parts.cat.com/en/catcorp/product/555-8355',
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Safety correction: kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number='555-8355'
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5575423','6115564','0815622','2127265','4867965','8T2442','5558355')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM safety) AS unsafe_existing_rows_quarantined,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;