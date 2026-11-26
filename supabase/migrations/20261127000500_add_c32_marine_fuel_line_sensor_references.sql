-- C32 Marine fuel-system detail references.
-- Cat Parts Store public model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('641-3134','براکت نگهدارنده لوله‌های سوخت Cat 641-3134','4 mm fuel-line mounting bracket that secures and protects fuel lines against vibration, movement and contact with adjacent components. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم سوخت - براکت لوله‌ها',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/641-3134','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify serial prefix and arrangement in Cat SIS.','{"component":"Fuel Lines Mounting Bracket","thickness_mm":4}'::jsonb),
 ('456-4323','مجموعه فرستنده سطح سوخت Cat 456-4323','Passive fuel-level sender with sealed column and reed-switch array; variable-resistance output. Cat lists C32 MARINE under Marine Engine. Tank and sender configuration must be checked.','موتورهای دریایی - سیستم سوخت - سنسور سطح سوخت',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/456-4323','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Cat notes level sensors are tank/application specific; verify tank configuration, serial prefix and arrangement.','{"component":"Fuel Level Sender Assembly","resistance_range_ohm":"56-4500","float_range_mm":240,"wire_length_in":9.4,"connector":"3-pin Ampseal","flange_diameter_in":2.7}'::jsonb),
 ('485-4911','مجموعه شیلنگ سوخت Cat 485-4911','High-temperature fuel/oil hose assembly; 0.5 in hose ID and 11.181 in overall length. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم سوخت - شیلنگ انتقال',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/485-4911','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify serial prefix, hose routing and arrangement in Cat SIS.','{"component":"Fuel Hose Assembly","hose_id_in":0.5,"overall_length_in":11.181,"hose_type":"Fuel and Oil High Temperature"}'::jsonb),
 ('555-4065','مجموعه صفحه سیستم سوخت Cat 555-4065','Fuel-system plate assembly. Cat lists C32 MARINE under Marine Engine; the public listing provides limited descriptive and dimensional information.','موتورهای دریایی - سیستم سوخت - مجموعه صفحه',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/555-4065','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Description/specification data is limited; confirm diagram position, serial prefix and arrangement in Cat SIS.','{"component":"Plate Assembly - Fuel System","public_specification":"Limited"}'::jsonb),
 ('419-6811','فیلم محافظ تزریق سوخت Cat 419-6811','Fuel-injection film component listed by Cat for C32 MARINE under Marine Engine. Confirm exact diagram location and function before ordering.','موتورهای دریایی - سیستم تزریق سوخت - فیلم محافظ',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/419-6811','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Product description is limited; verify diagram position, serial prefix and arrangement in Cat SIS.','{"component":"Film-Fuel Injection","material":["PVC","Polyethylene Terephthalate Plastic"]}'::jsonb)
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
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('383-1608','487-0039')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6413134','4564323','4854911','5554065','4196811','3831608','4870039')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;