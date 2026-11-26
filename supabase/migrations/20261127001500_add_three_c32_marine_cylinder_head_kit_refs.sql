WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('578-5810','مجموعه سرسیلندر Cat 578-5810','مجموعه سرسیلندر برای موتور C32 Marine؛ صفحه رسمی Cat این شماره را در گروه Marine Engine برای C32B و C32 MARINE فهرست کرده است. جزئیات قطعات داخل مجموعه و شماره سریال باید از دیاگرام SIS تأیید شود.','موتور دریایی - سرسیلندر - مجموعه سرسیلندر','https://parts.cat.com/en/catcorp/product/578-5810','{"component":"Cylinder Head Group","compatible_model_listing":["C32B","C32 MARINE"],"parts_diagram_review_required":true}'::jsonb),
('606-1526','کیت بازسازی سرسیلندر تک‌سیلندر Cat 606-1526','کیت شامل گسکت‌ها و آب‌بندهای لازم برای بازسازی و نصب مجدد یک سرسیلندر است؛ گسکت‌های توربو در کیت وجود دارند اما آب‌بند انژکتور باید جداگانه تهیه شود.','موتور دریایی - سرسیلندر - کیت بازسازی','https://parts.cat.com/en/catcorp/product/606-1526','{"component":"Single Cylinder Head Kit","includes":["Cylinder head gaskets","Seals","Turbo gaskets"],"injector_seals_included":false,"materials":["Structural Steel","Alloy Mixed Metal"]}'::jsonb),
('579-0058','کیت بازسازی سرسیلندر تک‌سیلندر Cat 579-0058','کیت گسکت و آب‌بند برای بازسازی و نصب مجدد یک سرسیلندر؛ گسکت‌های توربو را شامل می‌شود اما آب‌بند انژکتور در آن نیست.','موتور دریایی - سرسیلندر - کیت گسکت و آب‌بند','https://parts.cat.com/en/catcorp/product/579-0058','{"component":"Single Cylinder Head Kit","includes":["Gaskets","Seals","Turbo gaskets"],"injector_seals_included":false,"materials":["Carbon Steel","Alloy Mixed Metal"]}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5785810','6061526','5790058')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;