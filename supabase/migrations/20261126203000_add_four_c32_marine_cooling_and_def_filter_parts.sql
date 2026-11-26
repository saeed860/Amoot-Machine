WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('632-8970','درپوش مبدل حرارتی آب دریا Cat 632-8970','درپوش چدنی برای محافظت از اجزای داخلی مبدل حرارتی آب دریا در برابر تماس و خوردگی ناشی از آب دریا و عوامل محیطی.','موتور دریایی - مبدل حرارتی - درپوش','https://parts.cat.com/en/catcorp/product/632-8970','{"component":"Sea Water Heat Exchanger Cover","material":"Gray (Flake) Iron"}'::jsonb),
('613-6620','مجموعه لوله مدار خنک‌کننده Cat 613-6620','مجموعه لوله با قطر داخلی 34.8 میلی‌متر برای گردش مایع خنک‌کننده بین اجزای مدار؛ جنس مس آلیاژی در مشخصات Cat درج شده است.','موتور دریایی - خنک‌کاری - لوله‌های مدار','https://parts.cat.com/en/catcorp/product/613-6620','{"component":"Coolant Lines Tube Assembly","inside_diameter_mm":34.8,"material":"Alloy Copper"}'::jsonb),
('500-3087','حسگر سطح مایع خنک‌کننده Cat 500-3087','حسگر سطح با اتصال سه‌پین DT، طول سیم 9.8 اینچ و رزوه 1/4-18 NPT؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Engine درج کرده است.','موتور دریایی - پایش - حسگر سطح خنک‌کننده','https://parts.cat.com/en/catcorp/product/500-3087','{"component":"Coolant Level Sensor","thread":"1/4-18 NPT","wire_length_in":9.8,"connector":"3-pin DT","materials":["Plastic Plastic","Alloy Brass"]}'::jsonb),
('505-0160','المنت فیلتر سیال اگزوز دیزل Cat 505-0160','المنت کارتریجی فیلتر DEF برای حذف ذرات ناخواسته از سیال اگزوز دیزل؛ Cat سازگاری C32 MARINE را در گروه Marine Engine فهرست کرده است.','موتور دریایی - سامانه پس‌پالایش - فیلتر DEF','https://parts.cat.com/en/catcorp/product/505-0160','{"component":"Diesel Exhaust Fluid Filter Element","fluid":"Diesel Exhaust Fluid","filter_type":"Cartridge Element"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment not verified.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6328970','6136620','5003087','5050160')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;