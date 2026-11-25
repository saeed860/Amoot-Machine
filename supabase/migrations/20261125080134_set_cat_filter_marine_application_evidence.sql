update public.part_catalog
set application_type='BOTH',
    application_evidence='Cat Parts Store Compatible Models explicitly lists a Marine Engine group and multiple non-marine equipment/engine groups for this exact part number.',
    application_source_url='https://parts.cat.com/en/catcorp/product/' || replace(part_number,' ',''),
    updated_at=now()
where part_number in ('1R-0750','326-1644','360-8960');
