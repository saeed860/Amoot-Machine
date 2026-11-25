-- Add official Cat 523-1411 fuel-filter record without inventing machine compatibility.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('523-1411','فیلتر سوخت موتور Cat 523-1411',
 'Cat Fuel Filter (SEM). Official Cat Parts Store identifies the product as an engine fuel filter, Type: Fuel, Material: Carbon Steel. Cat currently publishes no compatible-model information and no usable dimensional measurements for this part.',
 ARRAY[]::text[],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/523-1411',
 'Official Cat product page confirms part name, fuel type and carbon-steel material. Compatible models are explicitly unavailable on the official page; no machine or engine fitment has been inferred. No price or stock imported.',
 'REFERENCE')
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,
 source_url=excluded.source_url,source_note=excluded.source_note,
 verification_status='REFERENCE',updated_at=now()
where public.part_catalog.source_url is distinct from excluded.source_url
   or public.part_catalog.name is distinct from excluded.name
   or public.part_catalog.description is distinct from excluded.description
   or public.part_catalog.engine_models is distinct from excluded.engine_models
   or public.part_catalog.technical_group is distinct from excluded.technical_group
   or public.part_catalog.source_note is distinct from excluded.source_note;
