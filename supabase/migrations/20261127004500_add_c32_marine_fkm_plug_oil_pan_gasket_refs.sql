-- C32 Marine FKM O-ring, straight-thread plug and oil-pan gasket references.
-- Public Cat model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('8C-3089','اورینگ FKM با ابعاد 2.62 × 82.22 میلی‌متر Cat 8C-3089','اورینگ FKM با قطر مقطع 2.62 میلی‌متر، قطر داخلی 82.22 میلی‌متر و سختی 75A برای آب‌بندی اتصالات موتور و مدارهای سیال.','موتورهای دریایی - آب‌بندها - اورینگ FKM','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify groove, fluid, temperature and serial/arrangement in Cat SIS.','{"component":"O-Ring","cross_section_mm":2.62,"inside_diameter_mm":82.22,"hardness":"75A","material":"FKM Fluorocarbon Rubber"}'::jsonb),
 ('106-8459','پلاگ استنلس‌استیل رزوه مستقیم اورینگی 1-3/16 اینچ Cat 106-8459','پلاگ رزوه مستقیم با آب‌بندی اورینگی و سر شش‌گوش از فولاد ضدزنگ برای مسدودکردن مطمئن دهانه‌های رزوه‌دار خطوط سیال.','موتورهای دریایی - اتصالات خطوط سیال - پلاگ اورینگی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread form, O-ring size, port and pressure rating in Cat SIS.','{"component":"Straight Thread O-Ring Plug","thread_size_in":"1-3/16","materials":["Stainless Steel","Alloy Steel","Carbon Steel"]}'::jsonb),
 ('353-1648','واشر کارتل روغن با ضخامت 0.8 میلی‌متر Cat 353-1648','واشر آب‌بندی کارتل روغن با ضخامت 0.8 میلی‌متر از لاستیک سیلیکونی برای جلوگیری از نشت روغن و ورود آلودگی در اتصال سطوح کارتل.','موتورهای دریایی - روانکاری - واشر کارتل روغن','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify oil pan flange pattern, thickness, sealant requirements and serial/arrangement in Cat SIS.','{"component":"Oil Pan Gasket","thickness_mm":0.8,"material":"Silicone / MQ / VMQ / PMQ Rubber"}'::jsonb)
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
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('9M-9647','6N-0824')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('8C3089','1068459','3531648','9M9647','6N0824')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;