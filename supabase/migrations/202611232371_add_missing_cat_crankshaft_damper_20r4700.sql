-- Add the thirteenth member omitted from the initial Crankshaft Dampers import.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','20R-4700','Cat Reman Crankshaft Damper','Cat Reman crankshaft damper; Cat Compatible Models explicitly lists vibratory compactor CP-563C and motor grader 120H ES.',ARRAY[]::text[],'Engine Components','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/20R-4700','Complete Crankshaft Dampers category member (1–13 of 13). Compatible Models explicitly lists Vibratory Compactor CP-563C and Motor Grader 120H ES. No engine family is inferred. The Cat product page did not expose a verified primary Scene7 image; omitted.','REFERENCE',null,'{}'::jsonb,ARRAY['CP-563C','120H ES']::text[])
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,source_url=excluded.source_url,
 source_note=excluded.source_note,verification_status='REFERENCE',
 image_url=coalesce(public.part_catalog.image_url,excluded.image_url),
 specifications=excluded.specifications,compatible_models=excluded.compatible_models,updated_at=now();
