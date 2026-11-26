WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
  VALUES
  ('423-2807','آداپتور دمپر میل‌لنگ Cat 423-2807','آداپتور مجموعه دمپر ارتعاشی متصل به میل‌لنگ؛ طبق فهرست رسمی Cat در گروه Marine Engine برای C32 MARINE نیز درج شده است.','موتور دریایی - میل‌لنگ و دمپر - آداپتور','Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Damper Adapter","material":"Gray (Flake) Iron"}'::jsonb),
  ('550-1822','مجموعه کارتریج Cat 550-1822','مجموعه کارتریج؛ صفحه رسمی Cat برای این شماره شرح فنی تفصیلی ارائه نمی‌کند و فقط سازگاری فهرست‌شده با C32 MARINE در گروه Marine Engine را نشان می‌دهد.','موتور دریایی - مجموعه‌های کارتریج','Cat Parts Store lists C32 MARINE under Marine Engine; description and exact assembly position require diagram review; serial-prefix and arrangement fitment not verified.','{"component":"Cartridge Group","material":"Ductile (Spheroidal) Iron","description_status":"Not provided by Cat public listing"}'::jsonb),
  ('539-4564','کاور دسترسی بلوک سیلندر Cat 539-4564','کاور دسترسی بلوک سیلندر برای محافظت از اجزای داخلی در برابر آلودگی؛ فهرست رسمی Cat، C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتور دریایی - بلوک سیلندر - کاور دسترسی','Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Cylinder Block Access Cover","material":"Alloy Aluminum","other_listed_models":["3412E","3412D","C32","C32B"]}'::jsonb)
), upserted AS (
  INSERT INTO public.part_catalog
  (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
  SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',
    'https://parts.cat.com/en/catcorp/product/'||s.part_number,s.source_note,
    'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
    'Official Cat Parts Store public listing includes C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
    'https://parts.cat.com/en/catcorp/product/'||s.part_number,s.specifications
  FROM src s
  ON CONFLICT(part_number) DO UPDATE SET
    name=EXCLUDED.name,description=EXCLUDED.description,technical_group=EXCLUDED.technical_group,
    source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,source_note=EXCLUDED.source_note,
    verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
    compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
    application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
    specifications=EXCLUDED.specifications
  RETURNING part_number
), product_safety AS (
  UPDATE public.products p SET status='INACTIVE'
  WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
    AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('4232807','5501822','5394564')
  RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
       (SELECT count(*) FROM product_safety) AS active_products_deactivated;