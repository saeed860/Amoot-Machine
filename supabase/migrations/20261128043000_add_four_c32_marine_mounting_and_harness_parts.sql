WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('466-9293','پایه لرزه‌گیر پنل کنترل ۱/۴ اینچ Cat 466-9293','پایه ایزولاتور پنل کنترل برای کاهش انتقال لرزش، ضربه و صدا به پنل الکترونیکی؛ نوع ساندویچی با دو استاد رزوه‌دار، رزوه 1/4 اینچ، طول لاستیک 0.37 و قطر خارجی 0.75 اینچ.','موتور دریایی - پنل کنترل - پایه لرزه‌گیر','https://parts.cat.com/en/catcorp/product/466-9293','{"component":"Control Panel Isolator Mount","mount_type":"Sandwich - Threaded Stud Both Ends","stud_thread_size_in":0.25,"stud_thread_pitch":20,"rubber_length_in":0.37,"stud_length_in":0.41,"outside_diameter_in":0.75,"material":"Carbon Steel"}'::jsonb),
('450-0998','اسپیسر سخت گرد پایه موتور با ضخامت ۱۲ میلی‌متر Cat 450-0998','اسپیسر فولادی سخت برای ایجاد فاصله دقیق در محل نصب و حفظ هم‌راستایی مجموعه موتور؛ قطر داخلی 0.531، قطر خارجی 0.984 و ضخامت 0.472 اینچ و پوشش روی.','موتور دریایی - نصب موتور - اسپیسر پایه','https://parts.cat.com/en/catcorp/product/450-0998','{"component":"Engine Support Round Hard Spacer","inside_diameter_in":0.531,"outside_diameter_in":0.984,"thickness_in":0.472,"materials":["Steel","Alloy Zinc","Low Alloy Steel"],"coating":"Zinc"}'::jsonb),
('635-0872','براکت نصب دسته‌سیم انژکتور واحدی Cat 635-0872','براکت فولادی برای پشتیبانی و محافظت از دسته‌سیم انژکتورها و جلوگیری از جابه‌جایی، تماس و آسیب سیم‌کشی در شرایط لرزش و بار عملیاتی موتور.','موتور دریایی - سوخت‌رسانی و برق - براکت دسته‌سیم انژکتور','https://parts.cat.com/en/catcorp/product/635-0872','{"component":"Unit Injector Harness Mounting Bracket","materials":["Carbon Steel","Alloy Zinc"]}'::jsonb),
('310-8570','براکت نصب دسته‌سیم با ضخامت ۳ میلی‌متر Cat 310-8570','براکت فولادی برای مهار و هدایت دسته‌سیم و جلوگیری از تماس آن با اجزای متحرک یا سطوح ساینده؛ ضخامت 3 میلی‌متر و فهرست رسمی Cat شامل C32 MARINE است.','برق موتور دریایی - دسته‌سیم - براکت نصب','https://parts.cat.com/en/catcorp/product/310-8570','{"component":"Wiring Harness Mounting Bracket","thickness_mm":3,"materials":["Carbon Steel","Steel"]}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public compatible-model listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment not verified.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
 s.source_url,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET name=EXCLUDED.name,description=EXCLUDED.description,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=EXCLUDED.source_note,verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_accessed_at=now(),compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications
 RETURNING part_number
), product_safety AS (
 UPDATE public.products p SET status='INACTIVE'
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4669293','4500998','6350872','3108570')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;