WITH candidates AS (
  UPDATE public.part_catalog
  SET verification_status = 'NEEDS_SERIAL_CHECK',
      application_type = 'UNVERIFIED',
      is_active = false,
      source_note = concat_ws(E'\n', nullif(source_note,''), 'C18 Marine safety review 2026-11-26: Cat public Marine publications establish system/options context only; exact serial prefix and engine arrangement fitment is not established. Keep quarantined pending Cat SIS verification.')
  WHERE brand ILIKE '%cat%'
    AND (engine_models && ARRAY['C18','C18 Marine']::text[] OR compatible_models && ARRAY['C18','C18 Marine']::text[])
    AND verification_status <> 'OEM_VERIFIED'
    AND application_type IN ('UNVERIFIED','MARINE')
    AND (
      technical_group ILIKE '%exhaust%' OR technical_group ILIKE '%turbo%'
      OR technical_group ILIKE '%electrical%' OR technical_group ILIKE '%sensor%'
      OR technical_group ILIKE '%harness%' OR technical_group ILIKE '%starting%'
      OR technical_group ILIKE '%engine%' OR technical_group ILIKE '%cylinder%'
      OR technical_group ILIKE '%bearing%' OR technical_group ILIKE '%gasket%'
      OR technical_group ILIKE '%breather%' OR technical_group ILIKE '%air intake%'
      OR technical_group ILIKE '%هوارسانی%' OR technical_group ILIKE '%توربو%'
      OR technical_group ILIKE '%اگزوز%' OR technical_group ILIKE '%برق%'
      OR technical_group ILIKE '%استارت%' OR technical_group ILIKE '%بلوک%'
      OR technical_group ILIKE '%سیلندر%' OR technical_group ILIKE '%یاتاقان%'
      OR technical_group ILIKE '%واشر%' OR technical_group ILIKE '%مکانیکی%'
    )
  RETURNING part_number_normalized
), products_off AS (
  UPDATE public.products p
  SET status = 'INACTIVE'
  FROM candidates c
  WHERE upper(regexp_replace(p.sku, '[^A-Za-z0-9]', '', 'g')) = upper(regexp_replace(c.part_number_normalized, '[^A-Za-z0-9]', '', 'g'))
    AND p.brand ILIKE '%cat%'
    AND p.status = 'ACTIVE'
  RETURNING p.id
)
SELECT (SELECT count(*) FROM candidates) AS quarantined_catalog_refs,
       (SELECT count(*) FROM products_off) AS deactivated_exact_sku_products;