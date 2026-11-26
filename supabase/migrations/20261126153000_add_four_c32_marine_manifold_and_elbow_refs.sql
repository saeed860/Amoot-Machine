WITH src(part_number,name,description,technical_group,source_url,source_note,specifications) AS (VALUES
('501-2101','منیفولد موتور Cat 501-2101','منیفولد از چدن داکتیل؛ صفحه رسمی Cat مدل C32 MARINE را در گروه Marine Engine فهرست می‌کند.','موتور دریایی - منیفولد','https://parts.cat.com/en/catcorp/product/501-2101','Official Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Manifold","material":"Ductile (Spheroidal) Iron"}'::jsonb),
('202-7959','زانویی ۹۰ درجه خروجی پمپ آب دریا Cat 202-7959','زانویی خروجی ۹۰ درجه برای هدایت آب دریا از منبع به پمپ؛ جنس برنج آلیاژی و فشار طراحی اعلام‌شده 240 کیلوپاسکال است.','موتور دریایی - خنک‌کاری - اتصالات پمپ آب دریا','https://parts.cat.com/en/catcorp/product/202-7959','Official Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Sea Water Pump Outlet 90 Degree Elbow","material":"Alloy Brass","design_water_pressure_kpa":240}'::jsonb),
('483-3809','زانویی آلومینیومی ریختگی Cat 483-3809','زانویی آلومینیومی ریختگی برای تغییر جهت جریان؛ Cat آن را در فهرست سازگاری Marine Engine برای C32 MARINE درج کرده است.','موتور دریایی - اتصالات و زانویی‌ها','https://parts.cat.com/en/catcorp/product/483-3809','Official Cat Parts Store lists C32 MARINE under Marine Engine; exact serial-prefix and arrangement fitment not verified.','{"component":"Cast Aluminum Elbow","material":"Alloy Aluminum"}'::jsonb),
('605-1232','زانویی مبدل حرارتی آب دریا Cat 605-1232 - متوقف‌شده','زانویی 54 میلی‌متری مبدل حرارتی آب دریا؛ صفحه رسمی Cat وضعیت Discontinued را اعلام کرده است. فقط برای مرجع تاریخی و شناسایی قطعه ثبت می‌شود و قابل عرضه نیست.','موتور دریایی - خنک‌کاری - مبدل حرارتی - قطعه متوقف‌شده','https://parts.cat.com/en/catcorp/product/605-1232','Cat Parts Store explicitly marks this part DISCONTINUED; historical reference only, not for sale. Exact serial-prefix and arrangement fitment not verified.','{"component":"Sea Water Heat Exchanger Elbow","inside_diameter_mm":54,"material":"Alloy Copper","lifecycle":"DISCONTINUED","sellable":false}'::jsonb)
), upserted AS (
 INSERT INTO public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,is_active,source_accessed_at,compatible_models,application_type,application_evidence,application_source_url,specifications)
 SELECT 'Caterpillar',s.part_number,s.name,s.description,ARRAY['C32']::text[],s.technical_group,'Cat Parts Store',s.source_url,s.source_note,
 'NEEDS_SERIAL_CHECK',false,now(),ARRAY['C32 MARINE ENGINE']::text[],'UNVERIFIED',
 'Official Cat Parts Store public model listing only; exact serial-prefix and arrangement fitment has not been verified in Cat SIS.',
 s.source_url,s.specifications
 FROM src s
 ON CONFLICT(part_number) DO UPDATE SET name=EXCLUDED.name,description=EXCLUDED.description,
 technical_group=EXCLUDED.technical_group,source_name=EXCLUDED.source_name,source_url=EXCLUDED.source_url,
 source_note=EXCLUDED.source_note,verification_status='NEEDS_SERIAL_CHECK',is_active=false,
 source_accessed_at=now(),compatible_models=EXCLUDED.compatible_models,application_type='UNVERIFIED',
 application_evidence=EXCLUDED.application_evidence,application_source_url=EXCLUDED.application_source_url,
 specifications=EXCLUDED.specifications
 RETURNING part_number
), product_safety AS (
 UPDATE public.products p SET status='INACTIVE'
 WHERE p.brand ILIKE '%cat%' AND p.status='ACTIVE'
 AND upper(regexp_replace(p.sku,'[^A-Za-z0-9]','','g')) IN ('5012101','2027959','4833809','6051232')
 RETURNING p.sku
)
SELECT (SELECT count(*) FROM upserted) AS catalog_rows_upserted,
(SELECT count(*) FROM product_safety) AS active_products_deactivated;