-- C32 Marine fuel priming, fuel-line and zinc-anode references.
-- Cat public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('506-0061','شیر یک‌طرفه پمپ پرایمینگ سوخت با رزوه 1-3/16-12 Cat 506-0061','شیر یک‌طرفه فولادی برای جلوگیری از برگشت سوخت در پمپ پرایمینگ و حفظ فشار اولیه مدار سوخت هنگام راه‌اندازی؛ دارای رزوه 1-3/16-12.','موتورهای دریایی - سیستم سوخت - شیر یک‌طرفه پرایمینگ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify valve seat, thread, flow direction and serial/arrangement in Cat SIS.','{"component":"Fuel Priming Pump Check Valve","thread":"1-3/16-12","material":"Carbon Steel"}'::jsonb),
 ('149-4230','زانویی آداپتور خط سوخت Cat 149-4230','زانویی آداپتور برای تغییر جهت و اتصال ایمن خطوط سوخت؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - سیستم سوخت - زانویی خط سوخت','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread form, angle, sealing face and serial/arrangement in Cat SIS.','{"component":"Fuel Line Elbow Adapter"}'::jsonb),
 ('183-2823','پمپ پرایمینگ سوخت آلومینیومی 76.6 سی‌سی Cat 183-2823','پمپ پرایمینگ دستی/مکانیکی با بدنه آلومینیومی برای خارج‌کردن هوا از مدار سوخت و ایجاد فشار اولیه پیش از استارت؛ طول 9.8 اینچ و ارتفاع 1.6 اینچ.','موتورهای دریایی - سیستم سوخت - پمپ پرایمینگ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify displacement, mounting and fuel circuit arrangement in Cat SIS.','{"component":"Fuel Priming Pump","displacement_cc":76.6,"length_in":9.8,"height_in":1.6,"material":"Alloy Aluminum"}'::jsonb),
 ('188-7541','آب‌بند پمپ سوخت Cat 188-7541','آب‌بند پمپ سوخت برای جلوگیری از نشت در محل اتصال و محور پمپ؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - سیستم سوخت - آب‌بند پمپ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump group, seal dimensions, fuel compatibility and serial/arrangement in Cat SIS.','{"component":"Fuel Pump Seal"}'::jsonb),
 ('261-0670','بست نگهدارنده پمپ تزریق سوخت Cat 261-0670','بست فولادی و فولاد آلیاژی برای نگهداری و تثبیت پمپ تزریق سوخت؛ طول 2.9، عرض 1.7 و ارتفاع 1.6 اینچ، مناسب پیچ 3/8 اینچ.','موتورهای دریایی - سیستم سوخت - بست پمپ تزریق','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify injection pump group, bolt size, mounting geometry and serial/arrangement in Cat SIS.','{"component":"Fuel Injection Pump Clamp","length_in":2.9,"width_in":1.7,"height_in":1.6,"bolt_size_in":0.375,"materials":["Steel","Alloy Steel"]}'::jsonb),
 ('377-0775','اورینگ FKM با ابعاد 3.53 × 20.22 میلی‌متر Cat 377-0775','اورینگ FKM با قطر مقطع 3.53 میلی‌متر، قطر داخلی 20.22 میلی‌متر و سختی 75A برای آب‌بندی اتصالات مدارهای سیال.','موتورهای دریایی - آب‌بندها - اورینگ FKM','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify groove, fluid, temperature and serial/arrangement in Cat SIS.','{"component":"O-Ring","cross_section_mm":3.53,"inside_diameter_mm":20.22,"hardness":"75A","material":"FKM Fluorocarbon Rubber"}'::jsonb)
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
 WHERE p.part_number IN ('6L-2280','472-4908','383-1608')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5060061','1494230','1832823','1887541','2610670','3770775','6L2280','4724908','3831608')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;