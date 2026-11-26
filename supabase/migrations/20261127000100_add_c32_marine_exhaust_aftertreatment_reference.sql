-- Add newly discovered Cat C32 Marine exhaust aftertreatment module and normalize model labels.
-- Cat public compatibility listings are not serial-prefix / arrangement-level fitment certification.
WITH ins AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,
  verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,
  application_source_url,specifications)
 VALUES
 ('Caterpillar','575-5613','ماژول مجموعه اگزوز Cat 575-5613',
  'Exhaust aftertreatment module listed by Cat for C32 MARINE under Marine Engine. Exact serial prefix and arrangement must be confirmed in Cat SIS.',
  ARRAY['C32']::text[],'موتورهای دریایی - سیستم اگزوز - ماژول پس‌پردازش','Cat Parts Store',
  'https://parts.cat.com/en/catcorp/product/575-5613',
  'Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Public model listing only; not approved for sale until Cat SIS serial/arrangement verification.',
  'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE']::text[],'UNVERIFIED',
  'Official Cat Parts Store compatible-model listing: MARINE ENGINE / C32 MARINE. Exact serial-prefix and arrangement fitment not verified.',
  'https://parts.cat.com/en/catcorp/product/575-5613','{"component":"Exhaust Aftertreatment Module","material":"Alloy Steel"}'::jsonb)
 ON CONFLICT(part_number) DO UPDATE SET
  name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
  technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
  source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
  verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
  compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
  application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
  specifications=EXCLUDED.specifications,updated_at=now()
 RETURNING part_number
), corrected AS (
 UPDATE public.part_catalog p SET
  compatible_models=CASE p.part_number
   WHEN '389-0434' THEN ARRAY['C32 MARINE','3116']::text[]
   WHEN '293-2875' THEN ARRAY['C32 MARINE','C32','C9.3']::text[]
   WHEN '153-9121' THEN ARRAY['C32B','C32 MARINE','3412E','C30','C32']::text[]
   WHEN '328-2561' THEN ARRAY['3412E','C32']::text[]
   WHEN '516-6017' THEN ARRAY['C32','C32B','C32 MARINE']::text[]
   WHEN '490-3745' THEN ARRAY['C32','C32B','C32 MARINE']::text[]
   ELSE p.compatible_models END,
  source_note=concat_ws(E'\n',nullif(p.source_note,''),'Model labels normalized to Cat public model names; category context retained in application_evidence. Exact serial/arrangement remains unverified.'),
  application_evidence=CASE p.part_number
   WHEN '389-0434' THEN 'Official Cat Parts Store: MARINE ENGINE / C32 MARINE, 3116.'
   WHEN '293-2875' THEN 'Official Cat Parts Store: MARINE ENGINE / C32 MARINE, C32, C9.3.'
   WHEN '153-9121' THEN 'Official Cat Parts Store: MARINE ENGINE / C32B, C32 MARINE, 3412E, C30, C32; MARINE AUXILIARY / C32. C32B is not interchangeable by inference.'
   WHEN '328-2561' THEN 'Official Cat Parts Store: MARINE ENGINE / 3412E, C32. Listing does not explicitly say C32 MARINE.'
   WHEN '516-6017' THEN 'Official Cat Parts Store: MARINE ENGINE / C32B, C32 MARINE, C32; MARINE AUXILIARY / C32B, C32.'
   WHEN '490-3745' THEN 'Official Cat Parts Store: GENERATOR SET / C32; MARINE ENGINE / C32B, C32 MARINE, C32; MARINE AUXILIARY / C32B.'
   ELSE p.application_evidence END,
  application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
  source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('389-0434','293-2875','153-9121','328-2561','516-6017','490-3745')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5755613')
 RETURNING p.id
)
SELECT (SELECT count(*) FROM ins) AS exhaust_module_upserted,
       (SELECT count(*) FROM corrected) AS model_labels_corrected,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;