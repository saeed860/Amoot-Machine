-- Complete official Cat Engine Overhaul Kits category (3/3).
-- All entries are reference-only; discontinued status is explicitly preserved in notes.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','20R-0651','Cat Reman Platinum Engine Overhaul Kit (3126B)','Cat Reman 3126B (16.1:1 compression ratio) Platinum overhaul kit. Official description lists piston packs, cylinder block and head, injector pump, gerotor pump and fuel injectors. Cat Compatible Models explicitly lists Truck Engine 3126E.',ARRAY['3126B','3126E']::text[],'Engine Overhaul Kits','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/20R-0651','Complete official Engine Overhaul Kits category member (1–3 of 3). Active Cat Reman reference. No price, stock or unverified image supplied.','REFERENCE',null,'{}'::jsonb,ARRAY['3126E']::text[]),
('Caterpillar','356-1448','KIT-ENGINE OVERHAUL (SILVER)','Heavy Duty Precious Metals Silver Overhaul Kit. Official Cat description identifies an in-frame kit including bronze kit plus six pistons, liners, wrist pins, rings and retainers. Compatible Models explicitly lists Truck Engine C15.',ARRAY['C15']::text[],'Engine Overhaul Kits','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/356-1448','Complete official Engine Overhaul Kits category member (1–3 of 3). Official Cat Compatible Models lists C15. No price, stock or unverified image supplied.','REFERENCE',null,'{}'::jsonb,ARRAY['C15']::text[]),
('Caterpillar','435-1295','Engine Arrangement-Complete','Cat Complete Engine Arrangement. Official description identifies a C7 engine arrangement with 115 A brush-type alternator and PA90L starter. Compatible Models lists Excavator 329D and 329D L. Cat marks this item discontinued.',ARRAY['C7']::text[],'Engine Overhaul Kits','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/435-1295','Complete official Engine Overhaul Kits category member (1–3 of 3). Discontinued per Cat; retained as historical reference only. No price, stock or unverified image supplied.','REFERENCE',null,'{}'::jsonb,ARRAY['329D','329D L']::text[])
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,
 source_name=excluded.source_name,source_url=excluded.source_url,source_note=excluded.source_note,
 technical_group=excluded.technical_group,verification_status='REFERENCE',
 engine_models=case when cardinality(public.part_catalog.engine_models)=0 then excluded.engine_models else public.part_catalog.engine_models end,
 compatible_models=case when cardinality(public.part_catalog.compatible_models)=0 then excluded.compatible_models else public.part_catalog.compatible_models end,
 updated_at=now();
