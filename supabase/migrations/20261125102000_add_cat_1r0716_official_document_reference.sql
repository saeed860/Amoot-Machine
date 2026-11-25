-- Official Caterpillar publication cross-check for Off Road candidate 1R-0716.
-- CAT identifies 1R-0716 as a standard-efficiency oil filter and 1R-1808 as an approved upgrade option.
-- Keep this as a reference record; verify exact serial/Arrangement before fitment.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('1R-0716','فیلتر روغن موتور استاندارد Cat 1R-0716',
 'Cat Standard Efficiency Engine Oil Filter. Caterpillar technical publication states that 1R-0716 is an approved upgrade base for Cat Advanced High Efficiency Engine Oil Filter 1R-1808. Cat preventive-maintenance kit documentation lists 1R-0716 for 3176, 3406B/C/E, C10, C12, C15 and C16 engine families.',
 ARRAY['3176','3406','3406B','3406C','3406E','C10','C-10','C12','C-12','C15','C-15','C16','C-16'],
 'فیلتر و مصرفی - فیلتر روغن موتور',
 'Caterpillar official technical publications; Off Road Equipment public popular-parts index',
 'https://s7d2.scene7.com/is/content/Caterpillar/CM20150415-45165-44935',
 'CAT publication: Cat Advanced High Efficiency Engine Oil Filters, published 2015, explicitly lists 1R-0716 as a standard-efficiency oil filter and 1R-1808 as the approved upgrade option. CAT preventive-maintenance kit publication also lists 1R-0716 for 3176/3406B-C-E/C10/C12/C15/C16 applications. Off Road public index lists 1R0716 as FILTER A. This is OEM document evidence, not a serial-specific fitment guarantee. Do not merge the approved upgrade relationship with a claim that all machines can directly substitute without serial/Arrangement check.',
 'REFERENCE')
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,
 source_url=excluded.source_url,source_note=excluded.source_note,
 verification_status='REFERENCE',updated_at=now();
