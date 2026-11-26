WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
  VALUES
  ('474-7471','دسته‌سیم موتور Cat 474-7471','Engine wiring harness for sensors, air pressure, fuel temperature and coolant level; Cat listing includes C18 and C18 Marine under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم سنسورها',ARRAY['C18','C18 Marine']::text[],'https://parts.cat.com/en/catcorp/product/474-7471','Cat Parts Store lists C18 and C18 MARINE under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
  ('524-1350','دسته‌سیم موتور Cat 524-1350','Engine wiring harness; Cat listing includes C18 and C18 Marine under Marine Engine.','موتورهای دریایی - برق و کنترل - دسته‌سیم موتور',ARRAY['C18','C18 Marine']::text[],'https://parts.cat.com/en/catcorp/product/524-1350','Cat Parts Store lists C18 and C18 MARINE under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
  ('329-0176','دسته‌سیم کنترل الکترونیکی موتور Cat 329-0176','Engine electronic control wiring harness connecting engine sensors and connectors to power supply; Marine Engine C18 listing.','موتورهای دریایی - برق و کنترل - دسته‌سیم ECM',ARRAY['C18']::text[],'https://parts.cat.com/en/catcorp/product/329-0176','Cat Parts Store lists C18 under MARINE ENGINE. C18 MARINE label and exact arrangement not independently established.'),
  ('202-2091','دسته‌سیم واحد کنترل موتور Cat 202-2091','Engine electronic control unit wiring harness; Marine Engine C18 listing.','موتورهای دریایی - برق و کنترل - دسته‌سیم ECM',ARRAY['C18']::text[],'https://parts.cat.com/en/catcorp/product/202-2091','Cat Parts Store lists C18 under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
  ('293-2338','دسته‌سیم موتور Cat 293-2338','Engine harness; Marine Engine C18 listing.','موتورهای دریایی - برق و کنترل - دسته‌سیم موتور',ARRAY['C18']::text[],'https://parts.cat.com/en/catcorp/product/293-2338','Cat Parts Store lists C18 under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
  ('246-0531','دسته‌سیم ماژول کنترل موتور Cat 246-0531','Engine wiring harness for electronic control module components; Marine Engine C18 listing.','موتورهای دریایی - برق و کنترل - دسته‌سیم ECM',ARRAY['C18']::text[],'https://parts.cat.com/en/catcorp/product/246-0531','Cat Parts Store lists C18 under MARINE ENGINE. Exact serial prefix and arrangement remain unverified.'),
  ('388-3721','مجموعه منیفولد اگزوز Cat 388-3721','Exhaust manifold assembly; Cat Parts Store lists C18 under Marine Engine and shows associated gaskets and seals.','موتورهای دریایی - اگزوز - مجموعه منیفولد',ARRAY['C18']::text[],'https://parts.cat.com/en/catcorp/product/388-3721','Cat Parts Store lists C18 under MARINE ENGINE. Component-level fitment requires serial and arrangement verification.'),
  ('362-0732','آلترناتور شارژ ۲۴ ولت ۷۰ آمپر Cat 362-0732','24 V, 70 A charging alternator; Cat Parts Store lists C18 and C18 Marine under Marine Engine.','موتورهای دریایی - برق و شارژ - آلترناتور',ARRAY['C18','C18 Marine']::text[],'https://parts.cat.com/en/catcorp/product/362-0732','Cat Parts Store lists C18 and C18 MARINE under MARINE ENGINE. Confirm belt, bracket and arrangement by serial.'),
  ('20R-2677','آلترناتور بازسازی‌شده Cat Reman 20R-2677','Cat Reman 24 V, 70 A alternator; Cat Parts Store lists C18 under Marine Engine.','موتورهای دریایی - برق و شارژ - آلترناتور بازسازی‌شده',ARRAY['C18']::text[],'https://parts.cat.com/en/catcorp/product/20R-2677','Cat Parts Store lists C18 under MARINE ENGINE. Reman interchange and exact arrangement require serial verification.'),
  ('246-3277','موتور استارت بادی Cat 246-3277','Air starting motor assembly; Cat Parts Store lists C18 and C18 Marine under Marine Engine.','موتورهای دریایی - استارت - موتور استارت بادی',ARRAY['C18','C18 Marine']::text[],'https://parts.cat.com/en/catcorp/product/246-3277','Cat Parts Store lists C18 and C18 MARINE under MARINE ENGINE. Air-start system and arrangement require serial verification.'),
  ('200-6962','استارت الکتریکی ۱۲ ولت Cat 200-6962','12 V electric starting motor; Cat listing states Marine Approved: Yes and lists C18 under Marine Engine.','موتورهای دریایی - استارت - استارت الکتریکی',ARRAY['C18']::text[],'https://parts.cat.com/en/catcorp/product/200-6962','Cat Parts Store lists C18 under MARINE ENGINE and Marine Approved: Yes. Verify voltage, pinion and arrangement by serial.')
), upserted AS (
  INSERT INTO public.part_catalog
    (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
  SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
         s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
         'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
         'Public Cat Parts Store Marine Engine model listing only; no serial-prefix or arrangement-level confirmation.',
         s.source_url
  FROM src s
  ON CONFLICT (part_number) DO UPDATE SET
    description=EXCLUDED.description,
    engine_models=EXCLUDED.engine_models,
    technical_group=EXCLUDED.technical_group,
    source_name=EXCLUDED.source_name,
    source_url=EXCLUDED.source_url,
    source_note=concat_ws(E'\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
    verification_status='NEEDS_SERIAL_CHECK',
    is_active=false,
    source_accessed_at=now(),
    compatible_models=EXCLUDED.compatible_models,
    application_type='UNVERIFIED',
    application_evidence=EXCLUDED.application_evidence,
    application_source_url=EXCLUDED.application_source_url,
    updated_at=now()
  RETURNING part_number
), products_off AS (
  UPDATE public.products p SET status='INACTIVE'
  FROM upserted u
  WHERE upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g'))=upper(regexp_replace(u.part_number,'[^A-Za-z0-9]','','g'))
    AND p.brand ILIKE '%cat%' AND p.status='ACTIVE'
  RETURNING p.id
)
SELECT (SELECT count(*) FROM upserted) AS catalog_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;