-- C32 Marine exhaust, DEF, starting and air-control references.
-- Cat Parts Store public model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('596-8595','بدنه شیر کنترل هوای فشرده Cat 596-8595','بدنه شیر کنترل برای تنظیم جریان هوای فشرده به عملگرها و سیلندرهای پنوماتیکی؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - سامانه هوای فشرده - بدنه شیر کنترل','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify valve group, porting, actuator system and serial/arrangement in Cat SIS.','{"component":"Air Control Valve Body"}'::jsonb),
 ('516-2724','مجموعه انژکتور سیال اگزوز دیزل Cat 516-2724','مجموعه انژکتور سیال اگزوز دیزل برای سامانه کنترل آلایندگی؛ ابعاد کلی 93.2 در 114.5 در 57 میلی‌متر و بدنه آلومینیومی. فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - پس‌پالایش اگزوز - انژکتور DEF','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify emissions configuration, electrical connector, DEF dosing setup and serial/arrangement in Cat SIS.','{"component":"Diesel Exhaust Fluid Injector Assembly","length_mm":93.2,"width_mm":114.5,"height_mm":57,"material":"Alloy Aluminum"}'::jsonb),
 ('541-6607','استارتر پنوماتیکی موتور Cat 541-6607','موتور استارت هوایی با محرک پنوماتیکی، چرخ‌دنده پینیون و مجموعه انتقال نیرو برای چرخاندن میل‌لنگ هنگام راه‌اندازی؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - سیستم استارت - استارتر هوایی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify air pressure, pinion/flywheel interface and exact starter arrangement in Cat SIS.','{"component":"Air Starting Motor","material":"Carbon Steel"}'::jsonb),
 ('451-2253','پیچ استاد اتصال خطوط کولر تهویه Cat 451-2253','پیچ استاد فولادی برای مهار خطوط کولر تهویه و جلوگیری از حرکت اتصالات در اثر ارتعاش؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - تهویه مطبوع - اتصالات خطوط','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, line clamp and installation position against Cat SIS serial/arrangement.','{"component":"Air Conditioner Lines Bolt Stud","materials":["Carbon Steel","Alloy Zinc"]}'::jsonb)
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
 WHERE p.part_number IN ('575-5613','588-6302','596-9253','586-5323','494-6993','505-0160','491-6779')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5968595','5162724','5416607','4512253','5755613','5886302','5969253','5865323','4946993','5050160','4916779')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;