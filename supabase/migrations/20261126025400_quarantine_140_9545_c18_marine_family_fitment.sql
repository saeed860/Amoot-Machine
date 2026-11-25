-- Quarantine 140-9545: Cat lists C18 and Marine Engine compatibility,
-- but the public family-level listing does not establish serial/arrangement effectivity.
UPDATE public.part_catalog
SET name = 'هسته خنک‌کن سوخت CAT 140-9545',
    description = 'Cat Fuel Cooler Core cools fuel before it reaches the engine. Cat describes the assembly as a heat exchanger with coolant lines and lists compatible model families including C18 generator set, C18/3406E marine engines and C18 petroleum package. This is family-level catalog evidence only; exact marine serial number and arrangement effectivity are not established.',
    technical_group = 'موتورهای دریایی - سوخت‌رسانی و خنک‌کن سوخت',
    engine_models = ARRAY['C18','3406E']::text[],
    compatible_models = ARRAY['C18','3406E']::text[],
    verification_status = 'NEEDS_SERIAL_CHECK',
    application_type = 'UNVERIFIED',
    application_evidence = 'Cat Parts Store lists C18 and MARINE ENGINE C18/3406E among compatible model families; no serial-number or arrangement-specific effectivity supplied on the public product page.',
    application_source_url = 'https://parts.cat.com/en/catcorp/product/140-9545',
    source_name = 'Cat Parts Store',
    source_url = 'https://parts.cat.com/en/catcorp/product/140-9545',
    source_note = concat_ws(E'\n', nullif(source_note,''), 'Reclassified from active family-level reference to NEEDS_SERIAL_CHECK. Public Cat listing confirms model-family relevance only; verify full engine serial number and arrangement in Cat SIS before any sale/application claim.'),
    source_accessed_at = now(),
    is_active = false,
    updated_at = now()
WHERE part_number_normalized = '1409545'
   OR regexp_replace(upper(part_number), '[^A-Z0-9]', '', 'g') = '1409545';

UPDATE public.products
SET status = 'INACTIVE',
    application_type = 'UNVERIFIED',
    application_evidence = 'Quarantined: Cat family-level C18/Marine Engine compatibility is not serial/arrangement-specific. Verify in Cat SIS before sale.',
    application_source_url = 'https://parts.cat.com/en/catcorp/product/140-9545',
    updated_at = now()
WHERE regexp_replace(upper(sku), '[^A-Z0-9]', '', 'g') = '1409545';
