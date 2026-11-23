-- These four SKUs were verified on Cat's official Engine Components category listing, not a separately captured product-detail page.
update public.part_catalog
set source_url='https://parts.cat.com/en/catcorp/category/engine-components',
    source_note=source_note || ' Source is the official Cat Engine Components category listing; no individual product detail URL was verified in this extraction.',
    updated_at=now()
where part_number in ('0R-9737','107-7330','523-8663','593-2027');
