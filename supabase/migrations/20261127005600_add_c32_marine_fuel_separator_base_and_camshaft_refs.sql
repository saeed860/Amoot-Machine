-- C32 Marine fuel filtration and valvetrain references.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('175-7060','پایه آلومینیومی جداکننده آب و سوخت Cat 175-7060','پایه آلومینیومی مجموعه جداکننده سوخت و آب با فیلتر Spin-On برای نصب ایمن و کاهش انتقال لرزش به مجموعه فیلتر؛ فهرست Cat مدل C32 MARINE را نشان می‌دهد.','موتورهای دریایی - سوخت‌رسانی - پایه جداکننده آب و سوخت','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify filter interface, ports and serial/arrangement in Cat SIS.','{"component":"Fuel and Water Separator Base","filter_type":"Spin-On","material":"Alloy Aluminum"}'::jsonb),
 ('421-0176','میل‌بادامک سمت چپ موتور Cat 421-0176','میل‌بادامک فولادی سمت چپ موتور برای زمان‌بندی باز و بسته‌شدن سوپاپ‌های ورودی و خروجی سیلندرهای سمت چپ؛ در فهرست Cat برای C32 MARINE درج شده است.','موتورهای دریایی - قطار سوپاپ - میل‌بادامک','Official Cat Parts Store lists C32 MARINE under Engine and Marine Engine. Verify bank, timing marks and serial/arrangement in Cat SIS.','{"component":"Engine Cylinder Left Bank Camshaft","material":"Carbon Steel"}'::jsonb)
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
), quarantine AS (
 UPDATE public.part_catalog p SET
 source_name='Cat Parts Store',source_url='https://parts.cat.com/en/catcorp/product/348-7307',
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Cat public listing includes C32 MARINE; serial-prefix/arrangement fitment not confirmed. Quarantined pending Cat SIS.'),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=ARRAY['C32 MARINE ENGINE']::text[],application_type='UNVERIFIED',
 application_evidence='Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.',
 application_source_url='https://parts.cat.com/en/catcorp/product/348-7307',
 specifications='{"component":"Fuel Filter Base Assembly","ports":["SAE No.5","SAE No.8","SAE No.10"],"material":"Alloy Aluminum","filter_type":"Spin-On"}'::jsonb,
 updated_at=now()
 WHERE p.part_number='348-7307' RETURNING p.part_number
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM quarantine) AS existing_references_quarantined;