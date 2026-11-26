-- C32 Marine seawater heat-exchanger elbow and model-category safety corrections.
-- Public Cat model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('605-1231','زانویی مبدل حرارتی آب دریا با قطر داخلی 54 میلی‌متر Cat 605-1231','زانویی مبدل حرارتی آب دریا با قطر داخلی 54 میلی‌متر برای تغییر جهت جریان آب دریا در مدار خنک‌کاری؛ از آلیاژ مس برای مقاومت در محیط دریایی ساخته شده است.','موتورهای دریایی - مبدل حرارتی آب دریا - زانویی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify hose/tube mating diameter, bend orientation, corrosion and serial/arrangement in Cat SIS.','{"component":"Sea Water Heat Exchanger Elbow","inside_diameter_mm":54,"material":"Alloy Copper"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',
 'https://parts.cat.com/en/catcorp/product/'||s.part_number,
 s.source_note||' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 'https://parts.cat.com/en/catcorp/product/'||s.part_number,s.specifications
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
 compatible_models=CASE
 WHEN p.part_number='586-1393' THEN ARRAY['C32 MARINE ENGINE','C32B MARINE ENGINE']::text[]
 WHEN p.part_number='441-0371' THEN ARRAY['C32B MARINE ENGINE','3516C MARINE ENGINE','3516E MARINE ENGINE']::text[]
 ELSE ARRAY['C32 MARINE ENGINE','C32B MARINE ENGINE']::text[] END,
 application_evidence=CASE
 WHEN p.part_number='441-0371' THEN 'Cat Parts Store Marine Engine category lists C32B, 3516C and 3516E; C32 MARINE appears only under generic Engine. Excluded from exact C32 MARINE fitment pending Cat SIS.'
 ELSE 'Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.'
 END,
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store model-category listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('586-1393','441-0371','353-9037')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6051231','5861393','4410371','3539037')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;