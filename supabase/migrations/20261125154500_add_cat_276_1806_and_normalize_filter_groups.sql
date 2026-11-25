-- Add Cat 276-1806 and normalize existing fuel filters/separators into the Persian taxonomy.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('276-1806','جداکننده آب و سوخت با راندمان استاندارد Cat 276-1806',
 'Cat Standard Efficiency Fuel Water Separator. Official compatible model classes include C1.1/C1.7/C2.2 engines, 3024/3011C/3013/3014/3054C/C3.3/C1.5/C1.6 industrial engines, LC20XX generator, C4.4/C2.2/C3.3 generator-set families and XQ20/XQ35 power modules.',
 ARRAY['C1.1','C1.7','C2.2','3024','3011C','3013','3014','3054C','C0.5','3003','3013C','C1.5','C3.3','C1.6','3024C','LC20XX','C4.4DE110E','DE55GC','C2.2DE18E3','C4.4','C2.2 GEN S','C1.1DE9.5','C4.4DE55E2','C3.3 GEN S','D20','DE50GC','XQ35','DE33GC','D25','C4.4DE88E0','C4.4DE65E3','C4.4DE88E3','DE65GC','XQ20T4F','XQP30','C3.3DE50E0','C1.5DE13.5'],
 'فیلتر و مصرفی - جداکننده آب و سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/276-1806',
 'Official Cat page confirms Standard Efficiency Fuel Water Separator and compatible model groups. The retrieved page does not provide dimensional specifications. No price or stock imported. Verify exact serial number and arrangement.',
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
set technical_group = case
 when part_number in ('1R-0749','1R-0751','1R-0762') then 'فیلتر و مصرفی - فیلتر سوخت'
 when part_number in ('1R-1804','326-1643','326-1644','436-7077','479-4133','523-4987') then 'فیلتر و مصرفی - جداکننده آب و سوخت'
 else technical_group end,
 updated_at=now()
where part_number in ('1R-0749','1R-0751','1R-0762','1R-1804','326-1643','326-1644','436-7077','479-4133','523-4987');