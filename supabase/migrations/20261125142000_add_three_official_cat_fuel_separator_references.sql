-- Three more Cat filter/separator references cross-checked against official Cat product pages.
-- Compatibility is model-class evidence only; exact serial/arrangement must be confirmed.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('540-5119','المنت جداکننده آب و سوخت Cat 540-5119',
 'Cat Ultra High Efficiency Fuel-Water Separator Element; cartridge; diameter 3.209 in; length 7.35 in; flow Out-to-In; polyamide plastic. Official compatible-model groups include C3.6/C2.8 industrial engines, 315 GC excavator, 415/416/420/428/430/432/434/444 backhoe loaders, 906/907/908 wheel loaders, CB7/CB8/CB10 asphalt compactors, AP400/AP455 asphalt pavers and TH telehandlers.',
 ARRAY['C3.6','C2.8','315 GC','415','416','420','420XE','428','430','432','434','444','906','907','908','CB7','CB8','CB10','CW16','AP400','AP455','TH1055','TH1255','TH0642','TH0842','275','255','285','265','260','250','270','CS5'],
 'فیلتر و مصرفی - جداکننده آب و سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/540-5119',
 'Official Cat page confirms Ultra High Efficiency Fuel Water Separator, cartridge type, dimensions, flow direction, material and compatible model groups. No price or stock imported. Verify exact serial number and arrangement.',
 'REFERENCE'),
('243-6411','فیلتر پمپ انتقال سوخت Cat 243-6411',
 'Cat Standard Efficiency Fuel Transfer Pump Filter. Official compatible-model groups include C1.1/C1.7 engines, C2.2/C0.5/C1.5/C0.7/C1.6 industrial engines, 3011C/3013C/3024C industrial engines and CB/CC compactor families.',
 ARRAY['C1.1','C1.7','C2.2','C0.5','C1.5','C0.7','C1.6','3011C','3013C','3024C','CB22B','CB-22B','CB4.4','CB4.0','CC-34B','CC-24B','CB-34B XW','CB-24B','CB-32B','CB-36B','CC4.0'],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/243-6411',
 'Official Cat page identifies Fuel Transfer Pump Filter, Standard Efficiency, Brand Cat, Carbon Steel and corrosion-preventative fluid material, and compatible compactor/engine classes. Do not confuse this with a general engine spin-on filter. No price or stock imported. Verify exact serial/arrangement.',
 'REFERENCE'),
('565-4266','المنت جداکننده آب و سوخت Cat 565-4266',
 'Cat Ultra High Efficiency Fuel Water Separator; cartridge; diameter 3.291 in; length 6.902 in; flow Out-to-In; polyphthalamide (PPA) plastic. Official compatible-model groups include C1.7 industrial engine, C2.2/C1.7 engines, and CB2.5/CB2.7/CB2.9/CC2.7/CB4.0/CC4.0/CB4.4 compactor families.',
 ARRAY['C1.7','C2.2','CB2.7','CB2.5','CC2.7','CB2.9','CB4.0','CC4.0','CB4.4'],
 'فیلتر و مصرفی - جداکننده آب و سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/565-4266',
 'Official Cat page confirms Ultra High Efficiency Fuel Water Separator, cartridge type, dimensions, flow direction, material and compatible model classes. Related display of 363-5819 is not treated as direct interchange or supersession. No price or stock imported. Verify exact serial/arrangement.',
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
