ALTER TABLE public.products
  ADD COLUMN IF NOT EXISTS price_usd numeric(12,2);

COMMENT ON COLUMN public.products.price_usd IS
  'Amoot public selling reference in USD; source price converted to USD × 1.65. Evidence remains in internal pricing audit documentation.';

UPDATE public.products
SET price_usd = CASE sku
  WHEN 'CAT-136-3742' THEN 1.81
  WHEN 'CAT-151-7737' THEN 123.07
  WHEN 'CAT-1R-0749' THEN 129.57
  WHEN 'CAT-1R-1808' THEN 61.03
  WHEN 'CDQ2B32-25DZ' THEN 74.25
  WHEN 'D1VW001CNJW' THEN 653.91
  WHEN 'SY5120-5LZ-01N' THEN 89.69
  ELSE price_usd
END
WHERE sku IN ('CAT-136-3742','CAT-151-7737','CAT-1R-0749','CAT-1R-1808','CDQ2B32-25DZ','D1VW001CNJW','SY5120-5LZ-01N');

-- USD reference values must never be stored in the IRR checkout column.
UPDATE public.products SET price_irr = NULL
WHERE sku IN ('CAT-136-3742','CAT-151-7737','CAT-1R-0749','CAT-1R-1808','CDQ2B32-25DZ','D1VW001CNJW','SY5120-5LZ-01N');
