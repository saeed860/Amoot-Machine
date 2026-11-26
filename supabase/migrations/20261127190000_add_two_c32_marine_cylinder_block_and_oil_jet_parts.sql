WITH src(part_number,name,description,technical_group,source_url,source_note,specifications) AS (VALUES
('349-0701','بلوک سیلندر موتور Cat 349-0701','بلوک سیلندر ساختار اصلی موتور است و سیلندرها و اجزای داخلی را در خود جای می‌دهد. ابعاد اعلام‌شده طول 52.5 و ارتفاع 28.5 اینچ است. برای موتورهای جایگزین و بلوک‌های کوتاه/بلند برچسب‌دار در ایالات متحده، بازگرداندن هسته موتور قدیمی به نمایندگی Cat الزامی است.','موتور دریایی - بلوک سیلندر','https://parts.cat.com/en/catcorp/product/349-0701','Official Cat Parts Store explicitly lists C32 MARINE under Marine Engine and Engine; replacement-labeled long/short blocks require core return under US rules. Exact serial-prefix and arrangement fitment not verified.','{"component":"Engine Cylinder Block","length_in":52.5,"height_in":28.5,"core_return_required_in_us_for_replacement_labeled_units":true}'::jsonb),
('355-6043','لوله فولادی جت روغن پیستون و شاتون Cat 355-6043','لوله جت روغن برای پاشش روغن به زیر تاج پیستون و خارج‌کردن حرارت؛ طول 4.5 و ارتفاع 1.35 اینچ و جنس فولاد کربنی و مس آلیاژی.','موتور دریایی - روغن‌کاری - لوله جت پیستون','https://parts.cat.com/en/catcorp/product/355-6043','Official Cat Parts Store explicitly lists C32 MARINE in compatible models; exact serial-prefix and arrangement fitment not verified.','{"component":"Piston and Rod Oil Jet Steel Tube","length_in":4.5,"height_in":1.35,"materials":["Carbon Steel","Alloy Copper"]}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,s.source_note,
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('3490701','3556043')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;