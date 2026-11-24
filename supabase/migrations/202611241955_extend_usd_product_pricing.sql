UPDATE public.products
SET price_usd = CASE sku
  WHEN '6J-2680' THEN 0.59
  WHEN 'AC30A-03-D' THEN 24.26
  ELSE price_usd
END
WHERE sku IN ('6J-2680','AC30A-03-D');
UPDATE public.products SET price_irr = NULL
WHERE sku IN ('6J-2680','AC30A-03-D');