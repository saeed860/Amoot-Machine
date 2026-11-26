-- C32 Marine catalog enrichment batch.
-- Official Cat Parts Store model listings are discovery references only.
-- No exact serial-prefix/arrangement fitment is asserted; all new records remain quarantined.
WITH src(part_number,name,description,technical_group,compatible_models,source_url,source_note,specifications) AS (
 VALUES
 ('478-0940','رایزر سمت راست منیفولد اگزوز Cat 478-0940','Right-hand exhaust manifold riser connecting the exhaust manifold to the turbocharger. Cat lists C32 MARINE under Marine Engine; C32B is a separate listed variant.','موتورهای دریایی - سیستم اگزوز - رایزر منیفولد',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/478-0940','Official Cat Parts Store lists C32 MARINE in MARINE ENGINE. C32B listing is not treated as C32 Marine compatibility. Verify exact serial prefix and arrangement in Cat SIS.','{"component":"Right Hand Side Exhaust Manifold Riser","source_material":"Not specified"}'::jsonb),
 ('485-7756','پیچ استاد منیفولد اگزوز Cat 485-7756','Fully threaded 3/8-16 exhaust manifold taperlock stud; overall length 2.17 in; steel/carbon steel. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم اگزوز - استاد منیفولد',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/485-7756','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Marine Auxiliary listing is C32B only and is not generalized. Verify exact serial prefix and arrangement in Cat SIS.','{"component":"Exhaust Manifold Taperlock Stud","thread_size":"3/8-16","overall_length_in":2.17,"material":"Steel, Carbon Steel"}'::jsonb),
 ('326-3686','فاصله‌گذار افترکولر Cat 326-3686','1.5 mm brass spacer for the aftercooler. Cat lists C32 MARINE under Marine Engine; C18 is also listed.','موتورهای دریایی - سیستم هوارسانی - فاصله‌گذار افترکولر',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/326-3686','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. No Marine Auxiliary application inferred. Verify exact serial prefix and arrangement in Cat SIS.','{"component":"Aftercooler Spacer","thickness_mm":1.5,"material":"Alloy Brass"}'::jsonb),
 ('6N-0624','لوله ورودی خنک‌کن روغن موتور Cat 6N-0624','Engine oil cooler inlet tube; outer diameter 1.38 in. Cat lists C32 MARINE under Marine Engine; additional C32-family categories are not treated as proof of exact configuration.','موتورهای دریایی - سیستم روغن‌کاری - لوله ورودی خنک‌کن روغن',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/6N-0624','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Other C32/C32B categories are retained as distinct applications. Verify exact serial prefix and arrangement in Cat SIS.','{"component":"Engine Oil Cooler Inlet Tube","outer_diameter_in":1.38,"materials":["Steel","Alloy Copper","Mixed Metal"]}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.compatible_models,'UNVERIFIED',
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
), safety AS (
 UPDATE public.part_catalog p SET
 is_active=false,verification_status='NEEDS_SERIAL_CHECK',application_type='UNVERIFIED',
 updated_at=now()
 WHERE p.part_number IN ('478-0940','485-7756','326-3686','6N-0624')
 AND (p.is_active OR p.verification_status<>'NEEDS_SERIAL_CHECK' OR p.application_type<>'UNVERIFIED')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4780940','4857756','3263686','6N0624')
 RETURNING p.sku
)
SELECT
 (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM safety) AS unsafe_catalog_rows_quarantined,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated,
 (SELECT count(*) FROM public.part_catalog WHERE verification_status='NEEDS_SERIAL_CHECK' AND is_active=true) AS active_unverified_catalog_rows;