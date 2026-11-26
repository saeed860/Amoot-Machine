-- C32 Marine engine wiring and bracket references.
-- Public Cat listings are not exact serial-prefix/arrangement certification.
WITH src(part_number,name,description,technical_group,source_url,source_note,specifications) AS (
 VALUES
 ('478-7056','براکت Cat 478-7056','Carbon-steel bracket listed by Cat for C32 MARINE under Marine Engine. The public product page provides no detailed function; confirm diagram position and mounting assembly before ordering.','موتورهای دریایی - براکت‌ها و نگهدارنده‌های موتور','https://parts.cat.com/en/catcorp/product/478-7056','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Limited public description; verify diagram position, serial prefix and arrangement in Cat SIS.','{"component":"Bracket","material":"Carbon Steel","public_specification":"Limited"}'::jsonb),
 ('594-8249','براکت دسته‌سیم موتور Cat 594-8249','Steel engine wiring-harness bracket retaining wiring and electronic-control assemblies on the engine; dimensions 1.38 in high, 2.44 in long, 2.09 in wide and 0.16 in thick. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - برق و الکترونیک - براکت دسته‌سیم','https://parts.cat.com/en/catcorp/product/594-8249','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify harness routing, bracket position, serial prefix and arrangement in Cat SIS.','{"component":"Engine Wiring Harness Bracket","height_in":1.38,"length_in":2.44,"width_in":2.09,"thickness_in":0.16,"material":"Steel, Carbon Steel"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',s.source_url,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=EXCLUDED.source_note,verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_accessed_at=now(),compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications,updated_at=now()
 RETURNING part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4787056','5948249')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;