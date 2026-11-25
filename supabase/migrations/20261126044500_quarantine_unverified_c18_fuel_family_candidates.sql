-- C18 fuel-system catalog safety sweep: unresolved family-level/third-party references are not sale-ready.
UPDATE public.part_catalog
SET verification_status='NEEDS_SERIAL_CHECK',
    application_type='UNVERIFIED',
    application_evidence=concat_ws(E'\n',nullif(application_evidence,''),'C18 family-level or third-party catalog reference only. Marine applicability and exact serial/arrangement effectivity have not been established from Cat SIS.'),
    application_source_url=coalesce(application_source_url,source_url),
    is_active=false,
    source_note=concat_ws(E'\n',nullif(source_note,''),'Safety sweep 2026-11-26: C18 fuel-system candidate quarantined; Cat SIS serial/arrangement evidence required.'),
    source_accessed_at=coalesce(source_accessed_at,now()),
    updated_at=now()
WHERE is_active=true
  AND (coalesce(array_to_string(engine_models,','),'') ILIKE '%C18%'
       OR coalesce(array_to_string(compatible_models,','),'') ILIKE '%C18%')
  AND (technical_group ILIKE '%سوخت%' OR technical_group ILIKE '%fuel%')
  AND verification_status <> 'OEM_VERIFIED';

UPDATE public.products p
SET status='INACTIVE',
    application_type='UNVERIFIED',
    application_evidence=concat_ws(E'\n',nullif(p.application_evidence,''),'C18 fuel-system candidate is quarantined pending Cat SIS serial/arrangement verification.'),
    updated_at=now()
WHERE p.status::text='ACTIVE'
  AND EXISTS (
    SELECT 1 FROM public.part_catalog c
    WHERE regexp_replace(upper(c.part_number),'[^A-Z0-9]','','g')=regexp_replace(upper(p.sku),'[^A-Z0-9]','','g')
      AND c.is_active=false AND c.verification_status='NEEDS_SERIAL_CHECK'
      AND (coalesce(array_to_string(c.engine_models,','),'') ILIKE '%C18%'
           OR coalesce(array_to_string(c.compatible_models,','),'') ILIKE '%C18%')
      AND (c.technical_group ILIKE '%سوخت%' OR c.technical_group ILIKE '%fuel%')
  );