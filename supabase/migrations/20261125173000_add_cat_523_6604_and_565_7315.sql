-- Add two official Cat fuel filtration references.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('523-6604','جداکننده آب و سوخت با راندمان پیشرفته Cat 523-6604',
 'Cat Advanced Efficiency Fuel Water Separator. Official Cat description states it removes virtually all free water and 90% of emulsified water, with smaller contaminants, helping extend fuel-filter and injector life. Material: polyamide plastic; efficiency category: Advanced High Efficiency. Compatible model classes include CW16 asphalt compactor; D1/D2/D3 track-type tractors; AP400/AP455/AP655 asphalt pavers; M313/M314/M315/M317/M319 wheeled excavators; C2.8/C3.6/C4.4 industrial engines; CS/CP soil and vibratory compactors; 312/313/316/317/318/321/322 excavators; 416/420 backhoe loaders; TH telehandlers.',
 ARRAY['CW16','D1','D2','D3','AP455','AP655','AP400','M313-07','M314-07','M314','M315','M319','M317','C4.4','C2.8','C3.6','CS12 GC','CP13 GC','CS13','CS13 GC','CS10 GC','CP12 GC','CP11','CP13','CS11 GC','313 GX','316 GC','313 GC','316 GX','312 GX','317','313','312 GC','321','318 GC','322','416','420','CS512 GC','CS7','CP7','CP11 GC','TH1055','TH1255','TH3510','TH0642','TH0842','TH357','TH408'],
 'فیلتر و مصرفی - جداکننده آب و سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/523-6604',
 'Official Cat page confirms Advanced Efficiency Fuel Water Separator, polyamide material, Advanced High Efficiency category and listed compatible model groups. No price or stock imported. Verify exact serial number and arrangement.',
 'REFERENCE'),
('565-7315','فیلتر سوخت ثانویه Cat 565-7315',
 'Cat Secondary Fuel Filter. Official compatible model classes include D1/D2/D3 track-type tractors; M313-07/M314-07/M314/M315 wheeled excavators; C2.8/C3.6 industrial engines; CS/CP soil and vibratory compactors; 312/313/316 GX/GC excavators; TH1055/TH1255/TH3510/TH0642/TH0842/TH408/TH357 telehandlers. Material listed as oil fluid; Cat does not publish efficiency or dimensions on the retrieved page.',
 ARRAY['D2','D1','D3','M313-07','M314','M315','M314-07','C3.6','C2.8','CS10 GC','CP12 GC','CS12 GC','CP11','CP13','CP13 GC','CS13','CS13 GC','CS11 GC','313 GX','316 GC','313 GC','316 GX','312 GX','312 GC','CP7','CP11 GC','CS512 GC','CS7','TH1055','TH1255','TH3510','TH0642','TH0842','TH408','TH357'],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/565-7315',
 'Official Cat page confirms Secondary Fuel Filter, listed compatible model groups and Oil Fluid material. Efficiency category and dimensions are not published on the retrieved page. No price or stock imported. Verify exact serial number and arrangement.',
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