-- Add official Cat 308-9679 fuel filter and normalize 423-8524 separator group.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('308-9679','فیلتر سوخت با راندمان پیشرفته Cat 308-9679',
 'Cat Advanced Efficiency Fuel Filter. Official compatible model classes include 725C articulated truck; C9.3/C9.3B industrial engines; 12M/12M 2/12M 3/12M 3 AWD/140M 2/140M 3/140M 3 AWD/160M 2/160M 3/160M 3 AWD motor graders; 966K/966K XE/966L/966M/966M XE/972K/972L/972M/972M XE wheel loaders. Cat page describes one-piece can construction, non-metallic center tube, advanced efficiency media, acrylic beads, spiral roving, nylon center tube and molded end caps. Specifications are not yet published.',
 ARRAY['725C','C9.3B','C9.3','140M 3 AWD','12M 3','12M 2','12M 3 AWD','160M 2','160M 3 AWD','160M 3','140M 3','140M 2','972M XE','966L','966K','966M','972K','972M','972L','966K XE','966M XE'],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/308-9679',
 'Official Cat page confirms Advanced Efficiency Fuel Filter and compatible model classes. Specifications are not yet published on the retrieved page. No price or stock imported. Verify exact serial number and arrangement.',
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
where part_number='423-8524' and technical_group='Filters & Service';