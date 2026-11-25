# CAT marine engine parts extraction — 2026-11-25 (Y)

This is the 27-record checkpoint batch (combined with batches W and X, 50 product records were processed in this extraction cycle). All records below were inserted/upserted in `public.part_catalog` and `public.products`.

| Part number | Product | Key specifications / fitment | Application |
|---|---|---|---|
| 6I-0047 | Exhaust manifold | 3512 marine engine; 3512B marine auxiliary; generator and industrial variants | BOTH |
| 6I-0046 | Exhaust manifold | 76.5 in length × 15 in height; alloy/structural steel; 3512 marine engine and 3512B marine auxiliary; generator/industrial fitments | BOTH |
| 596-9253 | Aftercooler | Alloy aluminum; C32 MARINE ENGINE | MARINE |
| 5L-5993 | Engine oil pump | Plastic material field; D379A/B and D398A/B marine, D379/D398 industrial | BOTH |
| 622-8814 | Aftercooler | Alloy copper; C175-16 marine and generator/industrial variants | BOTH |
| 489-5361 | Exhaust manifold | 3516B/3516C/3512C marine; 3512C/3516C marine auxiliary; generator/industrial uses | BOTH |
| 230-8163 | Engine exhaust manifold | 350 kPa air pressure; 3516B/C, 3512B/C/E and other marine engine/auxiliary fitments; industrial and locomotive uses | BOTH |
| 7E-0429 | Aftercooler core | 3208 marine engine | MARINE |
| 448-8710 | 24V electric starting motor | C8.7 marine engine | MARINE |
| 100-3146 | Cast-iron exhaust manifold | 10.76 in height × 5.71 in length × 7.06 in width; extensive 3512/3516/3508 marine and auxiliary fitments | BOTH |
| 6N-5960 | Aftercooler | CAT has not yet added a detailed description; Oil Fluid material field; marine and auxiliary fitments include D333C, 3412, 3508, 3306, 3306B, 3608 | BOTH |
| 303-8551 | Aftercooler | Alloy aluminum; C9 marine engine | MARINE |
| 162-8865 | Exhaust manifold | 300 kPa air pressure; marine, marine auxiliary, generator and industrial model groups | BOTH |
| 619-1782 | Engine oil pump | C175-16 marine engine; mining truck / off-highway truck models also listed | BOTH |
| 176-3228 | Aftercooler core assembly | 3508B and 3516B marine engines | MARINE |
| 364-8268 | Aftercooler | Alloy aluminum; C32B and C32 marine engines | MARINE |
| 473-2336 | Engine exhaust manifold | 300 kPa air pressure; 3516C and 3512C marine engines | MARINE |
| 6I-0048 | Water-cooled exhaust manifold | Structural/alloy steel; 3516 marine and generator/industrial uses | BOTH |
| 415-5863 | Exhaust manifold | 3516B/C, 3512B/C, 3516 and 3512 marine engines; marine auxiliary variants | BOTH |
| 105-7573 | Fuel transfer pump | 12-tooth helical gear; 3412 and 3408B marine engines; generator/industrial variants | BOTH |
| 245-4622 | Aftercooler core | 279×1171×152 mm; fluid-to-air; 60 mm male fittings; structural steel; marine and auxiliary 3512/3516 variants | BOTH |
| 322-1347 | Aftercooler core | Carbon steel; 4,165 kg/h air flow; 500 L/min water flow; 400 kPa water leak test; C18 marine engine | MARINE |
| 349-7034 | Aftercooler core | 660×303×261 mm; copper/brass/bronze; 82.1 mm male fittings; C32 marine engine | MARINE |
| 415-5964 | Engine exhaust manifold | 3516C/3512C marine engine and 3512C marine auxiliary; industrial fitment also listed | BOTH |
| 577-4342 | Aftercooler core | Alloy copper; 3126B and C7 marine engines; C7 power-package/petroleum fitment | BOTH |
| 278-6038 | Sea-water / sea-air aftercooler core assembly | Copper core; 28.48×11.26×4.9 in; 3126 marine engine | MARINE |
| 7C-1190 | Fuel transfer pump | 3.6 in length × 4.2 in height; carbon steel; 3616/3612 marine engine and 3608 marine auxiliary | BOTH |

## Official CAT sources

- https://parts.cat.com/en/catcorp/product/6I-0047
- https://parts.cat.com/en/catcorp/product/596-9253
- https://parts.cat.com/en/catcorp/product/5L-5993
- https://parts.cat.com/en/catcorp/product/622-8814
- https://parts.cat.com/en/catcorp/product/489-5361
- https://parts.cat.com/en/catcorp/product/230-8163
- https://parts.cat.com/en/catcorp/product/7E-0429
- https://parts.cat.com/en/catcorp/product/448-8710
- https://parts.cat.com/en/catcorp/product/100-3146
- https://parts.cat.com/en/catcorp/product/6N-5960
- https://parts.cat.com/en/catcorp/product/303-8551
- https://parts.cat.com/en/catcorp/product/162-8865
- https://parts.cat.com/en/catcorp/product/619-1782
- https://parts.cat.com/en/catcorp/product/176-3228
- https://parts.cat.com/en/catcorp/product/364-8268
- https://parts.cat.com/en/catcorp/product/473-2336
- https://parts.cat.com/en/catcorp/product/6I-0048
- https://parts.cat.com/en/catcorp/product/415-5863
- https://parts.cat.com/en/catcorp/product/105-7573
- https://parts.cat.com/en/catcorp/product/245-4622
- https://parts.cat.com/en/catcorp/product/322-1347
- https://parts.cat.com/en/catcorp/product/349-7034
- https://parts.cat.com/en/catcorp/product/415-5964
- https://parts.cat.com/en/catcorp/product/577-4342
- https://parts.cat.com/en/catcorp/product/278-6038
- https://parts.cat.com/en/catcorp/product/7C-1190

## Data quality and commercial status

- Marine application labels are grounded in CAT's explicit `MARINE ENGINE` and/or `MARINE AUXILIARY` compatible-model groups. Where industrial, generator, truck or other non-marine uses are also listed, the record is marked `BOTH`.
- Product fitment is `NEEDS_SERIAL_CHECK`; validate engine serial number, arrangement, and supersession before quoting or ordering.
- No price or stock was inferred. New rows use `price_usd=NULL`, `price_irr=NULL`, `stock=0`.
- Category values are engine-system families (cooling, exhaust, lubrication, fuel, electrical/start); frontend parent/child grouping should keep these under the correct product family rather than one flat list.
