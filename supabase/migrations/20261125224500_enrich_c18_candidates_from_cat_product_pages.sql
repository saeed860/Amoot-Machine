-- Enrich six C18 candidate references with directly transcribed Cat Parts Store data.
-- No row is made sellable: all remain serial/arrangement-unverified and inactive.
UPDATE public.part_catalog
SET name='پمپ کمکی آب دریا CAT 524-3160',
    description='Cat Sea Water Auxiliary Pump used in cooling lines. Centrifugal pump for seawater circulation in the cooling system; Cat describes counterclockwise rotation.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"weight_lb":54.23,"length_in":12.76,"rotation":"Counterclockwise","condition":"OEM"}'::jsonb,
    source_name='Cat Parts Store',
    source_url='https://parts.cat.com/en/catcorp/product/524-3160',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page reviewed: Sea Water Auxiliary Pump; Cat describes seawater circulation in cooling lines. Listed dimensions/weight transcribed from comparison panel. C18 marine family applicability only; exact serial and arrangement remain unverified.'),
    source_accessed_at=now(), verification_status='NEEDS_SERIAL_CHECK', application_type='UNVERIFIED', is_active=false, updated_at=now()
WHERE part_number='524-3160';

UPDATE public.part_catalog
SET name='Cat Reman Auxiliary Sea Water Pump 20R-7175',
    description='Cat Reman auxiliary seawater pump for marine cooling; Cat product description restricts this reference to Tier 3 and identifies 3406E/C18. Remanufactured component.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"condition":"REMAN","tier_restriction":"Tier 3 only","model_reference":["3406E","C18"],"warranty":"Same-as-new 12-month Caterpillar Parts Warranty; limitations apply"}'::jsonb,
    source_name='Cat Parts Store',
    source_url='https://parts.cat.com/en/catcorp/product/20R-7175',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page explicitly states Cat Reman Auxiliary Water Pump (Sea Water), Tier 3 Only, 3406E, C18. Preserve Reman condition. Marine model-family reference only; serial and arrangement effectivity remain unverified.'),
    source_accessed_at=now(), verification_status='NEEDS_SERIAL_CHECK', application_type='UNVERIFIED', is_active=false, updated_at=now()
WHERE part_number='20R-7175';

UPDATE public.part_catalog
SET name='شفت پمپ آب CAT 524-3154',
    description='Cat Water Pump Shaft; transmits rotational motion to the impeller. Cat describes corrosion-resistant construction and lists C18 among compatible model families, including Marine Engine C18.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"length_mm":316.85,"condition":"OEM"}'::jsonb,
    source_name='Cat Parts Store',
    source_url='https://parts.cat.com/en/catcorp/product/524-3154',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page lists Compatible Models: Marine Engine C18 and other C18 engine/generator families; description states 316.85 mm shaft length. Public model-family listing is not serial/arrangement effectivity.'),
    source_accessed_at=now(), verification_status='NEEDS_SERIAL_CHECK', application_type='UNVERIFIED', is_active=false, updated_at=now()
WHERE part_number='524-3154';

UPDATE public.part_catalog
SET name='پایه محفظه پمپ پرایمینگ سوخت ۱۲ ولت CAT 361-5093',
    description='Cat 12V Fuel Pump Housing Base. Cat product description identifies fuel priming pumps as removing air from fuel systems before engine start; Cat lists C18 under Marine Engine compatibility.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"voltage_v":12,"function":"Fuel priming pump housing base","condition":"OEM"}'::jsonb,
    source_name='Cat Parts Store',
    source_url='https://parts.cat.com/en/catcorp/product/361-5093',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page: 12V Fuel Pump Housing Base; function is fuel priming (air removal before starting). Compatible Models lists MARINE ENGINE C18. Exact serial/arrangement effectivity remains unverified.'),
    source_accessed_at=now(), verification_status='NEEDS_SERIAL_CHECK', application_type='UNVERIFIED', is_active=false, updated_at=now()
WHERE part_number='361-5093';

UPDATE public.part_catalog
SET name='پمپ دنده‌ای یک‌بخشی روغن موتور CAT 226-1191',
    description='Cat 1 Section Gear Engine Oil Pump. Cat describes the pump as circulating engine oil to crankshaft and connecting-rod bearings, camshaft, valve mechanism components and accessory-drive gears; compatible model list includes Marine Engine C18.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"length_in":14.3,"height_in":7.0,"pump_type":"1 Section Gear Engine Oil Pump","condition":"OEM"}'::jsonb,
    source_name='Cat Parts Store',
    source_url='https://parts.cat.com/en/catcorp/product/226-1191',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page lists Marine Engine C18 and dimensions 14.3 in length x 7.0 in height. Cat page shows 20R-4330 as the Cat Reman alternate. Exact serial/arrangement effectivity remains unverified.'),
    source_accessed_at=now(), verification_status='NEEDS_SERIAL_CHECK', application_type='UNVERIFIED', is_active=false, updated_at=now()
WHERE part_number='226-1191';

UPDATE public.part_catalog
SET name='پمپ دنده‌ای یک‌بخشی روغن موتور CAT 161-4113',
    description='Cat One Section Engine Oil Gear Pump used in engine lubrication. Cat compatible-model list includes Marine Engine C18 as well as other engine, generator and industrial applications.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"pump_type":"One Section Engine Oil Gear Pump","condition":"OEM"}'::jsonb,
    source_name='Cat Parts Store',
    source_url='https://parts.cat.com/en/catcorp/product/161-4113',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page lists C18 under Marine Engine and multiple other applications. This broad compatible-model list is not a serial/arrangement effectivity statement.'),
    source_accessed_at=now(), verification_status='NEEDS_SERIAL_CHECK', application_type='UNVERIFIED', is_active=false, updated_at=now()
WHERE part_number='161-4113';

UPDATE public.part_catalog
SET name='پمپ دنده‌ای بازسازی‌شده یک‌بخشی روغن موتور CAT 20R-4330',
    description='Cat Reman Gear Pump (1 Section) identified by Cat as the reman counterpart/alternate for 226-1191; Cat comparison text explicitly identifies C18.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"condition":"REMAN","pump_type":"1 Section Gear Pump","alternate_for":"226-1191"}'::jsonb,
    source_name='Cat Parts Store',
    source_url='https://parts.cat.com/en/catcorp/product/226-1191',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat 226-1191 page comparison panel identifies 20R-4330 as Cat Reman Gear Pump (1 Section) (C18). Preserve Reman condition; serial/arrangement effectivity remains unverified.'),
    source_accessed_at=now(), verification_status='NEEDS_SERIAL_CHECK', application_type='UNVERIFIED', is_active=false, updated_at=now()
WHERE part_number='20R-4330';
