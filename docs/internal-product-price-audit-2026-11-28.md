# Internal Amoot price audit — 2026-11-28

Internal/admin-only evidence. Do not expose supplier basis, exchange-rate calculation, or multiplier in the public product UI. Public display uses only the final Amoot USD price.

Approved formula: reference price × 1.65, rounded to two decimals. Currency conversion is recorded separately. No freight, customs, tax, or bank fees have been added unless already included in the supplier's displayed amount.

| SKU | Supplier reference | Source amount | FX basis | USD reference | Amoot USD | Price type / condition | Availability snapshot | Source |
|---|---|---:|---|---:|---:|---|---|---|
| 006-7750 | GearTechSolutions | CNY 996.00 | 1 CNY = 0.1502 USD (2026-11-28) | 149.60 | 246.84 | Supplier listing; condition not specified | 5-day lead time; China Rest | https://shop.geartechsol.com/en/products/electrical-electronics/electrical-electronics-sensors-switches/sensors-switches-pressure-sensors/ |
| 033-6031 | GearTechSolutions | CNY 159.00 | 1 CNY = 0.1502 USD (2026-11-28) | 23.88 | 39.40 | Supplier listing; condition not specified; exact 3.53 × 69.44 mm FKM 75A O-ring | 5-day lead time; Moscow/China/Rest | https://shop.geartechsol.com/en/products/hw-seals-consumables/hw-seals-consumables-seals-gaskets-o-rings/seals-gaskets-o-rings-o-rings/ |
| 033-6033 | GearTechSolutions | CNY 39.00 | 1 CNY = 0.1502 USD (2026-11-28) | 5.86 | 9.67 | Supplier listing; condition not specified; exact 1.78 × 12.42 mm FKM 75A O-ring | 5-day lead time; Moscow/China/Rest | https://shop.geartechsol.com/en/products/hw-seals-consumables/hw-seals-consumables-seals-gaskets-o-rings/seals-gaskets-o-rings-o-rings/ |
| 100-4095 | Off Road Equipment public detail | OEM List USD 4,679.33 | USD | 4,679.33 | 7,720.89 | OEM_LIST_FALLBACK; provisional, not supplier acquisition cost | Supplier unit price hidden; not stock confirmation | https://offroadeq.com/parts/1004095 |

## FX evidence
- CNY/USD reference rate on 2026-11-28: 1 CNY = 0.1502 USD — https://waverate.app/rates/cny-to-usd

## Publication rule
Only the final Amoot USD amount is stored in `public.products.price_usd` for storefront display. Source amounts, FX, price type, condition, and URLs remain in this internal audit. Supplier availability is a timestamped snapshot, not Amoot-owned inventory. Reconfirm price and availability before accepting an order.
