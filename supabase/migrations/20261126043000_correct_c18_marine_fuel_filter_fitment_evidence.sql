-- Correct C18 fuel filtration marine fitment from official Cat model lists.
-- 129-0372, 129-0375 and 6N-6248 explicitly list C18 under MARINE ENGINE.
UPDATE public.part_catalog
SET name=CASE part_number WHEN '129-0372' THEN 'جداکننده آب و سوخت CAT 129-0372' WHEN '129-0375' THEN 'کاسه فیلتر جداکننده آب و سوخت CAT 129-0375' WHEN '6N-6248' THEN 'صفحه نصب پایه فیلتر سوخت CAT 6N-6248' ELSE name END,
 description=CASE part_number
 WHEN '129-0372' THEN 'Cat Standard Efficiency Fuel Water Separator. Cat describes removal of free and emulsified water and lists C18 under MARINE ENGINE. Carbon steel and polyamide plastic.'
 WHEN '129-0375' THEN 'Cat Fuel Water Separator Filter Bowl, transparent polyamide plastic bowl assembly with drain plug; spin-on assembly, 3-3/4-10 UNS-2A thread. Cat lists C18 under MARINE ENGINE.'
 WHEN '6N-6248' THEN 'Cat 6.35 mm thick carbon-steel Fuel Filter Base Mount Plate. Cat lists C18 and C18 MARINE under MARINE ENGINE.'
 ELSE description END,
 source_name='Cat Parts Store',verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,
 application_evidence='Official Cat Parts Store lists C18 under MARINE ENGINE. This is model-family evidence only; exact serial number and arrangement must be verified in Cat SIS.',
 application_source_url='https://parts.cat.com/en/catcorp/product/'||part_number,
 source_note=concat_ws(E'\n',nullif(source_note,''),'Official Cat Parts Store fitment reviewed 2026-11-26; C18 marine model-family listing retained, serial/arrangement confirmation still required.'),
 source_accessed_at=now(),updated_at=now()
WHERE part_number IN ('129-0372','129-0375','6N-6248');

-- 513-4490 lists C18 in generator-set categories but its MARINE ENGINE list excludes C18.
-- Do not claim C18 Marine fitment from the generator-set listing.
UPDATE public.part_catalog
SET verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',is_active=false,
 application_evidence='Cat Parts Store lists C18 under GENERATOR SET and POWER MODULE, but the MARINE ENGINE compatible-model list does not include C18. Do not use as C18 Marine fitment without SIS confirmation.',
 application_source_url='https://parts.cat.com/en/catcorp/product/513-4490',
 source_note=concat_ws(E'\n',nullif(source_note,''),'Fitment correction 2026-11-26: C18 appears in generator-set categories, not in Cat public MARINE ENGINE list for this part. C18 Marine application not established.'),
 source_accessed_at=now(),updated_at=now()
WHERE part_number='513-4490';

UPDATE public.products p
SET status='INACTIVE',application_type='UNVERIFIED',
 application_evidence=concat_ws(E'\n',nullif(p.application_evidence,''),'C18 Marine fitment requires Cat SIS serial/arrangement verification; 513-4490 public listing does not include C18 in its MARINE ENGINE list.'),
 updated_at=now()
WHERE regexp_replace(upper(p.sku),'[^A-Z0-9]','','g') IN ('1290372','1290375','6N6248','5134490');