-- C32 Marine water-pump covers and auxiliary seawater pump references.
-- Public Cat model listings are not serial/arrangement certification.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('156-6889','درپوش پمپ آب خام کمکی Cat 156-6889','صفحه پوشش پمپ آب خام کمکی برای محافظت از اجزای داخلی پمپ در برابر رطوبت، آلودگی و ذرات خارجی؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - پمپ آب خام - درپوش پمپ','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify cover profile, pump body, gasket and serial/arrangement in Cat SIS.','{"component":"Water Pump Cover Plate","application":"Auxiliary Raw Water Pump"}'::jsonb),
 ('467-7085','درپوش چدنی پمپ آب Cat 467-7085','درپوش چدنی پمپ آب برای ایجاد محفظه آب‌بندی‌شده، هدایت جریان مایع خنک‌کننده و جلوگیری از نشت یا ورود آلودگی؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - خنک‌کاری - درپوش پمپ آب','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump housing interface, gasket and serial/arrangement in Cat SIS.','{"component":"Water Pump Cover","material":"Gray Flake Iron"}'::jsonb),
 ('593-2663','درپوش پمپ آب موتور Cat 593-2663','درپوش چدنی برای پوشاندن و محافظت از پمپ آب موتور در برابر آلودگی و آسیب؛ توان تحمل فشار آب اعلام‌شده 240 کیلوپاسکال.','موتورهای دریایی - خنک‌کاری - درپوش پمپ آب موتور','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify pump interface, sealing surface, pressure duty and serial/arrangement in Cat SIS.','{"component":"Engine Water Pump Cover","material":"Gray Flake Iron","water_pressure_kPa":240}'::jsonb)
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
 compatible_models=CASE WHEN p.part_number IN ('548-1813','627-7250') THEN ARRAY['C32 MARINE ENGINE','C32B MARINE ENGINE','C32B MARINE AUXILIARY']::text[] ELSE ARRAY['C32B MARINE ENGINE']::text[] END,
 application_evidence=CASE WHEN p.part_number IN ('548-1813','627-7250')
 THEN 'Official Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.'
 ELSE 'Cat Parts Store Marine Engine listing identifies C32B and C32 but not exact C32 MARINE; C32 MARINE appears only under generic Engine. Excluded from exact C32 MARINE fitment until Cat SIS confirms.'
 END,
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store model categories; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('548-1813','627-7250','525-7151')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('1566889','4677085','5932663','5481813','6277250','5257151')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;