-- C32 Marine oil-line, heat-tube and plate references.
-- Public Cat model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('9X-2506','مجموعه لوله انتقال حرارت Cat 9X-2506','لوله انتقال حرارت برای هدایت سیال یا گرما در مجموعه‌های موتور؛ فهرست Cat کاربرد C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - خنک‌کاری و انتقال حرارت - لوله','Official Cat Parts Store lists C32 MARINE under Marine Engine. Confirm exact tube assembly, routing, connection dimensions, serial prefix and arrangement in Cat SIS.','{"component":"Tube - Heat"}'::jsonb),
 ('293-8628','لوله مسیر فیلتر روغن موتور Cat 293-8628','لوله با قطر داخلی 4.57 میلی‌متر برای هدایت روغن موتور به محفظه فیلتر؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - روانکاری - لوله فیلتر روغن','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify oil circuit location, fitting ends, serial prefix and arrangement in Cat SIS.','{"component":"Engine Oil Filter Line Tube","inner_diameter_mm":4.57,"water_pressure_kPa":240,"material":"Alloy Mixed Metal"}'::jsonb),
 ('598-6474','مجموعه صفحه فلزی Cat 598-6474','مجموعه صفحه سازه‌ای از فولاد سازه‌ای و فلز آلیاژی؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد. محل نصب باید با نقشه قطعات موتور تطبیق داده شود.','موتورهای دریایی - سازه و اتصالات - صفحه','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify exact mounting location, dimensions, mating components and serial/arrangement in Cat SIS.','{"component":"Plate Assembly","materials":["Structural Steel","Alloy Mixed Metal"]}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',
 'https://parts.cat.com/en/catcorp/product/'||s.part_number,
 s.source_note||' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 'https://parts.cat.com/en/catcorp/product/'||s.part_number,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=EXCLUDED.source_note,verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_accessed_at=now(),compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications,updated_at=now()
 RETURNING part_number
), refreshed AS (
 UPDATE public.part_catalog p SET
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 application_source_url='https://parts.cat.com/en/catcorp/product/'||p.part_number,
 compatible_models=CASE WHEN p.part_number IN ('552-8508','420-8979') THEN ARRAY['C32 MARINE ENGINE','C32B MARINE ENGINE','C32B MARINE AUXILIARY']::text[] ELSE ARRAY['C32 MARINE ENGINE']::text[] END,
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('552-8508','420-8979','6N-0163')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('9X2506','2938628','5986474','5528508','4208979','6N0163')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;