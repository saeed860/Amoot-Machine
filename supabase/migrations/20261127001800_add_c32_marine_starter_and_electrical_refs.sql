-- C32 Marine starter, electrical control and harness components.
-- Cat Parts Store model listings are references only; serial/arrangement confirmation remains mandatory.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('500-7312','استارت الکتریکی ۲۴ ولت ۹ کیلووات Cat 500-7312','استارتر الکتریکی 24 ولت و 9 کیلووات با فلنج نصب ثابت آلومینیومی، مناسب کاربردهای دریایی و موتورهای سنگین. فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - سیستم استارت - استارتر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Confirm voltage, power, flange, pinion and serial/arrangement in Cat SIS.','{"component":"Electric Starter","voltage_V":24,"power_kW":9,"mounting_flange":"SAE 3 fixed aluminum"}'::jsonb),
 ('461-9463','واحد کنترل Cat 461-9463','واحد کنترل با بدنه استنلس استیل؛ فهرست Cat کاربرد C32 MARINE را در گروه Marine Engine نشان می‌دهد. جزئیات عملکرد و کانکتورها باید با نقشه قطعات و آرایش موتور تطبیق داده شود.','موتورهای دریایی - برق و کنترل - واحد کنترل','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify controller function, connector/pinout and serial/arrangement in Cat SIS before selection.','{"component":"Control Unit","material":"Stainless Steel"}'::jsonb),
 ('203-8987','کلید قطع مدار ۴۰ آمپر Cat 203-8987','کلید قطع مدار آب‌بندی‌شده با جریان نامی 40 آمپر و ولتاژ حداکثر 80 ولت DC یا 240 ولت AC؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - برق - کلید و حفاظت مدار','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify circuit, pole configuration, voltage rating and serial/arrangement in Cat SIS.','{"component":"Circuit Breaker","type":"Sealed Toggle Switch","current_A":40,"voltage_max_DC_V":80,"voltage_max_AC_V":240}'::jsonb),
 ('516-8886','کیت اورهال الکتریکی Cat 516-8886','کیت تعمیر و اورهال شامل مواد آب‌بندی FKM و اجزای فولادی؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد. محتویات دقیق کیت باید از کاتالوگ سریال‌محور تأیید شود.','موتورهای دریایی - برق - کیت تعمیر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Kit contents and exact application require Cat SIS serial/arrangement verification.','{"component":"Electrical Overhaul Kit","materials":["Fluoroelastomer FKM Rubber","Carbon Steel"]}'::jsonb),
 ('297-5486','سوکت کانکتور الکتریکی سه‌پین Cat 297-5486','سوکت کانکتور الکتریکی سه‌پین با سه کلید راهنما برای اتصال ایمن سیم‌کشی؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - برق - کانکتور و سوکت','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify connector keying, mating plug, pinout and harness arrangement in Cat SIS.','{"component":"Electrical Connector Plug","pin_count":3,"key_count":3,"materials":["Polyamide Plastic","Mixed Plastic"]}'::jsonb),
 ('7M-8651','آرمیچر موتور استارت الکتریکی Cat 7M-8651','آرمیچر موتور استارت الکتریکی؛ فهرست Cat کاربرد C32 MARINE را در میان چندین خانواده موتور دریایی نشان می‌دهد. سازگاری با استارتر نصب‌شده باید از طریق شماره مجموعه و سریال تأیید شود.','موتورهای دریایی - سیستم استارت - آرمیچر','Official Cat Parts Store lists C32 MARINE among Marine Engine applications. Confirm starter assembly number, armature revision and serial/arrangement in Cat SIS.','{"component":"Electric Starting Motor Armature"}'::jsonb)
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
 compatible_models=CASE WHEN p.part_number IN ('507-2631','493-7631','374-5344','383-6318') THEN ARRAY['C32 MARINE ENGINE']::text[] ELSE p.compatible_models END,
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('507-2631','493-7631','374-5344','383-6318')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5007312','4619463','2038987','5168886','2975486','7M8651','5072631','4937631','3745344','3836318')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;