-- Correct the first-page Fuel Rails membership against the official Cat category listing.
-- The listing's first page includes 518-5338 and 562-0434; 393-9936 and 399-8470
-- were incorrectly attributed to this category in the preceding partial import.
update public.part_catalog
set technical_group = null,
    source_note = coalesce(source_note,'') || ' Category-membership correction: not present in the verified first page of the official Cat Fuel Rails listing; retained as a general Cat part reference.',
    updated_at = now()
where part_number in ('393-9936','399-8470')
  and technical_group = 'Fuel Rails'
  and source_note like '%Fuel Rails category page 1%';

insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','518-5338','Rail Group - SEM','Cat part listed in the official Fuel Rails category as RAIL GP-SEM. No fitment inferred.',ARRAY[]::text[],'Fuel Rails','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/518-5338','Official Cat Fuel Rails category page 1, visible among results 1–16 of 34. Price, stock, fitment and image not inferred.','REFERENCE',null,'{}'::jsonb,ARRAY[]::text[]),
('Caterpillar','562-0434','Fuel Rail','Cat part listed in the official Fuel Rails category as RAIL-FUEL. No fitment inferred.',ARRAY[]::text[],'Fuel Rails','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/562-0434','Official Cat Fuel Rails category page 1, visible among results 1–16 of 34. Price, stock, fitment and image not inferred.','REFERENCE',null,'{}'::jsonb,ARRAY[]::text[])
on conflict (part_number) do update set
 name=excluded.name,
 description=excluded.description,
 source_name=excluded.source_name,
 source_url=excluded.source_url,
 source_note=excluded.source_note,
 technical_group='Fuel Rails',
 verification_status='REFERENCE',
 updated_at=now();
