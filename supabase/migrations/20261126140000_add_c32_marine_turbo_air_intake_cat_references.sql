-- C32 Marine turbocharger and air-intake references from official Cat Parts Store.
-- All candidates remain quarantined pending Cat SIS serial/arrangement confirmation.
WITH src(part_number,name,description,technical_group,models,source_url,source_note) AS (
 VALUES
 ('600-3447','پوسته توربوشارژر Cat 600-3447','Turbocharger housing; Cat lists Marine Engine C32 Marine.','موتورهای دریایی - توربوشارژر - پوسته',ARRAY['C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/600-3447','Direct Cat compatible-model listing: MARINE ENGINE / C32 MARINE. Confirm serial and turbo arrangement.'),
 ('599-4821','مجموعه لوله و شیلنگ توربوشارژر Cat 599-4821','Turbocharger hose and tube assembly; Cat lists Marine Engine C32 Marine.','موتورهای دریایی - توربوشارژر - لوله و شیلنگ',ARRAY['C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/599-4821','Direct Cat compatible-model listing: MARINE ENGINE / C32 MARINE. Verify routing and arrangement.'),
 ('480-6705','کیت واشر نصب توربوشارژر Cat 480-6705','Turbocharger install gasket kit; Cat lists C32 in Marine Engine and Marine Auxiliary.','موتورهای دریایی - توربوشارژر - کیت واشر نصب',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/480-6705','Direct Cat compatible-model listing includes MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Verify turbo configuration and kit contents.'),
 ('457-9062','لوله تخلیه آب توربوشارژر Cat 457-9062','Turbocharger water drain tube; Cat lists C32 Marine and C32 under Marine Engine.','موتورهای دریایی - توربوشارژر - لوله تخلیه آب',ARRAY['C32 Marine','C32']::text[],'https://parts.cat.com/en/catcorp/product/457-9062','Direct Cat compatible-model listing includes MARINE ENGINE / C32B / C32 MARINE / C32. Confirm serial and routing.'),
 ('440-1657','کارتریج توربوشارژر Cat 440-1657','Turbocharger cartridge; Cat lists C32B and C32 under Marine Engine.','موتورهای دریایی - توربوشارژر - کارتریج',ARRAY['C32B','C32']::text[],'https://parts.cat.com/en/catcorp/product/440-1657','Direct Cat compatible-model listing: MARINE ENGINE / C32B / C32. Verify turbo group and serial range.'),
 ('353-9039','مغزی خام افترکولر Cat 353-9039','Raw aftercooler core; Cat lists C32B, C32 Marine and C32 under Marine Engine.','موتورهای دریایی - سیستم هوای ورودی - مغزی افترکولر',ARRAY['C32B','C32 Marine','C32']::text[],'https://parts.cat.com/en/catcorp/product/353-9039','Direct Cat compatible-model listing includes MARINE ENGINE / C32B / C32 MARINE / C32. Verify core variant and serial range.'),
 ('300-1389','پایه افترکولر آب خام Cat 300-1389','Raw water aftercooler base; Cat lists Marine Engine C32.','موتورهای دریایی - سیستم هوای ورودی - پایه افترکولر',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/300-1389','Direct Cat compatible-model listing: MARINE ENGINE / C32. Verify mating core and arrangement.'),
 ('526-8491','کیت نصب افترکولر و لوله‌ها Cat 526-8491','Aftercooler and lines install gasket kit; Cat lists C32 under Marine Engine.','موتورهای دریایی - سیستم هوای ورودی - کیت نصب افترکولر',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/526-8491','Direct Cat compatible-model listing: MARINE ENGINE / C32. Kit contents and serial applicability require confirmation.'),
 ('595-4299','زانویی ورودی هوای ۹۰ میلی‌متری Cat 595-4299','90 mm ID air intake elbow; Cat lists C32 Marine under Marine Engine (also C32B).','موتورهای دریایی - سیستم هوای ورودی - زانویی',ARRAY['C32B','C32 Marine']::text[],'https://parts.cat.com/en/catcorp/product/595-4299','Direct Cat compatible-model listing includes MARINE ENGINE / C32B / C32 MARINE. Verify intake routing and serial.'),
 ('287-7210','توربوشارژر پایه Cat 287-7210','Basic turbocharger; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - توربوشارژر - مجموعه کامل',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/287-7210','Direct Cat compatible-model listing includes MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Verify turbo specification and engine arrangement.'),
 ('262-7103','درپوش کمپرسور توربوشارژر Cat 262-7103','Turbocharger compressor cover; Cat lists C32 under Marine Engine and Marine Auxiliary.','موتورهای دریایی - توربوشارژر - درپوش کمپرسور',ARRAY['C32']::text[],'https://parts.cat.com/en/catcorp/product/262-7103','Direct Cat compatible-model listing includes MARINE ENGINE / C32 and MARINE AUXILIARY / C32. Verify turbo group and serial.')
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,s.models,s.technical_group,'Cat Parts Store',s.source_url,
 s.source_note || ' Status: NEEDS_SERIAL_CHECK; not approved for sale until Cat SIS serial/arrangement verification.',
 'NEEDS_SERIAL_CHECK',false,now(),s.models,'UNVERIFIED',
 'Official Cat Parts Store compatible-model listing; serial-prefix and exact arrangement fitment not verified.',s.source_url
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET
 name=EXCLUDED.name,description=EXCLUDED.description,engine_models=EXCLUDED.engine_models,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=concat_ws(E'\\n',nullif(public.part_catalog.source_note,''),EXCLUDED.source_note),
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
SELECT (SELECT count(*) FROM upserted) AS c32_air_turbo_refs_upserted,
       (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;
