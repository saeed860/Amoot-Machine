WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('338-5461','لاینر بادامکی پمپ آب دریای کمکی Cat 338-5461','لاینر بادامکی با قطر خارجی 116.1 میلی‌متر برای مجموعه پمپ آب دریای کمکی؛ طول 9 و ارتفاع 2.5 اینچ و جنس فنولیک پلاستیک طبق مشخصات Cat.','موتور دریایی - پمپ آب دریا - لاینر بادامکی','https://parts.cat.com/en/catcorp/product/338-5461','{"component":"Sea Water Auxiliary Pump Cam Liner","outside_diameter_mm":116.1,"length_in":9.0,"height_in":2.5,"material":"Phenolic Plastic"}'::jsonb),
('212-9436','حلقه نگهدارنده خارجی ۲۶.۴۴ میلی‌متری Cat 212-9436','حلقه نگهدارنده خارجی برای جلوگیری از جابه‌جایی محوری اجزای پمپ آب مانند پروانه، یاتاقان و آب‌بند؛ فهرست رسمی Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - پمپ آب - حلقه نگهدارنده خارجی','https://parts.cat.com/en/catcorp/product/212-9436','{"component":"External Retaining Ring","inside_diameter_mm":26.44,"application":"Water Pump"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('3385461','2129436')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;