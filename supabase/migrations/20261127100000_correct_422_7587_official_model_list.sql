-- Ensure the official Cat 422-7587 secondary fuel-filter reference is present in fresh CI databases.
-- Public model listings are reference evidence only; serial/arrangement fitment must still be checked.
insert into public.part_catalog
  (brand, part_number, name, description, engine_models, technical_group,
   source_name, source_url, source_note, verification_status, is_active,
   source_accessed_at, specifications, compatible_models, application_type,
   application_evidence, application_source_url)
values
  ('Caterpillar',
   '422-7587',
   'Secondary Fuel Filter',
   'Cat Ultra High Efficiency secondary fuel filter. Diameter 5.358in, length 12.181in, flow direction Out-to-In, carbon-steel Spin-On body. Official public compatible-model listing includes AD63, SR500/SR4B, C175-20/C175-16, C27/C32/C32B, 3512B/3512/3512C/3516C, mining trucks, wheel dozers, loaders, shovels, D10/D11 and MD6250/MD6310 drills.',
   array['C32','C32B','C32 MARINE','C27','3512','3512B','3512C','3516C','AD63','789G','777G','D10T2','D11T','6040','990K']::text[],
   'Filters & Service',
   'Cat Parts Store (official)',
   'https://parts.cat.com/en/catcorp/product/422-7587',
   'Official Cat Parts Store page identifies this as a Secondary Fuel Filter, Ultra High Efficiency. Listed models include Engine 3512B and Petroleum Engine 3512/3512C/3516C. This is public catalog evidence, not serial-specific fitment approval.',
   'REFERENCE',
   true,
   now(),
   '{"diameter_in":5.358,"length_in":12.181,"flow_direction":"Out-to-In","material":"Carbon Steel","efficiency":"Ultra High Efficiency","filter_type":"Spin-On"}'::jsonb,
   array['AD63','SR500','SR4B','DE1400','C175-20','C175-16','DE1250','C175-16GENSET','C27','C32','D1500','C32B','DE1500','DE1250S','C32 MARINE','C32 INDUSTRIAL','C32B INDUSTRIAL','C27 INDUSTRIAL','3512B','3512','3512C','3516C','844','854','854K','844K','789G','777G','777','775','789D','773','793F','798 AC','796 AC','785D','794 AC','789','785','793','798','24','RC20','990K','990','993','992','993K','992K','6040 FS','6030 T4','6020B','6030 T2','6015B','6020','6015','D10T2','D10','D11','D10N','D10R','D10T','D11R','D11T','MD6250','MD6310','C32B MARINE','TH48-E70','CX35-P800']::text[],
   'UNVERIFIED',
   'Official Cat Parts Store compatible-model listing; exact serial/arrangement fitment still requires Cat SIS/dealer verification.',
   'https://parts.cat.com/en/catcorp/product/422-7587')
on conflict (part_number) do update set
  name = excluded.name,
  description = excluded.description,
  engine_models = excluded.engine_models,
  technical_group = excluded.technical_group,
  source_name = excluded.source_name,
  source_url = excluded.source_url,
  source_note = excluded.source_note,
  verification_status = excluded.verification_status,
  is_active = true,
  source_accessed_at = now(),
  specifications = excluded.specifications,
  compatible_models = excluded.compatible_models,
  application_type = excluded.application_type,
  application_evidence = excluded.application_evidence,
  application_source_url = excluded.application_source_url,
  updated_at = now();
