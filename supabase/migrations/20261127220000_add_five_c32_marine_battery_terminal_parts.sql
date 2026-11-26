WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('9G-0003','کاور ترمینال منفی باتری ۶۸ میلی‌متری Cat 9G-0003','کاور PVC مشکی برای پوشاندن ترمینال منفی باتری و جلوگیری از اتصال کوتاه، تماس تصادفی، خوردگی و برق‌گرفتگی؛ طول 2.67، عرض 2.07 و ارتفاع 1.06 اینچ.','برق موتور دریایی - باتری - کاور ترمینال منفی','https://parts.cat.com/en/catcorp/product/9G-0003','{"component":"Battery Terminal Cover","polarity":"Negative","material":"PVC Plastic","color":"Black","length_in":2.67,"width_in":2.07,"height_in":1.06}'::jsonb),
('9G-0004','بوت عایق ترمینال مثبت باتری Cat 9G-0004','بوت PVC قرمز برای عایق‌کردن ترمینال مثبت باتری و جلوگیری از اتصال کوتاه و تماس تصادفی؛ طول 2.9، عرض 2.67 و ارتفاع 1.06 اینچ.','برق موتور دریایی - باتری - بوت عایق ترمینال مثبت','https://parts.cat.com/en/catcorp/product/9G-0004','{"component":"Terminal Insulation Boot","polarity":"Positive","material":"PVC Plastic","color":"Red","length_in":2.9,"width_in":2.67,"height_in":1.06}'::jsonb),
('8N-0869','بوت عایق ترمینال باتری Cat 8N-0869','بوت PVC مشکی برای عایق‌کردن ترمینال باتری و حفاظت در برابر اتصال کوتاه و شوک الکتریکی؛ طول 2.9، عرض 1.6 و ارتفاع 1.2 اینچ.','برق موتور دریایی - باتری - بوت عایق ترمینال','https://parts.cat.com/en/catcorp/product/8N-0869','{"component":"Terminal Insulation Boot","material":"PVC Plastic","color":"Black","length_in":2.9,"width_in":1.6,"height_in":1.2}'::jsonb),
('1S-7251','سرکابل حلقوی AWG 00 Cat 1S-7251','سرکابل حلقوی مسی برای اتصال مطمئن کابل باتری به پیچ یا استاد ترمینال؛ پوشش فلزی روی برای مقاومت در برابر خوردگی و اتصال الکتریکی پایدار.','برق موتور دریایی - باتری - سرکابل حلقوی','https://parts.cat.com/en/catcorp/product/1S-7251','{"component":"00 AWG Ring Terminal","wire_gauge":"00 AWG","material":"Alloy Copper","coating":"Alloy Zinc"}'::jsonb),
('9G-8909','بوت عایق ترمینال باتری Cat 9G-8909','بوت عایق PVC برای پوشاندن ترمینال باتری و جلوگیری از تماس ناخواسته و اتصال کوتاه؛ Cat سازگاری C32 MARINE را در فهرست مدل‌ها درج کرده است.','برق موتور دریایی - باتری - بوت عایق ترمینال','https://parts.cat.com/en/catcorp/product/9G-8909','{"component":"Terminal Insulation Boot","material":"PVC Plastic"}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 'Official Cat Parts Store public compatible-model listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment not verified.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing explicitly includes C32 MARINE; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('9G0003','9G0004','8N0869','1S7251','9G8909')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;