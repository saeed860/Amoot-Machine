WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('586-1027','براکت نصب حسگر موتور با ضخامت ۶ میلی‌متر Cat 586-1027','براکت فولادی برای نگهداری و تثبیت حسگر در موقعیت صحیح و کمک به جمع‌آوری دقیق داده‌های پایش؛ صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - پایش و کنترل - براکت حسگر','https://parts.cat.com/en/catcorp/product/586-1027','{"component":"Engine Sensor Mounting Bracket","thickness_mm":6,"material":"Carbon Steel"}'::jsonb),
('243-3384','براکت نصب فیلتر روغن موتور Cat 243-3384','براکت فولاد کربنی برای ایجاد نقطه نصب پایدار فیلتر روغن و مهار آن در برابر وزن، لرزش و تنش‌های عملیاتی؛ C32 MARINE در فهرست Marine Engine درج شده است.','موتور دریایی - روغن‌کاری - براکت فیلتر روغن','https://parts.cat.com/en/catcorp/product/243-3384','{"component":"Engine Oil Filter Mounting Bracket","material":"Carbon Steel"}'::jsonb),
('116-1979','بدنه شیر اطمینان فشار روغن Cat 116-1979','بدنه شیر اطمینان فشار روغن برای کنترل و محدودسازی فشار مدار روغن‌کاری؛ در صورت افزایش فشار از حد طراحی، مسیر تخلیه را فراهم می‌کند. صفحه رسمی Cat، C32 MARINE را در گروه Marine Engine و Engine درج کرده است.','موتور دریایی - روغن‌کاری - بدنه شیر اطمینان فشار','https://parts.cat.com/en/catcorp/product/116-1979','{"component":"Oil Pressure Relief Valve Body","function":"Lubrication system pressure regulation"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public compatible-model listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment not verified.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5861027','2433384','1161979')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;