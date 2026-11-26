-- C32 Marine turbocharger coolant and drain tube references.
-- Official Cat public listings do not certify exact serial/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_url,source_note,specifications) AS (
 VALUES
 ('650-1947','لوله آب توربوشارژر Cat 650-1947','34.8 mm inner-diameter turbocharger water-lines tube carrying coolant to and from the turbocharger. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - توربوشارژر - لوله آب خنک‌کاری','https://parts.cat.com/en/catcorp/product/650-1947','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify tube routing, connections, serial prefix and arrangement in Cat SIS.','{"component":"Turbocharger Water Lines Tube","inner_diameter_mm":34.8,"outer_diameter_in":1.5,"working_pressure_kPa":1000,"weight_lb":1.01,"materials":["Carbon Steel","Alloy Mixed Metal","Alloy Copper"]}'::jsonb),
 ('247-0457','مجموعه لوله تخلیه توربوشارژر Cat 247-0457','15.75 mm inner-diameter turbocharger drain tube assembly returning excess water to the engine water supply; withstands 240 kPa water pressure. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - توربوشارژر - لوله تخلیه آب','https://parts.cat.com/en/catcorp/product/247-0457','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm whether the tube is a water drain/return for the installed turbocharger configuration; verify serial prefix and arrangement in Cat SIS.','{"component":"Turbocharger Drain Tube Assembly","inner_diameter_mm":15.75,"water_pressure_kPa":240,"materials":["Carbon Steel","Alloy Mixed Metal"]}'::jsonb)
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
), refreshed AS (
 UPDATE public.part_catalog p SET
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('525-7148','603-6733')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6501947','2470457','5257148','6036733')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;