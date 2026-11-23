-- Reconcile model-family tags against the page-by-page public C9/C18/C15 directories.
-- These are reference associations only; they do not establish serial-specific OEM fitment.
update public.part_catalog
set engine_models = array_append(engine_models,'C9'),
    updated_at = now()
where part_number in ('030-7946','464-0329','457-6112')
  and not engine_models @> array['C9']::text[];

update public.part_catalog
set engine_models = array_remove(engine_models,'C15'),
    updated_at = now()
where part_number = '343-5527'
  and engine_models @> array['C15']::text[];

insert into public.part_catalog
  (brand,part_number,name,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
  ('Caterpillar','453-2315','Oil Cooler and Lines Gasket Kit',array['C18']::text[],
   'Gaskets & Seals','Hamkar Tejarat Shayan public catalog',
   'https://htshco.ir/en/brands/caterpillar/parts/series/c18?page=5',
   'Public C18 directory reference; verify exact engine serial number and Arrangement before fitment.',
   'REFERENCE')
on conflict (part_number) do update set
  name = excluded.name,
  engine_models = (select array_agg(distinct v order by v) from unnest(part_catalog.engine_models || excluded.engine_models) as t(v)),
  technical_group = excluded.technical_group,
  source_name = excluded.source_name,
  source_url = excluded.source_url,
  source_note = excluded.source_note,
  verification_status = 'REFERENCE',
  updated_at = now();
