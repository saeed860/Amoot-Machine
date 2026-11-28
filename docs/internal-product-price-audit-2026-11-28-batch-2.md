# Internal Amoot price audit — 2026-11-28 — batch 2

Internal/admin-only source evidence. Do not expose supplier price basis, FX conversion, source URLs, or multiplier in the public product UI. Public catalog stores only the final Amoot USD price.

Approved Amoot formula: supplier reference price × 1.65, rounded to two decimals. Currency conversion is recorded separately. No freight, customs, taxes, or bank fees are added.

FX reference used: 1 CNY = 0.1502 USD on 2026-11-28 (https://waverate.app/rates/cny-to-usd).

| SKU | Description | Supplier | Supplier amount | USD reference | Amoot USD | Lead time / availability | Condition | Source |
|---|---|---|---:|---:|---:|---|---|---|
| 054-1719 | Hydraulic/transmission oil filter | GearTechSolutions | CNY 277 | 41.61 | 68.65 | 35 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/filters-and-fluids/filters-and-fluids-filters/ |
| 055-1990 | M10x1 rear axle vent | GearTechSolutions | CNY 79 | 11.87 | 19.58 | 35 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/filters-and-fluids/filters-and-fluids-filters/ |
| 067-6987 | Fuel filter | GearTechSolutions | CNY 75 | 11.27 | 18.59 | 5 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/engines/engine-filters-fluids/ |
| 068-7744 | Engine air filter | GearTechSolutions | CNY 268 | 40.25 | 66.42 | 35 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/filters-and-fluids/filters-and-fluids-filters/ |
| 069-3734 | Hydraulic/transmission filter | GearTechSolutions | CNY 100 | 15.02 | 24.78 | 5 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/filters-and-fluids/filters-and-fluids-filters/ |
| 077-3492 | Hydraulic/transmission oil filter | GearTechSolutions | CNY 202 | 30.34 | 50.06 | 5 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/filters-and-fluids/filters-and-fluids-filters/ |
| 077-4517 | Engine air filter, primary | GearTechSolutions | CNY 463 | 69.54 | 114.75 | Lead time TBC; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/hydraulic/hydraulics-pumps-motors-components/hydraulics-pumps-motors-components-other/ |
| 077-5232 | Hydraulic tank breather | GearTechSolutions | CNY 182 | 27.34 | 45.11 | 5 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/filters-and-fluids/filters-and-fluids-filters/ |
| 077-5479 | Hydraulic/transmission filter | GearTechSolutions | CNY 438 | 65.79 | 108.55 | 35 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/filters-and-fluids/filters-and-fluids-filters/ |
| 077-5795 | Hydraulic/transmission oil filter | GearTechSolutions | CNY 725 | 108.90 | 179.68 | 35 days; China/Rest | Not specified by listing | https://shop.geartechsol.com/en/products/spare-parts/filters-and-fluids/filters-and-fluids-filters/ |

## Publication and stock notes
- The source lists prices and supplier lead-time/availability snapshots. They are not Amoot-owned inventory.
- Condition is not specified by the source; do not label these as genuine OEM or aftermarket without separate evidence.
- Reconfirm supplier price, condition and availability before accepting an order.
- The final amounts above were written to `public.products.price_usd`; the supplier basis and evidence remain internal.
