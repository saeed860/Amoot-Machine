-- Expand C32 Marine cooling, exhaust and harness references from official Cat Parts Store listings.
-- Public model listings are discovery evidence only; no serial-prefix/arrangement fitment is asserted.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('355-1264','منیفولد اگزوز آب‌خنک سمت چپ Cat 355-1264','Left Hand Side Water Cooled Exhaust Manifold. Cat lists C32 under Marine Engine and Marine Auxiliary applications.','موتورهای دریایی - سیستم اگزوز - منیفولد آب‌خنک',ARRAY['C32 MARINE ENGINE','C32 MARINE AUXILIARY']::text[],'https://parts.cat.com/en/catcorp/product/355-1264','Official Cat Parts Store lists C32 under MARINE ENGINE and MARINE AUXILIARY. Exact serial-prefix and arrangement fitment must be checked in Cat SIS.','{"component":"Left Hand Side Water Cooled Exhaust Manifold","material":"Alloy Steel, Carbon Steel"}'::jsonb),
 ('356-1246','گروه پمپ آب Cat 356-1246','Water Pump Group used to circulate coolant through the engine. Cat lists C32 in Marine Engine and C32 in Generator Set; C32B also appears separately.','موتورهای دریایی - سیستم خنک‌کاری - پمپ آب',ARRAY['C32 MARINE ENGINE','C32 GENERATOR SET','C32B MARINE ENGINE','C32B MARINE AUXILIARY']::text[],'https://parts.cat.com/en/catcorp/product/356-1246','Official Cat Parts Store lists C32 under MARINE ENGINE and GENERATOR SET, and C32B separately. Exact serial-prefix and arrangement fitment must be checked in Cat SIS.','{"component":"Water Pump Group","length_in":24.5,"height_in":16.8,"material":"Oil Fluid"}'::jsonb),
 ('519-6368','پمپ آب دریا کمکی Cat 519-6368','Auxiliary Sea Water Pump supplying seawater to heat exchangers for engine cooling. Cat lists C32 under Marine Engine.','موتورهای دریایی - سیستم خنک‌کاری - پمپ آب دریا',ARRAY['C32 MARINE ENGINE','C32 GENERATOR SET']::text[],'https://parts.cat.com/en/catcorp/product/519-6368','Official Cat Parts Store lists C32 under MARINE ENGINE and GENERATOR SET. Exact serial-prefix and arrangement fitment must be checked in Cat SIS.','{"component":"Auxiliary Sea Water Pump","material":"Alloy Copper"}'::jsonb),
 ('548-1813','پروانه پمپ آب Cat 548-1813','Water Pump Impeller used in the engine cooling-water pump. Cat lists C32 under Marine Engine; C32B is listed separately for Marine Engine and Marine Auxiliary.','موتورهای دریایی - سیستم خنک‌کاری - پروانه پمپ آب',ARRAY['C32 MARINE ENGINE','C32B MARINE ENGINE','C32B MARINE AUXILIARY']::text[],'https://parts.cat.com/en/catcorp/product/548-1813','Official Cat Parts Store lists C32 under MARINE ENGINE; C32B appears separately under MARINE ENGINE and MARINE AUXILIARY. Do not infer C32 Marine Auxiliary applicability. Exact serial-prefix and arrangement fitment must be checked in Cat SIS.','{"component":"Water Pump Impeller","material":"Nickel Aluminum Bronze"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store compatible-model listing only; exact serial-prefix and arrangement fitment not verified.',s.source_url,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications,updated_at=now()
 RETURNING part_number
), refreshed AS (
 UPDATE public.part_catalog p
 SET compatible_models=CASE p.part_number
       WHEN '610-6841' THEN ARRAY['C32 MARINE ENGINE','C32 GENERATOR SET']::text[]
       WHEN '631-5864' THEN ARRAY['C32 MARINE ENGINE','C32B MARINE ENGINE','C32B MARINE AUXILIARY','C32 GENERATOR SET']::text[]
       ELSE p.compatible_models END,
     engine_models=CASE p.part_number
       WHEN '610-6841' THEN ARRAY['C32']::text[]
       WHEN '631-5864' THEN ARRAY['C32','C32B']::text[]
       ELSE p.engine_models END,
     source_name='Cat Parts Store',
     source_url=CASE p.part_number
       WHEN '610-6841' THEN 'https://parts.cat.com/en/catcorp/product/610-6841'
       WHEN '631-5864' THEN 'https://parts.cat.com/en/catcorp/product/631-5864'
       ELSE p.source_url END,
     application_source_url=CASE p.part_number
       WHEN '610-6841' THEN 'https://parts.cat.com/en/catcorp/product/610-6841'
       WHEN '631-5864' THEN 'https://parts.cat.com/en/catcorp/product/631-5864'
       ELSE p.application_source_url END,
     application_evidence='Official Cat Parts Store listing confirms model-family application only; exact serial-prefix and arrangement fitment not verified.',
     application_type=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.application_type ELSE 'UNVERIFIED' END,
     verification_status=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.verification_status ELSE 'NEEDS_SERIAL_CHECK' END,
     is_active=CASE WHEN p.application_type='OEM_VERIFIED' THEN p.is_active ELSE false END,
     source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('610-6841','631-5864')
 RETURNING p.part_number
), safety AS (
 UPDATE public.part_catalog
 SET is_active=false,verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',
     source_note=concat_ws(E'\n',nullif(source_note,''),'Safety sweep: C32 Marine family listing is not serial/arrangement verification; kept inactive.'),
     updated_at=now()
 WHERE brand ILIKE '%cat%' AND is_active=true
   AND coalesce(application_type,'') <> 'OEM_VERIFIED'
   AND (compatible_models && ARRAY['C32 MARINE ENGINE','MARINE ENGINE C32','C32 MARINE AUXILIARY','MARINE AUXILIARY C32','C32 MARINE','MARINE C32']::text[])
 RETURNING part_number
), product_off AS (
 UPDATE public.products p SET status='INACTIVE'
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
   AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
       (SELECT upper(regexp_replace(part_number,'[^A-Za-z0-9]','','g')) FROM upserted
        UNION SELECT upper(regexp_replace(part_number,'[^A-Za-z0-9]','','g')) FROM refreshed)
 RETURNING p.id
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
       (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
       (SELECT count(*) FROM safety) AS unsafe_active_catalog_rows_deactivated,
       (SELECT count(*) FROM product_off) AS exact_sku_products_deactivated;
