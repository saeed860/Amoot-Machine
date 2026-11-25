-- Quarantine every currently active C18 cooling-family catalog reference.
-- This is a conservative safety gate: public Cat family compatibility is not serial/arrangement fitment.
UPDATE public.part_catalog
SET verification_status='NEEDS_SERIAL_CHECK',
    application_type='UNVERIFIED',
    application_evidence=concat_ws(E'\n',nullif(application_evidence,''),'C18 cooling-family candidate only. Cat SIS verification against complete engine serial number and arrangement is required before confirming marine fitment.'),
    application_source_url=coalesce(application_source_url,source_url),
    is_active=false,
    source_note=concat_ws(E'\n',nullif(source_note,''),'Safety sweep 2026-11-26: active C18 cooling-family reference quarantined pending serial/arrangement verification.'),
    source_accessed_at=coalesce(source_accessed_at,now()),
    updated_at=now()
WHERE is_active=true
  AND (coalesce(array_to_string(engine_models,','),'') ILIKE '%C18%'
       OR coalesce(array_to_string(compatible_models,','),'') ILIKE '%C18%')
  AND (technical_group ILIKE '%خنک%' OR technical_group ILIKE '%cooling%' OR technical_group ILIKE '%water pump%' OR technical_group ILIKE '%exchanger%')
  AND verification_status <> 'OEM_VERIFIED';

UPDATE public.products p
SET status='INACTIVE',
    application_type='UNVERIFIED',
    application_evidence=concat_ws(E'\n',nullif(p.application_evidence,''),'C18 cooling-family candidate only; Cat SIS verification against complete engine serial number and arrangement is required before sale.'),
    updated_at=now()
WHERE p.status::text='ACTIVE'
  AND EXISTS (
    SELECT 1 FROM public.part_catalog c
    WHERE regexp_replace(upper(c.part_number),'[^A-Z0-9]','','g')=regexp_replace(upper(p.sku),'[^A-Z0-9]','','g')
      AND c.verification_status='NEEDS_SERIAL_CHECK'
      AND c.is_active=false
      AND (coalesce(array_to_string(c.engine_models,','),'') ILIKE '%C18%'
           OR coalesce(array_to_string(c.compatible_models,','),'') ILIKE '%C18%')
      AND (c.technical_group ILIKE '%خنک%' OR c.technical_group ILIKE '%cooling%' OR c.technical_group ILIKE '%water pump%' OR c.technical_group ILIKE '%exchanger%')
  );