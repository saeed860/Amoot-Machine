-- Enrich remaining six C18 candidate records from official Cat product pages.
-- All records remain inactive and serial/arrangement-unverified.
UPDATE public.part_catalog
SET name='نیمه بدنه پمپ آب CAT 524-3157',
    description='Cat Water Pump Body (BODY-HALF). Cat describes the body as a water-pump component used to circulate coolant through engine blocks; listed material is alloy brass. Compatible-model summary includes C18 Marine Engine.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"material":"Alloy Brass","component_type":"Water Pump Body Half","condition":"OEM"}'::jsonb,
    source_name='Cat Parts Store', source_url='https://parts.cat.com/en/catcorp/product/524-3157',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page identifies BODY-HALF / Water Pump Body; material Alloy Brass; Compatible Models includes MARINE ENGINE C18. Serial/arrangement effectivity remains unverified.'),
    source_accessed_at=now(),verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,updated_at=now()
WHERE part_number='524-3157';

UPDATE public.part_catalog
SET name='کیت پمپ انتقال سوخت CAT 448-4451',
    description='Cat Fuel Transfer Pump Kit for repairing a fuel transfer pump. Cat lists kit components and quantities; compatible-model summary includes C18 Marine Engine.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"condition":"OEM","kit_contents":[{"part_number":"0S-0699","description":"37mm Long Steel Stud","quantity":2},{"part_number":"107-5769","description":"2.62 x 79.38mm 78A HNBR O-Ring","quantity":2},{"part_number":"133-9116","description":"Rear Fly Housing Cover","quantity":1},{"part_number":"1T-0765","description":"3/8-16 x 1 inch 12-Point Head Bolt","quantity":2},{"part_number":"384-8612","description":"Fuel Transfer Pump","quantity":1},{"part_number":"5M-2894","description":"3/8 inch ID Steel Flat Washer","quantity":2},{"part_number":"9S-8752","description":"3/8-16 Hex Nut","quantity":2}]}'::jsonb,
    source_name='Cat Parts Store', source_url='https://parts.cat.com/en/catcorp/product/448-4451',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page lists 7 kit component lines with quantities and Compatible Models includes GENERATOR SET C18, MARINE ENGINE C18 and PETROLEUM PACKAGE C18. Kit fitment still requires exact serial/arrangement verification.'),
    source_accessed_at=now(),verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,updated_at=now()
WHERE part_number='448-4451';

UPDATE public.part_catalog
SET name='کیت پمپ انتقال سوخت CAT 448-4452',
    description='Cat Fuel Transfer Pump Kit. Cat lists the kit as a pump, bolts and O-ring seals for fuel transfer pump repair; compatible-model summary includes C18 Marine Engine.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"condition":"OEM","kit_contents":[{"part_number":"107-5769","description":"2.62 x 79.38mm 78A HNBR O-Ring","quantity":1},{"part_number":"1T-0765","description":"3/8-16 x 1 inch 12-Point Head Bolt","quantity":2},{"part_number":"388-7286","description":"Fuel Transfer Pump","quantity":1}]}'::jsonb,
    source_name='Cat Parts Store', source_url='https://parts.cat.com/en/catcorp/product/448-4452',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page lists three kit component lines with quantities and Compatible Models includes MARINE ENGINE C18. Kit fitment still requires exact serial/arrangement verification.'),
    source_accessed_at=now(),verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,updated_at=now()
WHERE part_number='448-4452';

UPDATE public.part_catalog
SET name='مجموعه لوله خط فیلتر روغن موتور CAT 258-9978',
    description='Cat Engine Oil Filter Tube Line Assembly carries oil from the engine oil pump to the oil filter. Cat specifies 1000 kPa oil pressure resistance and lists Marine Engine C18 in Compatible Models.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"inner_diameter_mm":7.74,"outer_diameter_in":0.37,"material":"Steel, Alloy Mixed Metal","oil_pressure_resistance_kpa":1000,"condition":"OEM"}'::jsonb,
    source_name='Cat Parts Store', source_url='https://parts.cat.com/en/catcorp/product/258-9978',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page: 7.74 mm inner diameter, 0.37 in outer diameter, steel/alloy mixed metal, 1000 kPa oil pressure resistance; Compatible Models includes GENERATOR SET C18, MARINE ENGINE C18 and PETROLEUM PACKAGE C18. Exact serial/arrangement effectivity remains unverified.'),
    source_accessed_at=now(),verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,updated_at=now()
WHERE part_number='258-9978';

UPDATE public.part_catalog
SET name='چرخ‌دنده محرک پمپ روغن موتور ۳۴ دندانه CAT 6I-4575',
    description='Cat 34 Teeth Engine Oil Pump Drive Gear transmits engine power to the oil pump. Cat product page lists Marine Engine C18 among compatible model families.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"teeth":34,"length_in":4.6,"height_in":4.2,"material":"Low Alloy Steel","condition":"OEM"}'::jsonb,
    source_name='Cat Parts Store', source_url='https://parts.cat.com/en/catcorp/product/6I-4575',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page identifies 34 Teeth Engine Oil Pump Drive Gear; dimensions 4.6 in length x 4.2 in height; Low Alloy Steel; Compatible Models includes MARINE ENGINE C18. Exact serial/arrangement effectivity remains unverified.'),
    source_accessed_at=now(),verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,updated_at=now()
WHERE part_number='6I-4575';

UPDATE public.part_catalog
SET description='Cat Reman Gear Pump (1 Section) for C18. Cat lists Marine Engine C18 among compatible model families; the Cat product page compares this reman part with 226-1191.',
    specifications=coalesce(specifications,'{}'::jsonb) || '{"condition":"REMAN","pump_type":"1 Section Gear Pump","alternate_for":"226-1191"}'::jsonb,
    source_name='Cat Parts Store', source_url='https://parts.cat.com/en/catcorp/product/20R-4330',
    source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat product page explicitly identifies Cat Reman Gear Pump (1 Section) (C18), lists Marine Engine C18 and compares it with 226-1191. Preserve Reman condition; serial/arrangement effectivity remains unverified.'),
    source_accessed_at=now(),verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,updated_at=now()
WHERE part_number='20R-4330';
