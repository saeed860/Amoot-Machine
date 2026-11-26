WITH src(part_number,name,description,technical_group,source_url,source_note,specifications,engine_models) AS (VALUES
('630-8569','کارتل روغن موتور Cat 630-8569','کارتل فولادی روغن با طول 50.078 و عرض 24.893 اینچ و وزن 256.838 پوند؛ برای نگهداری و حفاظت روغن موتور و اتصال به بلوک طراحی شده است. فهرست رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - روغن‌کاری - کارتل روغن','https://parts.cat.com/en/catcorp/product/630-8569','Official Cat Parts Store explicitly lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Engine Oil Pan","overall_length_in":50.078,"overall_width_in":24.893,"weight_lb":256.838,"materials":["Carbon Steel","Alloy Steel"]}'::jsonb,ARRAY['C32']::text[]),
('30R-1990','انژکتور سوخت بازسازی‌شده Cat Reman C32 Marine - 30R-1990','انژکتور سوخت بازسازی‌شده Cat Reman برای موتور C32 Marine؛ برای تزریق مقدار و زمان‌بندی دقیق سوخت طراحی شده و طبق اطلاعات Cat شامل آزمون عملکرد و به‌روزرسانی‌های مهندسی است. شرایط گارانتی و تحویل هسته باید از نمایندگی Cat استعلام شود.','موتور دریایی - سوخت‌رسانی - انژکتور بازسازی‌شده','https://parts.cat.com/en/catcorp/product/30R-1990','Cat Reman product description explicitly identifies this as a C32 Marine fuel injector; public compatibility block lists C32 under Marine Engine, so exact serial-prefix and arrangement fitment still requires Cat SIS confirmation.','{"component":"Cat Reman Fuel Injector","reman_status":"Remanufactured","application_label":"C32 Marine","warranty":"12-month limited warranty subject to terms","core_return_may_apply":true}'::jsonb,ARRAY['C32 MARINE']::text[])
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.engine_models,s.technical_group,'Cat Parts Store',s.source_url,s.source_note,
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat product page identifies C32 MARINE application; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6308569','30R1990')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;