-- Correct the first-page Fuel Rails import against the official Cat category listing.
-- Cat's page 1 contains 16 items; 518-5338 and 562-0434 were omitted,
-- while 393-9936 and 399-8470 were incorrectly attributed to this category.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','518-5338','Rail Group-SEM','Cat Parts Store lists this exact part number as RAIL GP-SEM in the Fuel Rails category. Cat currently provides no compatible-model information for this part.',ARRAY[]::text[],'Fuel Rails','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/518-5338','Official Cat Fuel Rails category page 1 of 3, item 12 of 16. Cat product page states compatible-model information is unavailable. No price, stock or unverified image supplied.','REFERENCE',null,'{}'::jsonb,ARRAY[]::text[]),
('Caterpillar','562-0434','Fuel Rail','Cat Parts Store lists this exact part number as RAIL-FUEL in the Fuel Rails category. No engine compatibility inferred.',ARRAY[]::text[],'Fuel Rails','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/562-0434','Official Cat Fuel Rails category page 1 of 3, item 13 of 16. No price, stock or unverified image supplied.','REFERENCE',null,'{}'::jsonb,ARRAY[]::text[])
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,
 source_name=excluded.source_name,source_url=excluded.source_url,source_note=excluded.source_note,
 technical_group='Fuel Rails',verification_status='REFERENCE',
 updated_at=now();

update public.part_catalog
set technical_group='Other Fuel System Components',
    source_note='Correction: this part number was not present in the official Cat Fuel Rails category page 1 listing (1-16 of 34). Retained only as a separate Cat product-page reference; not counted in Fuel Rails category coverage.',
    updated_at=now()
where part_number in ('393-9936','399-8470')
  and technical_group='Fuel Rails';
