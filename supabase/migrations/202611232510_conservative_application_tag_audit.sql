-- Conservative correction: a page that lists a non-marine fitment does not prove land-only use.
-- Keep the application badge explicitly unverified until Cat confirms exclusive land application.
update public.products
set application_type='UNVERIFIED',
    application_evidence='Marine versus land application is not conclusively established by the checked public Cat page; fitment requires serial-number-specific verification.',
    application_source_url=case when application_source_url is null then 'https://parts.cat.com/' else application_source_url end,
    updated_at=now()
where sku in ('CAT-20R-2510','CAT-20R-5367','CAT-30R-0084','CAT-593-5344','CAT-0R-8200','CAT-9X-3406','CAT-260-3406','CAT-20R-3958')
  and application_type='LAND';
