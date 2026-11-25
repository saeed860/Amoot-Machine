# CAT filter verification batch — 25 Nov 2026

This addendum records a further official Cat Parts Store pass. Product-page data is separated from serial-specific fitment: listed compatible-model families are discovery evidence, not a guarantee for every serial number or arrangement.

## Official CAT product pages checked

| CAT part | Official name | Application tag | CAT-listed examples | Status |
|---|---|---|---|---|
| 1R-1808 | Engine Oil Filter, Advanced High Efficiency | BOTH | Marine Engine C32/C9/C18/C12 families; C7/C9/C11/C13/C15 truck engines; D6R and 330D families | Existing storefront product; catalog reference added |
| 1R-0749 | Secondary Fuel Filter, Advanced High Efficiency | BOTH | Marine Engine 3196/C12/C18/3406B/C/E; D6R, 950H and 966H families | Existing storefront product; catalog reference added |
| 326-1644 | Fuel Water Separator | BOTH | Marine Engine 3406B; D6R/D6T, 320D/330D and M325D families | Existing storefront product; catalog reference added |
| 360-8960 | Engine Fuel Filter Element, Ultra High Efficiency | BOTH | Marine Engine C7.1; D6K2, 320D, 420F2 and 950M families | Existing storefront product; catalog reference added |
| 1R-0762 | Engine Fuel Filter, Advanced High Efficiency | LAND | D6R/D7R/D9R, 320D/330D and M325D families; no Marine Engine group shown in retrieved CAT list | Existing storefront product; catalog reference added |
| 571-5253 | Transmission Filter Element Assembly, Advanced High Efficiency | LAND | D6R/D6T/D8/D9 families, 320D2 FM, off-highway trucks and motor graders; no Marine Engine group shown | Product added to storefront; catalog reference added |

Official Cat product pages:
- https://parts.cat.com/en/catcorp/product/1R-1808
- https://parts.cat.com/en/catcorp/product/1R-0749
- https://parts.cat.com/en/catcorp/product/326-1644
- https://parts.cat.com/en/catcorp/product/360-8960
- https://parts.cat.com/en/catcorp/product/1R-0762
- https://parts.cat.com/en/catcorp/product/571-5253

All six public.part_catalog rows use verification_status='REFERENCE', not OEM_VERIFIED. Although the source is Caterpillar's official public product catalog, a model-family listing is not a serial/Arrangement verification. Application tags reflect whether the public CAT Compatible Models section includes a distinct Marine Engine group and at least one land equipment group.

## CAT-published filter upgrade guidance

Caterpillar's filter application guide explicitly lists:
- 1R-0739 (standard efficiency) → 1R-1807 (advanced efficiency)
- 1R-0716 (standard efficiency) → 1R-1808 (advanced efficiency) → 563-8152 (ultra-high efficiency), subject to the guide's footnote that this row is not for 3500 engines.

This is an efficiency-upgrade guide, not a universal interchange instruction. CAT states that filters are selected for system technology and tolerances and recommends checking the Parts Book or SIS2GO for current fitment.

Official CAT guide: https://s7d2.scene7.com/is/content/Caterpillar/CM20231004-c3763-43efb

## Data integrity

- No prices or stock quantities were invented.
- The new storefront SKU is CAT-571-5253; price fields are NULL and stock is 0.
- Existing product records were not duplicated.
- The separate reference catalog contains all six part numbers with CAT product URLs, technical groups, selected compatible model examples, application evidence and official image URLs where available.
- After insertion, public.products total is 76; the six-part reference batch count is 6.
