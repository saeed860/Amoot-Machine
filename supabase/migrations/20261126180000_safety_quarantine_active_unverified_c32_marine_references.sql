-- Safety correction: deactivate active non-OEM-verified entries whose Cat model evidence
-- explicitly includes C32 Marine / Marine Auxiliary. Public model references alone are not fitment approval.
UPDATE public.part_catalog
SET is_active=false,
    verification_status='NEEDS_SERIAL_CHECK',
    application_type='UNVERIFIED',
    source_note=concat_ws(E'\n',nullif(source_note,''),'C32 Marine safety correction 2026-11-26: deactivated pending exact Cat SIS serial/arrangement verification.'),
    updated_at=now()
WHERE part_number IN ('113-5304','20R-8517','30R-1359','394-1398','489-5670')
  AND is_active=true
  AND coalesce(application_type,'') <> 'OEM_VERIFIED';
UPDATE public.products p
SET status='INACTIVE'
WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('1135304','20R8517','30R1359','3941398','4895670')
  AND p.brand ILIKE '%cat%'
  AND p.status='ACTIVE';