-- C32 Marine bushing, spiral-wound gasket and oil-line elbow gasket references.
-- Cat public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('5B-4855','بوش/اتصال برنجی و فولادی Cat 5B-4855','بوش اتصال از آلیاژ برنج، فولاد کربنی، آهن آلیاژی و پوشش روی برای اتصال اجزای خطوط و مجموعه‌های موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - اتصالات - بوش و رابط','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, mating parts, material and exact installation location in Cat SIS.','{"component":"Bushing","materials":["Alloy Brass","Carbon Steel","Alloy Iron","Alloy Zinc"]}'::jsonb),
 ('236-1637','واشر مارپیچی استنلس‌استیل با قطر 128.66 میلی‌متر Cat 236-1637','واشر مارپیچی فلزی و الیافی با قطر خارجی 128.66 میلی‌متر برای آب‌بندی اتصال دو سطح در سامانه موتور و جلوگیری از نشت سیال.','موتورهای دریایی - واشرها - واشر مارپیچی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify flange standard, pressure/temperature rating and serial/arrangement in Cat SIS.','{"component":"Spiral Wound Gasket","outside_diameter_mm":128.66,"materials":["Stainless Steel","Fiber Gasket","Mixed Metal"]}'::jsonb),
 ('6N-0824','واشر تخت زانویی خطوط روغن با ضخامت 0.79 میلی‌متر Cat 6N-0824','واشر تخت مستطیلی با ابعاد 3.57 در 3.57 اینچ، ضخامت 0.03 اینچ و چهار سوراخ 0.42 اینچی برای آب‌بندی زانویی خطوط روغن و فیلتر روغن.','موتورهای دریایی - روانکاری - واشر زانویی خطوط روغن','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify elbow flange pattern, hole spacing, fluid and serial/arrangement in Cat SIS.','{"component":"Elbow Gasket","shape":"Square-Rectangular","length_in":3.57,"width_in":3.57,"thickness_in":0.03,"hole_size_in":0.42,"hole_count":4,"materials":["Non-metallic Fiber","Rubber Gasket"]}'::jsonb)
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
 WHERE p.part_number IN ('220-8710','3N-3299','555-7709','116-8528')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5B4855','2361637','6N0824','2208710','3N3299','5557709','1168528')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;