WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('383-1608','پمپ پرایمینگ سوخت Cat 383-1608','Cat Fuel Priming Pump; Cat Parts Store lists C32B, C32 Marine and C32 under Marine Engine.','موتورهای دریایی - سوخت‌رسانی - پمپ پرایمینگ',ARRAY['C32','C32 Marine','C32B']::text[],'https://parts.cat.com/en/catcorp/product/383-1608','Cat Parts Store lists C32B, C32 MARINE and C32 under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
 ('491-6748','خنک‌کن سوخت موتور Cat 491-6748','Engine Fuel Cooler; Cat Parts Store lists C32B, C32 Marine and C32 under Marine Engine.','موتورهای دریایی - سوخت‌رسانی - خنک‌کن سوخت',ARRAY['C32','C32 Marine','C32B']::text[],'https://parts.cat.com/en/catcorp/product/491-6748','Cat Parts Store lists C32B, C32 MARINE and C32 under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Public Cat Parts Store Marine Engine model listing only; no serial-prefix or arrangement-level confirmation.',s.source_url
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,updated_at=now()
 RETURNING part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 FROM upserted u
 WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g'))=upper(regexp_replace(u.part_number,'[^A-Za-z0-9]','','g'))
 AND p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 RETURNING p.id
)
SELECT (SELECT count(*) FROM upserted) AS c32_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;