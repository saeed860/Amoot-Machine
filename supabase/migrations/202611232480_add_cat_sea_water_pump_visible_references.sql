-- Additional Sea Water Pump references visible in the current official Cat category listing.
-- The category currently reports 33 results; this does not complete pages 2-3.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','0R-7722','Remanufactured Auxiliary Sea Water Pump','Cat category title: PUMP GP AUX; product listing describes Remanufactured Sea Water Pump.',ARRAY[]::text[],'Sea Water Pumps','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/0R-7722','Official Cat Sea Water Pumps category listing; visible additional reference. No engine fitment inferred.', 'REFERENCE',null,'{}'::jsonb,ARRAY[]::text[]),
('Caterpillar','0R-7867','Remanufactured Auxiliary Sea Water Pump','Cat category title: PUMP GP-AUX; product listing describes Remanufactured Sea Water Pump.',ARRAY[]::text[],'Sea Water Pumps','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/0R-7867','Official Cat Sea Water Pumps category listing; visible additional reference. No engine fitment inferred.', 'REFERENCE',null,'{}'::jsonb,ARRAY[]::text[])
on conflict (part_number) do nothing;
