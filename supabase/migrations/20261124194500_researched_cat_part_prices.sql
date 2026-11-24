-- Researched, supplier-backed Amoot USD prices. Source evidence is documented in
-- .github/internal/cat-pricing-research-2026-11-24.md.
-- These are not genuine Cat prices: two are explicitly new aftermarket and one is a
-- supplier-listed replacement with OEM authenticity unverified. No stock is inferred.
BEGIN;
UPDATE public.products SET price_usd=3225.75, brand='Aftermarket', updated_at=now() WHERE sku='CAT-7W-0009';
UPDATE public.products SET price_usd=436.46, brand='Aftermarket', updated_at=now() WHERE sku='CAT-5N-4504';
UPDATE public.products SET price_usd=1.73, brand='Replacement (OEM status unverified)', updated_at=now() WHERE sku='CAT-8T-6765';
COMMIT;
