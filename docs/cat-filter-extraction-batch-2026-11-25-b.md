# CAT filters extraction batch — 25 Nov 2026 (continued)

## New official CAT catalogue records

| Part number | Official product | Key details | CAT-listed application groups | Storefront |
|---|---|---|---|---|
| 1R-0724 | Fuel Filter Element | Advanced High Efficiency; mixed metal/non-metal | Marine Engine D399, generator and industrial engine families | Added |
| 1R-0740 | Fuel Filter | Standard Efficiency | Marine Engine 3116/3304B plus wheel loaders, track-type tractors, excavators and industrial engines | Added |
| 1R-0751 | Advanced Efficiency Fuel Filter | Spin-on; 3.374 × 7.252 in; Out-to-In | Marine Engine C7/C9/3126/3116 plus broad land equipment list | Existing product enriched; existing price retained |
| 1R-0755 | High Efficiency Fuel Filter | Advanced High Efficiency | Marine Engine/Marine Auxiliary C32 and 3516 families plus mining trucks, dozers, shovels and excavators | Added |
| 1R-0756 | Element Assembly | Cartridge; 3.996 × 9.252 in; Out-to-In | Marine Engine/Marine Auxiliary, generators, industrial engines, locomotive and off-highway truck | Added |
| 1R-0766 | High Efficiency Fuel Filter Element | Advanced High Efficiency | Marine Engine/Marine Auxiliary, generator, locomotive and petroleum engine families | Added |
| 7W-2326 | Engine Oil Filter | Standard Efficiency; spin-on; 3.78 × 6.717 in; Out-to-In | Marine Engine C4.4/3054 plus land machines and generator sets | Existing product enriched; existing price retained |

Official CAT product pages:
- https://parts.cat.com/en/catcorp/product/1R-0724
- https://parts.cat.com/en/catcorp/product/1R-0740
- https://parts.cat.com/en/catcorp/product/1R-0751
- https://parts.cat.com/en/catcorp/product/1R-0755
- https://parts.cat.com/en/catcorp/product/1R-0756
- https://parts.cat.com/en/catcorp/product/1R-0766
- https://parts.cat.com/en/catcorp/product/7W-2326

## Application classification

- `BOTH`: 1R-0724, 1R-0740, 1R-0751, 1R-0755, 1R-0756, 7W-2326 — CAT's public compatible-model lists include a Marine Engine group and land equipment/industrial applications.
- `MARINE`: 1R-0766 — CAT's retrieved list includes Marine Engine and Marine Auxiliary groups, but no land machine group.
- All rows use `verification_status='REFERENCE'`. Official public CAT compatible-model lists are useful discovery evidence, but they are not serial-number/Arrangement-specific SIS confirmation.

## Storefront and data integrity

- Five new product SKUs were inserted: `CAT-1R-0724`, `CAT-1R-0740`, `CAT-1R-0755`, `CAT-1R-0756`, `CAT-1R-0766`.
- Existing `CAT-1R-0751` and `CAT-7W-2326` product records were enriched with official CAT images and fitment evidence; existing prices were preserved.
- New products have NULL USD/IRR prices and stock 0; no prices or inventory were fabricated.
- `public.products` total after this batch: 81.
- The official part-number list in `data/cat-official-part-numbers.txt` was updated to 852 unique identifiers.
- Seven corresponding reference records are present in `public.part_catalog`.

## Sources

CAT product pages above. Public catalogue descriptions, specifications, and compatible-model groups were captured from the official pages; image URLs are Caterpillar Scene7 assets linked from the pages.
