-- C32 Marine support bracket, camera bracket and oil-pump gasket references.
-- Cat public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('525-7137','براکت دوربین موتور Cat 525-7137','براکت فولادی سازه‌ای برای نصب و نگهداری مجموعه دوربین؛ فهرست Cat کاربرد C32 MARINE را در گروه Marine Engine نشان می‌دهد. محل و جهت نصب باید با پیکربندی تجهیزات تطبیق داده شود.','موتورهای دریایی - سازه و متعلقات - براکت دوربین','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify camera system, mounting location and equipment arrangement in Cat SIS.','{"component":"Camera Bracket","material":"Structural Steel"}'::jsonb),
 ('153-9076','براکت نگهدارنده موتور Cat 153-9076','براکت نگهدارنده موتور از فولاد سازه‌ای و فولاد آلیاژی برای تثبیت موتور و کاهش انتقال ارتعاش؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - پایه‌ها و اتصالات موتور - براکت نگهدارنده','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify mounting points, dimensions, mating parts and serial/arrangement in Cat SIS.','{"component":"Engine Support Mounting Bracket","materials":["Structural Steel","Alloy Steel"]}'::jsonb),
 ('3N-3299','مجموعه واشر پمپ کارتل/روغن Cat 3N-3299','مجموعه واشر با قطر خارجی 6.25 اینچ برای آب‌بندی اتصالات مجموعه پمپ روغن/کارتل؛ فهرست Cat کاربرد C32 MARINE را در گروه Engine نشان می‌دهد.','موتورهای دریایی - روانکاری - واشر مجموعه پمپ روغن','Official Cat Parts Store lists C32 MARINE under Engine. Confirm exact pump group, gasket profile and serial/arrangement in Cat SIS before selection.','{"component":"Gasket Set","outer_diameter_in":6.25}'::jsonb)
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
 WHERE p.part_number IN ('583-7208','153-9121')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5257137','1539076','3N3299','5837208','1539121')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;