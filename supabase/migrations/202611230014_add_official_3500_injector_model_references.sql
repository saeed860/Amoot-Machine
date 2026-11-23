-- Add official Cat Parts Store application data for injector groups in the 392-02xx family.
-- These are official model listings, but exact equipment fitment still depends on serial/Arrangement.
update public.part_catalog
set name='Injector Group - Cat Fuel Injector',
    engine_models=array['3508B','3512','3512B','3516B']::text[],
    source_name='Cat Parts Store (official)',
    source_url='https://parts.cat.com/en/catcorp/product/392-0200',
    source_note='Official Cat Parts Store compatible-model list includes 3512B, 3508B and 3516B. Generic 3512 tag is a search-family alias only. Verify exact serial number and Arrangement.',
    verification_status='REFERENCE', updated_at=now()
where part_number='392-0200';

update public.part_catalog
set name='Injector Group - Cat Fuel Injector',
    engine_models=array['3508B','3512','3512B','3516B']::text[],
    source_name='Cat Parts Store (official)',
    source_url='https://parts.cat.com/en/catcorp/product/392-0206',
    source_note='Official Cat Parts Store compatible-model list includes 3512B, 3508B and 3516B. Generic 3512 tag is a search-family alias only. Verify exact serial number and Arrangement.',
    verification_status='REFERENCE', updated_at=now()
where part_number='392-0206';

update public.part_catalog
set name='Injector Group - Cat Fuel Injector',
    engine_models=array['3508','3508B','3512','3512B','3516','3516B']::text[],
    source_name='Cat Parts Store (official)',
    source_url='https://parts.cat.com/en/catcorp/product/392-0214',
    source_note='Official Cat Parts Store compatible-model list includes 3512, 3512B, 3508, 3508B, 3516 and 3516B. This is not a CB-specific statement. Verify exact serial number and Arrangement.',
    verification_status='REFERENCE', updated_at=now()
where part_number='392-0214';

-- Official Cat listings explicitly identify C-series models separately from B-series.
insert into public.part_catalog
(part_number,name,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('392-0205','Fuel Pump Injector',ARRAY['3512C','3516C']::text[],'Fuel System','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/392-0205','Official Cat Parts Store compatible-model list includes 3512C and 3516C. Do not interpret this as a 3512CB or 3516CB listing; verify exact serial number and Arrangement.','REFERENCE'),
('392-0219','Fuel Pump Injector',ARRAY['3508C','3512C','3516C']::text[],'Fuel System','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/392-0219','Official Cat Parts Store compatible-model list includes 3508C, 3512C and 3516C. Do not interpret this as a 3512CB or 3516CB listing; verify exact serial number and Arrangement.','REFERENCE')
on conflict(part_number) do update set
 name=excluded.name,
 engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,
 source_name=excluded.source_name,
 source_url=excluded.source_url,
 source_note=excluded.source_note,
 verification_status='REFERENCE', updated_at=now();
