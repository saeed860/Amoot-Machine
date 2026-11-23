-- Correct the descriptive label for the 2W-6290 reference using its official Cat product page.
update public.part_catalog
set name='15.88mm OD Secondary Fuel Filter Tube',
    description='Cat Secondary Fuel Filter Tube directs filtered fuel from the secondary fuel filter to the engine.',
    technical_group='موتورهای دریایی - فیلتر و خطوط سوخت',
    source_note='Official Cat Parts Store product title, description and Compatible Models sections reviewed; no serial-specific fitment inferred.',
    source_url='https://parts.cat.com/en/catcorp/product/2W-6290',
    application_type='BOTH',
    application_evidence='Official Compatible Models lists Marine Engine and Marine Auxiliary alongside generator, industrial, engine, petroleum and other applications.',
    application_source_url='https://parts.cat.com/en/catcorp/product/2W-6290',
    updated_at=now()
where part_number='2W-6290';
