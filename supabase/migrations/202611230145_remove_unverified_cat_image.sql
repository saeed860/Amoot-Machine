-- Correct an earlier catalog batch: the 3L-3380 image could not be verified as the exact Cat part image.
-- Do not keep a mismatched product photo. Preserve historical order references if any.
update public.products
set status='INACTIVE', image_url=null, updated_at=now()
where sku='3L-3380'
  and exists (select 1 from public.order_items oi where oi.product_id=products.id);

delete from public.products p
where p.sku='3L-3380'
  and not exists (select 1 from public.order_items oi where oi.product_id=p.id);
