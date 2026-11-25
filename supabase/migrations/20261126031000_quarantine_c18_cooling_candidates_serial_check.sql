-- C18 cooling candidates: keep Cat family-level evidence, but do not expose as sale-ready until SIS effectivity is checked.
UPDATE public.part_catalog
SET verification_status='NEEDS_SERIAL_CHECK',
    application_type='UNVERIFIED',
    application_evidence=concat_ws(E'\n',nullif(application_evidence,''),'Cat public product page lists C18 Marine at model-family level; verify complete engine serial number and arrangement in Cat SIS before confirming fitment.'),
    application_source_url=coalesce(application_source_url,source_url),
    is_active=false,
    source_note=concat_ws(E'\n',nullif(source_note,''),'Safety quarantine 2026-11-26: sourced C18 Marine family candidate; not serial/arrangement confirmed.'),
    source_accessed_at=coalesce(source_accessed_at,now()),
    updated_at=now()
WHERE regexp_replace(upper(part_number),'[^A-Z0-9]','','g') IN ('3421616','4475412','20R0981');

UPDATE public.products
SET status='INACTIVE',
    application_type='UNVERIFIED',
    application_evidence=concat_ws(E'\n',nullif(application_evidence,''),'C18 Marine family-level candidate only; Cat SIS serial/arrangement confirmation required before sale.'),
    application_source_url=coalesce(application_source_url,'https://parts.cat.com/en/catcorp/equipment/marine-engine/C18-47/parts-diagram'),
    updated_at=now()
WHERE regexp_replace(upper(sku),'[^A-Z0-9]','','g') IN ('3421616','4475412','20R0981');