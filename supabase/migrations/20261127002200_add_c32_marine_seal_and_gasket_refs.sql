-- C32 Marine seal, gasket and rotating-pump sealing references.
-- Cat Parts Store public model listings are not serial/arrangement approval.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('555-7709','آب‌بند لبه‌دار ۲۸ میلی‌متری پمپ آب دریا Cat 555-7709','آب‌بند لبه‌دار با قطر 28 میلی‌متر برای جلوگیری از نشت در محل تماس شفت پمپ آب دریای کمکی و محفظه یاتاقان؛ دارای ترکیب FKM، فولاد کربنی و پلاستیک.','موتورهای دریایی - پمپ آب دریا - آب‌بند شفت','Official Cat Parts Store lists C32 MARINE under Marine Engine and describes use at the auxiliary seawater pump shaft bearing housing. Verify shaft/bore and serial arrangement in Cat SIS.','{"component":"Lip Type Seal","diameter_mm":28,"materials":["Fluoroelastomer FKM Rubber","Carbon Steel","Plastic"]}'::jsonb),
 ('153-9124','اورینگ پمپ آب دریا Cat 153-9124','اورینگ آب‌بندی پمپ آب دریای کمکی با طول 8 اینچ و ارتفاع 0.2 اینچ؛ برای آب‌بندی محفظه و پروانه و جلوگیری از نشت مایع خنک‌کننده.','موتورهای دریایی - پمپ آب دریا - اورینگ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump housing groove, seal profile and serial/arrangement in Cat SIS.','{"component":"Water Pump O-Ring Seal","length_in":8.0,"height_in":0.2}'::jsonb),
 ('365-4860','آب‌بند یکپارچه خطوط هوای توربوشارژر Cat 365-4860','آب‌بند یکپارچه برای خطوط هوای توربوشارژر با قطر داخلی 0.87 اینچ، قطر خارجی 1.319 اینچ و طول 2.008 اینچ؛ ساختار فولاد و لاستیک.','موتورهای دریایی - توربوشارژر - آب‌بند خطوط هوا','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify turbo air-line joint, seal dimensions and serial/arrangement in Cat SIS.','{"component":"Integral Seal","inside_diameter_in":0.87,"outside_diameter_in":1.319,"length_in":2.008,"materials":["Steel","Rubber","Carbon Steel"]}'::jsonb),
 ('574-9069','آب‌بند میل‌لنگ با قطر خارجی 176.79 میلی‌متر Cat 574-9069','آب‌بند میل‌لنگ با قطر خارجی 176.79 میلی‌متر برای جلوگیری از نشت روغن از محفظه میل‌لنگ و حفظ آب‌بندی مجموعه تایمینگ و محفظه موتور.','موتورهای دریایی - میل‌لنگ - آب‌بند اصلی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify crankshaft seal position, rotation, dimensions and serial/arrangement in Cat SIS.','{"component":"Crankshaft Seal","outer_diameter_mm":176.79,"materials":["Plastic","Carbon Steel","PTFE"]}'::jsonb),
 ('420-3618','واشر الیافی آب‌بندی Cat 420-3618','واشر الیافی برای آب‌بندی سطوح اتصال و جلوگیری از نشت سیال و ورود آلودگی؛ فهرست Cat کاربرد C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - واشرها - واشر الیافی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify mating surfaces, thickness, fluid and temperature duty, and serial/arrangement in Cat SIS.','{"component":"Fiber Gasket"}'::jsonb),
 ('590-7610','اورینگ مخزن سیال اگزوز دیزل Cat 590-7610','آب‌بند حلقوی EPDM برای مخزن سیال اگزوز دیزل با قطر خارجی 3.661 اینچ، قطر داخلی 3.346 اینچ و ضخامت 0.197 اینچ؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - سامانه پس‌پالایش - آب‌بند مخزن DEF','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify DEF tank interface, fluid compatibility and serial/arrangement in Cat SIS.','{"component":"DEF Tank Ring Seal","material":"EPDM","outer_diameter_in":3.661,"inner_diameter_in":3.346,"thickness_in":0.197}'::jsonb)
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
 WHERE p.part_number IN ('220-8710','588-5919')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5557709','1539124','3654860','5749069','4203618','5907610','2208710','5885919')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;