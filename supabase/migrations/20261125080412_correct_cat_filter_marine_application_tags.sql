update public.part_catalog
set application_type='BOTH',
    application_evidence='Exact Cat Parts Store Compatible Models page explicitly lists a Marine Engine group and non-marine machine/engine groups for this part.',
    application_source_url=case part_number
      when '1R-0739' then 'https://parts.cat.com/en/catcorp/product/1R-0739'
      when '1R-0749' then 'https://parts.cat.com/en/catcorp/product/1R-0749'
      when '1R-0751' then 'https://parts.cat.com/en/catcorp/product/1R-0751'
      when '1R-1807' then 'https://parts.cat.com/en/catcorp/product/1R-1807'
      when '1R-1808' then 'https://parts.cat.com/en/catcorp/product/1R-1808'
      when '7W-2326' then 'https://parts.cat.com/en/catcorp/product/7W-2326'
    end,
    updated_at=now()
where part_number in ('1R-0739','1R-0749','1R-0751','1R-1807','1R-1808','7W-2326');

update public.part_catalog
set application_type='LAND',
    application_evidence='Exact Cat Parts Store Compatible Models page lists land machine/engine classes and no Marine application group.',
    application_source_url='https://parts.cat.com/en/catcorp/product/1R-0762',
    updated_at=now()
where part_number='1R-0762';
