-- Complete the public C15 directory page-1/page-2 references omitted from the first seed.
insert into public.part_catalog
(part_number,name,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('567-5857','Water Pump Install Kit',ARRAY['C15','C18']::text[],'Cooling & Pumps','Hamkar Tejarat Shayan public catalog','https://htshco.ir/en/brands/caterpillar/parts/series/c15','Public catalog reference; confirm exact engine serial number and Arrangement before fitment.','REFERENCE'),
('620-5615','Cylinder Head Installation Kit',ARRAY['C15']::text[],'Cylinder & Power Pack','Hamkar Tejarat Shayan public catalog','https://htshco.ir/en/brands/caterpillar/parts/series/c15','Public catalog reference; confirm exact engine serial number and Arrangement before fitment.','REFERENCE')
on conflict(part_number) do update set name=excluded.name,engine_models=excluded.engine_models,
technical_group=excluded.technical_group,source_name=excluded.source_name,source_url=excluded.source_url,
source_note=excluded.source_note,verification_status='REFERENCE',updated_at=now();
