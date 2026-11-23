-- Attach directly verified Cat Scene7 product images captured from the official Cat Parts Store pages.
update public.part_catalog
set image_url = 'https://caterpillar.scene7.com/is/image/Caterpillar/C10869416?fmt=WebP&hei=960&iccembed=0&layer=COMP&op_sharpen=0&op_usm=1%2C1%2C6%2C0&printres=72&qlt=88%2C1&resmode=sharp2&wid=960',
    updated_at = now()
where part_number = '7E-6408'
  and source_url = 'https://parts.cat.com/en/catcorp/product/7E-6408';

update public.part_catalog
set image_url = 'https://caterpillar.scene7.com/is/image/Caterpillar/C10539025?fmt=WebP&hei=960&iccembed=0&layer=COMP&op_sharpen=0&op_usm=1%2C1%2C6%2C0&printres=72&qlt=88%2C1&resmode=sharp2&wid=960',
    updated_at = now()
where part_number = '352-0210'
  and source_url = 'https://parts.cat.com/en/catcorp/product/352-0210';
