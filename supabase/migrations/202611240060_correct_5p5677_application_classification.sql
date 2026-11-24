-- Correct the 5P-5677 reference using the current official Cat Parts Store fitment list.
-- The page identifies 5P-5677 as 18 AWG electrical bulk wire and does not list Marine Engine or Marine Auxiliary.
update public.part_catalog
set name='سیم برق فله‌ای Cat 5P-5677، گیج 18 AWG',
    description='Cat Parts Store identifies 5P-5677 as 18 AWG electrical bulk wire for low-voltage wiring assemblies. The current Compatible Models list includes numerous land machines, generator, vehicular, petroleum and industrial applications; it does not list Marine Engine or Marine Auxiliary.',
    engine_models='{}',
    technical_group='برق و الکترونیک - سیم و کابل',
    source_name='Cat Parts Store',
    source_url='https://parts.cat.com/en/catcorp/product/5P-5677',
    source_note='Official page fitment list reviewed; no Marine Engine or Marine Auxiliary category appears. Land/non-marine applications are explicitly listed.',
    verification_status='REFERENCE',
    application_type='LAND',
    application_evidence='The official Cat Compatible Models list includes land equipment, generator, vehicular, petroleum and industrial applications, and does not list Marine Engine or Marine Auxiliary.',
    application_source_url='https://parts.cat.com/en/catcorp/product/5P-5677',
    updated_at=now()
where part_number='5P-5677';
