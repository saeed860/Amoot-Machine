WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('9W-4192','پین داول فولادی Cat 9W-4192','پین داول فولادی سخت‌کاری‌شده برای موقعیت‌دهی و انتقال بار بین قطعات؛ قطر 6.35 میلی‌متر و طول کلی 23 میلی‌متر. فهرست رسمی Cat، C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - اتصالات و سخت‌افزار - پین داول','Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Solid Dowel Pin","material":"Steel, Carbon Steel","diameter_mm":6.35,"overall_length_mm":23,"pin_type":"Plain","end_type":"Chamfer, Chamfer"}'::jsonb),
 ('485-4902','مجموعه خطوط هیبریدی Cat 485-4902','مجموعه خطوط هیبریدی شامل بخش شیلنگ انعطاف‌پذیر تقویت‌شده و بخش لوله صلب برای انتقال سیالات؛ فهرست رسمی Cat، C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - خطوط و اتصالات - مجموعه خطوط هیبریدی','Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Hybrid Line Assembly","material":"Carbon Steel, Alloy Copper, Other Hose, Tape / Labels Adhesive"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',
 'https://parts.cat.com/en/catcorp/product/'||s.part_number,s.source_note,
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public listing includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
 'https://parts.cat.com/en/catcorp/product/'||s.part_number,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,technical_group=EXCLUDED.technical_group,
 source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,source_note=EXCLUDED.source_note,
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications
 RETURNING part_number
), product_safety AS (
 UPDATE public.products p SET status='INACTIVE'
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('9W4192','4854902')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
 (SELECT count(*) FROM product_safety) AS active_products_deactivated;