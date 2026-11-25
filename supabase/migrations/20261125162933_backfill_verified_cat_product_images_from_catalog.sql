-- Backfill storefront product photos only from active official Cat catalog rows.
-- Keep existing product imagery untouched and never invent or derive image URLs.
WITH catalog_images AS (
  SELECT DISTINCT ON (regexp_replace(upper(part_number),'[^A-Z0-9]','','g'))
    regexp_replace(upper(part_number),'[^A-Z0-9]','','g') AS normalized_part_number,
    image_url
  FROM public.part_catalog
  WHERE is_active = true
    AND source_url ILIKE 'https://parts.cat.com/%'
    AND image_url ILIKE 'https://caterpillar.scene7.com/is/image/Caterpillar/%'
  ORDER BY regexp_replace(upper(part_number),'[^A-Z0-9]','','g'), updated_at DESC NULLS LAST
)
UPDATE public.products AS p
SET image_url = c.image_url,
    updated_at = now()
FROM catalog_images AS c
WHERE regexp_replace(upper(p.sku),'[^A-Z0-9]','','g') =
      'CAT' || c.normalized_part_number
  AND p.status = 'ACTIVE'
  AND (p.image_url IS NULL OR p.image_url = '')
  AND (p.brand ILIKE '%cat%' OR p.sku ILIKE 'CAT-%');
