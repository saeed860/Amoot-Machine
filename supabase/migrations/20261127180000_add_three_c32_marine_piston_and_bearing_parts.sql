WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('211-6973','رینگ آب‌بندی پیستون توربوشارژر Cat 211-6973','رینگ آب‌بندی پیستون توربوشارژر برای جلوگیری از نشت گاز و روغن در بخش متحرک توربوشارژر؛ صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine درج می‌کند.','موتور دریایی - توربوشارژر - رینگ آب‌بندی','https://parts.cat.com/en/catcorp/product/211-6973','{"component":"Turbocharger Piston Seal Ring"}'::jsonb),
('524-5565','گژن‌پین پیستون با قطر ۵۹.۹۷۵ میلی‌متر Cat 524-5565','گژن‌پین فولادی برای اتصال پیستون به شاتون و انتقال نیروی احتراق؛ قطر اسمی 59.975 میلی‌متر و طراحی‌شده برای بارهای تناوبی و دمای بالای موتور.','موتور دریایی - مجموعه پیستون و شاتون - گژن‌پین','https://parts.cat.com/en/catcorp/product/524-5565','{"component":"Piston Pin","diameter_mm":59.975,"material":"Steel"}'::jsonb),
('341-0060','یاتاقان شاتون با قطر خارجی ۱۰۴.۹۰ میلی‌متر Cat 341-0060','یاتاقان شاتون برای ایجاد سطح تماس کم‌اصطکاک میان شاتون و میل‌لنگ؛ لایه پشتی فولادی و سطح یاتاقانی مس-سرب، با طول 4.6 و ارتفاع 2.3 اینچ.','موتور دریایی - میل‌لنگ و شاتون - یاتاقان','https://parts.cat.com/en/catcorp/product/341-0060','{"component":"Connecting Rod Bearing","outside_diameter_mm":104.90,"length_in":4.6,"height_in":2.3,"material":"Steel Backed Copper-Lead Bearing"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('2116973','5245565','3410060')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;