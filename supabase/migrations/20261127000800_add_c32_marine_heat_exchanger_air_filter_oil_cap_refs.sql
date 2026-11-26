-- C32 Marine heat exchanger, intake filtration and oil-filter references.
-- Public Cat listings do not establish exact serial/arrangement fitment.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('632-8970','درپوش مبدل حرارتی آب دریا Cat 632-8970','Gray cast-iron cover enclosing and protecting the seawater heat exchanger in the marine cooling circuit. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم خنک‌کاری - درپوش مبدل آب دریا',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/632-8970','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify exchanger variant, serial prefix and arrangement in Cat SIS.','{"component":"Sea Water Heat Exchanger Cover","material":"Gray (Flake) Iron"}'::jsonb),
 ('494-6993','فیلتر هوای پایه سمت چپ Cat 494-6993','Left-hand basic air cleaner filtering incoming air before it enters the engine. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم هوارسانی - فیلتر هوای سمت چپ',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/494-6993','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm left/right installation and air-cleaner housing configuration, then verify serial prefix and arrangement in Cat SIS.','{"component":"Left Hand Basic Air Cleaner","shape":"Round","overall_width_in":12.126,"overall_height_in":14.587,"overall_length_in":19.657,"outlet_size_in":6,"material":"Carbon Steel"}'::jsonb),
 ('581-2165','درپوش فیلتر روغن Cat 581-2165','64.5 mm outer-diameter oil filter cap securing and protecting the oil-filter assembly against contamination. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم روغن‌کاری - درپوش فیلتر روغن',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/581-2165','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify filter-base variant, serial prefix and arrangement in Cat SIS.','{"component":"Oil Filter Cap","outer_diameter_mm":64.5,"material":"Polyamide Plastic"}'::jsonb)
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
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/353-9037',
 application_source_url='https://parts.cat.com/en/catcorp/product/353-9037',
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Safety correction: public Cat model listing is not exact SIS fitment certification; kept inactive pending serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number='353-9037'
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6328970','4946993','5812165','3539037')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;