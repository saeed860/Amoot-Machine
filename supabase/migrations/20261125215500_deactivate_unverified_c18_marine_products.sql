-- These three C18 marine products were active despite missing serial/arrangement verification.
-- Keep them out of the storefront until Cat SIS effectivity is checked.
UPDATE public.products
SET status = 'INACTIVE'::public.product_status,
    updated_at = now()
WHERE sku IN ('CAT-524-3154','CAT-524-3160','CAT-20R-7175')
  AND status = 'ACTIVE'::public.product_status;
