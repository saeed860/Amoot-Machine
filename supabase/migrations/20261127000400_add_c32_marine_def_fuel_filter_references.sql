-- C32 Marine fuel filtration and emissions-fluid references.
-- Public Cat model listings do not certify exact serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('491-6779','فیلتر سیال اگزوز دیزل Cat 491-6779','Diesel Exhaust Fluid (DEF) filter element removing contaminants from the fluid supply for the emissions aftertreatment system. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم پس‌پالایش - فیلتر DEF',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/491-6779','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm whether the installed engine emissions package uses this DEF system, then verify serial prefix and arrangement in Cat SIS.','{"component":"Diesel Exhaust Fluid Filter","filter_type":"Cartridge (Element)","material":"Stainless Steel","maximum_temperature_C":100,"maximum_working_pressure_bar":7}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
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
 source_name='Cat Parts Store',
 source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 compatible_models=CASE p.part_number
  WHEN '6N-6251' THEN ARRAY['C32 MARINE ENGINE']::text[]
  WHEN '422-7587' THEN ARRAY['C32 MARINE ENGINE']::text[]
  WHEN '505-0160' THEN ARRAY['C32 MARINE ENGINE']::text[]
  WHEN '578-1572' THEN ARRAY['C32 MARINE ENGINE']::text[]
  ELSE p.compatible_models END,
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store public listing. Kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('6N-6251','422-7587','505-0160','578-1572')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4916779','6N6251','4227587','5050160','5781572')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;