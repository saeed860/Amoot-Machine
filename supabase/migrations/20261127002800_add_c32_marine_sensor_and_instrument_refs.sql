-- C32 Marine exhaust temperature, pressure sensing and fuel-line sensor references.
-- Cat public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('592-3073','حسگر دمای ترموکوپل گاز اگزوز Cat 592-3073','حسگر دمای ترموکوپل نوع K برای اندازه‌گیری دمای گاز اگزوز و نواحی ورودی/خروجی توربوشارژر؛ رزوه M14 و کانکتور دوپین AMPSEAL 16.','موتورهای دریایی - ابزار دقیق - حسگر دمای اگزوز','Official Cat Parts Store lists C32 MARINE under Marine Engine. Cat identifies this as an application-specific exhaust-gas sensor; verify location, range and serial/arrangement in Cat SIS.','{"component":"Thermocouple Temperature Sensor","type":"K-type","sensing_media":"Exhaust gas","thread":"M14","connector":"2-pin AMPSEAL 16","accuracy_limit_C":1095}'::jsonb),
 ('147-1174','حسگر دمای مقاومتی RTD Cat 147-1174','حسگر دمای مقاومتی برای پایش دمای هوا، گاز، بخار، آب یا روغن؛ دارای ترموول و اتصال رزوه مستقیم 9/16-18 با کانکتور PG11.','موتورهای دریایی - ابزار دقیق - حسگر RTD','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify process medium, thermowell length, wiring and serial/arrangement in Cat SIS.','{"component":"Resistance Temperature Detector Sensor","thread":"9/16-18 Straight","overall_width_in":5.4,"connector":"PG 11 Plug","material":"Carbon Steel"}'::jsonb),
 ('415-2434','حسگر دمای موتور Cat 415-2434','حسگر دما از فولاد ضدزنگ با طول کلی 50.04 اینچ، رزوه M14x1.5 و کانکتور سه‌پین DT؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - ابزار دقیق - حسگر دما','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify sensor medium, harness length, connector and serial/arrangement in Cat SIS.','{"component":"Temperature Sensor","overall_length_in":50.04,"thread":"M14x1.5","connector":"3-pin DT","material":"Stainless Steel"}'::jsonb),
 ('144-0415','کانکتور حسگر دمای RTD Cat 144-0415','کانکتور الکتریکی برای اتصال حسگر دمای مقاومتی به ورودی تجهیزات پایش یا کنترل؛ کاربرد آن باید با آرایش سیم‌کشی و نوع سنسور مطابقت داده شود.','موتورهای دریایی - برق و ابزار دقیق - کانکتور حسگر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify sensor lead configuration, pinout and mating harness in Cat SIS.','{"component":"Temperature Sensor Connector"}'::jsonb),
 ('377-0264','ترموول حسگر دما با رزوه M12x1.5 Cat 377-0264','غلاف محافظ حسگر دما با رزوه M12x1.5 از فولاد ضدزنگ برای جداسازی حسگر از محیط فرایندی و حفاظت مکانیکی و حرارتی آن.','موتورهای دریایی - ابزار دقیق - ترموول حسگر','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, insertion depth, process connection and sensor match in Cat SIS.','{"component":"Sensor Thermowell","thread":"M12x1.5 STOR","material":"Stainless Steel"}'::jsonb),
 ('163-8512','حسگر فشار Cat 163-8512','حسگر فشار کاربردی با رزوه SAE #4F، کانکتور سه‌پین DT و تغذیه تنظیم‌شده 5 ولت DC؛ بدنه برنج آلیاژی.','موتورهای دریایی - ابزار دقیق - حسگر فشار','Official Cat Parts Store lists C32 MARINE under Marine Engine. Cat identifies pressure sensors as application-specific; verify pressure range, port and harness in Cat SIS.','{"component":"Pressure Sensor","thread":"SAE #4F","connector":"3-pin DT","supply_voltage":"5V DC regulated","material":"Alloy Brass"}'::jsonb)
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
 WHERE p.part_number IN ('419-6811','422-0109','487-0039','641-3134')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5923073','1471174','4152434','1440415','3770264','1638512','4196811','4220109','4870039','6413134')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;