-- Keep C18 marine family candidates non-sellable until exact engine serial and arrangement are checked.
-- Marine prefixes: C1J, CKH, CYN, KJT, NAX, NAY. MGS is C18 generator-set and excluded.
UPDATE public.part_catalog
SET verification_status = 'NEEDS_SERIAL_CHECK',
    application_type = 'UNVERIFIED',
    engine_models = ARRAY['C18']::text[],
    is_active = false,
    source_note = concat_ws(E'\n', nullif(source_note,''), 'C18 marine family candidate only. Known marine serial prefixes for C18 are C1J, CKH, CYN, KJT, NAX and NAY; exact applicability is NOT established. Confirm engine serial number, arrangement and SIS effectivity before fitment or sale. C18 generator-set prefix MGS is excluded from this marine scope.'),
    application_evidence = 'Model-family reference only; serial-prefix and arrangement fitment not verified.',
    application_source_url = 'https://parts.cat.com/en/catcorp/equipment/marine-engine/C18-47/parts-diagram',
    updated_at = now()
WHERE part_number IN ('524-3160','20R-7175','524-3157','524-3154','361-5093','448-4451','448-4452','226-1191','161-4113','20R-4330','6I-4575','258-9978');
