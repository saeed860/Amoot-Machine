WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('234-3438','زانویی خروجی آب موتور Cat 234-3438','زانویی خروجی آب از چدن خاکستری برای هدایت مایع خنک‌کننده از موتور به مسیر رادیاتور؛ طراحی‌شده برای فشار آب 240 کیلوپاسکال و کاهش آشفتگی و افت فشار.','موتور دریایی - خنک‌کاری - زانویی خروجی آب','https://parts.cat.com/en/catcorp/product/234-3438','{"component":"Water Outlet Elbow","material":"Gray (Flake) Iron","water_pressure_kpa":240}'::jsonb),
('451-0371','آداپتور زانویی ۹۰ درجه Cat 451-0371','آداپتور زانویی ۹۰ درجه با رزوه 7/16-20 در سمت ورودی و 1/4-19 در سمت خروجی؛ جنس فولاد آلیاژی و کاربرد در اتصال خطوط سیال موتور دریایی.','موتور دریایی - اتصالات خطوط سیال - آداپتور زانویی','https://parts.cat.com/en/catcorp/product/451-0371','{"component":"90 Degree Elbow Adapter","inlet_thread":"7/16-20","outlet_thread":"1/4-19","material":"Alloy Steel"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('2343438','4510371')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;