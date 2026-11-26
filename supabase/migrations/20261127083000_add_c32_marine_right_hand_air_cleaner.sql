WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('494-6994','فیلتر هوای پایه سمت راست Cat 494-6994','فیلتر هوای پایه سمت راست برای پاک‌سازی هوای ورودی موتور و جلوگیری از ورود گردوغبار و ذرات ساینده؛ بدنه فولاد کربنی، خروجی 6 اینچ و ابعاد کلی طول 19.657، عرض 14.291 و ارتفاع 14.587 اینچ.','موتور دریایی - هوارسانی - فیلتر هوای سمت راست','https://parts.cat.com/en/catcorp/product/494-6994','{"component":"Right Hand Basic Air Cleaner","overall_length_in":19.657,"overall_width_in":14.291,"overall_height_in":14.587,"outlet_size_in":6,"material":"Carbon Steel"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4946994')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;