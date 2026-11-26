-- C32 Marine switch, pressure sensor and wiring jumper references.
-- Cat public model association is not serial/arrangement confirmation; all records remain inactive.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('541-2061','کلید الکتریکی بدنه پلی‌ایمیدی Cat 541-2061','کلید الکتریکی با بدنه پلی‌ایمیدی؛ در کاتالوگ عمومی Cat در گروه Marine Engine برای C32 MARINE فهرست شده است. نوع عملکرد و محل نصب باید با نقشه قطعات و شماره سریال موتور تطبیق داده شود.','موتورهای دریایی - برق و الکترونیک - کلیدها','Official Cat Parts Store lists C32 MARINE under Marine Engine. Switch function and exact installation point require Cat SIS verification.','{"component":"Electrical Switch","material":"Polyimide Plastic"}'::jsonb),
 ('308-6688','دسته‌سیم جامپر سنسور انتقال قدرت Cat 308-6688','دسته‌سیم جامپر برای اتصال سیگنال حسگرهای فشار و دمای انتقال قدرت به سامانه کنترل؛ فهرست عمومی Cat مدل C32 MARINE را نیز نشان می‌دهد. کاربرد دقیق روی پیکربندی موتور باید بررسی شود.','موتورهای دریایی - برق و الکترونیک - دسته‌سیم سنسورها','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify engine-side use, connectors and serial/arrangement in Cat SIS.','{"component":"Transmission Sensor Jumper Wiring Harness","functions":["Pressure signal","Temperature signal"]}'::jsonb),
 ('163-8512','سنسور فشار با اتصال 3 پین DT Cat 163-8512','سنسور فشار با رزوه اتصال SAE #4F، کانکتور سه‌پین DT و تغذیه 5 ولت DC تنظیم‌شده؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد. فشار اندازه‌گیری‌شده و محل نصب باید از روی SIS تأیید شود.','موتورهای دریایی - برق و الکترونیک - سنسور فشار','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pressure range, port and exact serial/arrangement fitment in Cat SIS.','{"component":"Pressure Sensor","thread":"SAE #4F","connector":"3 Pin DT","supply_voltage":"5 VDC regulated","material":"Alloy Brass"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5412061','3086688','1638512')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM deactivated) AS exact_sku_products_deactivated;