-- Refresh official Cat public evidence for existing C32 Marine-related references.
-- Public catalog compatibility is not serial-prefix / arrangement-level certification.
WITH src(part_number,models,source_note,application_evidence,specifications) AS (
 VALUES
 ('389-0434',ARRAY['C32 MARINE ENGINE','3116 MARINE ENGINE']::text[],
  'Cat Parts Store identifies C32 MARINE in MARINE ENGINE. Exact serial prefix and arrangement remain unverified.',
  'Official Cat Parts Store compatible-model listing: MARINE ENGINE / C32 MARINE. Family-level evidence only; Cat SIS serial/arrangement check required.',
  '{"component":"Engine Oil Filter","filter_type":"Spin-On","diameter_in":5.346,"length_in":12.087,"material":"Carbon Steel","efficiency":"Advanced High Efficiency"}'::jsonb),
 ('328-2560',ARRAY['C32 MARINE ENGINE']::text[],
  'Cat Parts Store identifies C32 MARINE in MARINE ENGINE. Verify water-pump variant and supersession by serial/arrangement.',
  'Official Cat Parts Store compatible-model listing: MARINE ENGINE / C32 MARINE. Family-level evidence only; Cat SIS serial/arrangement check required.',
  '{"component":"Water Pump Shaft","material":"Stainless Steel","length_in":13.0,"height_in":1.2}'::jsonb),
 ('575-5613',ARRAY['C32 MARINE ENGINE']::text[],
  'Cat Parts Store identifies C32 MARINE in MARINE ENGINE. Exact serial prefix and exhaust arrangement remain unverified.',
  'Official Cat Parts Store compatible-model listing: MARINE ENGINE / C32 MARINE. Family-level evidence only; Cat SIS serial/arrangement check required.',
  '{"component":"Exhaust Aftertreatment Module","material":"Alloy Steel"}'::jsonb),
 ('293-2875',ARRAY['C32 MARINE ENGINE','C32 MARINE ENGINE FAMILY','C9.3 MARINE ENGINE']::text[],
  'Cat Parts Store lists C32 MARINE and C32 under MARINE ENGINE. Exact serial prefix and oil-filter housing arrangement remain unverified.',
  'Official Cat Parts Store compatible-model listing includes MARINE ENGINE / C32 MARINE and C32. Family-level evidence only; Cat SIS serial/arrangement check required.',
  '{"component":"Engine Oil Filter Cover"}'::jsonb),
 ('153-9121',ARRAY['C32B MARINE ENGINE','C32 MARINE ENGINE','3412E MARINE ENGINE','C30 MARINE ENGINE','C32 MARINE AUXILIARY','C32 PETROLEUM ENGINE']::text[],
  'Cat Parts Store lists multiple engine families including C32 MARINE and C32B. Do not infer cross-fit between C32B and C32 Marine.',
  'Official Cat Parts Store compatible-model listing includes MARINE ENGINE / C32 MARINE and MARINE AUXILIARY / C32. Separate C32B applicability; Cat SIS serial/arrangement check required.',
  '{"component":"Auxiliary Water Pump Plate"}'::jsonb),
 ('328-2561',ARRAY['3412E MARINE ENGINE','C32 MARINE ENGINE FAMILY']::text[],
  'Cat Parts Store lists C32 under MARINE ENGINE. Verify exact C32 Marine arrangement, impeller vane count and pump variant.',
  'Official Cat Parts Store compatible-model listing: MARINE ENGINE / 3412E, C32. C32 Marine exact serial/arrangement not established; Cat SIS check required.',
  '{"component":"Water Pump Impeller Kit","length_in":6.6,"height_in":5.2,"included_parts":["153-9124","322-8595"]}'::jsonb),
 ('516-6017',ARRAY['C32 GENERATOR SET','C32B MARINE AUXILIARY','C32 MARINE AUXILIARY','C32B MARINE ENGINE','C32 MARINE ENGINE']::text[],
  'Cat Parts Store lists C32/C32B in Marine Engine and Marine Auxiliary categories. Keep inactive until exact engine serial and arrangement are confirmed.',
  'Official Cat Parts Store compatible-model listing: MARINE ENGINE / C32B, C32 MARINE, C32; MARINE AUXILIARY / C32B, C32. Do not transfer C32B-only fitment to C32 Marine without Cat SIS.',
  '{"component":"Engine Oil Filter Base Cover"}'::jsonb),
 ('490-3745',ARRAY['C32 GENERATOR SET','C32B MARINE ENGINE','C32 MARINE ENGINE','C32 MARINE AUXILIARY','C32B MARINE AUXILIARY']::text[],
  'Cat Parts Store lists C32 MARINE in Marine Engine, but C32B also appears in Marine Engine and Marine Auxiliary. Quarantined pending exact serial/arrangement confirmation.',
  'Official Cat Parts Store compatible-model listing includes C32 MARINE / C32 and C32B in different marine categories. Do not infer shared fitment; Cat SIS serial/arrangement check required.',
  '{"component":"Fuel Cooler Core","material":"Alloy Copper"}'::jsonb)
), refreshed AS (
 UPDATE public.part_catalog p SET
  compatible_models=s.models,
  source_name='Cat Parts Store',
  source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
  application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
  source_note=concat_ws(E'\n',nullif(p.source_note,''),s.source_note,'Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.'),
  application_evidence=s.application_evidence,
  application_type='UNVERIFIED',
  verification_status='NEEDS_SERIAL_CHECK',
  is_active=false,
  specifications=coalesce(s.specifications,p.specifications),
  source_accessed_at=now(),updated_at=now()
 FROM src s
 WHERE p.part_number=s.part_number
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 (SELECT upper(regexp_replace(part_number,'[^A-Za-z0-9]','','g')) FROM refreshed)
 RETURNING p.id
)
SELECT (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;