-- Official Cat 170mm long-bore piston reference.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','299-5204','170mm Long Bore Engine Piston','Cat piston for 170 mm bore with 14:1 compression ratio; 9.36 in length and 9.1 in height. Cat lists 3516E, 3516B, 3512B and related 3500-family engine applications.',ARRAY['3516E','3516B','3508B','3512B']::text[],'Engine','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/299-5204','Official Cat product page; engine model associations copied from Cat compatible-model listing. Confirm exact serial number and Arrangement before ordering.','REFERENCE','https://caterpillar.scene7.com/is/image/Caterpillar/CM20240517-cf25c-9d29f?fmt=WebP&hei=960&wid=960','{"bore_mm":170,"compression_ratio":"14:1","length_in":9.36,"height_in":9.1}'::jsonb,ARRAY['3516E','3516B','3508B','3512B']::text[])
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,source_url=excluded.source_url,
 source_note=excluded.source_note,verification_status='REFERENCE',image_url=excluded.image_url,
 specifications=excluded.specifications,compatible_models=excluded.compatible_models,updated_at=now();
