-- C32 Marine air-pressure, sensor shutoff and engine hardware references.
-- Public Cat model listings do not certify serial-prefix/arrangement fitment.
WITH src(part_number,name,description,technical_group,source_note,specifications) AS (
 VALUES
 ('6V-5016','شیر توپی برنجی با رزوه 1/2 اینچ Cat 6V-5016','شیر توپی با رزوه 1/2 اینچ از آلیاژ برنج برای قطع‌و‌وصل جریان سیال در خطوط موتور؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - شیرآلات - شیر توپی','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify thread, pressure rating, fluid compatibility and installation position in Cat SIS.','{"component":"Ball Valve","thread_in":0.5,"material":"Brass"}'::jsonb),
 ('5D-2751','واشر فنری فولادی با ضخامت 3.175 میلی‌متر Cat 5D-2751','واشر فنری فولادی با ضخامت 3.175 میلی‌متر برای حفظ نیروی پیش‌بار اتصال و کاهش احتمال شل‌شدن بست در اثر ارتعاش.','موتورهای دریایی - اتصالات - واشر فنری','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify fastener size, washer diameter and joint stack-up in Cat SIS.','{"component":"Spring Washer","thickness_mm":3.175,"material":"Steel"}'::jsonb),
 ('521-0055','کیت شیر تنظیم فشار هوای فشرده Cat 521-0055','کیت شیر رگولاتور فشار هوا شامل شیر، فنر، حلقه‌های نگهدارنده، اورینگ‌ها و واشرها برای تنظیم فشار هوای ورودی به سامانه پنوماتیکی موتور.','موتورهای دریایی - هوای فشرده - کیت رگولاتور فشار','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify regulator group, set pressure, porting and serial/arrangement in Cat SIS.','{"component":"Air Pressure Regulator Valve Kit","contents":["Valve","Valve Spring","Retaining Rings","O-Rings","Washers"]}'::jsonb),
 ('423-3781','شیر قطع‌کن حسگر فشار با رزوه M12 Cat 423-3781','شیر قطع‌کن حسگر فشار با رزوه M12 برای ایزوله‌کردن یا کنترل اتصال حسگر در مدار؛ فهرست Cat مدل C32 MARINE را در گروه Marine Engine نشان می‌دهد.','موتورهای دریایی - ابزار دقیق - شیر قطع‌کن حسگر فشار','Official Cat Parts Store lists C32 MARINE under Marine Engine. Verify sensor interface, thread pitch, pressure rating and serial/arrangement in Cat SIS.','{"component":"Pressure Sensor Shutoff Valve","thread":"M12"}'::jsonb)
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
 WHERE p.part_number IN ('501-4085','588-6302','596-8595')
 RETURNING p.part_number
), discontinued_off AS (
 UPDATE public.part_catalog p SET is_active=false,
 source_note=concat_ws(E'\n',nullif(p.source_note,''),'Cat Parts Store identifies this part as DISCONTINUED; retained for historical/reference purposes only, not for sale.'),
 updated_at=now()
 WHERE p.part_number='613-4661'
 RETURNING p.part_number
), products_off AS (
 UPDATE public.products p SET status='INACTIVE',updated_at=now()
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN
 ('6V5016','5D2751','5210055','4233781','5014085','5886302','5968595','6134661')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS references_upserted,
 (SELECT count(*) FROM refreshed) AS existing_references_refreshed,
 (SELECT count(*) FROM discontinued_off) AS discontinued_references_locked,
 (SELECT count(*) FROM products_off) AS exact_sku_products_deactivated;