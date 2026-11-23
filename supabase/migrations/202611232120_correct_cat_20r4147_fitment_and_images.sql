-- Correct fitment from the official 20R-4147 page and attach verified Cat Scene7 product images.
update public.part_catalog
set engine_models=ARRAY['3408','3412','3412E']::text[],
    compatible_models=ARRAY['3412E']::text[],
    source_note='Official Cat product title identifies the 3408/3412 Reman Fuel Injector, but the official Compatible Models section lists only Marine Engine 3412E. 3408/3412 title wording is retained for search; only 3412E is recorded as explicit compatible fitment. Confirm arrangement and serial before order.',
    updated_at=now()
where part_number='20R-4147';
update public.part_catalog set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/C10869413?fmt=WebP&hei=960&iccembed=0&layer=COMP&op_sharpen=0&op_usm=1%2C1%2C6%2C0&printres=72&qlt=88%2C1&resmode=sharp2&wid=960',updated_at=now() where part_number='20R-4147';
update public.part_catalog set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20210617-6127c-21d85?fmt=WebP&hei=960&iccembed=0&layer=COMP&op_sharpen=0&op_usm=1%2C1%2C6%2C0&printres=72&qlt=88%2C1&resmode=sharp2&wid=960',updated_at=now() where part_number='1P-1120';
