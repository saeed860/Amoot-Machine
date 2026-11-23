-- Consolidated official Cat Parts Store references discovered in the unified engine-family pass (2026-11-23).
-- Search references only. No price, stock, or unsupported fitment is asserted.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','574-0991','Cat High Pressure Fuel Pump','Cat High Pressure Control Fuel Pump / fuel transfer pump. Cat lists 12-24 V, 11.4 L/min rated flow, cast-iron construction, and dimensions 579 x 200 x 451 mm.',ARRAY['3512E']::text[],'Fuel System','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/574-0991','Official Cat product page lists ENGINE 3512E and PETROLEUM ENGINE 3512E 2016. The page says to consult the owner manual or Cat dealer for application; exact arrangement/serial fitment must be confirmed.','REFERENCE',null,'{"voltage":"12-24 V","rated_flow_l_min":11.4,"material":"Cast Iron, Ductile Iron, Carbon Steel","overall_height_in":17.74,"overall_length_in":22.81,"overall_width_in":7.87}'::jsonb,ARRAY['3512E']::text[]),
('Caterpillar','115-5674','Cat Unit Injector Boot','Cat Unit Injector Rubber Boot seals between the unit injector and cylinder head, preventing fuel/combustion-gas leakage and contamination.',ARRAY['C9','C9.3','C18','C15','3408B','3406E','3412E','3408E','3512B','3512C','3512E','3516B','3516C','3516E']::text[],'Fuel System','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/115-5674','Official Cat product page explicitly lists compatible models across generator set, marine, industrial and petroleum applications, including C9/C9.3/C18/C15, 3406E/3408B/3408E/3412E and 3512/3516 B/C/E variants. Confirm exact arrangement and serial number.','REFERENCE',null,'{}'::jsonb,ARRAY['C9','C9.3','C18','C15','3408B','3406E','3412E','3408E','3512B','3512C','3512E','3516B','3516C','3516E']::text[])
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,source_url=excluded.source_url,
 source_note=excluded.source_note,verification_status='REFERENCE',
 image_url=coalesce(public.part_catalog.image_url,excluded.image_url),
 specifications=excluded.specifications,compatible_models=excluded.compatible_models,updated_at=now();
