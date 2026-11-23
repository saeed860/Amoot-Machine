-- Keep all verified Cat engine fasteners and valve-train parts in the existing homepage engine-parts category.
update public.products
set category = 'قطعات موتور', updated_at = now()
where sku in ('CAT-1L-9049','CAT-0S-1571');
