-- C32 Marine seawater heat-exchanger structural reference.
-- Cat public listing is not exact serial/arrangement certification.
WITH upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 VALUES
 ('Caterpillar','609-1189','فریم پشتی مبدل حرارتی آب دریا Cat 609-1189','Sea water heat exchanger rear frame supporting the exchanger assembly and maintaining stability in the marine cooling system. Cat lists C32 MARINE under Marine Engine.','{C32}','موتورهای دریایی - سیستم خنک‌کاری - فریم مبدل حرارتی','Cat Parts Store','https://parts.cat.com/en/catcorp/product/609-1189','Official Cat Parts Store lists C32 MARINE under MARINE ENGINE. Verify exchanger configuration, serial prefix and arrangement in Cat SIS. Status: NEEDS_SERIAL_CHECK; not approved for sale.','NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED','Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment not verified.','https://parts.cat.com/en/catcorp/product/609-1189','{"component":"Sea Water Heat Exchanger Rear Frame","application":"Structural support for seawater heat exchanger"}'::jsonb)
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
 WHERE p.part_number IN ('270-7257','457-9062','586-5323')
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('6091189','2707257','4579062','5865323')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;