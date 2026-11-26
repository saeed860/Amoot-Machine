WITH src(part_number,name,description,technical_group,source_url,source_note) AS (
 VALUES
 ('460-6041','کیت نصب واشر سرسیلندر تک‌سیلندر Cat 460-6041','Single cylinder head gasket installation kit; Cat lists C32 under Marine Engine and shows gaskets, seals and exhaust/aftercooler sealing components.','موتورهای دریایی - موتور پایه - کیت واشر سرسیلندر','https://parts.cat.com/en/catcorp/product/460-6041','Cat Parts Store explicitly lists C32 under MARINE ENGINE. Kit bill of materials and engine arrangement require SIS verification.'),
 ('501-4085','کیت سرسیلندر تک‌سیلندر Cat 501-4085','Single cylinder head kit containing gaskets and seals to rebuild and reinstall one cylinder head; Cat lists C32, C32 Marine and C32B under Marine Engine.','موتورهای دریایی - موتور پایه - کیت سرسیلندر','https://parts.cat.com/en/catcorp/product/501-4085','Cat Parts Store explicitly lists C32, C32 MARINE and C32B under MARINE ENGINE. Confirm injector seal requirements and arrangement in SIS.'),
 ('482-1357','کیت نصب سرسیلندر تک‌سیلندر Cat 482-1357','Single cylinder head gasket kit; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - موتور پایه - کیت سرسیلندر','https://parts.cat.com/en/catcorp/product/482-1357','Cat Parts Store explicitly lists C32 under MARINE ENGINE and MARINE AUXILIARY. Exact serial and arrangement remain unverified.'),
 ('415-4993','کیت نصب سرسیلندر تک‌سیلندر Cat 415-4993','Single cylinder head install kit containing gaskets and seals; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - موتور پایه - کیت سرسیلندر','https://parts.cat.com/en/catcorp/product/415-4993','Cat Parts Store explicitly lists C32 under MARINE ENGINE and MARINE AUXILIARY. Check included seals and injector seal kit separately by SIS.'),
 ('634-6936','کیت تعمیر اساسی موتور Cat 634-6936','Engine overhaul kit; Cat lists C32 under Marine Engine and exposes 59 component lines, including cylinder liner gasket, head plate gasket and water seals.','موتورهای دریایی - موتور پایه - کیت اورهال','https://parts.cat.com/en/catcorp/product/634-6936','Cat Parts Store explicitly lists C32 under MARINE ENGINE. 59 kit component lines are shown; exact engine serial and kit revision must be verified.'),
 ('468-2994','کیت سرسیلندر تک‌سیلندر Cat 468-2994','Single cylinder head kit with gaskets and seals, including turbo gaskets; Cat lists C32 and C32 Marine under Marine Engine.','موتورهای دریایی - موتور پایه - کیت سرسیلندر','https://parts.cat.com/en/catcorp/product/468-2994','Cat Parts Store explicitly lists C32 and C32 MARINE under MARINE ENGINE. Confirm injector seal exclusion and exact arrangement.'),
 ('415-4994','کیت نصب سرسیلندر تک‌سیلندر Cat 415-4994','Single cylinder head install kit with gaskets and seals, including exhaust manifold gaskets and valve stem seals; Cat lists C32 under Marine Engine.','موتورهای دریایی - موتور پایه - کیت سرسیلندر','https://parts.cat.com/en/catcorp/product/415-4994','Cat Parts Store explicitly lists C32 under MARINE ENGINE. Verify kit revision and arrangement by serial.'),
 ('225-3099','واشر سرسیلندر Cat 225-3099','Cylinder head gasket, 51.0 in length and 0.6 in height; Cat lists C32, C32 Marine and C32B under Marine Engine.','موتورهای دریایی - موتور پایه - واشر سرسیلندر','https://parts.cat.com/en/catcorp/product/225-3099','Cat Parts Store explicitly lists C32, C32 MARINE and C32B under MARINE ENGINE. Confirm gasket specification and engine arrangement by serial.'),
 ('30R-0624','مجموعه سیلندر بازسازی‌شده Cat Reman 30R-0624','Cat Reman C32 cylinder pack, 15.0:1 compression ratio; includes liner, piston, rings, pin, retainers, connecting rod and seals; Cat lists C32 under Marine Engine.','موتورهای دریایی - موتور پایه - مجموعه سیلندر بازسازی‌شده','https://parts.cat.com/en/catcorp/product/30R-0624','Cat Parts Store explicitly lists C32 under MARINE ENGINE and recommends C32. Verify compression ratio, serial and arrangement before sale.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32']::text[],'UNVERIFIED',
 'Public Cat Parts Store explicitly lists C32 under MARINE ENGINE; no serial-prefix or arrangement-level confirmation.',s.source_url
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
 verification_status='NEEDS_SERIAL_CHECK',is_active=false,source_accessed_at=now(),
 compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,updated_at=now()
 RETURNING part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE'
 FROM upserted u
 WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g'))=upper(regexp_replace(u.part_number,'[^A-Za-z0-9]','','g'))
 AND p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 RETURNING p.id
)
SELECT (SELECT count(*) FROM upserted) AS c32_basic_engine_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;