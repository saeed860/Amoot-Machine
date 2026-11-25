-- Two additional Cat fuel-filter references cross-checked against official Cat product pages.
-- Model-class compatibility only; exact serial/arrangement must be confirmed before sale.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('582-9355','فیلتر ثانویه سوخت Cat 582-9355',
 'Cat Secondary Fuel Filter. Official product page identifies a Cat fuel filter; material: alloy aluminum, polyamide plastic and oil fluid. Compatible-model groups explicitly include C3.6/C2.8 industrial engines, 315 GC excavator, 415/416/420/428/430/432/434/444 backhoe loaders, 906/907/908 wheel loaders, CB7/CB8/CB10 asphalt compactors, AP400/AP455 asphalt pavers and TH telehandlers.',
 ARRAY['C3.6','C2.8','315 GC','415','416','420','420XE','428','430','432','434','444','906','907','908','CB7','CB8','CB10','AP400','AP455','TH1055','TH1255','TH0642','TH0842'],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/582-9355',
 'Official Cat product page confirms Secondary Fuel Filter, Brand Cat, Type Fuel Filter, listed material and compatible model classes. No price or stock imported. Compatibility is model-class evidence only; verify exact serial number and arrangement before ordering.',
 'REFERENCE'),
('346-0523','فیلتر سوخت موتور Cat 346-0523',
 'Cat Standard Efficiency Engine Fuel Filter. Official compatible-model groups include C4.4/C6.6 engine-machine, C6.6 industrial engine, 559 knuckleboom loader, AP-500E/AP-555E/BG500E/BG555E/AP-1000E/AP-1055E asphalt pavers, IT38H integrated toolcarrier, CW-34 pneumatic compactor, R1300G II load-haul-dump, 12M/120M motor graders and 924H/928H/928HZ/930H/938H wheel loaders.',
 ARRAY['C4.4','C6.6','559','AP-500E','AP-555E','BG500E','BG555E','AP-1000E','AP-1055E','IT38H','CW-34','R1300G II','12M','120M','928H','928HZ','938H','924H','930H','924HZ'],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/346-0523',
 'Official Cat page confirms Engine Fuel Filter, Standard Efficiency, Brand Cat and compatible model groups listed in the record. Cat page does not currently publish detailed dimensions/specifications for this part. No price or stock imported. Verify exact serial number and arrangement.',
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
