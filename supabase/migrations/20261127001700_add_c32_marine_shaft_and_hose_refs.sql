-- C32 Marine mechanical, shaft and hose references from Cat Parts Store.
-- Public model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('5L-2026','خار قفلی شفت Cat 5L-2026','خار فولادی قفل‌کننده شفت با ضخامت 1.2 میلی‌متر برای جلوگیری از جابه‌جایی محوری و حفظ موقعیت قطعه دوار. فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد؛ این قطعه کاربردهای متعدد دیگری نیز دارد.','موتورهای دریایی - اجزای مکانیکی - قفل شفت','Official Cat Parts Store lists C32 MARINE among Marine Engine applications and many other engine families. Confirm exact shaft, groove dimensions and arrangement in Cat SIS.','{"component":"Shaft Lock","thickness_mm":1.2,"material":"Steel"}'::jsonb),
 ('420-3225','شفت واسط موتور Cat 420-3225','شفت واسط فولادی با قطر خارجی 212 میلی‌متر برای اتصال اجزای دوار و انتقال گشتاور از موتور به تجهیزات کمکی. فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - انتقال قدرت - شفت واسط','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify shaft dimensions, mating components, serial prefix and arrangement in Cat SIS.','{"component":"Engine Stub Shaft","outer_diameter_mm":212,"material":"Carbon Steel"}'::jsonb)
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
 compatible_models=CASE WHEN p.part_number IN ('516-5982','519-7628') THEN ARRAY['C32 MARINE ENGINE','C32B MARINE ENGINE','C32B MARINE AUXILIARY']::text[] ELSE p.compatible_models END,
 application_evidence='Official Cat Parts Store public listing includes C32 MARINE under MARINE ENGINE; exact serial-prefix and arrangement fitment not verified.',
 application_type='UNVERIFIED',verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Rechecked against official Cat Parts Store C32 MARINE listing; kept inactive pending Cat SIS serial-prefix and arrangement verification.'),
 source_accessed_at=now(),updated_at=now()
 WHERE p.part_number IN ('516-5982','519-7628','578-1572','641-7871','641-7872')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('5L2026','4203225','5165982','5197628','5781572','6417871','6417872')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;