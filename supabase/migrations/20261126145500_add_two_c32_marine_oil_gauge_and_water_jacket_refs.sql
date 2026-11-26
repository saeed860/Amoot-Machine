WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('417-3705','گیج میله‌ای سطح روغن موتور Cat 417-3705','گیج میله‌ای برای سنجش مقدار روغن موتور؛ فهرست رسمی Cat، C32 MARINE را در گروه Marine Engine به‌عنوان مدل سازگار نشان می‌دهد.','موتور دریایی - روغن‌کاری - گیج سطح روغن','https://parts.cat.com/en/catcorp/product/417-3705','{"component":"Engine Oil Level Gauge Dipstick","materials":["Carbon Steel","Alloy Zinc","Alloy Mixed Metal"]}'::jsonb),
('353-9033','پوسته واترجکت موتور دریایی Cat 353-9033','پوسته واترجکت برای انتقال آب در مدار خنک‌کاری موتورهای دریایی؛ طراحی برای شرایط دریایی، مقاومت در برابر خوردگی و فشار آب تا 240 کیلوپاسکال اعلام شده است.','موتور دریایی - سیستم خنک‌کاری - پوسته واترجکت','https://parts.cat.com/en/catcorp/product/353-9033','{"component":"Water Jacket Housing","material":"Alloy Aluminum","design_water_pressure_kpa":240}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4173705','3539033')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;