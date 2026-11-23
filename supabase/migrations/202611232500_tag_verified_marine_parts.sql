-- Evidence-based marine application tagging for official Cat Parts Store references.
-- MARINE = explicit marine engine/auxiliary or seawater-pump application.
-- BOTH = official compatible-model page explicitly includes marine and land/power applications.
update public.part_catalog
set application_type='MARINE',
    application_evidence='Cat part name/description explicitly identifies a Sea Water Pump; marine cooling application is explicit, but exact engine fitment remains unverified.',
    application_source_url=source_url,
    technical_group='موتورهای دریایی - خنک‌کاری و پمپ آب دریا'
where part_number in ('20R-7175','627-7250','603-7963','20R-5191','0R-7724','0R-7725','0R-7728','0R-7731','0R-7732','0R-7726','0R-7892','0R-7904','0R-7880','0R-7895','0R-7722','0R-7867')
  and (name ilike '%sea water%' or description ilike '%sea water%');

update public.part_catalog
set application_type='BOTH',
    application_evidence='Cat Compatible Models explicitly lists Marine Engine/Marine Auxiliary and also Generator Set, Industrial Engine or other land/power applications.',
    application_source_url=source_url,
    technical_group='موتورهای دریایی - قطعات عمومی موتور'
where part_number in ('6J-2680','9Y-0849','302-8728');

-- Marine propulsion top-end kits already sold as products; retain marine evidence on product cards.
update public.products
set application_type='MARINE',
    application_evidence='Cat product description explicitly identifies Marine Propulsion Engine 3516B.',
    application_source_url='https://parts.cat.com/en/catcorp/product/10R-9954',
    category='موتورهای دریایی - کیت‌های تعمیر و سرویس',
    updated_at=now()
where sku='CAT-10R-9954';

update public.products
set application_type='MARINE',
    application_evidence='Cat product description explicitly identifies Marine Propulsion Engine 3512B.',
    application_source_url='https://parts.cat.com/en/catcorp/product/20R-0043',
    category='موتورهای دریایی - کیت‌های تعمیر و سرویس',
    updated_at=now()
where sku='CAT-20R-0043';

-- Marine/land overlap is kept only where Cat's compatible-model page explicitly lists both.
update public.products
set application_type='BOTH',
    application_evidence='Cat Compatible Models lists Marine Engine and Marine Auxiliary as well as industrial/generator and machine applications.',
    application_source_url='https://parts.cat.com/en/catcorp/product/7W-0009',
    category='قطعات موتور - کاربرد مشترک دریا و خشکی',
    updated_at=now()
where sku='CAT-7W-0009';
