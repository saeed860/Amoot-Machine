# CAT engine oil filter extraction — 25 Nov 2026 (batch C)

## Official CAT records added or enriched

| Part number | CAT description | Published details | Fitment evidence | Application |
|---|---|---|---|---|
| 1R-0659 | Engine Oil Filters | Standard Efficiency; 4.004 in diameter × 9.252 in length; cartridge; Out-to-In | D399 Marine Engine; D399/D379B/D398B Gen Set Engine; D398/D398B Industrial Engine | BOTH |
| 1R-0721 | Engine Oil Filter | Standard Efficiency; 5.091 in diameter × 9.0 in length; cartridge; Out-to-In | CAT page explicitly says compatible-model information is unavailable | UNVERIFIED |
| 1R-0716 | Engine Lube Oil Filter | Standard Efficiency; 5.346 in diameter × 12.177 in length; spin-on; Out-to-In | Marine Engine/Marine Auxiliary and extensive land equipment/industrial groups | BOTH |
| 1R-0739 | Standard Efficiency Engine Oil Filter | Standard Efficiency; 4.248 in diameter × 10.122 in length; spin-on; Out-to-In | Marine Engine 3116/3306/3304B and extensive land equipment groups | BOTH |

Official CAT pages:
- https://parts.cat.com/en/catcorp/product/1R-0659
- https://parts.cat.com/en/catcorp/product/1R-0721
- https://parts.cat.com/en/catcorp/product/1R-0716
- https://parts.cat.com/en/catcorp/product/1R-0739

## Important CAT efficiency guidance

CAT's filter application guide lists the progression 1R-0716 (Standard) → 1R-1808 (Advanced) → 563-8152 (Ultra High), and notes an exception for 3500 engines. It also lists 1R-0739 (Standard) → 1R-1807 (Advanced). This is a filtration-efficiency upgrade reference, not a blanket replacement authorization for every machine. Always confirm by machine serial number, arrangement and current Parts Book/SIS.

Official guide: https://s7d2.scene7.com/is/content/Caterpillar/CM20231004-c3763-43efb

## Storefront / database actions

- New product SKUs: `CAT-1R-0659`, `CAT-1R-0721`.
- Existing product entries `CAT-1R-0716` and `CAT-1R-0739` enriched with official CAT image links and marine/land application evidence; existing prices and stock values were not changed.
- Two new products have NULL USD/IRR prices and stock 0.
- Four reference rows were inserted/updated in `public.part_catalog`; all use `verification_status='REFERENCE'`, not `OEM_VERIFIED`.
- Official number list updated to 854 unique identifiers.
- Product count after batch: 83.

## Fitment caveat

CAT public Compatible Models groups are useful for product discovery but do not replace a serial-number/Arrangement-specific SIS check. 1R-0721 remains `UNVERIFIED` because CAT's own public page does not publish compatibility data.
