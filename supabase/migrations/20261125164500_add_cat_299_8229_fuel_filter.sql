-- Add official Cat 299-8229 fuel filter and normalize 439-5037 separator group.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('299-8229','فیلتر سوخت با راندمان بالا Cat 299-8229',
 'Cat Ultra High Efficiency Fuel Filter; spin-on; diameter 3.382 in; length 5.728 in; flow Out-to-In; carbon steel; Cat page lists Advanced High Efficiency in the specification field. Official compatible model classes include C4.4/C6.6 engines, 420E/430E/450E backhoe loaders, 928H/938H/930H wheel loaders, D1/D2/D3/D4K/D5K/D6N track-type tractors, R1300G II load-haul-dump, M313D/M315D/M316D/M318D/M322D wheeled excavators, 914G compact wheel loaders, TH407C/TH337C telehandlers, CW-34 pneumatic compactor, and multiple CS/CB/CP vibratory compactors.',
 ARRAY['SPF343C','LC20XX','LC30XX','C6.6','C6.6DE150E','C4.4DE110E','C4.4','C4.4DE88E0','C4.4DE65E3','C4.4DE88E3','C4.4DE110E2','IT14G2','IT38H','IT14G','613G','963D','R1300G II','430E','450E','420E','12M','120M','914G','914G2','TH407C','TH337C','TL943C','928H','928HZ','924HZ','924H','938H','930H','D5K LGP','D2','D1','D3','D4K LGP','D4K2 LGP','D3K2 XL','D4K XL','D5K2 LGP','D3K2 LGP','D5K XL','D5K2 XL','D3K XL','D6N','D4K2 XL','D3K LGP','559','AP-655D','AP-1055E','BG600D','BG555E','AP-1000E','AP-555E','AP-600D','BG655D','AP-500E','BG500E','M315D2','M322D MH','M322D','M318D','M315D','M317D2','M316D','M313D','M318D MH','CW-34','553C','2470C','CP-64','CS-56','CS-54','CB-54B','CS-56B','CS-68B','CP-54','CP-56','CS-44','CB-64','CP-74B','CP-44','CS-54B','CB-54','CS-78B','CS-79B','CS-64B','CP-54B','CS-76','CS-74','CS-74B','CB-44B','CP-76','CP-74','CS-64','CP-56B','CP-68B'],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/299-8229',
 'Official Cat page confirms UHE Fuel Filter, spin-on type, dimensions, material and compatible model groups. The page title says High Efficiency while its text says Ultra High Efficiency and specification field says Advanced High Efficiency; source wording conflict retained in notes. No price or stock imported. Verify exact serial number and arrangement.',
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
set technical_group='فیلتر و مصرفی - جداکننده آب و سوخت',updated_at=now()
where part_number='439-5037';