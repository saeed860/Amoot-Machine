WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('306-1720','بست V شکل با حداقل قطر داخلی ۱۴۸ میلی‌متر Cat 306-1720','بست V شکل برای اتصال و آب‌بندی اجزای مسیر اگزوز؛ عرض بست 1.25 اینچ، قطر گیج 5.83 اینچ و جنس فولاد کربنی و فلز آلیاژی است.','موتور دریایی - اگزوز - بست V شکل','https://parts.cat.com/en/catcorp/product/306-1720','{"component":"V-Band Clamp","minimum_inside_diameter_mm":148,"clamp_width_in":1.25,"gage_diameter_in":5.83,"materials":["Alloy Mixed Metal","Carbon Steel"]}'::jsonb),
('3N-8468','نیمه‌های بست V شکل ۹۸ میلی‌متری Cat 3N-8468','مجموعه نیمه‌های بست V شکل برای اتصال لوله‌ها و اجزای مسیر اگزوز؛ عرض بست 0.76 و قطر گیج 3.86 اینچ و جنس فولاد کربنی است.','موتور دریایی - اگزوز - بست V شکل','https://parts.cat.com/en/catcorp/product/3N-8468','{"component":"V-Band Halves Clamp","minimum_diameter_mm":98,"clamp_width_in":0.76,"gage_diameter_in":3.86,"material":"Carbon Steel"}'::jsonb),
('357-1752','گسکت اگزوز توربوشارژر چهارپیچ Cat 357-1752','گسکت چهارپیچ از فلز آلیاژی برای آب‌بندی اتصال توربوشارژر و مسیر اگزوز؛ از نشت گازهای داغ و افت فشار در محل اتصال جلوگیری می‌کند.','موتور دریایی - توربوشارژر - گسکت اگزوز','https://parts.cat.com/en/catcorp/product/357-1752','{"component":"4 Bolt Turbo Exhaust Gasket","material":"Alloy Mixed Metal"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('3061720','3N8468','3571752')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;