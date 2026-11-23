-- Add additional publicly indexed Caterpillar injector references.
-- Compatibility is limited to model names explicitly listed on each official Cat product page.
-- These records are public catalog references, not serial-specific SIS verification or stock.
insert into public.part_catalog
  (brand,part_number,name,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
  ('Caterpillar','392-0222','Injector Group',
   array['3508B','3508C','3512','3512B','3512C','3516C']::text[],
   'Fuel System','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/392-0222',
   'Official Cat public page identifies an injector group and lists these compatible models. Public reference only; verify exact application/configuration before ordering.',
   'REFERENCE'),
  ('Caterpillar','392-0221','Fuel Injector Group',
   array['3512B','3512C','3516C','3516E']::text[],
   'Fuel System','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/392-0221',
   'Official Cat public page identifies a fuel injector group and lists these compatible models. Public reference only; verify exact application/configuration before ordering.',
   'REFERENCE'),
  ('Caterpillar','392-0216','Injector Group',
   array['3512B','3512C','3516C']::text[],
   'Fuel System','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/392-0216',
   'Official Cat public page identifies an injector group and lists these compatible models. Public reference only; verify exact application/configuration before ordering.',
   'REFERENCE'),
  ('Caterpillar','392-0220','Fuel Pump Injector',
   array['3508','3508B','3508C','3512','3512B','3512C','3516','3516B','3516C']::text[],
   'Fuel System','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/392-0220',
   'Official Cat public page identifies a fuel pump injector and lists these compatible models. Public reference only; verify exact application/configuration before ordering.',
   'REFERENCE'),
  ('Caterpillar','7C-0877','Injector Assembly',
   array['3508','3512','3516']::text[],
   'Fuel System','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/7C-0877',
   'Official Cat public page identifies an injector assembly and lists 3508, 3512 and 3516 model families. Public reference only; verify exact application/configuration before ordering.',
   'REFERENCE'),
  ('Caterpillar','100-3878','Fuel Injector Spring',
   array['3508B','3508C','3512B','3512C','3516B','3516C','3516E']::text[],
   'Fuel System','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/100-3878',
   'Official Cat public page identifies a fuel injector spring and lists these compatible engine models among a broader equipment application list. Public reference only; verify exact application/configuration before ordering.',
   'REFERENCE')
on conflict (part_number) do update set
  name = excluded.name,
  engine_models = (
    select array_agg(distinct model order by model)
    from unnest(part_catalog.engine_models || excluded.engine_models) as t(model)
  ),
  technical_group = excluded.technical_group,
  source_name = excluded.source_name,
  source_url = excluded.source_url,
  source_note = excluded.source_note,
  verification_status = 'REFERENCE',
  updated_at = now();
