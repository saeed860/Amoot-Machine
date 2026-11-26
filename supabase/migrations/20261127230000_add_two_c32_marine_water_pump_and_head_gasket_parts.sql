WITH src(part_number,name,description,technical_group,source_url,specifications) AS (VALUES
('137-1970','پروانه ۶ پره پمپ آب Cat 137-1970','پروانه شش‌پره برای گردش آب و مایع خنک‌کننده در بلوک موتور؛ قطر خارجی 4.25، قطر داخلی 1.2 و ارتفاع 2.25 اینچ و جنس برنز نیکل آلومینیوم.','موتور دریایی - پمپ آب - پروانه','https://parts.cat.com/en/catcorp/product/137-1970','{"component":"6 Vanes Water Pump Impeller","outside_diameter_in":4.25,"inside_diameter_in":1.2,"height_in":2.25,"material":"Nickel Aluminum Bronze"}'::jsonb),
('354-8484','گسکت صفحه سرسیلندر Cat 354-8484','گسکت صفحه سرسیلندر از ترکیب لاستیک و فولاد برای آب‌بندی سطوح اتصال و جلوگیری از نشت سیالات؛ صفحه رسمی Cat سازگاری C32 MARINE را در گروه Marine Engine درج می‌کند.','موتور دریایی - سرسیلندر - گسکت صفحه','https://parts.cat.com/en/catcorp/product/354-8484','{"component":"Cylinder Head Plate Gasket","material":"Rubber & Steel Gasket"}'::jsonb)
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
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('1371970','3548484')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;