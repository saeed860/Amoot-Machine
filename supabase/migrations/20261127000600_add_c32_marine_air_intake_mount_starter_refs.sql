-- C32 Marine intake, engine mounting and starter-service references.
-- Cat public fitment listings are discovery evidence only; no exact SIS fitment asserted.
WITH src(part_number,name,description,technical_group,models,source_url,source_note,specifications) AS (
 VALUES
 ('465-8142','کیت سرویس استارتر هوایی Cat 465-8142','Air starter motor service kit containing valve and electronics replacement components, O-rings, controller, screws and thread-locking compound. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - سیستم استارت - کیت سرویس استارتر هوایی',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/465-8142','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm the installed air-starter model and kit contents, then verify serial prefix and arrangement in Cat SIS.','{"component":"Air Starter Motor Service Kit","kit_contents":["O-ring","Controller","Screws","Thread-locking compound"]}'::jsonb),
 ('503-8325','مجموعه کارتریج Cat 503-8325','Cat lists this cartridge group for C32 MARINE and C32 under Marine Engine. The public listing provides limited descriptive detail; identify the parent assembly and diagram position before ordering.','موتورهای دریایی - مجموعه‌های موتور - کارتریج',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/503-8325','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Generic part title; verify parent assembly, diagram position, serial prefix and arrangement in Cat SIS.','{"component":"Cartridge Group","material":"Ductile (Spheroidal) Iron","public_specification":"Limited"}'::jsonb),
 ('592-8620','کاور محافظ محفظه موتور Cat 592-8620','Engine enclosure protective cover shielding engine components from dirt, dust, debris and water. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - محفظه موتور - کاور محافظ',ARRAY['C32 MARINE ENGINE']::text[],'https://parts.cat.com/en/catcorp/product/592-8620','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify enclosure configuration, serial prefix and arrangement in Cat SIS.','{"component":"Engine Enclosure Protective Cover","materials":["Structural Steel","Alloy Zinc","Acrylic Adhesive"],"insert_torque_Nm":31}'::jsonb)
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
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('384-7484','384-7486','494-6995')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4658142','5038325','5928620','3847484','3847486','4946995')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;