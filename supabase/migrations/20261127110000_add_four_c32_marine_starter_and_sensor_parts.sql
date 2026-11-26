WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('570-1261','حسگر اکسید نیتروژن اگزوز ۲۴ ولت Cat 570-1261','حسگر NOx برای پایش غلظت اکسیدهای نیتروژن در گاز خروجی؛ تغذیه 24 ولت، خروجی شبکه CAN/J1939، کانکتور شش‌پین Ampseal 16 و محدوده دمای کاری منفی 40 تا مثبت 110 درجه سانتی‌گراد.','موتور دریایی - پس‌پالایش اگزوز - حسگر NOx','https://parts.cat.com/en/catcorp/product/570-1261','{"component":"Nitrogen Oxide Exhaust Sensor","sensor_type":"NOx","supply_voltage_v":24,"connector":"6-pin Ampseal 16","thread":"M20","wire_length_in":36,"operating_temperature_c":[-40,110],"network":"CAN J1939"}'::jsonb),
('636-7153','پولی آلترناتور ۸ شیار Cat 636-7153','پولی هشت‌شیار برای انتقال نیروی مکانیکی موتور به آلترناتور و چرخاندن روتور؛ از فولاد کربنی و پوشش فلز روی ساخته شده و برای کاهش لغزش و سایش تسمه طراحی شده است.','موتور دریایی - برق - پولی آلترناتور','https://parts.cat.com/en/catcorp/product/636-7153','{"component":"Alternator Pulley","grooves":8,"materials":["Carbon Steel","Alloy Zinc"]}'::jsonb),
('202-2708','دیود آلترناتور Cat 202-2708','دیود آلترناتور برای یکسوسازی جریان و کنترل مسیر عبور جریان در مدار شارژ؛ ابعاد کلی طول 2.88، عرض 2.86 و ارتفاع 0.56 اینچ است.','موتور دریایی - برق - دیود آلترناتور','https://parts.cat.com/en/catcorp/product/202-2708','{"component":"Alternator Diode","overall_length_in":2.88,"overall_width_in":2.86,"overall_height_in":0.56}'::jsonb),
('2V-7397','کابل باتری دو سر با قطبیت دوگانه Cat 2V-7397','کابل باتری با انتهای دوگانه برای اتصال مطمئن باتری به مدار استارت و برق موتور؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine درج می‌کند.','موتور دریایی - برق و استارت - کابل باتری','https://parts.cat.com/en/catcorp/product/2V-7397','{"component":"Dual Polarity End Battery Cable","application":"Battery and starting circuit"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public listing explicitly includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5701261','6367153','2022708','2V7397')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;