-- Add official Cat 525-6206 fuel filter reference and normalize existing 1R fuel filters.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('525-6206','فیلتر سوخت استاندارد Cat 525-6206',
 'Cat Standard Efficiency Fuel Filter; diameter 2.165 in; length 6.157 in; material corrosion preventative fluid, carbon steel and stainless steel. Official compatible model classes include CB13/CB15/CB16 asphalt compactors, D6K2/D6N/D3K2/D4K2/D5K2 track-type tractors, AP500F/AP1055/AP655F/AP600F/AP555F asphalt pavers, M323F/M320F/M316F/M322F/M314F/M318F wheeled excavators, 815/815K soil compactors, 814/814K wheel dozers, 816/816K landfill compactors, 962M/950M/938M/926M/930M wheel loaders, MH3022/MH3024 material handlers and PL61 pipelayer.',
 ARRAY['CB16','CB15','CB13','D6K2 XL','D6K2','D3K2 LGP','D4','D5','D6K2 LGP','D4K2 LGP','D5K2 XL','D3K2 XL','D6N LGP','D6N XL','D6N','D4K2 XL','D5K2 LGP','AP500F','AP1055','AP-1055F','AP655F','AP-1000F','AP600F','AP555F','AP1000','PL61','M323F','M320F','M316F','MH3026','M322F','M314F','M318F','815K','815','M315F','M317F','320','323','320 GC','MH3022','MH3024','814K','814','816K','816','962M Z','950M Z','950GC','938M','926M','930M','950M','962M','950 GC'],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/525-6206',
 'Official Cat page confirms Standard Efficiency Fuel Filter, dimensions, materials and compatible model groups. No price or stock imported. Verify exact serial number and arrangement.',
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

update public.part_catalog
set technical_group='فیلتر و مصرفی - فیلتر سوخت',updated_at=now()
where part_number in ('1R-0750','1R-0753')
and technical_group in ('FUEL_FILTER','FUEL_FILTER_ASSEMBLY');