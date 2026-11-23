-- Add OEM image and structured technical details to the searchable reference catalog.
alter table public.part_catalog
  add column if not exists image_url text,
  add column if not exists specifications jsonb not null default '{}'::jsonb,
  add column if not exists compatible_models text[] not null default '{}';

-- Public Cat Parts Store reference: exact part image, dimensions and listed model fitment.
update public.part_catalog
set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20231128-59fa0-8c001?fmt=WebP&hei=960&iccembed=0&layer=COMP&op_sharpen=0&op_usm=1%2C1%2C6%2C0&printres=72&qlt=88%2C1&resmode=sharp2&wid=960',
    specifications='{"length":{"value":14.8,"unit":"in"},"height":{"value":3.0,"unit":"in"},"description":"Cat fuel injector"}'::jsonb,
    compatible_models=array['3508B','3512B','3516B']::text[],
    technical_group='Fuel system · Injector group',
    source_name='Cat Parts Store (official)',
    source_url='https://parts.cat.com/en/catcorp/product/392-0217',
    source_note='Cat Parts Store lists 3508B, 3512B and 3516B in compatible-model groups. Dimensions: length 14.8 in, height 3.0 in. Verify engine serial number and Arrangement before ordering.',
    verification_status='REFERENCE',
    updated_at=now()
where part_number='392-0217';
