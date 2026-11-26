WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('2J-8163','اورینگ NBR با قطر داخلی ۱۱۷.۰۷ میلی‌متر Cat 2J-8163','اورینگ نیتریل NBR با قطر داخلی 117.07 میلی‌متر، قطر مقطع 3.53 میلی‌متر و سختی 75A؛ برای آب‌بندی استاتیک و برخی اتصالات دینامیکی استفاده می‌شود. فهرست رسمی Cat، C32 MARINE را در گروه Marine Engine درج می‌کند.','موتور دریایی - استارت و آب‌بندی - اورینگ NBR','https://parts.cat.com/en/catcorp/product/2J-8163','{"component":"O-Ring Seal","inside_diameter_mm":117.07,"cross_section_mm":3.53,"hardness":"75A","polymer":"NBR (Nitrile)","dash_size":247}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('2J8163')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;