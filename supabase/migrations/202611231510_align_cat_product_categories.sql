-- Keep all Cat engine-family items under the existing storefront category filters.
-- The 260-3406 coolant hose is an engine cooling component, not a hydraulic hose.
update public.products
set category='قطعات موتور', updated_at=now()
where sku in (
 'CAT-20R-2510','CAT-20R-5367','CAT-30R-0084','CAT-10R-9954',
 'CAT-5N-4504','CAT-7W-0009','CAT-260-3406'
);
update public.products
set category='قطعات برقی', updated_at=now()
where sku='CAT-9X-3406';
