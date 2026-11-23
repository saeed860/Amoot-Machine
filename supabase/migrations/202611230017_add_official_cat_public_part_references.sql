-- Add public Cat Parts Store references for the requested 3500/C15/C18 families.
-- These are official public catalog references, not serial-specific SIS verification or inventory.
insert into public.part_catalog
  (brand,part_number,name,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
  ('Caterpillar','447-8618','Element Assembly',
   array['3508','3508B','3508C','3512','3512B','3512C','3516','3516B','3516C','C15','C18']::text[],
   'Filters & Service','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/447-8618',
   'Official public Cat product page lists these compatible models. Public catalog reference only; confirm exact application/configuration before ordering.',
   'REFERENCE'),
  ('Caterpillar','397-4971','Exhaust Manifold',
   array['3512C','3516C']::text[],
   'Turbo & Exhaust','Cat Parts Store (official)',
   'https://parts.cat.com/de/catcorp/product/397-4971',
   'Official public Cat product page lists 3512C and 3516C compatibility. Public catalog reference only; confirm exact application/configuration before ordering.',
   'REFERENCE'),
  ('Caterpillar','375-4809','Tube Assembly',
   array['3512C','3512E','3516C','3516E']::text[],
   'Hoses & Tubes','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/375-4809',
   'Official public Cat product page lists these compatible models. Public catalog reference only; confirm exact application/configuration before ordering.',
   'REFERENCE'),
  ('Caterpillar','127-2176','Carrier Thick Integral Seal Gasket',
   array['3508','3508B','3508C','3512','3512B','3512C','3516','3516B','3516C']::text[],
   'Gaskets & Seals','Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/127-2176',
   'Official public Cat product page lists these compatible models. Public catalog reference only; confirm exact application/configuration before ordering.',
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
