-- C32 Marine tube, filler, breather and electronic control references.
-- Cat Parts Store model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('516-5979','مجموعه لوله فولادی Cat 516-5979','مجموعه لوله فولادی صلب برای انتقال سیال یا هوا در مدار موتور؛ فهرست Cat کاربرد C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - لوله‌ها - مجموعه لوله فولادی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify tube routing, connection ends, dimensions and serial/arrangement in Cat SIS.','{"component":"Steel Tube Assembly","material":"Carbon Steel"}'::jsonb),
 ('123-1373','مجموعه درپوش و پلاگ پرکن Cat 123-1373','مجموعه پلاگ پرکن برای دهانه سرویس و پرکردن؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد. نوع سیال و محل نصب باید از نقشه سریال‌محور تأیید شود.','موتورهای دریایی - سرویس و پرکن - پلاگ و درپوش','Official Cat Parts Store lists C32 MARINE under Marine Engine among numerous equipment families. Confirm filler location, thread and fluid system in Cat SIS.','{"component":"Plug Assembly - Filler"}'::jsonb),
 ('484-1994','مجموعه فیلتر تهویه کارتل Cat 484-1994','مجموعه فیلتر تهویه کارتل برای جداسازی گازهای عبوری و حذف روغن و آلاینده‌ها؛ ابعاد کلی حدود 7.248 اینچ عرض و ارتفاع و 6.65 اینچ عمق.','موتورهای دریایی - تهویه کارتل - فیلتر بخارات روغن','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify crankcase ventilation arrangement, mounting and service interval in Cat SIS.','{"component":"Crankcase Breather Filter Assembly","shape":"Round","width_in":7.248,"height_in":7.248,"depth_in":6.65,"materials":["Carbon Steel","Polyester Plastic"]}'::jsonb),
 ('586-5297','واحد کنترل الکترونیکی موتور Cat 586-5297','واحد کنترل الکترونیکی موتور برای مدیریت عملکرد و توان خروجی؛ بدنه آلومینیومی و فهرست Cat شامل مدل C32 MARINE در گروه Marine Engine است.','موتورهای دریایی - برق و کنترل - کنترل الکترونیکی موتور','Official Cat Parts Store lists C32 MARINE under Marine Engine, with C32B also shown. Verify ECM part revision, flash file, connectors and serial/arrangement in Cat SIS.','{"component":"Engine Electronic Control","material":"Alloy Aluminum"}'::jsonb),
 ('539-4559','مجموعه خط ترکیبی شیلنگ و لوله Cat 539-4559','مجموعه خط ترکیبی شامل بخش شیلنگ هیدرولیک تقویت‌شده و بخش لوله صلب برای هدایت سیال یا گاز؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - خطوط سیال - مجموعه خط ترکیبی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify exact route, pressure rating, fitting ends and serial/arrangement in Cat SIS.','{"component":"Hybrid Line Assembly","materials":["Low Pressure Hose","Alloy Copper","Other Hose","Carbon Steel"]}'::jsonb)
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
 WHERE p.part_number IN ('575-5613','588-6302','596-8595','516-2724','541-6607','451-2253')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5165979','1231373','4841994','5865297','5394559','5755613','5886302','5968595','5162724','5416607','4512253')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;