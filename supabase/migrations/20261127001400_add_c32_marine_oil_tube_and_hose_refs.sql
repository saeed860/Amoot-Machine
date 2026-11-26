-- C32 Marine oil tubes, hose assemblies and engine-system references.
-- Public Cat Parts Store model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('293-2890','لوله روغن موتور Cat 293-2890','31.62 mm inner-diameter engine oil tube used in the engine oil filter housing to route oil and maintain lubrication circulation. Cat lists C32 MARINE under Marine Engine; other C32/C32B applications are also shown.','موتورهای دریایی - روانکاری - لوله روغن','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify exact oil circuit, serial prefix and arrangement in Cat SIS.','{"component":"Engine Oil Tube","inner_diameter_mm":31.62,"working_pressure_kPa":1000,"minimum_burst_pressure_kPa":4000,"materials":["Alloy Copper","Alloy Mixed Metal"]}'::jsonb),
 ('594-5452','لوله روغن موتور Cat 594-5452','Steel tube for applications where line flexibility is not required. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - روانکاری - لوله فولادی','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify tube routing, connection geometry, serial prefix and arrangement in Cat SIS.','{"component":"Oil Tube Assembly","material":"Carbon Steel"}'::jsonb),
 ('293-2886','فلنج لوله Cat 293-2886','Steel flange component used in tube and fluid-line assemblies. Cat lists C32 MARINE among Marine Engine compatible models; multiple other engine applications are also listed.','موتورهای دریایی - اتصالات و فلنج‌ها','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Confirm the exact assembly position and serial/arrangement in Cat SIS.','{"component":"Flange","materials":["Alloy Steel","Gray Flake Iron","Carbon Steel","Structural Steel"]}'::jsonb),
 ('375-5555','مجموعه درپوش روغن Cat 375-5555','Cat-listed filler group for oil-system service; public model listing includes C32 MARINE and C32B in Marine Engine.','موتورهای دریایی - روانکاری - درپوش و پرکن','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify exact oil filler configuration, serial prefix and arrangement in Cat SIS.','{"component":"Filler Group - Oil"}'::jsonb),
 ('516-6013','اتصال لوله Cat 516-6013','Fluid-line connection fitting with NBR-family rubber material. Cat lists C32 MARINE under Marine Engine and C32 generator/marine auxiliary applications.','موتورهای دریایی - اتصالات و آب‌بندها','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify fitting dimensions, mating parts, serial prefix and arrangement in Cat SIS.','{"component":"Connection Fitting","material":"Nitrile / NBR / HNBR / XNBR Rubber"}'::jsonb),
 ('453-1611','شیلنگ قالبی موتور Cat 453-1611','Molded hose for engine air-intake or fumes-disposal applications. Cat lists C32 MARINE under Marine Engine.','موتورهای دریایی - ورودی هوا - شیلنگ','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify hose routing, diameter, end connections, serial prefix and arrangement in Cat SIS.','{"component":"Molded Hose","material":"Other Hose"}'::jsonb)
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
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('605-7519','600-3447','599-4821','613-6620','557-7650','284-7495','293-2890')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('2932890','5945452','2932886','3755555','5166013','4531611','6057519','6003447','5994821','6136620','5577650','2847495')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;