-- C32 Marine DEF, air-start and shutoff valve references.
-- Cat public model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('584-2473','کیت تعمیر شیر پمپ DEF Cat 584-2473','کیت شیر برای سرویس و تعمیر شیرهای پمپ سیال اگزوز دیزل در واحد کنترل دوزینگ؛ ساخته‌شده از PTFE.','موتورهای دریایی - پس‌پالایش - کیت شیر پمپ DEF','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify dosing unit revision, pump valve type and serial/arrangement in Cat SIS.','{"component":"DEF Pump Valve Kit","material":"PTFE"}'::jsonb),
 ('375-5814','شیر برقی استارتر هوایی Cat 375-5814','شیر برقی استارتر هوایی با کنترل سه‌راهه برای تنظیم و هدایت دقیق هوای فشرده در واحد پنوماتیکی استارت موتور.','موتورهای دریایی - سیستم استارت - شیر برقی هوای استارت','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify starter model, air pressure, porting and serial/arrangement in Cat SIS.','{"component":"Air Start Solenoid Valve","control":"3-way air control"}'::jsonb),
 ('235-3589','شیر قطع‌و‌وصل با رزوه 1-1/16-12 Cat 235-3589','شیر قطع‌و‌وصل با طول 3.58 اینچ و عرض 2.38 اینچ؛ بدنه و اجزای ساخته‌شده از فولاد و آلیاژ مس/برنج.','موتورهای دریایی - شیرآلات - شیر قطع‌و‌وصل','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, flow direction, pressure rating and serial/arrangement in Cat SIS.','{"component":"Shutoff Valve","thread":"1-1/16-12","length_in":3.58,"width_in":2.38,"materials":["Alloy Steel","Alloy Copper","Alloy Brass"]}'::jsonb)
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
 WHERE p.part_number IN ('111-4374','469-6273','465-8142')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5842473','3755814','2353589','1114374','4696273','4658142')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;