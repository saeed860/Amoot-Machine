WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('6N-3826','مجموعه محرک موتور استارت الکتریکی Cat 6N-3826','مجموعه محرک استارت برای درگیرکردن دنده استارت با فلایویل موتور؛ دارای 11 دندانه پینیون، قطر خارجی 56.7 میلی‌متر و جنس فولاد کربنی.','موتور دریایی - سیستم استارت - مجموعه محرک','https://parts.cat.com/en/catcorp/product/6N-3826','{"component":"Electric Starter Motor Drive","pinion_teeth":11,"pinion_outer_diameter_mm":56.7,"material":"Carbon Steel"}'::jsonb),
('3T-9524','مجموعه جاروبک موتور استارت Cat 3T-9524','مجموعه جاروبک مسی برای انتقال جریان به بخش گردان موتور استارت؛ برای موتورهای استارت 24 و 32 ولت کاربرد دارد.','موتور دریایی - سیستم استارت - مجموعه جاروبک','https://parts.cat.com/en/catcorp/product/3T-9524','{"component":"Starter Motor Brush Assembly","compatible_motor_voltage_v":[24,32],"material":"Alloy Copper"}'::jsonb),
('3T-3418','فریم انتهایی کموتاتور موتور استارت Cat 3T-3418','فریم انتهایی کموتاتور برای نگهداری و هم‌راستاسازی اجزای موتور استارت؛ در فهرست رسمی Cat مدل C32 MARINE در گروه Marine Engine درج شده است.','موتور دریایی - سیستم استارت - فریم کموتاتور','https://parts.cat.com/en/catcorp/product/3T-3418','{"component":"Commutator End Frame Assembly","system":"Starter Motor"}'::jsonb),
('125-6535','کاور موتور استارت Cat 125-6535','کاور محافظ موتور استارت برای حفاظت از مجموعه داخلی در برابر آلودگی و تماس محیطی؛ فهرست رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - سیستم استارت - کاور موتور','https://parts.cat.com/en/catcorp/product/125-6535','{"component":"Starting Motor Cover","system":"Starter Motor"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6N3826','3T9524','3T3418','1256535')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;