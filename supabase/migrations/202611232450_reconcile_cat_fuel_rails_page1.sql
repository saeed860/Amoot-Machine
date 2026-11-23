-- Reconcile Fuel Rails page-one import against the live official Cat category listing.
-- The category page confirms these two part numbers; it does not provide fitment for 518-5338.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','518-5338','RAIL GP-SEM','Official Cat product page: no compatible-model information is currently available. Material listed as carbon steel.',ARRAY[]::text[],'Fuel Rails','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/518-5338','Listed on official Cat Fuel Rails category page 1 (1–16 of 34). Official product page explicitly reports no compatibility information. No price, stock or image supplied.','REFERENCE',null,'{}'::jsonb,ARRAY[]::text[]),
('Caterpillar','562-0434','RAIL-FUEL','Part title as listed in the official Cat Fuel Rails category. No additional description, specification or fitment inferred.',ARRAY[]::text[],'Fuel Rails','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/562-0434','Listed on official Cat Fuel Rails category page 1 (1–16 of 34). Product detail page could not be independently retrieved during this pass; reference-only. No price, stock or image supplied.','REFERENCE',null,'{}'::jsonb,ARRAY[]::text[])
on conflict (part_number) do update set
 name=excluded.name,
 description=excluded.description,
 source_name=excluded.source_name,
 source_url=excluded.source_url,
 source_note=excluded.source_note,
 technical_group=excluded.technical_group,
 verification_status='REFERENCE',
 updated_at=now();

-- These two records were not present in the visible official category page.
-- Keep the part references, but remove the unsupported Fuel Rails classification.
update public.part_catalog
set technical_group='Unclassified Cat Reference',
    source_note=coalesce(source_note,'') || ' Reclassified: not present in the verified first-page listing of the Cat Fuel Rails category.',
    updated_at=now()
where part_number in ('393-9936','399-8470')
  and technical_group='Fuel Rails';
