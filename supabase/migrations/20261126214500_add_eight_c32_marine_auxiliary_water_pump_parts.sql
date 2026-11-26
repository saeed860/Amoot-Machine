WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('458-1025','کیت نصب نمایشگر دریایی ۷ اینچ Cat 458-1025','کیت نصب نمایشگر دریایی ۷ اینچ روی پنل پایش الکترونیکی؛ شامل صفحه نصب و اتصالات مهارکننده برای مقاومت در برابر لرزش.','موتور دریایی - نمایشگر و پنل پایش','https://parts.cat.com/en/catcorp/product/458-1025','{"component":"7-inch Marine Display Mounting Kit","material":"Carbon Steel"}'::jsonb),
('322-8595','پروانه ۱۰ پره پمپ آب Cat 322-8595','پروانه ۱۰ پره از لاستیک طبیعی برای گردش سیال خنک‌کننده در مدار پمپ آب؛ صفحه رسمی Cat سازگاری C32 MARINE را در Marine Engine فهرست می‌کند.','موتور دریایی - پمپ آب - پروانه','https://parts.cat.com/en/catcorp/product/322-8595','{"component":"10 Vanes Impeller","material":"Natural Rubber (NR) Rubber","length_in":5.1,"height_in":5.0}'::jsonb),
('650-1952','شیلنگ خطوط آب توربوشارژر Cat 650-1952','شیلنگ خطوط آب توربوشارژر با قطر داخلی 1.5 و قطر خارجی 2.01 اینچ برای انتقال سیال خنک‌کننده؛ فهرست رسمی Cat شامل C32 MARINE است.','موتور دریایی - توربوشارژر - شیلنگ آب','https://parts.cat.com/en/catcorp/product/650-1952','{"component":"Turbocharger Water Lines Hose","inside_diameter_in":1.5,"outside_diameter_in":2.01,"weight_lb":0.68}'::jsonb),
('235-4823','بلبرینگ رولری دو ردیفه ۳۰ میلی‌متری Cat 235-4823','بلبرینگ رولری دو ردیفه با ظرفیت تحمل بار بالاتر از نوع تک‌ردیفه؛ ابعاد طول 3.3 و ارتفاع 1.3 اینچ در صفحه رسمی Cat آمده است.','موتور دریایی - پمپ آب - بلبرینگ','https://parts.cat.com/en/catcorp/product/235-4823','{"component":"Double Roller Ball Bearing","length_in":3.3,"height_in":1.3}'::jsonb),
('235-4824','اسپیسر پمپ آب Cat 235-4824','اسپیسر مجموعه پمپ آب با طول 8 و ارتفاع 1.5 اینچ؛ صفحه رسمی Cat، C32 MARINE را در گروه Marine Engine درج می‌کند.','موتور دریایی - پمپ آب - اسپیسر','https://parts.cat.com/en/catcorp/product/235-4824','{"component":"Water Pump Spacer","length_in":8.0,"height_in":1.5}'::jsonb),
('235-4832','محافظ یاتاقان پمپ آب کمکی Cat 235-4832','محافظ یاتاقان پمپ آب کمکی برای حفاظت از مجموعه یاتاقان؛ طول 4 و ارتفاع 0.1 اینچ طبق مشخصات رسمی Cat.','موتور دریایی - پمپ آب کمکی - محافظ یاتاقان','https://parts.cat.com/en/catcorp/product/235-4832','{"component":"Auxiliary Water Pump Bearing Shield","length_in":4.0,"height_in":0.1}'::jsonb),
('235-4828','رینگ V پمپ آب دریای کمکی Cat 235-4828','رینگ V برای آب‌بندی مجموعه پمپ آب دریای کمکی؛ طول 3.8 و ارتفاع 0.3 اینچ طبق صفحه رسمی Cat.','موتور دریایی - پمپ آب دریا - رینگ آب‌بندی','https://parts.cat.com/en/catcorp/product/235-4828','{"component":"Auxiliary Sea Water Pump Vee Ring","length_in":3.8,"height_in":0.3}'::jsonb),
('155-8750','واشر آب‌بندی دایره‌ای باندشده Cat 155-8750','واشر آب‌بندی دایره‌ای باندشده با ضخامت 3.23 میلی‌متر؛ در فهرست رسمی قطعات مرتبط مجموعه پمپ آب دریایی Cat آمده و سازگاری C32 MARINE در صفحه رسمی Cat درج شده است.','موتور دریایی - پمپ آب - واشر آب‌بندی','https://parts.cat.com/en/catcorp/product/155-8750','{"component":"Circular Bonded Seal Washer","thickness_mm":3.23}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4581025','3228595','6501952','2354823','2354824','2354832','2354828','1558750')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;