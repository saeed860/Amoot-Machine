-- Additional official Cat C9/C9.3 and C15 fuel/turbo references from public product pages.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models)
values
('Caterpillar','460-8213','Common Rail Fuel Injector','Cat common-rail fuel injector specifically identified for C9/C9.3 engines.',ARRAY['C9','C9.3']::text[],'Fuel System','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/460-8213','Official Cat product title explicitly identifies this as a Common Rail Fuel Injector for C9/C9.3 engines. Exact arrangement/serial fitment still requires confirmation.','REFERENCE',null,'{}'::jsonb,ARRAY['C9','C9.3']::text[]),
('Caterpillar','432-0153','Basic Turbocharger Group','Cat basic turbocharger group; Cat states its turbochargers are performance-tested and matched to the engine.',ARRAY['C15','C9']::text[],'Turbo System','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/432-0153','Official Cat compatible-model list includes Generator Set C15/C9 and Industrial Engine C15.','REFERENCE',null,'{}'::jsonb,ARRAY['C15','C9']::text[]),
('Caterpillar','216-7815','Turbocharger Group','Cat turbocharger group for C-9 industrial engine applications.',ARRAY['C9','C-9']::text[],'Turbo System','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/216-7815','Official Cat compatible-model list explicitly includes Engine-Machine C-9 and Industrial Engine C-9.','REFERENCE',null,'{"length_in":15.6,"height_in":17.0}'::jsonb,ARRAY['C-9']::text[])
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,source_url=excluded.source_url,
 source_note=excluded.source_note,verification_status='REFERENCE',
 image_url=coalesce(public.part_catalog.image_url,excluded.image_url),
 specifications=excluded.specifications,compatible_models=excluded.compatible_models,updated_at=now();
