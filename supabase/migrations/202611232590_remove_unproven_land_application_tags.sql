-- Do not infer LAND merely because a public Cat page omits marine compatible models.
-- Keep these records internally UNVERIFIED; storefront intentionally suppresses unknown labels.
update public.products
set application_type='UNVERIFIED',
    application_evidence='The checked public Cat page does not establish marine-versus-land exclusivity; no application label is shown until explicit evidence is available.',
    application_source_url=case sku
      when 'CAT-20R-2510' then 'https://parts.cat.com/en/catcorp/product/20R-2510'
      when 'CAT-20R-5367' then 'https://parts.cat.com/en/catcorp/product/20R-5367'
      when 'CAT-30R-0084' then 'https://parts.cat.com/en/catcorp/product/30R-0084'
      when 'CAT-593-5344' then 'https://parts.cat.com/en/catcorp/product/593-5344'
      when 'CAT-0R-8200' then 'https://parts.cat.com/en/catcorp/product/0R-8200'
      when 'CAT-9X-3406' then 'https://parts.cat.com/en/catcorp/product/9X-3406'
      when 'CAT-260-3406' then 'https://parts.cat.com/en/catcorp/product/260-3406'
      when 'CAT-20R-3958' then 'https://parts.cat.com/en/catcorp/product/20R-3958'
    end,
    updated_at=now()
where sku in (
 'CAT-20R-2510','CAT-20R-5367','CAT-30R-0084','CAT-593-5344',
 'CAT-0R-8200','CAT-9X-3406','CAT-260-3406','CAT-20R-3958'
);
