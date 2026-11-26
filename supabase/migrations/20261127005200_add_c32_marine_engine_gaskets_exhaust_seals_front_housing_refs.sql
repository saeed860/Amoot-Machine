-- C32 Marine engine gasket, exhaust seal and housing references.
-- Public Cat model listings are not serial/arrangement confirmation; all new references remain inactive.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('7N-2491','گسکت لاستیک و الیاف پایه آداپتور پمپ هیدرولیک Cat 7N-2491','گسکت از ترکیب لاستیک و الیاف برای آب‌بندی اتصال پایه آداپتور پمپ؛ فهرست رسمی Cat مدل C32 MARINE را نیز نشان می‌دهد. محل نصب باید با نقشه قطعات تأیید شود.','موتورهای دریایی - آب‌بندها - گسکت آداپتور','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify exact joint and arrangement in Cat SIS.','{"component":"Hydraulic Pump Adapter Mounting Gasket","materials":["Rubber and Cork","Rubber and Fiber Gasket"]}'::jsonb),
 ('6N-3732','زانویی چدنی خطوط سیال Cat 6N-3732','زانویی چدنی برای اتصال مسیرهای سیال؛ فهرست عمومی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد. زاویه، قطر و محل نصب باید از روی نقشه قطعات بررسی شود.','موتورهای دریایی - خطوط سیال - زانویی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify bore, flange and exact application in Cat SIS.','{"component":"Elbow","material":"Gray Cast Iron"}'::jsonb),
 ('436-2542','آب‌بند توری فلزی منیفولد اگزوز Cat 436-2542','آب‌بند توری فلزی برای ایجاد اتصال هوابند میان اجزای سامانه اگزوز و کاهش نشت گاز و لرزش؛ مواد اعلام‌شده شامل فولاد ضدزنگ و گسکت فولاد/گرافیت است.','موتورهای دریایی - اگزوز - آب‌بند توری فلزی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify joint geometry and exhaust arrangement in Cat SIS.','{"component":"Exhaust Knitted Wire Seal","materials":["Stainless Steel","Steel and Graphite Gasket","Other Gasket"]}'::jsonb),
 ('350-1638','پوسته جلویی موتور Cat 350-1638','پوسته جلویی موتور برای پشتیبانی سازه‌ای و هم‌راستاسازی اجزای جلوی بلوک موتور و محل نصب متعلقات؛ در کاتالوگ Cat برای C32 MARINE فهرست شده است.','موتورهای دریایی - بلوک موتور - پوسته جلویی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify engine arrangement, accessory mounts and serial range in Cat SIS.','{"component":"Engine Front Housing"}'::jsonb),
 ('222-6456','آب‌بند FKM از نوع Press-in-Place Cat 222-6456','آب‌بند سفارشی FKM از نوع Press-in-Place با مقطع 0.29 × 0.16 اینچ برای نگهداری در شیار و جلوگیری از نشتی و آلودگی در اتصالات ثابت.','موتورهای دریایی - آب‌بندها - آب‌بند PIP','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify groove, fluid compatibility and exact application in Cat SIS.','{"component":"Press-in-Place Seal","cross_section_height_in":0.29,"cross_section_width_in":0.16,"material":"FKM Fluoroelastomer","temperature_range_C":[-40,150]}'::jsonb),
 ('239-1139','آب‌بند FKM فشاری با قطر داخلی 266.40 میلی‌متر Cat 239-1139','آب‌بند FKM از نوع Press-in-Place با قطر داخلی 10.5 اینچ، ارتفاع مقطع 0.29 اینچ و عرض مقطع 0.16 اینچ؛ برای آب‌بندی اتصالات ثابت و جلوگیری از آلودگی.','موتورهای دریایی - آب‌بندها - آب‌بند PIP','Official Cat Parts Store lists C32 MARINE under Marine Engine. FKM is not suitable for water/coolant; verify the exact oil/fuel joint in Cat SIS.','{"component":"Press-in-Place Seal","inside_diameter_in":10.5,"cross_section_height_in":0.29,"cross_section_width_in":0.16,"material":"FKM Fluoroelastomer","temperature_range_C":[-40,150],"not_suitable_for":["Water","Coolant"]}'::jsonb)
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
)
SELECT count(*) AS references_upserted FROM upserted;