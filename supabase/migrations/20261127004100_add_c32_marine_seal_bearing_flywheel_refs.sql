-- C32 Marine seals, bearings, flywheel and cylinder-head service references.
-- Cat public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('6L-7817','اورینگ EPDM با قطر داخلی 40.64 میلی‌متر Cat 6L-7817','اورینگ EPDM با قطر مقطع 0.21 اینچ، قطر داخلی 1.6 اینچ و سختی 70A؛ مناسب آب، بخار، اوزون و برخی سیالات شیمیایی سازگار.','موتورهای دریایی - آب‌بندها - اورینگ EPDM','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify groove, fluid compatibility, temperature and serial/arrangement in Cat SIS.','{"component":"O-Ring Seal","cross_section_in":0.21,"inside_diameter_in":1.6,"hardness":"70A","material":"EPDM Rubber","compatible_media":["Water","Steam","Ozone","Some dilute acids"]}'::jsonb),
 ('369-4018','چرخ‌دنده ۳۰ دندانه محرک متعلقات موتور Cat 369-4018','چرخ‌دنده محرک متعلقات با 30 دندانه از فولاد آلیاژی کم‌کربن/کم‌آلیاژ برای انتقال توان از موتور به اجزای کمکی؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - محرک متعلقات - چرخ‌دنده','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify gear tooth profile, mating gear and drive arrangement in Cat SIS.','{"component":"Accessory Drive Gear","teeth":30,"material":"Low Alloy Steel"}'::jsonb),
 ('2K-7979','بوش یاتاقانی استوانه‌ای با قطر خارجی 25.4 میلی‌متر Cat 2K-7979','بوش یاتاقانی استوانه‌ای با قطر خارجی 25.4 میلی‌متر برای پشتیبانی محور و کاهش اصطکاک؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - یاتاقان‌ها - بوش یاتاقانی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify bore, length, clearance and shaft/housing arrangement in Cat SIS.','{"component":"Straight Sleeve Bearing","outside_diameter_mm":25.4}'::jsonb),
 ('7W-5648','واشر لاستیکی پمپ آب کمکی Cat 7W-5648','واشر لاستیکی برای آب‌بندی سطوح اتصال پمپ آب کمکی و جلوگیری از نشت و ورود آلودگی؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - پمپ آب کمکی - واشر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump cover, gasket profile and serial/arrangement in Cat SIS.','{"component":"Auxiliary Water Pump Gasket","material":"Rubber Gasket"}'::jsonb),
 ('116-8528','بوش لغزشی مجموعه محرک Cat 116-8528','بوش لغزشی/سایشی برای پشتیبانی حرکت نسبی و کاهش اصطکاک در مجموعه‌های مکانیکی موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - یاتاقان‌ها - بوش لغزشی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify mating shaft, bore, length and assembly position in Cat SIS.','{"component":"Sleeve Bushing"}'::jsonb),
 ('7W-1250','فلایویل موتور Cat 7W-1250','فلایویل از چدن نشکن با طول 28.5 اینچ و ارتفاع 10.5 اینچ برای ذخیره انرژی دورانی، یکنواخت‌سازی سرعت میل‌لنگ و انتقال نرم‌تر توان.','موتورهای دریایی - میل‌لنگ و انتقال قدرت - فلایویل','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify flywheel ring gear, crank flange, inertia and arrangement in Cat SIS.','{"component":"Engine Flywheel","length_in":28.5,"height_in":10.5,"material":"Ductile Spheroidal Iron"}'::jsonb),
 ('608-7513','کیت واشر و آب‌بند سرسیلندر تک‌سیلندر Cat 608-7513','کیت سرویس سرسیلندر تک‌سیلندر شامل واشرها و آب‌بندهای لازم برای بازسازی و نصب مجدد سرسیلندر و واشرهای توربو؛ آب‌بند انژکتور سوخت در کیت نیست.','موتورهای دریایی - سرسیلندر - کیت واشر و آب‌بند','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify cylinder-head revision, turbo gasket set and injector seal requirements in Cat SIS.','{"component":"Single Cylinder Head Kit","materials":["Carbon Steel","Alloy Steel","Alloy Mixed Metal"],"injector_seals_included":false}'::jsonb)
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
 WHERE p.part_number IN ('243-6718')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('6L7817','3694018','2K7979','7W5648','1168528','7W1250','6087513','2436718')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;