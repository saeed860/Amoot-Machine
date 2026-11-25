-- Add three verified official Cat fuel filter/separator references.
-- Model lists are catalog evidence only; exact serial/arrangement verification remains required.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('500-0481','جداکننده آب و سوخت Cat 500-0481',
 'Cat Ultra High Efficiency Fuel Water Separator; cartridge; diameter 5.732 in; length 10.89 in; flow Out-to-In; polyamide plastic. Official compatible model classes include D6/D7 track-type tractors, 730/735 articulated trucks, C9.3 industrial engine, 349/352/374 excavators, MH3260 material handler, PM620/PM622/PM312/PM313/PM310 cold planers, 834 wheel dozer, 836 landfill compactor and 966/972/980/982/988 wheel loaders.',
 ARRAY['D6','D7','D6XE','D6T','730','730 EJECTOR','735','C9.3','349','395','MH3295','352','350','355','374','3101','352 UHD','MH3260','834','PM620','PM622','PM312','PM313','PM310','836','980 XE','982XE','980XE','966','988 XE','972M','972','972L','972XE','966 GC','966 XE','966XE','980','982','980GC','966L','988','966M','982 XE'],
 'فیلتر و مصرفی - جداکننده آب و سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/500-0481',
 'Official Cat page confirms Ultra High Efficiency fuel-water separator, cartridge, 5.732 in diameter, 10.89 in length, Out-to-In flow, polyamide plastic and compatible model groups. No price or stock imported. Verify exact serial number and arrangement.',
 'REFERENCE'),
('308-7298','جداکننده آب و سوخت با راندمان بالا Cat 308-7298',
 'Cat Advanced Efficiency Fuel Water Separator; spin-on; diameter 3.681 in; length 6.547 in; flow Out-to-In. Official compatible model classes include C4.4/C6.6 engines, IT38H/IT14G integrated toolcarriers, R1300G II load-haul-dump, 420E/430E/450E backhoe loaders, 938H wheel loader, 914G/914G2 compact wheel loaders, TH telehandlers, D3K/D4K/D5K track-type tractors, M313D/M315D/M316D/M318D/M322D wheeled excavators, CW-34 pneumatic compactor and CS/CB/CP vibratory compactors.',
 ARRAY['SPF343C','LC30XX','LC20XX','C4.4DE110E','C6.6','C4.4','C4.4DE88E0','C6.6DE150E','C4.4DE65E3','C4.4DE88E3','C4.4DE110E2','IT38H','IT14G','IT14G2','R1300G II','450E','430E','420E','938H','914G','914G2','TH407C','TH337C','TL943C','D5K LGP','D4K LGP','D5K XL','D3K XL','D4K XL','D3K LGP','M315D','M322D MH','M316D','M313D','M318D MH','CW-34','553C','2470C','CS-64B','CB-54B','CS-56B','CS-68B','CS-44','CP-54B','CP-74B','CP-44','CS-74B','CS-54B','CB-44B','CS-78B','CP-56B','CP-68B','CS-79B'],
 'فیلتر و مصرفی - جداکننده آب و سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/308-7298',
 'Official Cat page confirms Advanced Efficiency Fuel Water Separator, spin-on type, dimensions, flow direction and compatible model groups. No price or stock imported. Verify exact serial number and arrangement.',
 'REFERENCE'),
('276-1804','جداکننده آب و سوخت با راندمان استاندارد Cat 276-1804',
 'Cat Standard Efficiency Fuel Water Separator. Official compatible model classes include C1.1/C1.7/C2.2 engines, 3024/3011C/3013/3014/3054C/C3.3/C1.5/C1.6 industrial engines, LC20XX generator and C4.4/C2.2/C3.3 generator-set families. Official page specifies corrosion preventative fluid and alloy aluminum materials.',
 ARRAY['C1.1','C1.7','C2.2','3024','3011C','3013','3014','3054C','C0.5','3003','3013C','C1.5','C3.3','C1.6','3024C','LC20XX','C4.4DE110E','DE55GC','C2.2DE18E3','C4.4','C2.2 GEN S','C1.1DE9.5','C4.4DE55E2','C3.3 GEN S','D20','DE50GC','XQ35','DE33GC','D25','C4.4DE88E0','C4.4DE65E3','C4.4DE88E3','DE65GC','XQ20T4F','XQP30'],
 'فیلتر و مصرفی - جداکننده آب و سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/276-1804',
 'Official Cat page confirms Standard Efficiency Fuel Water Separator, materials and compatible model groups. No dimensions are stated in the retrieved official page. No price or stock imported. Verify exact serial number and arrangement.',
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

-- Normalize previously imported filter records into the current Persian filter taxonomy.
update public.part_catalog
set technical_group = case
  when part_number in ('500-0480','1R-0755','422-7587','570-1623') then 'فیلتر و مصرفی - فیلتر سوخت'
  when part_number in ('156-1200') then 'فیلتر و مصرفی - جداکننده آب و سوخت'
  else technical_group
end,
updated_at=now()
where part_number in ('500-0480','1R-0755','422-7587','570-1623','156-1200')
and technical_group in ('FILTER / SCREEN','FUEL_FILTER','فیلتر و مصرفی - فیلتر سوخت','فیلتر و مصرفی - جداکننده آب و سوخت');