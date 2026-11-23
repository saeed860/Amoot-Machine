-- Correct image-to-SKU mapping using the individual Cat product image records.
update public.products set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20180403-40956-30715?fmt=WebP&hei=960&wid=960', updated_at=now() where sku='CAT-1R-0749';
update public.products set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20131210-46863-24064?fmt=WebP&hei=960&wid=960', updated_at=now() where sku='CAT-423-8521';
update public.products set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20250918-87984-ae015?fmt=WebP&hei=960&wid=960', updated_at=now() where sku='CAT-151-7737';
update public.products set image_url='https://caterpillar.scene7.com/is/image/Caterpillar/CM20260505-f0464-781c7?fmt=WebP&hei=960&wid=960', updated_at=now() where sku='CAT-189-0202';
