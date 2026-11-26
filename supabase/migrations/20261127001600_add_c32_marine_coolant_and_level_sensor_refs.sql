-- C32 Marine coolant tube, tank hose and level sensor references.
-- Public Cat listings are model-level references, not serial/arrangement approval.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('487-7678','لوله مدار خنک‌کننده Cat 487-7678','لوله مدار خنک‌کننده با قطر داخلی 60.2 میلی‌متر برای گردش سیال خنک‌کننده در موتور و سامانه خنک‌کاری. فهرست Cat کاربرد C32 MARINE را نیز نشان می‌دهد.','موتورهای دریایی - خنک‌کاری - لوله مدار آب','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify dimensions, routing, connection ends, serial prefix and arrangement in Cat SIS.','{"component":"Coolant Lines Tube","inner_diameter_mm":60.2}'::jsonb),
 ('611-6147','شیلنگ مخزن خنک‌کننده Cat 611-6147','شیلنگ انعطاف‌پذیر با قطر داخلی 9.52 میلی‌متر برای اتصال مخزن خنک‌کننده به مدار خنک‌کاری موتور.','موتورهای دریایی - خنک‌کاری - شیلنگ مخزن','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify hose routing, length, end connections, serial prefix and arrangement in Cat SIS.','{"component":"Coolant Tank Hose","inner_diameter_mm":9.52,"material":"Coolant Hose"}'::jsonb),
 ('500-3087','سنسور سطح مایع خنک‌کننده Cat 500-3087','سوئیچ سطح خازنی برای اعلام سطح پایین مایع خنک‌کننده یا آب؛ دارای رزوه 1/4-18 NPT، کانکتور سه‌پین DT و طول سیم 9.8 اینچ. کاربردهای متنوع دارد و نوع مخزن/مدار باید با تجهیز تطبیق داده شود.','موتورهای دریایی - برق و کنترل - سنسور سطح','Official Cat Parts Store lists C32 MARINE in Marine Engine and also lists numerous other applications. Application is tank-specific; verify exact sensor logic, connector, serial prefix and arrangement in Cat SIS.','{"component":"Coolant Level Sensor","thread":"1/4-18 NPT","wire_length_in":9.8,"connector":"3-pin DT","materials":["Plastic","Alloy Brass"]}'::jsonb)
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
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('490-3745','491-6748','611-5564','613-6620','328-2560')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('4877678','6116147','5003087','4903745','4916748','6115564','6136620','3282560')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;