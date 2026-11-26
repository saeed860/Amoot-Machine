-- C32 Marine pressure sensors, oil hose and wiring connector references.
-- Public Cat model association is not serial/arrangement confirmation; all records remain inactive.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('349-7375','سنسور فشار پایین با اتصال 3 پین Ampseal Cat 349-7375','سنسور فشار پایین با رزوه M12، کانکتور سه‌پین Ampseal و تغذیه 5 ولت DC تنظیم‌شده؛ در فهرست عمومی Cat برای C32 MARINE درج شده است. بازه فشار و نقطه نصب باید از Cat SIS تأیید شود.','موتورهای دریایی - برق و الکترونیک - سنسور فشار','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pressure range and exact port/application in Cat SIS.','{"component":"Low Pressure Sensor","thread":"M12","connector":"3 Pin Ampseal","supply_voltage":"5 VDC regulated","material":"Alloy Brass"}'::jsonb),
 ('641-2996','سنسور فشار استنلس‌استیل Cat 641-2996','سنسور فشار برای پایش فشار هیدرواستاتیک در سامانه‌های سیال و محیط آب دریا؛ در کاتالوگ عمومی Cat برای C32 MARINE درج شده است. مشخصات فشار و اتصال در داده عمومی کامل نیست.','موتورهای دریایی - برق و الکترونیک - سنسور فشار آب دریا','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify range, connector, port and serial/arrangement in Cat SIS.','{"component":"Pressure Sensor","materials":["Stainless Steel","Mixed Metal"],"application":"Seawater fluid-system pressure monitoring"}'::jsonb),
 ('549-4821','مجموعه شیلنگ روغن با قطر داخلی 10.31 میلی‌متر Cat 549-4821','مجموعه شیلنگ روغن با قطر داخلی 0.406 اینچ و طول کلی 21.654 اینچ؛ شیلنگ مخصوص سوخت و روغن با دمای کاری بالا و تقویت/اتصالات فلزی.','موتورهای دریایی - روانکاری - شیلنگ روغن','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify routing, pressure rating, end fittings and serial/arrangement in Cat SIS.','{"component":"Oil Hose Assembly","inside_diameter_in":0.406,"overall_length_in":21.654,"hose_type":"Fuel and Oil High Temperature","materials":["Other Hose","Carbon Steel"]}'::jsonb),
 ('416-7159','کانکتور دسته‌سیم از پلی‌آمید 66 Cat 416-7159','کانکتور دسته‌سیم از پلی‌آمید 66 برای ایجاد اتصال الکتریکی مطمئن و کاهش مقاومت تماس؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد. تعداد پین و کلیدگذاری کانکتور باید بررسی شود.','موتورهای دریایی - برق و الکترونیک - کانکتور دسته‌سیم','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pin count, keying and mating harness in Cat SIS.','{"component":"Wiring Harness Connector","material":"Nylon 6,6 / 6,12"}'::jsonb),
 ('398-5399','سنسور فشار راتیومتریک سه‌پین با رزوه M14 Cat 398-5399','سنسور فشار راتیومتریک با رزوه M14، کانکتور سه‌پین Ampseal و تغذیه 5 ولت DC تنظیم‌شده؛ کاتالوگ Cat آن را برای C32 MARINE در Marine Engine فهرست می‌کند.','موتورهای دریایی - برق و الکترونیک - سنسور فشار راتیومتریک','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify sensing range, port and serial/arrangement in Cat SIS.','{"component":"Ratiometric Pressure Sensor","thread":"M14","connector":"3 Pin Ampseal","supply_voltage":"5 VDC regulated","material":"Alloy Copper"}'::jsonb)
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
), deactivated AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('3497375','6412996','5494821','4167159','3985399')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM deactivated) AS exact_sku_products_deactivated;