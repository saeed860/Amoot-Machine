WITH src(part_number,name,description,technical_group,source_url,source_note) AS (
 VALUES
 ('456-0007','کیت نصب واشر سرسیلندر تک‌سیلندر Cat 456-0007','Single cylinder head gasket installation kit including gaskets, seals, turbocharger gasket and mounting hardware; Cat lists C18 under Marine Engine.','موتورهای دریایی - موتور پایه - کیت واشر سرسیلندر','https://parts.cat.com/en/catcorp/product/456-0007','Cat Parts Store lists C18 under MARINE ENGINE. Kit contents and exact arrangement must be checked in Cat SIS.'),
 ('360-7480','کیت نصب سرسیلندر Cat 360-7480','Single cylinder head gasket kit with gaskets and seals for rebuilding and reinstalling one cylinder head; Cat lists C18 under Marine Engine.','موتورهای دریایی - موتور پایه - کیت واشر سرسیلندر','https://parts.cat.com/en/catcorp/product/360-7480','Cat Parts Store lists C18 under MARINE ENGINE. Kit contents and exact arrangement must be checked in Cat SIS.'),
 ('592-7354','کیت نصب سرسیلندر تک‌سیلندر Cat 592-7354','Single cylinder head install kit; Cat lists C18 under Marine Engine.','موتورهای دریایی - موتور پایه - کیت سرسیلندر','https://parts.cat.com/en/catcorp/product/592-7354','Cat Parts Store lists C18 under MARINE ENGINE. Confirm included contents and arrangement by serial.'),
 ('350-7770','کیت سرسیلندر تک‌سیلندر Cat 350-7770','Single cylinder head kit containing gaskets and seals, including turbo gaskets; Cat lists C18 under Marine Engine.','موتورهای دریایی - موتور پایه - کیت سرسیلندر','https://parts.cat.com/en/catcorp/product/350-7770','Cat Parts Store lists C18 under MARINE ENGINE. Confirm included contents and arrangement by serial.'),
 ('359-0908','واشر سرسیلندر موتور Cat 359-0908','Cylinder head gasket; Cat lists C18 under Marine Engine.','موتورهای دریایی - موتور پایه - واشر سرسیلندر','https://parts.cat.com/en/catcorp/product/359-0908','Cat Parts Store lists C18 under MARINE ENGINE. Exact engine serial and gasket thickness/arrangement require confirmation.'),
 ('571-9902','کیت مجموعه واشر موتور Cat 571-9902','Gasket assembly kit; Cat lists C18 under Marine Engine, while the product description identifies several off-highway applications.','موتورهای دریایی - موتور پایه - کیت واشر','https://parts.cat.com/en/catcorp/product/571-9902','Cat Parts Store includes C18 in MARINE ENGINE but also lists off-highway applications. Treat as candidate only; verify marine arrangement in SIS.'),
 ('592-7333','کیت نصب سرسیلندر تک‌سیلندر Cat 592-7333','Single cylinder head install kit; Cat lists C18 under Marine Engine and provides a component list.','موتورهای دریایی - موتور پایه - کیت سرسیلندر','https://parts.cat.com/en/catcorp/product/592-7333','Cat Parts Store lists C18 under MARINE ENGINE. Verify the 28 listed kit components against the engine arrangement.'),
 ('561-1100','براکت مجموعه Cat 561-1100','Cat Parts Store lists C18, C18 Marine and C32 under Marine Engine; public description text appears inconsistent with the part title.','موتورهای دریایی - موتور پایه - براکت و متعلقات','https://parts.cat.com/en/catcorp/product/561-1100','Cat listing includes C18 and C18 MARINE under MARINE ENGINE, but description text is inconsistent with the title. Do not infer function or sell until SIS verification.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C18']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C18']::text[],'UNVERIFIED',
 'Public Cat Parts Store Marine Engine model listing only; no serial-prefix or arrangement-level confirmation.',s.source_url
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,updated_at=now()
 RETURNING part_number
), enrich_existing AS (
 UPDATE public.part_catalog p SET
 source_note=concat_ws(E'\n',nullif(p.source_note,''),CASE p.part_number
 WHEN '455-1186' THEN 'Cat Parts Store: Marine Bundled Repair Solution, C18 Engine Overhaul; 110 component lines visible. Exact serial/arrangement remains required. Source: https://parts.cat.com/en/catcorp/455-1186'
 WHEN '243-6718' THEN 'Cat Parts Store: Crankshaft Main Bearing Kit; C18 explicitly listed under MARINE ENGINE. Exact serial/arrangement and bearing grade remain required. Source: https://parts.cat.com/en/catcorp/product/243-6718'
 END),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,application_type='UNVERIFIED',updated_at=now()
 WHERE p.part_number IN ('455-1186','243-6718')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 FROM upserted u
 WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g'))=upper(regexp_replace(u.part_number,'[^A-Za-z0-9]','','g'))
 AND p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 RETURNING p.id
)
SELECT (SELECT count(*) FROM upserted) AS catalog_refs_upserted,
       (SELECT count(*) FROM enrich_existing) AS existing_refs_enriched,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;