-- C32 Marine bearings, water pump and turbocharger service references.
-- Cat public model listings do not certify exact serial/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('556-0415','بلبرینگ تک‌ردیفه Cat 556-0415','بلبرینگ ساچمه‌ای تک‌ردیفه از فولاد آلیاژی برای کاهش اصطکاک بین قطعات جفت‌شونده؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - یاتاقان‌ها - بلبرینگ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Confirm bearing dimensions, load/speed duty and exact shaft/housing arrangement in Cat SIS.','{"component":"Ball Bearing Single Row","material":"Alloy Steel"}'::jsonb),
 ('235-4823','بلبرینگ دو ردیفه ۳۰ میلی‌متری Cat 235-4823','بلبرینگ غلتشی دو ردیفه با قطر 30 میلی‌متر برای تحمل بار بالاتر و چرخش روان؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - یاتاقان‌ها - بلبرینگ دو ردیفه','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify bearing dimensions, race fit and shaft/housing arrangement in Cat SIS.','{"component":"Double Row Roller Ball Bearing","diameter_mm":30,"length_in":3.3,"height_in":1.3}'::jsonb),
 ('541-2494','پمپ آب پایه موتور Cat 541-2494','پمپ آب پایه برای گردش و انتقال آب در مدار خنک‌کاری موتور؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد. نسخه Reman نیز در صفحه Cat معرفی شده و باید با شماره مجموعه و سریال تطبیق داده شود.','موتورهای دریایی - خنک‌کاری - پمپ آب موتور','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump configuration, drive, inlet/outlet and serial/arrangement in Cat SIS.','{"component":"Basic Water Pump"}'::jsonb),
 ('211-6976','یاتاقان ژورنال توربوشارژر Cat 211-6976','یاتاقان ژورنال توربوشارژر برای پشتیبانی از محور دوار و کنترل اصطکاک در مجموعه توربوشارژر؛ فهرست Cat کاربرد C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - توربوشارژر - یاتاقان ژورنال','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify turbocharger group, shaft dimensions and serial/arrangement in Cat SIS.','{"component":"Turbocharger Journal Bearing"}'::jsonb),
 ('3N-3300','کیت تعمیر پمپ واحد روانکاری Cat 3N-3300','کیت تعمیر پمپ واحد روانکاری شامل پره‌ها، فنرها، پکینگ، مهره و واشرها برای سرویس و بازسازی پمپ؛ فهرست Cat کاربرد C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - روانکاری - کیت تعمیر پمپ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify exact lubrication pump model and kit contents against Cat SIS serial/arrangement before selection.','{"component":"Pump Repair Kit","contents":["Vanes","Springs","Packing","Nut","Gaskets"]}'::jsonb)
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
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('153-9121','356-9568','644-1973')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5560415','2354823','5412494','2116976','3N3300','1539121','3569568','6441973')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;