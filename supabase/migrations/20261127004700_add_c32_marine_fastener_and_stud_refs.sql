-- C32 Marine fastener and stud-bolt references.
-- Public Cat model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('161-7419','استادبولت 5/16-18 Cat 161-7419','استادبولت رزوه 5/16-18 برای اتصال و تثبیت اجزای موتور و تجهیزات جانبی؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - استادبولت','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread length, engagement and fastener grade in Cat SIS.','{"component":"Stud Bolt","thread":"5/16-18"}'::jsonb),
 ('9L-9166','استادبولت فولادی گرید 8 با رزوه 3/8-16 Cat 9L-9166','استادبولت فولادی عملیات حرارتی‌شده مطابق SAE J429 Grade 8 با رزوه 3/8-16 در دو سمت برای اتصال سازه‌ای و تحمل بار کششی بالا.','موتورهای دریایی - اتصالات - استادبولت گرید 8','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread engagement, length and clamping application in Cat SIS.','{"component":"Stud Bolt","thread":"3/8-16-2A","material":"Heat Treated Carbon Steel","grade":"SAE J429 Grade 8","minimum_ultimate_strength_MPa":1040}'::jsonb),
 ('6V-7488','پیچ آلن سر استوانه‌ای 10-32 با طول 1/2 اینچ Cat 6V-7488','پیچ آلن فولاد آلیاژی با رزوه 10-32، طول 1/2 اینچ و طول درگیری 1 اینچ؛ کلاس مقاومتی ASTM A574.','موتورهای دریایی - اتصالات - پیچ آلن','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, grip length, head clearance and installation torque in Cat SIS.','{"component":"Hex Socket Head Bolt","thread":"10-32","bolt_length_in":0.5,"grip_length_in":1.0,"grade":"ASTM A574","materials":["Alloy Steel","Alloy Zinc","Alloy Mixed Metal"]}'::jsonb),
 ('5F-4899','پیچ شش‌گوش فولادی با رزوه 3/8-16 Cat 5F-4899','پیچ سرشش‌گوش با رزوه 3/8-16 برای اتصالات سازه‌ای و بست‌های موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - پیچ شش‌گوش','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify length, grade and mounting position in Cat SIS.','{"component":"Hex Head Bolt","thread":"3/8-16"}'::jsonb),
 ('143-9393','استادبولت فولادی گرید 8 با پوشش فسفات روی Cat 143-9393','استادبولت فولادی عملیات حرارتی‌شده مطابق SAE J429 Grade 8 با رزوه 3/8-16 و پوشش فسفات روی و روغن برای مقاومت خوردگی.','موتورهای دریایی - اتصالات - استادبولت گرید 8','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify stud engagement, coating, grade and mating hardware in Cat SIS.','{"component":"Stud Bolt","thread":"3/8-16","grade":"SAE J429 Grade 8","coating":"Zinc Phosphate + Oil","material":"Heat Treated Carbon Steel"}'::jsonb),
 ('334-5375','استادبولت فولادی 3/8-16 با طول 5.28 اینچ Cat 334-5375','استادبولت فولادی با رزوه 3/8-16، طول 5.28 اینچ و آچارخور 9 اینچ برای اتصالات بلند موتور؛ پوشش آلیاژ روی.','موتورهای دریایی - اتصالات - استادبولت بلند','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify stud length, thread engagement and mating assembly in Cat SIS.','{"component":"Stud Bolt","thread":"3/8-16","length_in":5.28,"hex_size_in":9.0,"materials":["Steel","Alloy Zinc","Carbon Steel"]}'::jsonb),
 ('170-0612','استادبولت فولادی گرید 8 با رزوه 3/8-16 Cat 170-0612','استادبولت فولادی عملیات حرارتی‌شده مطابق SAE J429 Grade 8 با رزوه 3/8-16 و پوشش فسفات روی و روغن برای اتصال قطعات موتور.','موتورهای دریایی - اتصالات - استادبولت','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread engagement, grade and fastener stack-up in Cat SIS.','{"component":"Stud Bolt","thread":"3/8-16","grade":"SAE J429 Grade 8","coating":"Zinc Phosphate + Oil","material":"Heat Treated Carbon Steel"}'::jsonb),
 ('7X-0818','پیچ شش‌گوش M8x1.25 با طول 45 میلی‌متر Cat 7X-0818','پیچ سرشش‌گوش متریک با رزوه M8x1.25 و طول 45 میلی‌متر برای اتصالات تجهیزات و مجموعه موتور؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - اتصالات - پیچ متریک','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread pitch, length, grade and mounting point in Cat SIS.','{"component":"Hex Head Bolt","thread":"M8x1.25","length_mm":45}'::jsonb),
 ('8L-4509','پیچ شش‌گوش استنلس‌استیل 5/16-18 با طول 7/8 اینچ Cat 8L-4509','پیچ سرشش‌گوش از فولاد ضدزنگ با رزوه 5/16-18 و طول 7/8 اینچ برای اتصالات مقاوم در برابر خوردگی محیط دریایی.','موتورهای دریایی - اتصالات - پیچ استنلس‌استیل','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, grip length, material grade and installation torque in Cat SIS.','{"component":"Hex Head Bolt","thread":"5/16-18","length_in":0.875,"grip_length_in":0.187,"material":"Stainless Steel","grade":"Austenitic"}'::jsonb)
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
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('1617419','9L9166','6V7488','5F4899','1439393','3345375','1700612','7X0818','8L4509')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;