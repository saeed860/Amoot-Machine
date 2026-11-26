-- Batch: C32 Marine water-pump manifold and starter wiring references.
-- Cat public model listings do not prove serial/arrangement fitment; all records remain quarantined.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('153-9075','منیفولد پمپ آب Cat 153-9075','Water pump manifold used in the cooling-water pump circuit. Cat Parts Store lists C32 under Marine Engine and Marine Auxiliary among other applications.','موتورهای دریایی - سیستم خنک‌کاری - منیفولد پمپ آب',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/153-9075','Official Cat Parts Store lists C32 MARINE ENGINE and MARINE AUXILIARY. Verify exact pump group, serial number and arrangement in Cat SIS.','{"component":"Water pump manifold","length_in":6.3,"height_in":4.5}'::jsonb),
 ('250-8472','سیم استارت موتور Cat 250-8472','Electric starting motor wire connecting the magnetic switch to the starter motor. Cat Parts Store lists C32 Marine Engine.','موتورهای دریایی - سیستم استارت - سیم استارت',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/250-8472','Official Cat Parts Store lists C32 MARINE ENGINE. Verify starter configuration, serial number and arrangement in Cat SIS.','{"component":"Electric starting motor wire"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store compatible-model listing; serial-prefix and exact arrangement fitment not verified.',s.source_url,s.specifications
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
), safety AS (
 UPDATE public.part_catalog
 SET is_active=false,verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',
 source_note=concat_ws(E'\n',nullif(source_note,''),'C32 Marine reference reconfirmed from Cat Parts Store; exact serial/arrangement remains unverified.'),
 updated_at=now()
 WHERE part_number IN ('646-0251','355-1265')
   AND coalesce(application_type,'') <> 'OEM_VERIFIED'
 RETURNING part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 FROM upserted u
 WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g'))=upper(regexp_replace(u.part_number,'[^A-Za-z0-9]','','g'))
 AND p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 RETURNING p.id
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
       (SELECT count(*) FROM safety) AS existing_references_safety_refreshed,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;