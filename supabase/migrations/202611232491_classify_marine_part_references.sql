-- Apply marine labels only to part references whose official Cat listing explicitly identifies sea-water/marine use.
update public.part_catalog
set application_type='MARINE',
    application_evidence='Official Cat Parts Store product listing explicitly identifies a Sea Water Pump.',
    application_source_url=source_url,
    updated_at=now()
where part_number in (
 '20R-7175','627-7250','603-7963','20R-5191','0R-7724','0R-7725','0R-7728',
 '0R-7731','0R-7732','0R-7726','0R-7892','0R-7904','0R-7880','0R-7895',
 '0R-7722','0R-7867'
);

update public.part_catalog
set application_type='MARINE',
    application_evidence='Official Cat product title explicitly identifies a Marine Propulsion engine overhaul kit for 3516B.',
    application_source_url='https://parts.cat.com/en/catcorp/product/10R-9954',
    updated_at=now()
where part_number='10R-9954';

update public.part_catalog
set application_type='MARINE',
    application_evidence='Official Cat product page explicitly identifies Marine Propulsion and Marine Engine 3512B.',
    application_source_url='https://parts.cat.com/en/catcorp/product/20R-0043',
    updated_at=now()
where part_number='20R-0043';

update public.part_catalog
set application_type='BOTH',
    application_evidence='Cat Compatible Models lists Marine Engine 3406B as well as truck, generator-set and industrial 3406B applications.',
    application_source_url='https://parts.cat.com/en/catcorp/product/7W-0009',
    updated_at=now()
where part_number='7W-0009';

update public.part_catalog
set application_type='BOTH',
    application_evidence='Cat page describes a seawater-pump port plate and lists Marine Auxiliary and generator-set/engine applications.',
    application_source_url='https://parts.cat.com/en/catcorp/product/5N-4504',
    updated_at=now()
where part_number='5N-4504';
