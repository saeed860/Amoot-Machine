WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('328-2564','کیت هوزینگ پمپ آب کمکی Cat 328-2564','کیت هوزینگ مجموعه پمپ آب کمکی؛ فهرست قطعات همراه شامل دو بلبرینگ 235-4823، حلقه نگهدارنده 2H-5549، واشر 5M-2894، چرخ‌دنده 418-2037، اسپیسر 235-4824، واشر آب‌بندی 155-8750، محافظ یاتاقان 235-4832، رینگ V شماره 235-4828 و شفت 328-2560 است. فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - پمپ آب کمکی - کیت هوزینگ','https://parts.cat.com/en/catcorp/product/328-2564','{"component":"Water Pump Housing Kit","material":"Gray (Flake) Iron","included_parts":[{"part_number":"235-4823","quantity":2},{"part_number":"2H-5549","quantity":1},{"part_number":"5M-2894","quantity":1},{"part_number":"4M-5285","quantity":1},{"part_number":"418-2037","quantity":1},{"part_number":"9L-8781","quantity":1},{"part_number":"235-4825","quantity":1},{"part_number":"235-4824","quantity":1},{"part_number":"0S-1571","quantity":1},{"part_number":"155-8750","quantity":1},{"part_number":"235-4832","quantity":1},{"part_number":"235-4828","quantity":1},{"part_number":"328-2560","quantity":1}]}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('3282564')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;