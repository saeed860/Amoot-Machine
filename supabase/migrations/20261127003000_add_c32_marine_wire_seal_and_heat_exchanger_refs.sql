-- C32 Marine heat-exchanger, piston and sealing references.
-- All public-model-only fitments remain inactive until Cat SIS serial/arrangement confirmation.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('185-1861','آب‌بند سیمی با قطر 5.6 میلی‌متر Cat 185-1861','آب‌بند سیمی با قطر 5.6 میلی‌متر برای جلوگیری از نشت در اتصالات مجموعه موتور؛ فهرست Cat کاربرد C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - آب‌بندها - آب‌بند سیمی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify seal groove, mating surfaces, dimensions and serial/arrangement in Cat SIS.','{"component":"Wire Seal","diameter_mm":5.6}'::jsonb)
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
 WHERE p.part_number IN ('610-1302','587-1664','587-1668','579-3853','353-9028','353-9029','361-5744')
 RETURNING p.part_number
), discontinued_off AS (
 UPDATE public.part_catalog p SET
 is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Cat Parts Store identifies this part as DISCONTINUED; retained for historical/reference purposes only, not for sale.'),
 updated_at=now()
 WHERE p.part_number='525-7144'
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('1851861','6101302','5871664','5871668','5793853','3539028','3539029','3615744','5257144')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM discontinued_off) AS discontinued_references_locked,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;