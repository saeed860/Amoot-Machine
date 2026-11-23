-- Restore the official C18 gasket-kit reference required by the catalog regression suite.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','453-2315','Oil Cooler and Lines Gasket Kit','Cat marine bundled repair solution for C18 engine overhaul. Prepackaged oil-cooler and lines gasket kit; Cat lists C18 generator-set and marine-engine applications.',ARRAY['C18']::text[],'Engine','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/453-2315','Official Cat product page lists C18 generator-set and marine-engine compatibility; confirm exact serial number and Arrangement before ordering.','REFERENCE','https://caterpillar.scene7.com/is/image/Caterpillar/CM20210818-d8d63-d8491?fmt=WebP&hei=960&wid=960','{}'::jsonb,ARRAY['C18']::text[])
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,source_url=excluded.source_url,
 source_note=excluded.source_note,verification_status='REFERENCE',image_url=excluded.image_url,
 specifications=excluded.specifications,compatible_models=excluded.compatible_models,updated_at=now();
