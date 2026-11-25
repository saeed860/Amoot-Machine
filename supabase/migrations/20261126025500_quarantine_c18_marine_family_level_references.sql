-- Marine-group C18 catalog references are family-level candidates, not serial-confirmed fitment.
-- Preserve their source records while preventing them from being treated as verified active applications.
UPDATE public.part_catalog
SET verification_status = 'NEEDS_SERIAL_CHECK',
    application_type = 'UNVERIFIED',
    application_evidence = concat_ws(E'\n', nullif(application_evidence,''), 'C18 marine family-level reference only. Exact engine serial number and arrangement effectivity must be confirmed in Cat SIS before application or sale.'),
    application_source_url = coalesce(application_source_url, source_url),
    is_active = false,
    source_note = concat_ws(E'\n', nullif(source_note,''), 'Safety review 2026-11-26: retained as a sourced C18 marine candidate; quarantined pending Cat SIS serial/arrangement verification.'),
    source_accessed_at = coalesce(source_accessed_at, now()),
    updated_at = now()
WHERE technical_group ILIKE '%دریایی%'
  AND (coalesce(array_to_string(engine_models,','),'') ILIKE '%C18%'
       OR coalesce(array_to_string(compatible_models,','),'') ILIKE '%C18%')
  AND verification_status = 'REFERENCE'
  AND application_type IN ('BOTH','MARINE');