WITH candidates AS (
 UPDATE public.part_catalog
 SET verification_status='NEEDS_SERIAL_CHECK',
     application_type='UNVERIFIED',
     is_active=false,
     source_note=concat_ws(E'\n',nullif(source_note,''),'C32 Marine safety sweep 2026-11-26: public model/application reference is not serial-prefix and arrangement-level proof. Quarantined pending Cat SIS verification.'),
     updated_at=now()
 WHERE brand ILIKE '%cat%'
   AND (engine_models && ARRAY['C32','C32 MARINE','C32B']::text[]
        OR compatible_models && ARRAY['C32','C32 MARINE','C32 MARINE ENGINE','C32B','C32B MARINE ENGINE']::text[])
   AND application_type IN ('MARINE','BOTH')
   AND verification_status <> 'OEM_VERIFIED'
 RETURNING part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 FROM candidates c
 WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g'))=upper(regexp_replace(c.part_number,'[^A-Za-z0-9]','','g'))
   AND p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 RETURNING p.id
)
SELECT (SELECT count(*) FROM candidates) AS quarantined_c32_marine_refs,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;