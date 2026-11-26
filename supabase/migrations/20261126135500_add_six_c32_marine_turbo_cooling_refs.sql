WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('457-1546','مجموعه صفحه Cat 457-1546','مجموعه صفحه فلزی با متریال فلز آلیاژی و فولاد زنگ‌نزن؛ در فهرست رسمی Cat برای C32 MARINE در گروه Marine Engine درج شده است.','موتور دریایی - سازه و اتصالات - مجموعه صفحه','https://parts.cat.com/en/catcorp/product/457-1546','{"component":"Plate Assembly","materials":["Alloy Mixed Metal","Stainless Steel"]}'::jsonb),
('628-0362','توربوشارژر موتور Cat 628-0362','مجموعه توربوشارژر برای افزایش چگالی هوای ورودی و توان موتور؛ Cat آن را برای C32 MARINE در گروه Marine Engine فهرست کرده است.','موتور دریایی - هوارسانی - توربوشارژر','https://parts.cat.com/en/catcorp/628-0362','{"component":"Engine Turbocharger"}'::jsonb),
('600-3447','پوسته توربوشارژر Cat 600-3447','پوسته محافظ توربوشارژر که چرخ توربین و کمپرسور را دربر می‌گیرد؛ جنس اعلام‌شده چدن داکتیل است.','موتور دریایی - هوارسانی - پوسته توربوشارژر','https://parts.cat.com/en/catcorp/product/600-3447','{"component":"Turbocharger Housing","material":"Ductile (Spheroidal) Iron"}'::jsonb),
('418-9136','شیلنگ خنک‌کننده چندخم Cat 418-9136','شیلنگ خنک‌کننده EPDM با قطر داخلی 1.5 اینچ برای عبور مایع خنک‌کننده در مدار خنک‌کاری؛ Cat مدل C32 MARINE را صریحاً درج کرده است.','موتور دریایی - سیستم خنک‌کاری - شیلنگ','https://parts.cat.com/en/catcorp/product/418-9136','{"component":"Coolant Hose","inside_diameter_in":1.5,"material":"EPDM"}'::jsonb),
('593-2261','زانویی خطوط آب Cat 593-2261','زانویی خطوط آب برای هدایت جریان خنک‌کننده و ایجاد اتصال هم‌راستا در مدار خنک‌کاری؛ Cat آن را برای C32 MARINE فهرست کرده است.','موتور دریایی - سیستم خنک‌کاری - زانویی خطوط آب','https://parts.cat.com/en/catcorp/product/593-2261','{"component":"Water Lines Elbow","design_water_pressure_kpa":240}'::jsonb),
('445-1679','مجموعه کارتریج توربوشارژر Cat 445-1679','کارتریج توربوشارژر؛ صفحه رسمی Cat سازگاری با C32 MARINE را در گروه Marine Engine نشان می‌دهد. ابعاد درج‌شده: طول 10.1 و ارتفاع 14.3 اینچ.','موتور دریایی - هوارسانی - کارتریج توربوشارژر','https://parts.cat.com/en/catcorp/product/445-1679','{"component":"Turbocharger Cartridge","length_in":10.1,"height_in":14.3}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public listing includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4571546','6280362','6003447','4189136','5932261','4451679')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;