# CAT filter extraction batch D — 25 Nov 2026

## Records captured from official Cat Parts Store

| CAT part | Product | Technical details | Application evidence | Storefront |
|---|---|---|---|---|
| 1R-0750 | Advanced Efficiency Secondary Fuel Filter | Spin-on; 3.374 × 7.146 in; Out-to-In | Marine Engine C12/3116/3208/3306/3304B/C9 plus land machines | Existing product enriched with CAT image and fitment evidence |
| 1R-0753 | Advanced Efficiency Fuel Filter Assembly | Advanced High Efficiency; metal/non-metal and carbon steel | ITC, track loaders, backhoe loaders, graders, wheel loaders, excavators, industrial engines; no Marine Engine group shown | Added |
| 244-4484 | Engine Oil Filter | Ultra High Efficiency; spin-on; 5.346 × 12.173 in; Out-to-In | D10/D11, 797/789/777 trucks, 854G wheel dozer, 992G loader, industrial/petroleum engines; no Marine Engine group shown | Added |

Official CAT pages:
- https://parts.cat.com/en/catcorp/product/1R-0750
- https://parts.cat.com/en/catcorp/product/1R-0753
- https://parts.cat.com/en/catcorp/product/244-4484

## Data changes

- Two new storefront SKUs: `CAT-1R-0753`, `CAT-244-4484`.
- Existing `CAT-1R-0750` enriched with official image and BOTH application evidence; existing price/stock preserved.
- New SKUs have NULL USD/IRR prices and stock 0.
- Three CAT part reference rows inserted/updated in `public.part_catalog`, all marked `REFERENCE` rather than `OEM_VERIFIED`.
- `public.products` total after this batch: 85.
- The canonical text list `data/cat-official-part-numbers.txt` was updated with 1R-0753 and 244-4484. A concurrent GitHub update caused one 409 conflict; the file was re-fetched and the update retried successfully.

## Fitment policy

CAT's public compatible-model lists support discovery and preliminary application classification only. They do not guarantee fitment for every serial prefix or arrangement. Final fitment requires the machine serial number and the current Parts Book/SIS record. No price or stock values were inferred.
