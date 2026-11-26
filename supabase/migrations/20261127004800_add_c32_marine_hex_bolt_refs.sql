-- C32 Marine hex-head bolt references.
-- Cat public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('8T-9377','پیچ شش‌گوش 3/8-16 با طول 2-1/4 اینچ Cat 8T-9377','پیچ سرشش‌گوش فولادی با رزوه 3/8-16 و طول 2-1/4 اینچ برای اتصالات و نگهداری اجزای موتور.','موتورهای دریایی - اتصالات - پیچ شش‌گوش','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, grip length, grade and mounting point in Cat SIS.','{"component":"Hex Head Bolt","thread":"3/8-16","length_in":2.25}'::jsonb),
 ('8T-9378','پیچ شش‌گوش 3/8-16 با طول 4 اینچ Cat 8T-9378','پیچ سرشش‌گوش فولادی با رزوه 3/8-16 و طول 4 اینچ برای اتصالات بلند و سازه‌های نگهدارنده موتور.','موتورهای دریایی - اتصالات - پیچ شش‌گوش بلند','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, grip length, grade and mounting point in Cat SIS.','{"component":"Hex Head Bolt","thread":"3/8-16","length_in":4.0}'::jsonb)
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
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('8T9377','8T9378')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;