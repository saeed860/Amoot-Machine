-- Attach only exact product images resolved from the official Cat Parts Store product pages.
update public.part_catalog
set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/C10680131?fmt=WebP&hei=960&iccembed=0&layer=COMP&op_sharpen=0&op_usm=1%2C1%2C6%2C0&printres=72&qlt=88%2C1&resmode=sharp2&wid=960',
    updated_at=now()
where brand='Caterpillar' and part_number='0R-0916';

update public.part_catalog
set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20190108-60010-01453',
    updated_at=now()
where brand='Caterpillar' and part_number='20R-0925';

update public.part_catalog
set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20230414-eea25-6b90c',
    updated_at=now()
where brand='Caterpillar' and part_number='0R-0921';
