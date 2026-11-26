WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('7C-1512','پلانجر پمپ روغن Cat 7C-1512','پلانجر با قطر خارجی 34.036 میلی‌متر برای مجموعه پمپ روغن؛ فهرست رسمی Cat، C32 MARINE را در گروه Marine Engine درج می‌کند.','موتور دریایی - روغن‌کاری - پمپ روغن','https://parts.cat.com/en/catcorp/product/7C-1512','{"component":"Oil Pump Plunger","outer_diameter_mm":34.036}'::jsonb),
('431-9373','بست نگهدارنده خطوط سوخت Cat 431-9373','بست نگهدارنده خطوط سوخت برای مهار مسیرها و کاهش حرکت و احتمال نشتی؛ صفحه رسمی Cat، C32 MARINE را در گروه Marine Engine فهرست می‌کند.','موتور دریایی - سوخت‌رسانی - بست خطوط سوخت','https://parts.cat.com/en/catcorp/product/431-9373','{"component":"Fuel Lines Support Clamp","material":"Cyanoacrylate Adhesive"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('7C1512','4319373')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;