-- Ensure Cat attachment references use the product-specific Scene7 assets.
update public.part_catalog set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20220805-4b6e3-5361a?fmt=WebP&hei=960&wid=960', updated_at=now() where part_number='575-2083';
update public.part_catalog set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20230323-1b1b4-84d6d?fmt=WebP&hei=960&wid=960', updated_at=now() where part_number='626-4231';
