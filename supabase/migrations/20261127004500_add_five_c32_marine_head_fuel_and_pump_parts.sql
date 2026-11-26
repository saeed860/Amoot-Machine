WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('607-7214','براکت نصب مجموعه سرسیلندر Cat 607-7214','براکت مجموعه سرسیلندر برای نگهداری و تثبیت اجزای کیت بازسازی سرسیلندر؛ صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - سرسیلندر - براکت مجموعه','https://parts.cat.com/en/catcorp/product/607-7214','{"component":"Single Cylinder Head Kit Bracket Assembly","materials":["Alloy Mixed Metal","Carbon Steel","Alloy Steel"]}'::jsonb),
('577-4115','براکت مجموعه سرسیلندر Cat 577-4115','براکت آلومینیومی مربوط به کیت سرسیلندر تک‌سیلندر؛ در اطلاعات Cat، کیت شامل گسکت‌ها و آب‌بندهای بازسازی سرسیلندر و گسکت‌های توربو است، بدون آب‌بند انژکتور.','موتور دریایی - سرسیلندر - براکت کیت','https://parts.cat.com/en/catcorp/product/577-4115','{"component":"Single Cylinder Head Kit Bracket Assembly","material":"Alloy Aluminum","injector_seals_included":false}'::jsonb),
('387-2637','سه‌راهی رابط خطوط سوخت Cat 387-2637','سه‌راهی آداپتور برای انشعاب جریان در خطوط تغذیه سوخت و اتصال مسیرهای فیلتر، پمپ و انژکتور؛ جنس فولاد آلیاژی است.','موتور دریایی - سوخت‌رسانی - سه‌راهی رابط','https://parts.cat.com/en/catcorp/product/387-2637','{"component":"Adapter Tee","material":"Alloy Steel","application":"Fuel Supply Lines"}'::jsonb),
('111-2721','فیلتر نمدی پلاگ پمپ آب Cat 111-2721','فیلتر نمدی پلاگ پمپ آب برای جلوگیری از ورود ذرات به مسیر و اجزای پمپ؛ طول قطعه 0.512 اینچ و فهرست Cat شامل C32 MARINE است.','موتور دریایی - پمپ آب - فیلتر پلاگ','https://parts.cat.com/en/catcorp/product/111-2721','{"component":"Water Pump Felt Plug Filter","length_in":0.512}'::jsonb),
('30R-0607','سرسیلندر بازسازی‌شده Cat Reman C27/C32 - 30R-0607','سرسیلندر بازسازی‌شده Cat Reman با هسته نو (NWC) برای خانواده C27/C32؛ بدنه سرسیلندر روی بلوک موتور نصب شده و محفظه احتراق و محل نصب سوپاپ‌ها و انژکتورها را تشکیل می‌دهد.','موتور دریایی - سرسیلندر - Cat Reman','https://parts.cat.com/en/catcorp/product/30R-0607','{"component":"Cat Reman C27/C32 Cylinder Head","reman_status":"New with Core (NWC)","warranty":"12-month limited warranty subject to terms"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6077214','5774115','3872637','1112721','30R0607')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;