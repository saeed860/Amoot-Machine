-- C18 marine lubrication candidates from official Cat Parts Store.
INSERT INTO public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,specifications,compatible_models,application_type,application_evidence,application_source_url)
VALUES
('Caterpillar','448-4455','کیت پمپ روغن موتور CAT 448-4455','Cat Engine Oil Pump Kit. The official Cat page lists C18 Marine and C18 Petroleum Package. The displayed component list includes an oil pump body, bolts, plug, washer, plunger ring, oil pump plunger and retainer; exact serial/arrangement effectivity is not established.',ARRAY['C18'],'سیستم روغن‌کاری - کیت پمپ روغن','Cat Parts Store','https://parts.cat.com/en/catcorp/product/448-4455','Official Cat listing: component lines shown in the kit include an oil pump body, bolts, plug, washer, plunger ring, oil pump plunger and retainer; MARINE ENGINE C18 is listed. Public page text contains an inconsistent generic kit description; verify BOM and serial effectivity with Cat SIS.','NEEDS_SERIAL_CHECK',false,now(),'{"condition":"OEM","kit_contents":[{"part_number":"236-9918","description":"Engine Oil Pump Body","quantity":1},{"part_number":"2P-3205","description":"3/8-16 x 1 3/4 in Hex Flange Head Bolt","quantity":4},{"part_number":"2S-7905","description":"1/16-27 NPTF Thread Hex-Drive Plug","quantity":1},{"part_number":"5M-2894","description":"3/8 in ID Steel Flat Washer","quantity":2},{"part_number":"7C-1511","description":"34.14 mm OD Plunger Ring","quantity":1},{"part_number":"7C-1512","description":"34.036 mm OD Oil Pump Plunger","quantity":1},{"part_number":"9Y-1792","description":"3 mm Thick Oil Pump Plunger Retainer","quantity":1}]}'::jsonb,ARRAY['C18'],'UNVERIFIED','Cat Parts Store lists MARINE ENGINE C18; family-level evidence only. Verify kit BOM, engine serial and arrangement in Cat SIS.','https://parts.cat.com/en/catcorp/product/448-4455'),
('Caterpillar','389-0435','فیلتر روغن موتور CAT 389-0435','Cat Advanced High Efficiency spin-on engine oil filter. Cat lists C18 under MARINE ENGINE. Exact serial/arrangement application remains unverified.',ARRAY['C18'],'سیستم روغن‌کاری - فیلتر روغن','Cat Parts Store','https://parts.cat.com/en/catcorp/product/389-0435','Official Cat listing: diameter 5.346 in, length 9.055 in, carbon steel, Advanced High Efficiency, spin-on; compatible MARINE ENGINE C18 and 3116. Family-level evidence only.','NEEDS_SERIAL_CHECK',false,now(),'{"diameter_in":5.346,"length_in":9.055,"material":"Carbon Steel","efficiency_category":"Advanced High Efficiency","filter_type":"Spin-On","flow_direction":"Out-to-In"}'::jsonb,ARRAY['C18','3116'],'UNVERIFIED','Cat Parts Store lists MARINE ENGINE C18; verify full serial and arrangement in Cat SIS before application.','https://parts.cat.com/en/catcorp/product/389-0435')
ON CONFLICT (part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,technical_group=EXCLUDED.technical_group,
 source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),specifications=public.part_catalog.specifications || EXCLUDED.specifications,
 compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',application_evidence=EXCLUDED.application_evidence,
 application_source_url=EXCLUDED.application_source_url,updated_at=now();

UPDATE public.part_catalog
SET source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/'||part_number,
 verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,
 application_evidence=concat_ws(E'\n',nullif(application_evidence,''),'Official Cat Parts Store lists C18 under MARINE ENGINE; exact serial/arrangement effectivity must be checked in Cat SIS.'),
 application_source_url='https://parts.cat.com/en/catcorp/product/'||part_number,
 source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat Parts Store provenance refreshed 2026-11-26; family-level C18 Marine reference only.'),
 source_accessed_at=now(),updated_at=now()
WHERE part_number IN ('136-3742','211-4359','292-8185','525-4774','6N-7420','6N-7422');

UPDATE public.products p
SET status='INACTIVE',application_type='UNVERIFIED',
 application_evidence=concat_ws(E'\n',nullif(p.application_evidence,''),'C18 Marine lubrication candidate; exact serial/arrangement confirmation required before sale.'),
 updated_at=now()
WHERE regexp_replace(upper(p.sku),'[^A-Z0-9]','','g') IN ('4484455','3890435','1363742','2114359','2928185','5254774','6N7420','6N7422');