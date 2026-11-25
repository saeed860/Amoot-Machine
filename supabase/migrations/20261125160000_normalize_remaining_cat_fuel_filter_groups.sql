-- Normalize additional existing Cat fuel filter/separator records into the Persian taxonomy.
update public.part_catalog
set technical_group = case
 when part_number in ('360-8960','1R-0756','525-6205','541-6956') then 'فیلتر و مصرفی - فیلتر سوخت'
 when part_number in ('479-4131') then 'فیلتر و مصرفی - جداکننده آب و سوخت'
 else technical_group end,
 updated_at=now()
where part_number in ('360-8960','1R-0756','479-4131','525-6205','541-6956');