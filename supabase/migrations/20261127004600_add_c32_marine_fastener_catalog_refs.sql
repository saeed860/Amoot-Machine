-- C32 Marine genuine Cat fastener references.
-- Public Cat model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('103-1107','پیچ ماشینی سرگرد شیاردار شماره 6 با طول 7/8 اینچ Cat 103-1107','پیچ ماشینی سرگرد شیاردار با رزوه شماره 6-32 و طول 7/8 اینچ، پوشش روی و فولاد کربنی برای اتصالات سبک و پوشش‌ها.','موتورهای دریایی - اتصالات - پیچ ماشینی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, head clearance and exact panel/cover location in Cat SIS.','{"component":"Machine Screw","head_type":"Rounded Pan","thread":"#6-32","bolt_length_in":0.875,"coating":"Zinc","materials":["Steel","Carbon Steel","Alloy Zinc"]}'::jsonb),
 ('2P-1279','مهره شش‌گوش قفلی نازک با رزوه 9/16-18 Cat 2P-1279','مهره شش‌گوش نازک با رزوه 9/16-18 برای تثبیت اتصالات و جلوگیری از شل‌شدن مجموعه‌های موتور؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - اتصالات - مهره قفلی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread pitch, grade and mating fastener in Cat SIS.','{"component":"Hex Jam Nut","thread":"9/16-18"}'::jsonb),
 ('8T-2501','پیچ شش‌گوش 3/8-16 با طول 2 اینچ Cat 8T-2501','پیچ سرشش‌گوش فولادی با رزوه 3/8-16 و طول 2 اینچ برای اتصالات سازه‌ای و اجزای موتور.','موتورهای دریایی - اتصالات - پیچ شش‌گوش','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, grip length, grade and mounting point in Cat SIS.','{"component":"Hex Head Bolt","thread":"3/8-16","length_in":2.0}'::jsonb),
 ('6V-2480','پیچ ماشینی سرگرد شیاردار شماره 4 با طول 1/2 اینچ Cat 6V-2480','پیچ ماشینی سرگرد شیاردار با رزوه شماره 4-40 و طول 1/2 اینچ برای تثبیت پوشش‌ها و اجزای سبک؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - اتصالات - پیچ ماشینی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, head clearance and exact panel/cover location in Cat SIS.','{"component":"Machine Screw","head_type":"Rounded Pan","thread":"#4-40","length_in":0.5}'::jsonb),
 ('8T-9371','پیچ شش‌گوش 3/8-16 با طول 1/2 اینچ Cat 8T-9371','پیچ سرشش‌گوش با رزوه 3/8-16 و طول 1/2 اینچ برای اتصالات و نگهداری اجزای موتور.','موتورهای دریایی - اتصالات - پیچ شش‌گوش','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, grade, grip length and mounting point in Cat SIS.','{"component":"Hex Head Bolt","thread":"3/8-16","length_in":0.5}'::jsonb),
 ('5S-7379','پیچ شش‌گوش 3/8-16 با طول 7/8 اینچ Cat 5S-7379','پیچ سرشش‌گوش با رزوه 3/8-16 و طول 7/8 اینچ برای اتصالات سازه‌ای و بست‌های موتور.','موتورهای دریایی - اتصالات - پیچ شش‌گوش','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, grade, grip length and mounting point in Cat SIS.','{"component":"Hex Head Bolt","thread":"3/8-16","length_in":0.875}'::jsonb),
 ('5B-0213','پیچ شش‌گوش 3/8-16 با طول 2-3/8 اینچ Cat 5B-0213','پیچ سرشش‌گوش بلند با رزوه 3/8-16 و طول 2-3/8 اینچ برای اتصال اجزای موتور و سازه‌های نگهدارنده.','موتورهای دریایی - اتصالات - پیچ شش‌گوش بلند','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, grade, grip length and mounting point in Cat SIS.','{"component":"Hex Head Bolt","thread":"3/8-16","length_in":2.375}'::jsonb),
 ('0S-1571','پیچ درپوش شش‌گوش Cat 0S-1571','پیچ درپوش سرشش‌گوش برای اتصال قطعات موتور و سازه‌های متعلقه؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - پیچ درپوش','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, length, grade and installation location in Cat SIS.','{"component":"Cap Screw"}'::jsonb)
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
 WHERE p.part_number IN ('1D-4538','0T-0573')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('1031107','2P1279','8T2501','6V2480','8T9371','5S7379','5B0213','0S1571','1D4538','0T0573')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;