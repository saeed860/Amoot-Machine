WITH target AS (
 UPDATE public.part_catalog
 SET verification_status='NEEDS_SERIAL_CHECK',
     application_type='UNVERIFIED',
     is_active=false,
     source_note=concat_ws(E'\n',nullif(source_note,''),'Safety correction 2026-11-26: C32 appears in a broad mixed-model reference, but no OEM serial/arrangement proof for C32 Marine was established. Quarantined; not sale-approved.'),
     updated_at=now()
 WHERE part_number='149-1950'
   AND brand ILIKE '%cat%'
   AND verification_status <> 'OEM_VERIFIED'
 RETURNING part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 FROM target t
 WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g'))=upper(regexp_replace(t.part_number,'[^A-Za-z0-9]','','g'))
   AND p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 RETURNING p.id
)
SELECT (SELECT count(*) FROM target) AS references_quarantined,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;