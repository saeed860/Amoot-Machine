# CAT screen and filter extraction — 2026-11-25 (T)

## Official CAT Parts Store records

Six additional CAT product records were captured from official product pages and inserted/upserted into `public.part_catalog` and `public.products`.

| CAT part number | Product | Captured specifications | Compatible models / application |
|---|---|---|---|
| 396-9124 | 164 mm hydraulic screen element | 3.563 in diameter × 6.457 in length; carbon steel; Out-to-In | MD6380, MD6250, MD6200, MD6310; 854/854K; 994F/K/H, 995, 993K, 992K, 993, 992. LAND |
| 104-3895 | High-pressure oil filter screen | 200 micron; 7.008 in length × 3.465 in diameter; Out-to-In; -30°C to 100°C | D11R/T, 5110B, 5130B, 5230, 5130, 844/854 family, 994/992/990 family, 6015B/6015. LAND |
| 8S-9129 | Transmission magnetic filter | 2.472 in diameter × 3.587 in length; alloy aluminum; standard-efficiency hydraulic/transmission filter | AD22, CX35/CX31/CX28, graders, track-type tractors, loaders, backhoes and other listed equipment. LAND; no explicit marine transmission designation found. |
| 534-8305 | Hydraulic screen oil filter | 3.15 in diameter × 6.693 in length; steel/carbon steel; Out-to-In | Hydraulic Shovel 6060 and 6030. LAND |
| 328-5972 | Hydraulic protection filter screen | 250 micron; 4.0 in diameter × 5.252 in length; In-to-Out; 6000 PSIG / 41 MPa maximum pressure; 103 GPM / 389 LPM rated flow | Truck 797F and 797B. LAND |
| 6E-5066 | Hydraulic screen | Stainless-steel mesh, 60 mesh; 230 micron particle retention; 9/16-18 thread; 0.591 in diameter × 1.024 in length; In-to-Out | Official compatible-model list explicitly includes C32 MARINE ENGINE as well as land equipment. BOTH |

### Official source URLs

- https://parts.cat.com/en/catcorp/product/396-9124
- https://parts.cat.com/en/catcorp/product/104-3895
- https://parts.cat.com/en/catcorp/product/8S-9129
- https://parts.cat.com/en/catcorp/product/534-8305
- https://parts.cat.com/en/catcorp/product/328-5972
- https://parts.cat.com/en/catcorp/product/6E-5066

## Verification and pricing

- All six were inserted/upserted in `public.part_catalog` and `public.products`.
- Compatibility status: `NEEDS_SERIAL_CHECK`; model lists are the official page's compatible-model data, not a substitute for serial-number / arrangement validation.
- Application type: five LAND, one BOTH (6E-5066), because the CAT page explicitly lists C32 MARINE ENGINE.
- No price or inventory was inferred: new rows have `price_usd=NULL`, `price_irr=NULL`, `stock=0`.
- Product category mapping keeps all six under the homepage parent category `فیلترها`, with hydraulic / lubrication subcategories.
- No third-party cross-reference was inferred from adjacent diagram numbers.
