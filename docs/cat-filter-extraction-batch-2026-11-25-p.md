# CAT filter and fluid-system extraction — 2026-11-25 (P)

## Official CAT Parts Store records

- **421-5475 — Hydraulic Filter:** cartridge; cast material, carbon steel and alloy aluminum; 13.787 in length × 12.449 in width. CAT lists wheel loaders 930, 938K, 938M, 926, 924K, 926M, 938, 930K, 924 and 930M. Stored as LAND / NEEDS_SERIAL_CHECK.
  - Official source: https://parts.cat.com/en/catcorp/product/421-5475
  - CAT image: https://caterpillar.scene7.com/is/image/Caterpillar/CM20231114-79e6e-96372

- **352-4915 — Water Separator Filter Assembly:** cartridge; polyamide plastic; 13.819 in length, 7.59 in diameter and 8.602 in width. Important distinction: despite the product title, CAT's description says the assembly is generally used in fumes disposal in a lubrication system. CAT explicitly lists MARINE ENGINE C18 plus land, generator and industrial applications. Stored as BOTH / NEEDS_SERIAL_CHECK.
  - Official source: https://parts.cat.com/en/catcorp/product/352-4915
  - CAT image: https://caterpillar.scene7.com/is/image/Caterpillar/CM20231114-f0e48-f62f5

- **383-7372 — Air Conditioner Drier Filter Receiver:** absorbs moisture and filters debris in the A/C system; compatible with R134A refrigerant; carbon steel. CAT lists on-highway trucks CT680, CT681 and CT660. Stored as LAND / NEEDS_SERIAL_CHECK.
  - Official source: https://parts.cat.com/en/catcorp/product/383-7372
  - CAT image: https://caterpillar.scene7.com/is/image/Caterpillar/CM20241029-32cac-f1260

- **503-7470 — Filter Fitting (In-Line)(HEP Pump):** in-line oil-filter fitting; -10 JIC 37° 7/8-14 on one end and -10 STOR 7/8-14 on the other; 4.6 in overall length, 1.5 in hex, carbon steel. No compatible models published. Stored as REFERENCE / UNVERIFIED; this is a filter fitting, not a standalone filter element.
  - Official source: https://parts.cat.com/en/catcorp/product/503-7470
  - CAT image: https://caterpillar.scene7.com/is/image/Caterpillar/CM20220413-73ac7-e709d

## Database

Added/upserted all four records in `public.part_catalog` and `public.products`. Prices remain NULL and stock remains zero. The product hierarchy maps them under the parent **فیلترها**, with the 352-4915 lubrication context retained despite its Water Separator title and 383-7372 grouped under A/C filters.
