WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('447-7146','شیر برقی کنترل سیال اگزوز دیزل Cat 447-7146','شیر برقی کنترل جریان سیال اگزوز دیزل با بدنه استنلس‌استیل؛ Cat سازگاری C32 MARINE را در گروه Marine Engine درج کرده است.','موتور دریایی - کنترل اگزوز - شیر برقی','https://parts.cat.com/en/catcorp/447-7146','{"component":"Solenoid Valve","application":"Diesel Exhaust Fluid Control","material":"Stainless Steel"}'::jsonb),
('274-3782','درپوش آب‌بند کانکتور پلاگ Cat 274-3782','درپوش آب‌بند کانکتور برای محافظت از اتصال الکتریکی در برابر آلودگی و رطوبت؛ فهرست رسمی Cat شامل C32 MARINE در گروه Marine Engine است.','موتور دریایی - برق و اتصالات - آب‌بند کانکتور','https://parts.cat.com/en/catcorp/product/274-3782','{"component":"Plug Connector Seal Cap"}'::jsonb),
('650-4550','آب‌بند رابط کانکتور Cat 650-4550','آب‌بند رابط کانکتور برای حفاظت از اتصال؛ صفحه رسمی Cat، C32 MARINE را در فهرست Marine Engine نشان می‌دهد.','موتور دریایی - برق و اتصالات - آب‌بند رابط','https://parts.cat.com/en/catcorp/product/650-4550','{"component":"Plug Interface Connector Seal"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4477146','2743782','6504550')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;