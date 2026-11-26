WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('233-8685','دسته‌سیم موتور Cat 233-8685','Engine wiring harness for engine control, battery, fuel pump switch, pressure transducer and analog sensor power; Cat lists C32 under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم موتور',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/233-8685','Cat Parts Store explicitly lists C32 under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
 ('374-5344','دسته‌سیم موتور Cat 374-5344','Engine wiring harness for repower conversions; Cat lists C32 and C32 Marine under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم موتور',ARRAY['C32','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/374-5344','Cat Parts Store explicitly lists C32 and C32 MARINE under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
 ('383-6318','دسته‌سیم موتور Cat 383-6318','Engine wiring harness assembly; Cat lists C32 and C32 Marine under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم موتور',ARRAY['C32','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/383-6318','Cat Parts Store explicitly lists C32 and C32 MARINE under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
 ('368-4450','دسته‌سیم ماژول کنترل الکترونیکی Cat 368-4450','Engine Electronic Control Module wiring harness; Cat lists C32 under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم ECM',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/368-4450','Cat Parts Store explicitly lists C32 under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
 ('454-0168','دسته‌سیم ۴۰ پین موتور Cat 454-0168','40-pin engine wiring harness; Cat lists C32 and C32 Marine under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم ۴۰ پین',ARRAY['C32','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/454-0168','Cat Parts Store explicitly lists C32 and C32 MARINE under MARINE ENGINE. Exact serial prefix and ECM arrangement remain unverified.'),
 ('355-1265','منیفولد اگزوز آب‌خنک Cat 355-1265','Water-cooled engine exhaust manifold; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - اگزوز - منیفولد آب‌خنک',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/355-1265','Cat Parts Store explicitly lists C32 under MARINE ENGINE. Exact side, serial prefix and arrangement remain unverified.'),
 ('631-5864','منیفولد اگزوز آب‌خنک سمت چپ Cat 631-5864','Left-hand water-cooled exhaust manifold, 50.69 in overall length, 74.74 lb; Cat lists C32 and C32 Marine under Marine Engine.','موتورهای دریایی - اگزوز - منیفولد سمت چپ',ARRAY['C32','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/631-5864','Cat Parts Store explicitly lists C32 and C32 MARINE under MARINE ENGINE. Confirm side and arrangement by engine serial.'),
 ('507-2631','موتور استارت Cat 507-2631','Starter motor assembly; Cat lists C32 and C32 Marine under Marine Engine.','موتورهای دریایی - استارت - موتور استارت',ARRAY['C32','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/507-2631','Cat Parts Store explicitly lists C32 and C32 MARINE under MARINE ENGINE. Electrical rating, pinion and arrangement require serial verification.'),
 ('292-5816','براکت منیفولد اگزوز Cat 292-5816','Gray iron mounting bracket used in exhaust manifold; Cat lists C32 under Marine Engine.','موتورهای دریایی - اگزوز - براکت منیفولد',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/292-5816','Cat Parts Store explicitly lists C32 under MARINE ENGINE. Exact position and arrangement require serial verification.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Public Cat Parts Store explicitly lists the model under MARINE ENGINE; no serial-prefix or arrangement-level confirmation.',s.source_url
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
SELECT (SELECT count(*) FROM upserted) AS c32_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;