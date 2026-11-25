# Caterpillar part-number catalog

The store keeps Caterpillar references in `public.part_catalog`, separate from saleable inventory. Search results are reference-only until the exact engine serial number and Arrangement are checked.

## Current seed coverage

Baseline before the public Cat Parts Store category imports below: the initial seed contained 237 unique references and earlier directory expansion produced 394 unique part-number records. Subsequent public-category migrations add or update additional references; treat 394 as the pre-expansion baseline, not the current live total. Model counts overlap because one part may be listed for multiple engine families; cross-family references can also make a tagged family count differ from the third-party directory's own total.

| Engine family | Current references | Public directory count |
|---|---:|---:|
| 3406 / 3408 (combined family directory) | 14 | 14 |
| C9 / C9.3 | 125 | 125 |
| C15 | 142 | 142 |
| C18 | 144 | 144 |
| 3508 / 3512 / 3516 family | 146 combined family-tagged references | 144 combined |

The public directory is a third-party reference, not Cat SIS. All imported rows remain `REFERENCE`, not `OEM_VERIFIED`. The official Cat Parts Store listing for `392-0217` identifies 3512B, 3516B and 3508B as compatible models. It does not list 3512CB or 3516CB. The generic 3512 tag is retained only as a search-family candidate; neither CB model is confirmed. Official Cat Parts Store records for injector groups `392-0200`, `392-0206`, `392-0214`, `392-0217`, `392-0205` and `392-0219` have also been added in migrations `202611230013_correct_392_0217_official_fitment_reference.sql` and `202611230014_add_official_3500_injector_model_references.sql`. The official listings distinguish B-series models (for example 3512B/3516B) from C-series models (3512C/3516C); neither is a literal confirmation of a `3512CB` or `3516CB` model.

## Search and import

- Public search: `GET /api/products?q=PART_NUMBER` searches saleable products and the separate part catalog.
- Admin import: `POST /api/admin/parts/import` accepts up to 500 rows with part number, name, engine models, technical group and HTTPS source URL.
- The admin Products panel accepts Excel/CSV imports for the part catalog.
- Part references have no price or stock and cannot be mistaken for available inventory.

## Remaining work

Additional C9 pages 2–6 and C18 pages 3–6 references have now been added from the public third-party directory in migrations `202611230008_expand_c9_c18_directory_references.sql` and `202611230010_expand_c9_c18_and_3500_coverage.sql`. The C9 and C18 directory associations were reconciled page by page in migration `202611230015_reconcile_c9_c15_c18_directory_coverage.sql`; their family-tag counts now match the public directory totals. Additional 3500-family references from public directory pages 1–6 have now been transcribed across migrations `202611230009_expand_3500_directory_references.sql`, `202611230011_expand_c9_and_3500_pages.sql` and `202611230012_complete_3500_directory_pages_1_2.sql`. Since the source directory groups 3508, 3512 and 3516 together, the imported family-level references are tagged for all three candidate families; this is not an assertion of exact build or CB fitment. The 3500-family reference count includes two official B/C injector references in addition to the 144 third-party family-directory references; direct CB-specific references remain open. For OEM-complete data, use Cat SIS / the authorized parts catalog with the full engine model, serial number and Arrangement number. Never promote a family-level match to OEM-confirmed compatibility without that check.

## Additional official Cat Parts Store products (2026-11-23)

The sellable storefront catalog has been expanded with fourteen further Cat Parts Store records across migrations `202611231500_expand_cat_oem_engine_products.sql`, `202611231520_add_cat_3406_c15_reman_blocks.sql` and `202611231530_add_cat_3512_3516_3406_3408_products.sql` and `202611231540_align_cat_upgrade_kit_category.sql`. Each row uses the exact Cat part number (prefixed with `CAT-` in Amoot's SKU), the Cat product page as its source, and a Cat Scene7 product image. Price is NULL and stock is 0, so each item is quote-only until supplier pricing and availability are confirmed.

| Amoot SKU | Cat part number | Cat product page | Engine family / listed application |
|---|---|---|---|
| CAT-20R-2510 | 20R-2510 | https://parts.cat.com/en/catcorp/product/20R-2510 | C18 Reman; Cat page lists 834H / 836H / 988H |
| CAT-20R-5367 | 20R-5367 | https://parts.cat.com/en/catcorp/product/20R-5367 | C9 Reman; Cat page lists D6T XL / XW / LGP |
| CAT-30R-0084 | 30R-0084 | https://parts.cat.com/en/catcorp/product/30R-0084 | C18 Reman; Cat page lists 988K |
| CAT-10R-9954 | 10R-9954 | https://parts.cat.com/en/catcorp/product/10R-9954 | 3516B Marine Propulsion top-end overhaul kit |
| CAT-5N-4504 | 5N-4504 | https://parts.cat.com/en/catcorp/product/5N-4504 | Port plate; Cat lists 3408, 3512 variants and 3516B |
| CAT-7W-0009 | 7W-0009 | https://parts.cat.com/en/catcorp/product/7W-0009 | Cylinder head assembly; Cat lists 3406B / 3406C |
| CAT-9X-3406 | 9X-3406 | https://parts.cat.com/en/catcorp/product/9X-3406 | 2-pin connector; Cat lists G3512 / G3516 / G3406 / G3408 |
| CAT-260-3406 | 260-3406 | https://parts.cat.com/en/catcorp/product/260-3406 | High-temperature coolant hose; Cat lists G3516 / G3516B / G3516C |
| CAT-20R-4278 | 20R-4278 | https://parts.cat.com/en/catcorp/product/20R-4278 | 3406 Reman Long Block |
| CAT-10R-9063 | 10R-9063 | https://parts.cat.com/en/catcorp/product/10R-9063 | C15 Reman Short Block |
| CAT-20R-0043 | 20R-0043 | https://parts.cat.com/en/catcorp/product/20R-0043 | 3512B Marine Propulsion top-end overhaul kit |
| CAT-20R-3958 | 20R-3958 | https://parts.cat.com/en/catcorp/product/20R-3958 | 3406B Reman Short Block |
| CAT-0R-8200 | 0R-8200 | https://parts.cat.com/en/catcorp/product/0R-8200 | 3408/3412 Reman Cylinder Pack |
| CAT-593-5344 | 593-5344 | https://parts.cat.com/en/catcorp/product/593-5344 | 3516B diesel-to-natural-gas conversion kit |

These are distinct Cat catalogue records, not a claim that every part fits every variant of the seven engine families. In particular, G-series references are not automatically interchangeable with diesel engine model references; C18 Reman engine numbers also have different machine/application configurations. Always check Cat SIS / dealer fitment by full serial number and Arrangement before order acceptance. Cat product images and descriptions are linked to Caterpillar's public Parts Store; commercial image reuse remains subject to Caterpillar's terms.

## Cat Filters category expansion (2026-11-23)

The previously empty **فیلتر و مصرفی** storefront category now contains 15 genuine Cat filter-related product records. The product entries link to individual Cat Parts Store pages and Cat Scene7 product images. Every row is quote-only (price NULL, stock 0) pending supplier confirmation.

| Amoot SKU | Cat part number | Filter type | Cat listed engine applications (selected) |
|---|---|---|---|
| CAT-1R-1808 | 1R-1808 | Engine oil filter | Included in Cat PM kits for 3406C, C15 and C18 |
| CAT-1R-0749 | 1R-0749 | Secondary fuel filter | Included in Cat PM kits for 3406C, C15 and C18 |
| CAT-142-1340 | 142-1340 | Primary air filter, ultra-high efficiency | 3406C PM kit |
| CAT-513-4490 | 513-4490 | Fuel-water separator | 3406C PM kit |
| CAT-423-8521 | 423-8521 | Advanced fuel-water separator | C18, C15, C9 |
| CAT-151-7737 | 151-7737 | Primary air filter | C18, C15, 3406C |
| CAT-189-0202 | 189-0202 | Secondary air filter | C18, C15, 3406C |
| CAT-321-6970 | 321-6970 | Secondary fuel filter, cartridge | 3516B, 3512B, G3516, G3512, G3406, G3408 |
| CAT-7W-5313 | 7W-5313 | Primary air filter | G3406, G3516, G3512, 3406B/C, 3408B |
| CAT-6N-6071 | 6N-6071 | Primary air filter | 3406B/C, 3408, 3408B |
| CAT-4N-0015 | 4N-0015 | Primary air filter, panel | C18, C15, 3406B/C, 3408 |
| CAT-453-1607 | 453-1607 | Fuel filter, tank sock | C18, C15, C9.3 |
| CAT-136-3742 | 136-3742 | Engine oil filter | C15, C18, 3512E, 3516C, G3406 |
| CAT-8H-7202 | 8H-7202 | Primary fuel filter | 3512/3516, C18, C15, C9, 3406/3408 |
| CAT-9M-2342 | 9M-2342 | Fuel filter screen | 3512/3516, 3406/3408 |

Cat PM kit 633-4100 (3406, 500-hour service) lists 142-1340 x2, 1R-0749 x2, 1R-1808 x2 and 513-4490 x1. Cat PM kit 609-0030 (C18) lists 151-7737, 189-0202, 1R-0749, 423-8521 and 1R-1808. Cat PM kit 606-1783 (C15) lists 423-8521, 1R-1808 and 1R-0749. These kit contents ground the service relationships; do not assume one filter part fits every arrangement of an engine family. Verify serial number, Arrangement and filter housing before order acceptance.

Sources: official Cat product pages linked in each row, plus https://parts.cat.com/en/catcorp/product/633-4100, https://parts.cat.com/en/catcorp/product/609-0030 and https://parts.cat.com/en/catcorp/product/606-1783.



## Public Cat Parts Store category expansion (2026-11-23)

Additional search-only references were added/upserted from the public Cat Parts Store category and product pages. The migration batch covers:

- `202611231700`: 66 references across filters, hydraulics, electrical, GET, hardware and hoses.
- `202611231710`–`202611231760`: fuel-system, 3500/G3600 and C-series engine components, including a corrected C18 association for `10R-7231`.
- `202611231770`: drivetrain and undercarriage references.
- `202611231810`: additional hardware and consumable references.
- `202611231820`: selected page-2 undercarriage kit references, including D9 arrangements, sprocket kits and track seal/bushing kits.
- `202611231830`–`202611231860`: first-page bogie, guard, rubber-track and seal subcategory references.
- `202611231870`–`202611231880`: rolling-component and track-component references.
- `202611231890`: first-page undercarriage hardware references (track bolts and nuts).
- `202611231780`: attachments and structures.
- `202611231790`: cab filters/cameras, equipment upgrades, hose/cap parts, repair kits and workshop supplies.
- `202611231800`: product-specific image corrections for `575-2083` and `626-4231`.

All these rows remain `REFERENCE`, with no price or stock. Fitment is recorded only where Cat's product page explicitly lists the model; category membership alone is not treated as machine compatibility.

**Coverage limitation:** many Cat category pages display only 1–16 of 1,200 results (75 pages), and their subcategories contain additional inventories. This batch captures visible first-page samples for major categories, selected official product pages, and six selected references from page 2 of Cat Undercarriage Kits plus first-page samples from Bogies, Guards, Rubber Tracks, Seals, Rolling Components, Track Components and Undercarriage Hardware; it is not a complete export of all Cat part numbers or a substitute for Cat SIS. Continue crawling remaining pages/categories or obtain an authorized complete catalog feed before claiming full coverage.

## Further official Cat undercarriage references (2026-11-23)

The public Cat Parts Store undercarriage catalog was expanded in migrations `202611231830`–`202611231870`, `202611231880`–`202611231890` and `202611231900`. This includes selected official references from Bogies, Guards, Rubber Track components, Seals, Rolling Components, Track Roller Groups and Carrier Roller Groups. The rolling-component batch includes track segments, track rollers, idler groups and Cat-listed fitment for selected models. The carrier-roller batch adds:

| Cat part number | Part | Cat-listed model examples |
|---|---|---|
| 603-8538 | Carrier Roller Group, 120 mm tread | 320, 326 GC, 321, 320D3 GC, 320 GX, 323 GX, 333 GC, 324, 320D3, 322, 319, 320 GC |
| 235-5974 | Carrier Roller Group, 199.5 mm tread | D6 family, PL72, 963D, 973D, 963C, 963K |
| 300-4545 | Carrier Roller Group, 160 mm tread | 3512B Generator Set (also multiple excavator and MHPU configurations) |
| 542-8380 | Carrier Roller Group, 190 mm tread | MD6380, MD6640, MD6540, 390F, 390F L, 395, MH3295, 374, 374F, 374F L, 3101 |

Each row remains a search-only `REFERENCE` with no price or stock. Product pages and Cat Scene7 product images are stored as source references. Compatible-model arrays are populated only from the individual Cat product pages; Cat itself advises confirming the machine serial number and configuration before ordering.

The official Cat pages expose multiple rolling-component subcategories with dozens to hundreds of results. These imports are selected page/category samples, not a complete export of Cat's undercarriage catalog or a replacement for Cat SIS.

## Full public Cat category index snapshot (2026-11-23)

Migration `202611231910_import_cat_category_tree_and_products.sql` adds a separate `public.cat_part_categories` taxonomy table, preserving Cat's public navigation separately from part references and saleable products.

- 15 official top-level Cat Parts Store categories captured from the public Shop By Category page.
- 118 first-level subcategory records captured from the official category landing pages, with Cat's displayed result counts and category URLs.
- 64 additional/upserted individual Cat part references across the 15 top-level groups. Each reference has an official Cat product URL and Cat Scene7 image URL; the source page's description/specifications are recorded where visible.
- `GET /api/part-categories` exposes the category index for the storefront and future category filters.
- Every imported reference remains `REFERENCE`; no price, stock, or unlisted machine fitment is invented.

The 15 top-level groups are Attachments, Cabs, Drivetrain, Electrical & Electronics, Engine, Equipment Upgrades, Filters & Fluids, Ground Engaging Tools, Hardware/Seals/Consumables, Hoses & Tubes, Hydraulics, Structures & Other Systems Components, Undercarriage, Upgrade & Repair Kits, and Workshop Supplies.

**Important scope:** this is a complete snapshot of Cat's 15 top-level navigation groups plus the 118 first-level subcategory links captured in this pass, not a complete export of every Cat SKU. Cat's public category pages commonly paginate up to 1,200 visible results (75 pages), while individual subcategories can contain tens of thousands of entries. Full SKU extraction still requires a systematic paginated crawl of every subcategory and may require Cat-authorized catalog/SIS access for fitment details. Category membership is never treated as compatibility.


## Further engine-family Cat references (2026-11-23)

Migration `202611232000_expand_cat_engine_family_official_references.sql` adds 19 search-only part references transcribed from official Cat Parts Store category listings:

- C15/C9/C18/3406C/3408 long blocks: `20R-1369`, `20R-5379`, `20R-1367`, `20R-4277`, `10R-7021`.
- 3512B/3508B/C18/3412 crankshafts: `0R-9736`, `0R-8502`, `20R-4195`, `0R-9751`.
- 3406B/3406E/C9 short blocks: `0R-4812`, `0R-8385`, `20R-2861`.
- 3408/3412 and 3500-family cylinder packs: `0R-1572`, `10R-9224`, `20R-0583`.
- 3516 oil pump/turbocharger and 3406/3408/3412 and C15/C16 water pumps: `0R-4345`, `612-6820`, `0R-4680`, `10R-0484`.

Source URLs point to the individual official Cat product pages. Images are intentionally left NULL in this import; the storefront API resolves and caches the official Cat Scene7 image from the product page on demand. These remain `REFERENCE` records, not saleable inventory. Family-level descriptions are not blanket fitment: confirm exact serial number, Arrangement and suffix with Cat before order acceptance.


## Engine fuel, cooling and overhaul references (2026-11-23)

Migration `202611232010_expand_cat_engine_fuel_cooling_references.sql` adds 14 further Cat Parts Store references: `600-3535`, `392-0205`, `7E-6408`, `2W-9726`, `392-0220`, `202-1062`, `350-2168`, `350-2167`, `350-2155`, `457-5312`, `486-8525`, `392-0214`, `392-0221`, `121-2630`.

These cover water pumps, fuel injectors, an oil cooler, 3512 Tier 1/Tier 2 engine upgrade kits and a single-cylinder-head repair kit. Only compatible model names explicitly shown on the Cat product pages are recorded; for `350-2168`, the Cat page does not provide compatible-model data, so none is asserted. All records remain `REFERENCE`, not saleable stock. Product imagery is resolved through the existing official Cat image lookup path when queried; this migration does not invent image URLs.


## Consolidated official Cat engine-family pass (2026-11-23)

Migration `202611232020_consolidated_cat_engine_family_batch.sql` adds/upserts two further official Cat Parts Store references found while consolidating the engine-family extraction:

| Cat part number | Description | Cat-listed engine applications |
|---|---|---|
| 574-0991 | High Pressure Control Fuel Pump / fuel transfer pump | 3512E (Engine and Petroleum Engine 3512E 2016) |
| 115-5674 | Unit Injector Boot | C9, C9.3, C18, C15, 3406E, 3408B, 3408E, 3412E, 3512B/C/E, 3516B/C/E |

The migration stores Cat's published specifications for 574-0991 and the official compatible-model list for 115-5674. Both records remain `REFERENCE`; image URLs are left NULL for the existing official Cat image resolver, and no price or stock is invented. Cat's public pages do not provide a complete universal fitment guarantee: confirm the exact arrangement and serial number before accepting an order.

**Extraction scope:** this is a consolidated verified batch, not a complete export of all Cat catalog SKUs. Cat's public categories expose large paginated inventories (up to 1,200 items in the visible category result window and additional subcategory inventories). Full-catalog extraction requires crawling every category page and product detail page; serial-specific SIS fitment remains a separate authorized-catalog task.


## Consolidated engine overhaul and cooling batch (2026-11-23)

Migration `202611232030_expand_cat_engine_overhaul_and_cooling_references.sql` adds/upserts seven official Cat references:

| Part number | Cat listing | Explicit engine applications recorded |
|---|---|---|
| 603-1668 | Basic Water Pump | C15, C18 |
| 284-5565 | Water Pump Rebuild Kit | C18, 3406E, C15 |
| 346-3791 | Engine Overhaul (Silver) Kit | 3406E |
| 599-7781 | Engine Overhaul (Major) Kit | G3516B |
| 0R-4285 | 3406A Reman Cylinder Pack | 3406A title only; no broader fitment asserted |
| 144-0503 | Piston & Ring Kit | 3516, 3512, 3508, 3516B, 3512B, 3406B/C/E |
| 0R-8200 | 3408/3412 Reman Cylinder Pack | 3408E, 3412E |

The batch records only Cat-published product descriptions, specifications and explicit compatible-model details. All rows remain `REFERENCE`; no price or stock is fabricated, and image URLs remain NULL for the official image resolver. Confirm exact arrangement and serial-number fitment with Cat before purchase.

Official product pages: [603-1668](https://parts.cat.com/en/catcorp/product/603-1668), [284-5565](https://parts.cat.com/en/catcorp/product/284-5565), [346-3791](https://parts.cat.com/en/catcorp/product/346-3791), [599-7781](https://parts.cat.com/en/catcorp/product/599-7781), [0R-4285](https://parts.cat.com/en/catcorp/product/0R-4285), [144-0503](https://parts.cat.com/en/catcorp/product/144-0503), [0R-8200](https://parts.cat.com/en/catcorp/product/0R-8200).


### Official image verification for the 2026-11-23 overhaul/cooling batch

The follow-up migration `202611232040_set_verified_cat_scene7_images.sql` stores direct Cat Scene7 assets confirmed from the official product-page image links for **603-1668, 346-3791, 599-7781, 0R-4285 and 0R-8200**. Cat's public pages expose only a generic fallback image for **284-5565** and **144-0503**, so no generic placeholder was stored for those SKUs. The API smoke test expects images only for the five parts with an actual product image.


## Additional consolidated engine-overhaul batch (2026-11-23)

Migration `202611232050_expand_cat_engine_overhaul_references.sql` adds/upserts eight official Cat references:

| Part number | Cat listing | Explicit engine applications |
|---|---|---|
| 0R-1571 | 3408/3412 Reman Cylinder Pack, 14.5:1 | Marine 3412; Industrial 3406 |
| 618-8046 | Engine Overhaul Kit | Truck Engine C15 |
| 350-2178 | 3512 Tier 2 Engine Upgrade Kit | Marine 3512B |
| 440-0216 | Land Drilling 3512 Engine Overhaul Kit | Generator Set 3512B |
| 20R-7411 | Reman Platinum Engine Overhaul Kit, C15 | Truck Engine C15 |
| 10R-4471 | 3516 Reman Cylinder Pack, 8.0:1 | G3508, G3512, G3516 |
| 494-1279 | Engine Overhaul (Top End) Kit | 3516, 3512, 3508, 3512B, 3512C, 3508B |
| 442-8972 | Engine Overhaul (Silver) Kit | Truck Engine C15 |

Follow-up migration `202611232060_set_additional_cat_scene7_images.sql` stores direct official Scene7 images for 0R-1571, 618-8046, 440-0216, 20R-7411, 10R-4471 and 442-8972. Cat's pages show fallback images for 350-2178 and 494-1279, so no generic placeholder is saved. All records remain `REFERENCE`; no price or stock is invented.


## C15/C18 Reman overhaul and cylinder-pack references (2026-11-23)

Migration `202611232070_expand_cat_c15_c18_reman_overhaul_references.sql` adds/upserts nine Cat product references:

| Part number | Cat listing | Cat-listed application |
|---|---|---|
| 20R-0632 | C18 Reman Cylinder Pack, 14.5:1 | C18 |
| 10R-8760 | C18 Reman Cylinder Pack, 18.0:1 High HP | C18 (title/application) |
| 10R-9025 | C18 Reman Cylinder Pack, 16.5:1 | C18 |
| 30R-0927 | C18 Marine Reman Cylinder Pack, 16.5:1 | Generator Set C18 |
| 30R-0925 | C18 Marine Reman Cylinder Pack, 16.5:1 | Marine Engine C18 |
| 10R-9345 | C15 Reman Gold Overhaul Kit, 16.6:1 | Truck Engine C-15 |
| 10R-9343 | C15 Reman Gold Overhaul Kit, 16.6:1 | Truck Engine C-15; Reman Engine C-12 |
| 20R-0744 | C15 Reman Gold Overhaul Kit, 18.0:1 | Truck Engine C15 |
| 10R-9923 | C15 Reman Gold Overhaul Kit | Truck Engine C15 |

Follow-up migration `202611232080_set_c15_c18_cat_scene7_images.sql` stores exact official Scene7 image assets for eight of the nine references. Cat's 30R-0925 page did not expose a direct Scene7 asset in this pass, so no guessed image was saved. All entries remain quote-only `REFERENCE` records; no price or stock is invented.


## Consolidated fuel, turbocharger, pump and internal-engine parts batch (2026-11-23)

Migration `202611232090_expand_cat_engine_fuel_turbo_pump_internal_references.sql` adds/upserts **17 official Cat Parts Store references**:

| Part number | Component group | Explicit Cat-listed engine applications |
|---|---|---|
| 211-3023 | Fuel injector group | C-15, C-16, 3406E |
| 392-0206 | Injector group | 3512B, 3508B, 3516B |
| 20R-4147 | 3408/3412 Reman injector | 3408/3412 in product title; no wider fitment asserted |
| 9N-3246 | Fuel injection nozzle | 3406, 3408, 3408B, 3412 |
| 7N-9843 | Fuel injector valve nozzle | 3406, 3408, 3408B, 3412 |
| 4N-0733 | Engine oil pump | 3406B/C/E, 3406, 3516 |
| 0R-9448 | 3406C Reman oil pump | 3406B/C/E, 3406, 3508, 3516 |
| 0R-9449 | Reman oil pump | C15/C16/C18, 3406B/C/E, 3408B/C, 3412 |
| 0R-9200 | 3500 Reman connecting rod | 3508, 3512, 3516 and listed B/C variants |
| 299-3521 | Engine cylinder head | 3508B/C, 3512/3512B/C, 3516B/C |
| 223-9250 | Basic engine cylinder head | C15, C18, 3406E, C-16 |
| 102-0296 | Basic turbocharger | 3512, 3516, 3516B |
| 102-0299 | Turbocharger group | 3512, 3516 |
| 1W-1052 | Turbocharger group | 3406 |
| 134-5402 | Engine turbocharger | 3508, 3512, 3516 |
| 528-9753 | Engine turbocharger | 3512B/C, 3516B/C, 3516 |
| 1P-1120 | Turbocharger cartridge seal ring | 3406, 3408, 3412, 3508, 3512, 3516 variants |

All rows remain `REFERENCE`, with null price and no saleable stock. Exact Cat source URLs and provenance are stored. Image URLs are not guessed: the existing API resolves official Cat product imagery where the Cat page exposes a product asset; pages showing a fallback image remain without an invented image. Confirm exact arrangement and serial-number fitment before accepting an order.

Official Cat product pages: [211-3023](https://parts.cat.com/en/catcorp/product/211-3023), [392-0206](https://parts.cat.com/en/catcorp/product/392-0206), [20R-4147](https://parts.cat.com/en/catcorp/product/20R-4147), [9N-3246](https://parts.cat.com/en/catcorp/product/9N-3246), [7N-9843](https://parts.cat.com/en/catcorp/product/7N-9843), [4N-0733](https://parts.cat.com/en/catcorp/product/4N-0733), [0R-9448](https://parts.cat.com/en/catcorp/product/0R-9448), [0R-9449](https://parts.cat.com/en/catcorp/product/0R-9449), [0R-9200](https://parts.cat.com/en/catcorp/product/0R-9200), [299-3521](https://parts.cat.com/en/catcorp/product/299-3521), [223-9250](https://parts.cat.com/en/catcorp/product/223-9250), [102-0296](https://parts.cat.com/en/catcorp/product/102-0296), [102-0299](https://parts.cat.com/en/catcorp/product/102-0299), [1W-1052](https://parts.cat.com/en/catcorp/product/1W-1052), [134-5402](https://parts.cat.com/en/catcorp/product/134-5402), [528-9753](https://parts.cat.com/en/catcorp/product/528-9753), [1P-1120](https://parts.cat.com/en/catcorp/product/1P-1120).


## C9/C9.3 and C15 fuel/turbo follow-up (2026-11-23)

Migration `202611232100_expand_cat_c9_c15_fuel_turbo_references.sql` adds/upserts three additional official Cat references:

| Part number | Component | Cat-listed engine application |
|---|---|---|
| 460-8213 | Common-rail fuel injector | C9, C9.3 (explicit in Cat product title) |
| 432-0153 | Basic turbocharger group | C15, C9 |
| 216-7815 | Turbocharger group | C-9 |

These entries expand direct C9/C9.3 coverage. They remain reference-only; exact arrangement and serial-number fitment must be checked before an order. No price, stock or image URL has been invented.


### Official Cat product image mapping for the 2026-11-23 batch

Migration `202611232110_set_verified_cat_scene7_images.sql` stores direct Scene7 image assets linked from the official Cat product pages for **211-3023, 460-8213, 392-0206, 9N-3246, 7N-9843, 102-0296, 102-0299, 134-5402, 223-9250, 0R-9200, 0R-9448 and 0R-9449**. No fallback/logo or merely representative image is assigned: 4N-0733, 528-9753, 432-0153 and 216-7815 remain without a stored product image in this batch because the Cat page showed a generic logo/fallback or explicitly described the image as representative. The remaining 20R-4147 image is not assigned in this pass.


### Fitment correction and final image verification

The official Cat page for `20R-4147` uses the title “3408/3412 Reman Fuel Injector” but its explicit Compatible Models section lists **Marine Engine 3412E only**. Migration `202611232120_correct_cat_20r4147_fitment_and_images.sql` therefore retains 3408/3412 as search terms while recording only 3412E in `compatible_models`. The same migration adds the exact Scene7 image for 20R-4147 and the exact product image for 1P-1120. The 1W-1052 Cat page states its image is representative, so that image remains deliberately unassigned.


## Expanded engine internals and turbocharger batch (2026-11-23)

Migration `202611232130_expand_cat_engine_internal_and_turbo_references.sql` adds/upserts **16 additional official Cat references**:

| Part number | Description | Cat-listed engine/application scope |
|---|---|---|
| 450-1408 | Top piston ring | 3512E, 3516E, G3516C, G3512H and listed 3500 family applications |
| 20R-9480 | 3512E DGB Tier 4 Reman cylinder pack | 3512E DGB (product title) |
| 314-2700 | Piston kit for basic engine | Exact SKU/title listed; fitment not asserted |
| 0R-9737 | 3516 Reman UTN crankshaft | 3516 (product title) |
| 0R-9739 | 3512B Reman UTN long-stroke crankshaft | 3512B (product title) |
| 523-8663 | 170.025 mm cylinder block liner | Exact SKU and diameter listed; fitment not asserted |
| 593-2027 | Cylinder liner | Exact SKU/title listed; fitment not asserted |
| 107-7330 | Connecting rod bearing | Exact SKU, dimensions and material listed; fitment not asserted |
| 7W-0489 | Turbocharger cartridge | 3408, 3408B/C, G3408 family |
| 20R-3163 | Reman turbocharger | 3408/3408B/C, 3412, G3408 family |
| 1W-8922 | Piston ring kit | 3406, 3406B/C, 3408/3408B, 3412 and listed applications |
| 8N-0822 | Engine and motor piston ring | 3406, 3408/3408B/C, 3412/3412C |
| 4W-1434 | Engine turbocharger | 3408, 3408B |
| 9N-6753 | Turbocharger group | 3408, 3408B |
| 0R-6364 | Reman turbocharger | 3408 family, 3412, 3508, G3512/G3516 |
| 4W-7637 | Turbocharger group | 3408 family, G3408 family |

All entries remain `REFERENCE`; Cat source URLs and provenance are stored. No sale price or stock is fabricated. Where the public Cat source did not provide a model-level fitment list, compatible_models remains empty. Turbo images marked representative by Cat are not stored as exact product images. Serial/arrangement confirmation remains necessary before order acceptance.

Sources: [450-1408](https://parts.cat.com/en/catcorp/product/450-1408), [20R-9480](https://parts.cat.com/en/catcorp/product/20R-9480), [314-2700](https://parts.cat.com/en/catcorp/product/314-2700), [0R-9737](https://parts.cat.com/en/catcorp/product/0R-9737), [0R-9739](https://parts.cat.com/en/catcorp/product/0R-9739), [523-8663](https://parts.cat.com/en/catcorp/product/523-8663), [593-2027](https://parts.cat.com/en/catcorp/product/593-2027), [107-7330](https://parts.cat.com/en/catcorp/product/107-7330), [7W-0489](https://parts.cat.com/en/catcorp/product/7W-0489), [20R-3163](https://parts.cat.com/en/catcorp/product/20R-3163), [1W-8922](https://parts.cat.com/en/catcorp/product/1W-8922), [8N-0822](https://parts.cat.com/en/catcorp/product/8N-0822), [4W-1434](https://parts.cat.com/en/catcorp/product/4W-1434), [9N-6753](https://parts.cat.com/en/catcorp/product/9N-6753), [0R-6364](https://parts.cat.com/en/catcorp/product/0R-6364), [4W-7637](https://parts.cat.com/en/catcorp/product/4W-7637).


## C15/C18/C9 injector, turbo and pump batch (2026-11-23)

Migration `202611232140_expand_cat_c15_c18_c9_fuel_pump_turbo_references.sql` adds/upserts **14 additional official Cat references**:

| Part number | Part | Explicit Cat-listed fitment |
|---|---|---|
| 10R-0956 | Reman electronic injector | C-15, 3406E |
| 10R-9787 | 3406E Reman injector | C-18, 3406E, 3456 |
| 232-1811 | Basic turbocharger group | C15 |
| 10R-8499 | Reman injector kit | 3406E Reman Engine |
| 241-9595 | Fuel injector group | C9 Marine Engine |
| 350-2537 | Engine water pump | C-9 Industrial Engine |
| 10R-8501 | Reman fuel injector | C-15, C-16, 3406E |
| 10R-8500 | Reman injector kit (set of 6) | C-15, C-16, 3406E, C-12 |
| 211-3022 | Fuel injector group | C-15, 3406E |
| 211-3026 | Fuel injector group | C-18, 3406E, 3456 |
| 20R-8060 | C9 Reman injector | C9 Truck Engine |
| 20R-8812 | 3500 Reman auxiliary water pump | 3512/3516/3508 and Cat-listed B/C variants |
| 284-2712 | Basic turbocharger group | C15, C18 generator-set; C15 industrial |
| 293-4068 | C9 fuel injector group | C-9/C9 Truck Engine |

All are reference-only; exact Cat source URLs and compatibility provenance are stored. No sale price or stock was fabricated. For turbo pages whose image is marked representative, no product image is assigned.

Sources: [10R-0956](https://parts.cat.com/en/catcorp/product/10R-0956), [10R-9787](https://parts.cat.com/en/catcorp/product/10R-9787), [232-1811](https://parts.cat.com/en/catcorp/product/232-1811), [10R-8499](https://parts.cat.com/en/catcorp/product/10R-8499), [241-9595](https://parts.cat.com/en/catcorp/product/241-9595), [350-2537](https://parts.cat.com/en/catcorp/product/350-2537), [10R-8501](https://parts.cat.com/en/catcorp/product/10R-8501), [10R-8500](https://parts.cat.com/en/catcorp/product/10R-8500), [211-3022](https://parts.cat.com/en/catcorp/product/211-3022), [211-3026](https://parts.cat.com/en/catcorp/product/211-3026), [20R-8060](https://parts.cat.com/en/catcorp/product/20R-8060), [20R-8812](https://parts.cat.com/en/catcorp/product/20R-8812), [284-2712](https://parts.cat.com/en/catcorp/product/284-2712), [293-4068](https://parts.cat.com/en/catcorp/product/293-4068).


## Additional 3400/3500 family injector and turbo batch (2026-11-23)

Migration `202611232160_expand_cat_3512_3516_3406_3408_fuel_turbo_references.sql` adds/upserts **12 official Cat references**:

| Part number | Component | Cat-listed applications |
|---|---|---|
| 467-5333 | Cylinder head installation kit | C-18, C18, C15 |
| 0R-9943 | 3406 Reman injector nozzle | 3412, 3412C, 3408C in visible compatibility list |
| 102-0297 | Basic engine turbocharger | 3512, 3516 |
| 102-0290 | Basic turbocharger | 3412, 3412C, 3512 |
| 0R-3536 | 3408 Reman injector nozzle | 3408/3408B/C, 3412/3412C |
| 0R-8787 | Reman injector nozzle | 3412/3412C, 3408B/C in visible fitment list |
| 0R-3422 | 3406 Reman injector nozzle | 3406B/C, 3408/3408B/C, 3412/3412C |
| 118-2989 | Turbocharger group | 3512, 3516, 3508 |
| 102-0294 | Turbocharger group | 3512, 3516, 3512B |
| 0R-7164 | Reman turbocharger | 3512, 3516 |
| 100-4095 | Turbocharger cartridge | 3512/3516, 3508 and listed 3500 variants |
| 0R-3425 | 3406 Reman injector nozzle | 3406B/C, 3412/3412C |

All entries are reference-only and sourced to official Cat product pages. Compatibility is restricted to the models explicitly listed by Cat; where the product title and visible fitment list differ, the source note records that distinction. No pricing or stock is fabricated.

Sources: [467-5333](https://parts.cat.com/en/catcorp/product/467-5333), [0R-9943](https://parts.cat.com/en/catcorp/product/0R-9943), [102-0297](https://parts.cat.com/en/catcorp/product/102-0297), [102-0290](https://parts.cat.com/en/catcorp/product/102-0290), [0R-3536](https://parts.cat.com/en/catcorp/product/0R-3536), [0R-8787](https://parts.cat.com/en/catcorp/product/0R-8787), [0R-3422](https://parts.cat.com/en/catcorp/product/0R-3422), [118-2989](https://parts.cat.com/en/catcorp/product/118-2989), [102-0294](https://parts.cat.com/en/catcorp/product/102-0294), [0R-7164](https://parts.cat.com/en/catcorp/product/0R-7164), [100-4095](https://parts.cat.com/en/catcorp/product/100-4095), [0R-3425](https://parts.cat.com/en/catcorp/product/0R-3425).


## Additional Cat 3500 engine and fuel references (2026-11-23)

Migration `202611232170_expand_cat_3500_engine_and_fuel_references.sql` adds/upserts **7 official Cat references** identified from Cat Parts Store category listings and verified product pages:

| Part number | Component | Cat-listed engine scope |
|---|---|---|
| 30R-0090 | G3500 Reman cylinder head (no swirl) | G3512, G3516 |
| 20R-6618 | 3500 HD Reman cylinder pack | 3512B, 3516B |
| 20R-1626 | 3500 Reman valve lifter | 3508/3508B/C, 3512B/C, 3516B/C |
| 10R-8762 | 3500C Reman cylinder pack | 3508B/C, 3512/3512B/C, 3516/3516B/C |
| 0R-4449 | G3500 SI Reman cylinder pack | G3508, G3512, G3516 |
| 20R-5075 | C9 CR350 Reman fuel injector | C9 is identified in Cat product title; engine fitment list not separately asserted |
| 20R-1270 | 3500B Reman fuel injector | 3508B, 3512B, 3516B |

All seven remain quote-only `REFERENCE` records. Source URLs point to official Cat product pages; compatibility is limited to Cat's explicit engine-model list. No price, stock, or non-Cat image has been fabricated. The public category listing also demonstrates that Cat's Fuel System and Turbo System categories contain thousands of results and the public catalog is paginated; this batch is not a claim of complete catalog extraction.

Official sources: [30R-0090](https://parts.cat.com/en/catcorp/product/30R-0090), [20R-6618](https://parts.cat.com/en/catcorp/product/20R-6618), [20R-1626](https://parts.cat.com/en/catcorp/product/20R-1626), [10R-8762](https://parts.cat.com/en/catcorp/product/10R-8762), [0R-4449](https://parts.cat.com/en/catcorp/product/0R-4449), [20R-5075](https://parts.cat.com/en/catcorp/product/20R-5075), [20R-1270](https://parts.cat.com/en/catcorp/product/20R-1270).


## Additional Cat 3400/C15 fuel-system batch (2026-11-23)

Migration `202611232180_expand_cat_3400_c15_fuel_injector_references.sql` adds/upserts **13 official Cat references**:

| Part number | Component | Cat-listed engine scope |
|---|---|---|
| 9N-3246 | Fuel injection nozzle | 3406, 3408, 3408B, 3412 |
| 7N-9843 | Fuel injector valve nozzle | 3406, 3408, 3408B, 3412 |
| 20R-4147 | 3408/3412 Reman fuel injector | Product title identifies 3408/3412; no separate fitment list asserted |
| 20R-0759 | Reman fuel injector | 3408E |
| 10R-1273 | C15 Reman EI550 EUI injector | C15 |
| 10R-3261 | Reman fuel injector | C15 |
| 20R-1306 | C15 Reman MEUI-C 10mm injector | C15 |
| 249-0709 | Fuel injector group | C15 |
| 211-3023 | Fuel injector group | C-15, C-16, 3406E |
| 4W-7019 | Fuel injector nozzle | 3408/3408B/C, 3412/3412C |
| 6I-0036 | 1.83mm fuel injector line | 3408/3408B/C, 3412C |
| 1W-6316 | Fuel injection line no. 6 | 3408/3408B/C |
| 1W-6312 | Fuel injection line no. 2 | 3408/3408B/C, 3412C |

All records remain quote-only `REFERENCE` entries. Compatible models are limited to Cat's explicit compatible-model sections; where only the Cat product title names an engine family, the source note says so and the compatible-model array is left empty. No pricing, stock, or non-Cat image is fabricated. This is a targeted family batch, not a claim that the public Cat catalog has been fully extracted.

Official sources: [9N-3246](https://parts.cat.com/en/catcorp/product/9N-3246), [7N-9843](https://parts.cat.com/en/catcorp/product/7N-9843), [20R-4147](https://parts.cat.com/en/catcorp/product/20R-4147), [20R-0759](https://parts.cat.com/en/catcorp/product/20R-0759), [10R-1273](https://parts.cat.com/en/catcorp/product/10R-1273), [10R-3261](https://parts.cat.com/en/catcorp/product/10R-3261), [20R-1306](https://parts.cat.com/en/catcorp/product/20R-1306), [249-0709](https://parts.cat.com/en/catcorp/product/249-0709), [211-3023](https://parts.cat.com/en/catcorp/product/211-3023), [4W-7019](https://parts.cat.com/en/catcorp/product/4W-7019), [6I-0036](https://parts.cat.com/en/catcorp/product/6I-0036), [1W-6316](https://parts.cat.com/en/catcorp/product/1W-6316), [1W-6312](https://parts.cat.com/en/catcorp/product/1W-6312).


## Cat C9/3400/3500 cylinder-pack and crankshaft batch (2026-11-23)

Migration `202611232190_expand_cat_c9_3400_3500_cylinder_and_crankshaft_references.sql` adds/upserts **12 official Cat references**:

| Part number | Component | Cat-listed engine scope |
|---|---|---|
| 0R-9736 | 3512B Reman UTN crankshaft | 3512, 3512B/C/E, G3512/B/E/J |
| 20R-4195 | C18 Reman UTN crankshaft | C18 |
| 0R-8502 | 3508B Reman UTN crankshaft | 3508, 3508B/C |
| 0R-2657 | 3408 Reman UTN crankshaft | 3408/3408B/C/E, 3412/3412C, G3408 family, G3412 |
| 0R-2235 | C9 Reman UTN crankshaft | C9, C-9 |
| 10R-6213 | C9 Reman cylinder pack, 17.5:1 | C9, C-9 |
| 20R-0615 | C9 Reman cylinder pack, 15.5:1 | C9 |
| 10R-8157 | C9 Reman cylinder pack, 17.0:1 | C9, C-9 |
| 20R-4306 | C9 Reman cylinder pack, Tier 4 | C9.3 explicitly listed; title also references C9 |
| 0R-1572 | 3408/3412 Reman cylinder pack | 3408/3408B/C, 3406B, 3412/3412C |
| 20R-0582 | 3500C HD Reman cylinder pack | 3512B/C, 3516B/C |
| 20R-5616 | 3500 HD Reman cylinder pack | 3512B, 3516B |

All entries are reference-only and quote-only. Compatible models are based on the official Cat product page's explicit compatible-model section; the 20R-4306 entry stores C9.3 only because that is what Cat explicitly lists, despite the product title identifying the C9 family. No prices, stock, or unverified image URLs are fabricated.

Official sources: [0R-9736](https://parts.cat.com/en/catcorp/product/0R-9736), [20R-4195](https://parts.cat.com/en/catcorp/product/20R-4195), [0R-8502](https://parts.cat.com/en/catcorp/product/0R-8502), [0R-2657](https://parts.cat.com/en/catcorp/product/0R-2657), [0R-2235](https://parts.cat.com/en/catcorp/product/0R-2235), [10R-6213](https://parts.cat.com/en/catcorp/product/10R-6213), [20R-0615](https://parts.cat.com/en/catcorp/product/20R-0615), [10R-8157](https://parts.cat.com/en/catcorp/product/10R-8157), [20R-4306](https://parts.cat.com/en/catcorp/product/20R-4306), [0R-1572](https://parts.cat.com/en/catcorp/product/0R-1572), [20R-0582](https://parts.cat.com/en/catcorp/product/20R-0582), [20R-5616](https://parts.cat.com/en/catcorp/product/20R-5616).


## Additional official Cat pump and engine-component references (2026-11-23)

Migration `202611232200_expand_cat_oil_pump_turbo_water_and_fuel_pump_references.sql` adds 12 search-only records sourced from individual Cat Parts Store product pages:

- Lubrication: `4N-0733`, `0R-9448`, `0R-9449`, `0R-9697`.
- Turbochargers: `232-1811`, `261-6857`, `110-8463`.
- Cooling: `600-3535`.
- Fuel pumps and pump components: `416-4686`, `264-6416`, `170-4007`.
- Cylinder head: `7W-2225`.

Each row links to its official Cat product page. Compatible-model values are limited to models shown in the Cat page's Compatible Models section; for `7W-2225`, the title identifies 3408 but the compatible-model array is deliberately empty because no explicit fitment list was captured. Images remain NULL where a verified direct Cat Scene7 asset URL was not captured; the API may resolve official product imagery when available. All rows remain `REFERENCE`, with NULL price and zero stock semantics; they are not sellable inventory and must not be treated as serial-number-verified fitment.

Official source pages: https://parts.cat.com/en/catcorp/product/4N-0733, https://parts.cat.com/en/catcorp/product/0R-9448, https://parts.cat.com/en/catcorp/product/0R-9449, https://parts.cat.com/en/catcorp/product/232-1811, https://parts.cat.com/en/catcorp/product/261-6857, https://parts.cat.com/en/catcorp/product/600-3535, https://parts.cat.com/en/catcorp/product/110-8463, https://parts.cat.com/en/catcorp/product/0R-9697, https://parts.cat.com/en/catcorp/product/7W-2225, https://parts.cat.com/en/catcorp/product/416-4686, https://parts.cat.com/en/catcorp/product/264-6416 and https://parts.cat.com/en/catcorp/product/170-4007.


## Further official Cat cooling-pump references (2026-11-23)

Migration `202611232210_expand_cat_3500_and_3400_cooling_pump_references.sql` adds five Cat Parts Store references: `10R-9598`, `20R-5191`, `315-5137`, `416-0613` and `212-8174`. These cover 3500-family sea-water/auxiliary pumps and selected 3512/3516 engine water-pump groups. Model associations are limited to Cat's explicit Compatible Models lists; `10R-9598` is tagged only with the broad 3500 application from the official title/recommended application and has no explicit compatible-model array. All five remain search-only `REFERENCE` records, with no price or stock.

Official sources: https://parts.cat.com/en/catcorp/product/10R-9598, https://parts.cat.com/en/catcorp/product/20R-5191, https://parts.cat.com/en/catcorp/product/315-5137, https://parts.cat.com/en/catcorp/product/416-0613 and https://parts.cat.com/en/catcorp/product/212-8174.


## Additional Cat 3400/3500 cooling and C18 turbo references (2026-11-23)

Migration `202611232220_expand_cat_3500_cooling_and_c18_turbo_references.sql` adds five official Cat Parts Store records: `0R-7721`, `20R-7175`, `10R-1670`, `20R-0505` and `20R-5005`. They cover 3400/3500 auxiliary pumps, 3500-family engine water pumps, the 3406E/C18 sea-water pump application and a C18 turbocharger cartridge. Compatibility arrays are grounded in the individual Cat Compatible Models lists; for example, `20R-0505` is not tagged as 3512B/3516B because Cat's listed models are G3516C, selected G3520 and 3512E/3516E variants. All entries remain search-only `REFERENCE` records, with no price or stock.

Official sources: https://parts.cat.com/en/catcorp/product/0R-7721, https://parts.cat.com/en/catcorp/product/20R-7175, https://parts.cat.com/en/catcorp/product/10R-1670, https://parts.cat.com/en/catcorp/product/20R-0505 and https://parts.cat.com/en/catcorp/product/20R-5005.


## Additional official Cat 3500 injector and 3400/C-series cooling references (2026-11-23)

Migration `202611232230_expand_cat_3500_injector_and_3400_cooling_references.sql` adds 15 official Cat Parts Store references:
- Fuel system/injectors: `7C-1903`, `7E-6408`, `392-0204`, `392-0205`, `392-0220`, `392-0221`, `121-2630`, `200-5272`, `392-0214`, `392-0213`, `457-5312`, `456-0027`.
- Cooling: `605-7481`, `352-0210`.
- Turbocharger: `7C-7688` (Cat marks this part discontinued).

Model tags are based on each Cat product page's Compatible Models section, not merely the engine family mentioned in a search query. All records are `REFERENCE` only; no sales price or stock is added. Cat product pages are linked directly below:

https://parts.cat.com/en/catcorp/product/7C-1903
https://parts.cat.com/en/catcorp/product/7E-6408
https://parts.cat.com/en/catcorp/product/392-0204
https://parts.cat.com/en/catcorp/product/392-0205
https://parts.cat.com/en/catcorp/product/392-0220
https://parts.cat.com/en/catcorp/product/392-0221
https://parts.cat.com/en/catcorp/product/121-2630
https://parts.cat.com/en/catcorp/product/200-5272
https://parts.cat.com/en/catcorp/product/392-0214
https://parts.cat.com/en/catcorp/product/392-0213
https://parts.cat.com/en/catcorp/product/457-5312
https://parts.cat.com/en/catcorp/product/605-7481
https://parts.cat.com/en/catcorp/product/7C-7688
https://parts.cat.com/en/catcorp/product/352-0210
https://parts.cat.com/en/catcorp/product/456-0027


### Fitment correction — 392-0221

Migration `202611232240_correct_cat_392_0221_fitment.sql` adds the Cat-listed `3512B` Marine Auxiliary application to the engine and compatible-model arrays for `392-0221`. This corrects the integration-test expectation against the official product page: https://parts.cat.com/en/catcorp/product/392-0221.


### Verified Cat Scene7 images

Migration `202611232250_set_verified_cat_scene7_images_for_injector_and_water_pump.sql` stores direct Cat Scene7 assets captured from the official product-image links for `7E-6408` and `352-0210`. The URLs are direct Caterpillar image assets, not generic placeholders. Sources: https://parts.cat.com/en/catcorp/product/7E-6408 and https://parts.cat.com/en/catcorp/product/352-0210.


## Additional Cat 3406 and 3500 engine references (2026-11-23)

Migration `202611232260_expand_cat_3406_3500_cylinder_turbo_and_fuel_pump_references.sql` adds/upserts four further official Cat Parts Store references:

| Part number | Component | Explicit Cat-listed engine scope |
|---|---|---|
| 20R-5629 | Reman cylinder pack | Cat Recommended Application: 3512/3516; Compatible Models explicitly lists 3512C and 3516C (plus 962K wheel loader) |
| 108-6630 | Fuel injection pump | 3406B, 3406C and 3412 |
| 0R-3841 | Reman cylinder pack, 13.0:1 | 3508, 3512 and 3516 across listed generator-set, marine, industrial and vehicular categories |
| 110-8897 | Fuel injection pump | 3406B and 3406C |

All remain search-only `REFERENCE` records with no price or stock. Model arrays are limited to Cat's explicit Compatible Models data; for 20R-5629, the broader 3512/3516 recommended application is retained in provenance but only 3512C/3516C are tagged as exact compatible engine models. No image is assigned unless a direct exact Cat Scene7 asset is verified.

Official sources: [20R-5629](https://parts.cat.com/en/catcorp/product/20R-5629), [108-6630](https://parts.cat.com/en/catcorp/product/108-6630), [0R-3841](https://parts.cat.com/en/catcorp/product/0R-3841), [110-8897](https://parts.cat.com/en/catcorp/product/110-8897).


## Additional Cat 3406/3408 and 3500 references (2026-11-23)

Migration `202611232270_expand_cat_3406_3408_and_3500_fuel_references.sql` adds six official Cat Parts Store references:

| Part number | Component | Explicit Cat-listed engine scope |
|---|---|---|
| 4P-1384 | Fuel injection pump | 3406B, 3406C |
| 115-5699 | Fuel injection pump | 3406C |
| 130-5789 | Fuel injection pump group | 3406B, 3406C |
| 10R-4374 | Cat Reman 11 mm fuel injection pump | 3406B, 3406C |
| 10R-9224 | Cat Reman cylinder pack, 15.3:1 | 3512B, 3516B |
| 20R-5152 | Cat Reman basic 10 mm fuel injection pump | 3406, 3406B, 3408, 3408B, 3408C, 3412, 3412C |

The records remain `REFERENCE` search results with no assumed selling price or stock. Compatible engine arrays reflect only the Cat Parts Store's explicit Compatible Models section. Images are left unset where an exact direct Cat Scene7 asset has not been verified.

Official Cat sources: [4P-1384](https://parts.cat.com/en/catcorp/product/4P-1384), [115-5699](https://parts.cat.com/en/catcorp/product/115-5699), [130-5789](https://parts.cat.com/en/catcorp/product/130-5789), [10R-4374](https://parts.cat.com/en/catcorp/product/10R-4374), [10R-9224](https://parts.cat.com/en/catcorp/product/10R-9224), [20R-5152](https://parts.cat.com/en/catcorp/product/20R-5152).


## Completed public Cat category: Bare Blocks

Source: https://parts.cat.com/en/catcorp/category/engine-blocks-bare-blocks

The public Cat Parts Store category currently lists exactly 9 entries (1–9 of 9). All nine have been imported into `public.part_catalog` as `REFERENCE` records with official product URLs:

- `10R-8415` — 3512 Reman cylinder block (Cat marks discontinued)
- `10R-8417` — 3516 Reman UTN bare block (Cat marks discontinued)
- `11R-1405` — 3512 Reman NWC bare block
- `11R-1406` — 3516 Reman NWC bare block
- `20R-3440` — 3508 Reman bare block (Cat marks discontinued)
- `20R-3441` — 3512 Reman service bare block (Cat marks discontinued)
- `20R-3442` — 3516 Reman bare block
- `20R-5199` — C175-16 Reman UTN bare block (Cat marks discontinued)
- `528-1699` — SEM cylinder block (Cat publishes no compatible-model data)

No prices, stock, guessed compatibility, or placeholder images were added. Fitment fields only use models explicitly shown on Cat product pages; `528-1699` has empty fitment arrays because Cat states that compatibility information is unavailable. All nine are search-only references, not sellable products.


## Completed public Cat category: Sleeve Pins

Source: https://parts.cat.com/en/catcorp/category/cylinder-components-sleeve-pins

The public Cat Parts Store page shows exactly **6 of 6** records. Migration `202611232290_import_complete_cat_sleeve_pins_category.sql` imports all six as search-only `REFERENCE` entries: `598-0498`, `387-9865`, `7T-9309`, `655-7611`, `6E-4351` and `7T-9307`.

Important catalog-quality note: Cat's own Sleeve Pins listing includes products whose individual product titles identify a bolt, a piston-pump pin, a cylinder-head valve sleeve and bogie-pin cartridges. The import preserves the official category membership as provenance but does not mislabel these as engine-specific parts. Equipment compatibility is copied only where explicitly listed on each Cat product page; engine-family tags are limited to the G3516K/G3512K/G3520K/G3520 applications shown for `655-7611`. Cat marks `7T-9309` and `7T-9307` discontinued; those statuses are retained in source notes.

Verified direct Cat Scene7 image assets were captured for all six listed records. No prices or stock are fabricated; every row remains `REFERENCE` rather than a sellable product.

Official product pages: [598-0498](https://parts.cat.com/en/catcorp/product/598-0498), [387-9865](https://parts.cat.com/en/catcorp/product/387-9865), [7T-9309](https://parts.cat.com/en/catcorp/product/7T-9309), [655-7611](https://parts.cat.com/en/catcorp/product/655-7611), [6E-4351](https://parts.cat.com/en/catcorp/product/6E-4351), [7T-9307](https://parts.cat.com/en/catcorp/product/7T-9307).


## Completed public Cat category: Camshaft Kits

Source: https://parts.cat.com/en/catcorp/category/engine-components-camshaft-kits

The official Cat Parts Store category lists exactly **7 of 7** records on one page. Migration `202611232300_import_complete_cat_camshaft_kits_category.sql` imports all seven as search-only `REFERENCE` records:

- `20R-7549` — Cat Reman camshaft kit, 3406C
- `0R-3021` — Cat Reman camshaft kit, recommended application 3208 NA
- `0R-3025` — Cat Reman camshaft kit, 3204
- `0R-3026` — Cat Reman camshaft kit, 3204
- `20R-7547` — Cat Reman camshaft kit, 3406B
- `20R-7555` — Cat Reman camshaft kit, 3408
- `20R-7560` — Cat Reman camshaft kit, 3412

Compatibility arrays are limited to the official Cat product-page Compatible Models sections. For `20R-7555` and `20R-7560`, the retrieved official category listing confirms the engine application, but no compatible-model detail was available; those arrays remain empty. No price, stock, or unverified image URLs were added.

Official category: [Camshaft Kits](https://parts.cat.com/en/catcorp/category/engine-components-camshaft-kits). Official product pages: [20R-7549](https://parts.cat.com/en/catcorp/product/20R-7549), [0R-3021](https://parts.cat.com/en/catcorp/product/0R-3021), [0R-3025](https://parts.cat.com/en/catcorp/product/0R-3025), [0R-3026](https://parts.cat.com/en/catcorp/product/0R-3026), [20R-7547](https://parts.cat.com/en/catcorp/product/20R-7547), [20R-7555](https://parts.cat.com/en/catcorp/product/20R-7555), [20R-7560](https://parts.cat.com/en/catcorp/product/20R-7560).


## Completed public Cat category: Rods

Source: https://parts.cat.com/en/catcorp/category/reman-products-rods

The official Cat Reman category lists exactly **7 of 7** products on one page. Migration `202611232310_import_complete_cat_reman_rods_category.sql` adds all seven as search-only `REFERENCE` records:

- `0R-0916` — 3408 Reman Connecting Rod (Wide Taper)
- `10R-6211` — C9 Reman Connecting Rod (9.3L)
- `10R-2788` — C11 Reman Connecting Rod
- `20R-0925` — C13 Reman Connecting Rod
- `0R-0921` — Reman Connecting Rod for D379/D398/D399 families
- `30R-1275` — Reman Connecting Rod; Cat lists compatible model 307.5, with no engine model inferred
- `30R-1818` — C32B Reman Connecting Rod; Cat lists compatible truck model 777F

Engine/model compatibility is restricted to information explicitly shown in official Cat product pages. No prices, stock, or unverified images were added.

Official category: [Rods](https://parts.cat.com/en/catcorp/category/reman-products-rods). Official product pages: [0R-0916](https://parts.cat.com/en/catcorp/product/0R-0916), [10R-6211](https://parts.cat.com/en/catcorp/product/10R-6211), [10R-2788](https://parts.cat.com/en/catcorp/product/10R-2788), [20R-0925](https://parts.cat.com/en/catcorp/product/20R-0925), [0R-0921](https://parts.cat.com/en/catcorp/product/0R-0921), [30R-1275](https://parts.cat.com/en/catcorp/product/30R-1275), [30R-1818](https://parts.cat.com/en/catcorp/product/30R-1818).


### Verified images for the Rods category

Exact official Cat Scene7 product images were resolved from the corresponding Cat product pages and attached to `0R-0916`, `20R-0925`, and `0R-0921` in migration `202611232320_set_verified_cat_rod_product_images.sql`. Other products in this seven-part category retain a null image because the retrieved official pages showed only a fallback/logo or a low-resolution thumbnail; no generic replacement was used.



## Completed public Cat Reman categories (2026-11-23): Lifters, Air Dryer Cartridges, Exhaust Bypass Valves

A single migration, `202611232330_import_complete_cat_lifters_airdryer_exhaust_bypass.sql`, imports three complete one-page official Cat categories as search-only `REFERENCE` rows:

- **Lifters — 16 of 16:** `20R-1626`, `0R-9668`, `10R-3139`, `10R-3138`, `20R-9654`, `11R-2387`, `20R-1828`, `30R-1590`, `11R-2388`, `0R-9667`, `20R-2447`, `11R-2389`, `20R-8981`, `0R-3270`, `0R-3271`, `0R-4657`.
- **Air Dryer Cartridges — 1 of 1:** `632-5510`.
- **Exhaust Bypass Valves — 2 of 2:** `30R-0133`, `30R-0132`.

The Lifters import retains Cat's exact engine-family and Compatible Models details where published. For `0R-3271`, `0R-4657`, `632-5510`, and both exhaust-bypass groups, Cat says compatible-model information is unavailable; fitment arrays therefore remain empty rather than guessed. The Cat page for `11R-2388` lists only CAT WDS, which is not treated as an engine fitment. No price or stock is fabricated.

Verified direct Scene7 images resolved from the corresponding official product pages are attached to `20R-1626`, `0R-9668`, `10R-3139`, `10R-3138`, `20R-9654`, `20R-1828`, `0R-9667`, `632-5510`, `30R-0133`, and `30R-0132`. Other Lifters records retain null images where an exact primary asset was not verified.

Official category sources:
- [Lifters](https://parts.cat.com/en/catcorp/category/reman-products-lifters) — 16 records
- [Air Dryer Cartridges](https://parts.cat.com/en/catcorp/category/reman-products-air-dryer-cartridges) — 1 record
- [Exhaust Bypass Valves](https://parts.cat.com/en/catcorp/category/reman-products-exhaust-bypass-valves) — 2 records

Official product sources: [20R-1626](https://parts.cat.com/en/catcorp/product/20R-1626), [0R-9668](https://parts.cat.com/en/catcorp/product/0R-9668), [10R-3139](https://parts.cat.com/en/catcorp/product/10R-3139), [10R-3138](https://parts.cat.com/en/catcorp/product/10R-3138), [20R-9654](https://parts.cat.com/en/catcorp/product/20R-9654), [20R-1828](https://parts.cat.com/en/catcorp/product/20R-1828), [30R-1590](https://parts.cat.com/en/catcorp/product/30R-1590), [11R-2387](https://parts.cat.com/en/catcorp/product/11R-2387), [11R-2388](https://parts.cat.com/en/catcorp/product/11R-2388), [0R-9667](https://parts.cat.com/en/catcorp/product/0R-9667), [20R-2447](https://parts.cat.com/en/catcorp/product/20R-2447), [11R-2389](https://parts.cat.com/en/catcorp/product/11R-2389), [20R-8981](https://parts.cat.com/en/catcorp/product/20R-8981), [0R-3270](https://parts.cat.com/en/catcorp/product/0R-3270), [0R-3271](https://parts.cat.com/en/catcorp/product/0R-3271), [0R-4657](https://parts.cat.com/en/catcorp/product/0R-4657), [632-5510](https://parts.cat.com/en/catcorp/product/632-5510), [30R-0133](https://parts.cat.com/en/catcorp/product/30R-0133), [30R-0132](https://parts.cat.com/en/catcorp/product/30R-0132).



## Completed public Cat Reman categories (2026-11-23): Air Conditioner Compressors, Worklights, Telematics

Migration `202611232340_import_complete_cat_air_conditioner_worklights_telematics.sql` imports three complete official Cat Reman categories:

- **Air Conditioner Compressors — 3 of 3:** `0R-6756`, `0R-5739`, `0R-2897`.
- **Worklights — 2 of 2:** `20R-7307`, `20R-7306`.
- **Telematics — 1 of 1:** `20R-5677`.

All six are search-only `REFERENCE` records. Cat marks `0R-6756` and `20R-7306` discontinued; that status is retained and they are not represented as available for sale. No price or inventory is invented. Fitment and engine family values are taken only from explicit Cat Compatible Models/application headings. For `20R-7307`, Cat's page has a View More control, so only visible model entries are stored.

Verified official Scene7 images from the corresponding product pages are attached to `0R-5739`, `0R-2897`, `20R-7307`, `20R-7306`, and `20R-5677`. `0R-6756` remains image-null because the official page only exposed a low-resolution thumbnail.

Official category sources:
- [Air Conditioner Compressors](https://parts.cat.com/en/catcorp/category/reman-products-air-conditioner-compressors) — 3 records
- [Worklights](https://parts.cat.com/en/catcorp/category/reman-products-worklights) — 2 records
- [Telematics](https://parts.cat.com/en/catcorp/category/reman-products-telematics) — 1 record

Official product pages: [0R-6756](https://parts.cat.com/en/catcorp/product/0R-6756), [0R-5739](https://parts.cat.com/en/catcorp/product/0R-5739), [0R-2897](https://parts.cat.com/en/catcorp/product/0R-2897), [20R-7307](https://parts.cat.com/en/catcorp/product/20R-7307), [20R-7306](https://parts.cat.com/en/catcorp/product/20R-7306), [20R-5677](https://parts.cat.com/en/catcorp/product/20R-5677).


## Completed public Cat Reman categories (2026-11-23): Flywheels, Fan Clutches, Radiators

Migration `202611232350_import_complete_cat_flywheels_fan_clutches_radiators.sql` imports three complete official category listings (21 references):

- **Flywheels — 3 of 3:** `0R-9983`, `10R-2356`, `0R-9986`.
- **Fan Clutches — 13 of 13:** `0R-1039`, `10R-1417`, `20R-8352`, `20R-8360`, `20R-8364`, `20R-8369`, `20R-8373`, `20R-8380`, `20R-8381`, `20R-8390`, `20R-8403`, `20R-8406`, `20R-8418`.
- **Radiators — 5 of 5:** `111-7785`, `140-4238`, `10R-0747`, `10R-0739`, `10R-0745`.

All 21 are search-only `REFERENCE` records, with no price or stock. `10R-0747` is marked discontinued per Cat. The two radiator caps are included because they are members of the official Radiators category; they are not described as Reman products. Engine models and fitment are only populated where Cat product pages explicitly list them. The public pages for most generic fan-clutch entries do not expose fitment, so none is inferred.

Verified official Scene7 images are attached to `0R-1039`, `0R-9983`, `10R-2356`, `0R-9986`, and `10R-0747`. No generic or substitute images are used.

Official category sources:
- [Flywheels](https://parts.cat.com/en/catcorp/category/reman-products-flywheels?page=1&sortBy=0) — 3 records
- [Fan Clutches](https://parts.cat.com/en/catcorp/category/reman-products-fan-clutches?page=1&sortBy=0) — 13 records
- [Radiators](https://parts.cat.com/en/catcorp/category/reman-products-radiators?page=1&sortBy=0) — 5 records

Official product pages: [0R-1039](https://parts.cat.com/en/catcorp/product/0R-1039), [10R-1417](https://parts.cat.com/en/catcorp/product/10R-1417), [0R-9983](https://parts.cat.com/en/catcorp/product/0R-9983), [10R-2356](https://parts.cat.com/en/catcorp/product/10R-2356), [0R-9986](https://parts.cat.com/en/catcorp/product/0R-9986), [10R-0747](https://parts.cat.com/en/catcorp/product/10R-0747), [10R-0739](https://parts.cat.com/en/catcorp/product/10R-0739), [10R-0745](https://parts.cat.com/en/catcorp/product/10R-0745).


## Completed public Cat Reman category (2026-11-23): Generator Ends

Migration `202611232360_import_complete_cat_generator_ends_category.sql` imports the full official Generator Ends category (10 of 10):

`11R-0023`, `11R-0024`, `11R-0025`, `11R-2113`, `30R-0417`, `30R-0418`, `30R-0422`, `30R-0454`, `30R-0484`, `30R-0485`.

All are search-only `REFERENCE` records, without price or inventory. Cat Compatible Models values are retained only when explicitly listed on product pages. `11R-0025` explicitly has no compatibility data; the D6R XE Motor wording remains descriptive only. No engine family is inferred from equipment fitment.

Verified official Scene7 product images are attached to `30R-0417`, `30R-0418`, `30R-0454`, `30R-0484`, and `30R-0485`. Other entries remain image-null where the page exposed only a fallback or non-product image.

Official category source:
- [Generator Ends](https://parts.cat.com/en/catcorp/category/reman-products-generator-ends?page=1&sortBy=0) — 10 records

Official product pages: [11R-0023](https://parts.cat.com/en/catcorp/product/11R-0023), [11R-0024](https://parts.cat.com/en/catcorp/product/11R-0024), [11R-0025](https://parts.cat.com/en/catcorp/product/11R-0025), [11R-2113](https://parts.cat.com/en/catcorp/product/11R-2113), [30R-0417](https://parts.cat.com/en/catcorp/product/30R-0417), [30R-0418](https://parts.cat.com/en/catcorp/product/30R-0418), [30R-0422](https://parts.cat.com/en/catcorp/product/30R-0422), [30R-0454](https://parts.cat.com/en/catcorp/product/30R-0454), [30R-0484](https://parts.cat.com/en/catcorp/product/30R-0484), [30R-0485](https://parts.cat.com/en/catcorp/product/30R-0485).


## Completed public Cat Reman category (2026-11-23): Crankshaft Dampers

Migration `202611232370_import_complete_cat_crankshaft_dampers_category.sql` imports the first 12 entries; corrective migration `202611232371_add_missing_cat_crankshaft_damper_20r4700.sql` adds the omitted `20R-4700`, completing the official Crankshaft Dampers category (13 of 13):

`0R-7853`, `0R-7847`, `20R-4602`, `10R-3833`, `10R-0711`, `10R-0707`, `10R-0716`, `10R-0717`, `10R-0715`, `10R-0718`, `20R-4700`, `20R-5393`, `20R-5420`.

All 13 are search-only `REFERENCE` records with no price or inventory. Explicit Cat Compatible Models and engine headings are retained; equipment titles are not used to invent engine compatibility. Verified official Scene7 images are attached to `0R-7847`, `20R-4602`, `10R-3833`, and `10R-0711`. No generic images are used for the remaining records.

Official category source:
- [Crankshaft Dampers](https://parts.cat.com/en/catcorp/category/reman-products-crankshaft-dampers?page=1) — 13 records

Official product pages: [0R-7853](https://parts.cat.com/en/catcorp/product/0R-7853), [0R-7847](https://parts.cat.com/en/catcorp/product/0R-7847), [20R-4602](https://parts.cat.com/en/catcorp/product/20R-4602), [10R-3833](https://parts.cat.com/en/catcorp/product/10R-3833), [10R-0711](https://parts.cat.com/en/catcorp/product/10R-0711), [10R-0707](https://parts.cat.com/en/catcorp/product/10R-0707), [10R-0716](https://parts.cat.com/en/catcorp/product/10R-0716), [10R-0717](https://parts.cat.com/en/catcorp/product/10R-0717), [10R-0715](https://parts.cat.com/en/catcorp/product/10R-0715), [10R-0718](https://parts.cat.com/en/catcorp/product/10R-0718), [20R-4700](https://parts.cat.com/en/catcorp/product/20R-4700), [20R-5393](https://parts.cat.com/en/catcorp/product/20R-5393), [20R-5420](https://parts.cat.com/en/catcorp/product/20R-5420).


## Completed public Cat Reman category (2026-11-23): Rocker Arms

Migration `202611232380_import_complete_cat_rocker_arms_category.sql` imports the complete official Rocker Arms category (17 of 17):

`20R-8517`, `20R-3319`, `20R-3318`, `20R-3322`, `20R-3317`, `20R-3323`, `20R-6263`, `11R-2442`, `20R-5681`, `10R-3479`, `10R-3480`, `20R-3320`, `20R-3321`, `20R-4505`, `20R-1136`, `0R-9952`, `20R-3324`.

All 17 are search-only `REFERENCE` records with no price or stock. The 17th record, `20R-3324`, was verified through its official product-page breadcrumb (Engine Components → Rocker Arms). Engine fitment is populated only from explicit Cat Compatible Models engine headings; the `compatible_models` array deliberately stores only those engine models, not unverified or incomplete equipment lists.

Five official Scene7 product images were verified and attached: `20R-8517`, `20R-3319`, `20R-3320`, `20R-3321`, and `20R-3324`.

Official category source:
- [Rocker Arms](https://parts.cat.com/en/catcorp/category/reman-products-rocker-arms) — 17 records

Official product pages: [20R-8517](https://parts.cat.com/en/catcorp/product/20R-8517), [20R-3319](https://parts.cat.com/en/catcorp/product/20R-3319), [20R-3318](https://parts.cat.com/en/catcorp/product/20R-3318), [20R-3322](https://parts.cat.com/en/catcorp/product/20R-3322), [20R-3317](https://parts.cat.com/en/catcorp/product/20R-3317), [20R-3323](https://parts.cat.com/en/catcorp/product/20R-3323), [20R-6263](https://parts.cat.com/en/catcorp/product/20R-6263), [11R-2442](https://parts.cat.com/en/catcorp/product/11R-2442), [20R-5681](https://parts.cat.com/en/catcorp/product/20R-5681), [10R-3479](https://parts.cat.com/en/catcorp/product/10R-3479), [10R-3480](https://parts.cat.com/en/catcorp/product/10R-3480), [20R-3320](https://parts.cat.com/en/catcorp/product/20R-3320), [20R-3321](https://parts.cat.com/en/catcorp/product/20R-3321), [20R-4505](https://parts.cat.com/en/catcorp/product/20R-4505), [20R-1136](https://parts.cat.com/en/catcorp/product/20R-1136), [0R-9952](https://parts.cat.com/en/catcorp/product/0R-9952), [20R-3324](https://parts.cat.com/en/catcorp/product/20R-3324).


## Completed public Cat Reman category (2026-11-23): Variable Valve Actuators

Migration `202611232390_import_complete_cat_variable_valve_actuators.sql` imports the complete official category (10 of 10):

`20R-3915`, `20R-6833`, `20R-0271`, `10R-3578`, `10R-6334`, `10R-6335`, `10R-6336`, `10R-6691`, `20R-0268`, `20R-0272`.

All are search-only `REFERENCE` records without price or stock. Engine model fitment is taken from explicit Cat Compatible Models engine headings or model designations in the official product title; no equipment model is converted into an engine fitment. Official Scene7 images verified from the product pages are attached to nine entries; `20R-0271` remains image-null because its primary image was exposed only as an 80px thumbnail.

Official category source:
- [Variable Valve Actuators](https://parts.cat.com/en/catcorp/category/reman-products-variable-valve-actuators?beginIndex=80&page=1&pageSize=16&productBeginIndex=80&sortBy=0) — 10 records

Official product pages: [20R-3915](https://parts.cat.com/en/catcorp/product/20R-3915), [20R-6833](https://parts.cat.com/en/catcorp/product/20R-6833), [20R-0271](https://parts.cat.com/en/catcorp/product/20R-0271), [10R-3578](https://parts.cat.com/en/catcorp/product/10R-3578), [10R-6334](https://parts.cat.com/en/catcorp/product/10R-6334), [10R-6335](https://parts.cat.com/en/catcorp/product/10R-6335), [10R-6336](https://parts.cat.com/en/catcorp/product/10R-6336), [10R-6691](https://parts.cat.com/en/catcorp/product/10R-6691), [20R-0268](https://parts.cat.com/en/catcorp/product/20R-0268), [20R-0272](https://parts.cat.com/en/catcorp/product/20R-0272).


## Combined completed public Cat Reman categories (2026-11-23): Prechamber Kits, Diesel Particulate Filters, Gearboxes

A single migration, `202611232410_import_cat_prechamber_dpf_gearboxes_bundle.sql`, imports all 11 items from three official one-page categories:

- **Prechamber Kits — 2 of 2:** `11R-2061`, `11R-2060`.
- **Diesel Particulate Filters — 4 of 4:** `536-6756`, `535-2508`, `591-2381`, `591-2382`.
- **Gearboxes — 5 of 5:** `20R-9045`, `20R-9567`, `20R-9565`, `20R-9564`, `20R-9566`.

All records are search-only `REFERENCE` entries with no price or stock. Engine fitment is populated only for `11R-2061`, whose official Cat title explicitly identifies G3600; no engine fitment is inferred for the other ten entries. Images remain NULL because no high-resolution product image was verified for this batch.

Official category sources:
- [Prechamber Kits](https://parts.cat.com/en/catcorp/category/reman-products-prechamber-kits) — 2 records
- [Diesel Particulate Filters](https://parts.cat.com/en/catcorp/category/reman-products-diesel-particulate-filters) — 4 records
- [Gearboxes](https://parts.cat.com/en/catcorp/category/reman-products-gearboxes) — 5 records

Official product pages: [11R-2061](https://parts.cat.com/en/catcorp/product/11R-2061), [11R-2060](https://parts.cat.com/en/catcorp/product/11R-2060), [536-6756](https://parts.cat.com/en/catcorp/product/536-6756), [535-2508](https://parts.cat.com/en/catcorp/product/535-2508), [591-2381](https://parts.cat.com/en/catcorp/product/591-2381), [591-2382](https://parts.cat.com/en/catcorp/product/591-2382), [20R-9045](https://parts.cat.com/en/catcorp/product/20R-9045), [20R-9567](https://parts.cat.com/en/catcorp/product/20R-9567), [20R-9565](https://parts.cat.com/en/catcorp/product/20R-9565), [20R-9564](https://parts.cat.com/en/catcorp/product/20R-9564), [20R-9566](https://parts.cat.com/en/catcorp/product/20R-9566).


## Combined completed public Cat Reman categories (2026-11-23): Fan Clutches and Radiators

A single migration, `202611232420_import_cat_fan_clutches_radiators_bundle.sql`, imports all 18 records from two official one-page Cat Reman categories:

- **Fan Clutches — 13 of 13:** `0R-1039`, `10R-1417`, `20R-8352`, `20R-8360`, `20R-8364`, `20R-8369`, `20R-8373`, `20R-8380`, `20R-8381`, `20R-8390`, `20R-8403`, `20R-8406`, `20R-8418`.
- **Radiators — 5 of 5:** `111-7785`, `140-4238`, `10R-0747`, `10R-0739`, `10R-0745`.

All records are search-only `REFERENCE` entries; no price or stock is inferred. Engine models are stored only where the Cat title or Compatible Models section explicitly identifies them. Cat marks `10R-0747` discontinued. Only `140-4238` received an image because its official product page linked a high-resolution Scene7 asset; the other category images were low-resolution or unavailable and remain NULL.

Official category pages:
- [Fan Clutches](https://parts.cat.com/en/catcorp/category/reman-products-fan-clutches) — 13 records
- [Radiators](https://parts.cat.com/en/catcorp/category/reman-products-radiators?page=1&sortBy=0) — 5 records

Official product pages: [0R-1039](https://parts.cat.com/en/catcorp/product/0R-1039), [10R-1417](https://parts.cat.com/en/catcorp/product/10R-1417), [20R-8352](https://parts.cat.com/en/catcorp/product/20R-8352), [20R-8360](https://parts.cat.com/en/catcorp/product/20R-8360), [20R-8364](https://parts.cat.com/en/catcorp/product/20R-8364), [20R-8369](https://parts.cat.com/en/catcorp/product/20R-8369), [20R-8373](https://parts.cat.com/en/catcorp/product/20R-8373), [20R-8380](https://parts.cat.com/en/catcorp/product/20R-8380), [20R-8381](https://parts.cat.com/en/catcorp/product/20R-8381), [20R-8390](https://parts.cat.com/en/catcorp/product/20R-8390), [20R-8403](https://parts.cat.com/en/catcorp/product/20R-8403), [20R-8406](https://parts.cat.com/en/catcorp/product/20R-8406), [20R-8418](https://parts.cat.com/en/catcorp/product/20R-8418), [111-7785](https://parts.cat.com/en/catcorp/product/111-7785), [140-4238](https://parts.cat.com/en/catcorp/product/140-4238), [10R-0747](https://parts.cat.com/en/catcorp/product/10R-0747), [10R-0739](https://parts.cat.com/en/catcorp/product/10R-0739), [10R-0745](https://parts.cat.com/en/catcorp/product/10R-0745).


## Completed public Cat Engine Overhaul Kits category (2026-11-23)

The official [Engine Overhaul Kits](https://parts.cat.com/en/catcorp/category/engine-overhaul-kits) category displays exactly 3 results (1–3 of 3). All three are imported by `202611232430_import_complete_cat_engine_overhaul_kits.sql`:

- `20R-0651` — Cat Reman Platinum Engine Overhaul Kit (3126B). The product title identifies 3126B; Cat Compatible Models separately lists Truck Engine 3126E.
- `356-1448` — Heavy Duty Precious Metals Silver Overhaul Kit. Cat Compatible Models lists Truck Engine C15.
- `435-1295` — Cat Complete Engine Arrangement (C7); Cat marks it discontinued. Compatible Models lists Excavator 329D and 329D L.

All three are search-only `REFERENCE` records with no price, stock, or unverified image. Fitment is limited to Cat's product title, description, or Compatible Models section. Official product pages: [20R-0651](https://parts.cat.com/en/catcorp/product/20R-0651), [356-1448](https://parts.cat.com/en/catcorp/product/356-1448), [435-1295](https://parts.cat.com/en/catcorp/product/435-1295).


## Cat Fuel Rails — first-page partial import (2026-11-23)

The official [Cat Fuel Rails category](https://parts.cat.com/en/catcorp/category/fuel-system-fuel-rails?page=1&sortBy=0) reports **34 results** and shows records 1–16 on its first page. Migration `202611232440_import_cat_fuel_rails_page1_partial.sql` imports those 16 visible records. The category is **not complete**: 18 remaining records require verification from the other pages before it can be marked complete. The current web retrieval could not access those page URLs, so no missing part numbers were guessed.

Imported: `20R-4264`, `20R-4263`, `20R-4267`, `20R-4266`, `436-1092`, `390-2615`, `614-6273`, `477-7728`, `376-2724`, `601-8313`, `258-9955`, `258-9959`, `322-0364`, `385-5991`, `393-9936`, `399-8470`.

All records are `REFERENCE`, with no price, stock or guessed image. Engine model is recorded only where explicitly stated in Cat's listing. The 4 C175 fuel rails also have individual official product pages: [20R-4264](https://parts.cat.com/en/catcorp/product/20R-4264), [20R-4263](https://parts.cat.com/en/catcorp/product/20R-4263), [20R-4267](https://parts.cat.com/en/catcorp/product/20R-4267), [20R-4266](https://parts.cat.com/en/catcorp/product/20R-4266).


## Fuel Rails category reconciliation (2026-11-23)

The official Cat Parts Store currently reports 34 Fuel Rails results. The visible first-page listing (1–16) contains 16 exact part numbers; two missed references, `518-5338` and `562-0434`, are now imported by migration `202611232450_reconcile_cat_fuel_rails_page1.sql`. `518-5338` has an official product page that explicitly reports no compatibility information; `562-0434` remains reference-only because its detail page could not be independently retrieved in this pass. Two earlier rows (`393-9936`, `399-8470`) were not in the visible official category listing and have been reclassified as unclassified references rather than Fuel Rails. The category remains **incomplete**: the remaining 18 results have not yet been independently captured and verified. No price, stock or unverified image is populated.


## Sea Water Pumps (2026-11-23)

The official Cat Parts Store Sea Water Pumps category reports 33 results. Migration `202611232460_import_cat_sea_water_pumps_page1_partial.sql` adds the 16 visible first-page references, without replacing existing part-number records. Engine-family tags are copied only from explicit product-title text; no exact equipment fitment, price, stock or image is inferred. One result (`519-6373`) is a shaft rather than a complete pump and is retained as listed in the source category. **17 results remain unverified; this category is partial.**


## Cat Reman Water Pumps — first-page partial import (2026-11-23)

The official [Cat Reman Water Pumps category](https://parts.cat.com/en/catcorp/category/reman-products-water-pumps) reports **110 results** and displays 16 items per page. Migration `202611232470_import_cat_reman_water_pumps_page1_partial.sql` adds the 16 visible page-one references. Engine-family tags are copied only from explicit model text in the Cat listing; generic titles remain untagged. These are search-only `REFERENCE` records, with no price, stock, image or inferred compatibility. **94 results remain unverified; this category is partial.**

Imported: `20R-9122`, `10R-1669`, `20R-9124`, `10R-0484`, `0R-4680`, `10R-1670`, `10R-0482`, `0R-0999`, `20R-0505`, `20R-9976`, `20R-9847`, `20R-1859`, `10R-9598`, `10R-6400`, `10R-5407`, `0R-1003`.


The current official category listing also exposes two additional references, `0R-7722` and `0R-7867`, added by migration `202611232480_add_cat_sea_water_pump_visible_references.sql`. These are reference-only and have no inferred engine fitment. The category still reports 33 results and remains partial; page 2 and page 3 could not be retrieved in this pass.


## Marine engine directory and application classification (2026-11-23)

The storefront now includes a dedicated marine-engine directory, grouped into:
- Commercial propulsion engines
- High-performance propulsion engines
- Marine generator sets
- Auxiliary engines

The model directory is sourced from Caterpillar's official Marine Power Systems pages. It is a model directory, not a statement of current stock or a guarantee that every engine variant is available in every region. Official source: https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/114160.html

Product application labels use four database values:
- `MARINE`: Cat's public description explicitly identifies marine use, marine engine/auxiliary, or sea-water-pump application.
- `LAND`: Cat public compatible-model/application data supports land-only use for the checked configuration.
- `BOTH`: Cat's compatible-model page explicitly lists marine and land/power applications.
- `UNVERIFIED`: evidence is insufficient; the UI must not guess.

The Persian storefront labels these as «دریایی»، «خشکی» و «هر دو»؛ رکوردهای فاقد شواهد کافی در رابط کاربری بدون برچسب نمایش داده می‌شوند.. Evidence and source URL are stored with each classification and are available in product details.

Verified examples from Cat Parts Store:
- `6J-2680` O-ring: Cat's compatible-model page includes Marine Engine and Marine Auxiliary as well as many land-machine and generator applications; classified BOTH.
- `9Y-0849` Support RH: Cat lists Marine Engine and Marine Auxiliary plus generator-set, industrial and petroleum engine groups; classified BOTH.
- `302-8728` Motor Assembly: Cat lists Marine Auxiliary and Marine Engine plus generator, industrial and petroleum applications; classified BOTH.
- Sea-water pump references are classified MARINE only when the official name/description explicitly says Sea Water Pump. A fresh-water pump merely appearing in the Sea Water Pumps category is not automatically classified MARINE.

Official references:
- https://parts.cat.com/en/catcorp/product/6J-2680
- https://parts.cat.com/en/catcorp/product/9Y-0849
- https://parts.cat.com/en/catcorp/product/302-8728

Marine classification does not replace serial-number/arrangement validation for exact fitment. All part references remain non-sellable reference records unless independently approved for sale; no price or stock is inferred.


## Additional marine-compatible Cat part references (2026-11-23)

Migration `202611232540_add_more_verified_marine_parts.sql` adds 10 additional official Cat Parts Store references. These records remain search-only `REFERENCE` rows, with NULL pricing, zero stock, and no guessed image or serial-specific fitment.

| Part number | Cat description | Marine model evidence | Group |
|---|---|---|---|
| 4P-0710 | ENGINE AIR FILTER | 3516, 3508B, 3516B/C, 3512B/C | Air intake & filtration |
| 068-0005 | TUBE | 3516 | Fluid lines |
| 7W-3737 | SUPPORT | 3516C/E, 3516B Auxiliary | Mounts & supports |
| 109-5738 | FILM-INTRFCE | 3512/3516, C32/C30/C9/C7, 3406E and others | Electrical & controls |
| 161-0801 | BAR | 3516 | General engine parts |
| 190-0330 | MODULE | C280-6/8/12/16, 3612/3616 | Electrical & controls |
| 301-3043 | INSERT V SEA | C280-12 | Sealing |
| 110-3754 | ADAPTER | C280-6/8/12/16, 3608 Auxiliary | Adapters & fittings |
| 5L-6954 | ELBOW | 3512/3516/3508 families | Fluid lines |
| 160-8765 | FITTING AS | 3516, 3508 | Adapters & fittings |

Note: the migration contains exactly 10 records, matching the table above. Every one of these pages lists at least one marine compatible model and at least one non-marine engine/application, so the current application tag is `BOTH`. Sources: https://parts.cat.com/en/catcorp/product/4P-0710, https://parts.cat.com/en/catcorp/product/068-0005, https://parts.cat.com/en/catcorp/product/7W-3737, https://parts.cat.com/en/catcorp/product/109-5738, https://parts.cat.com/en/catcorp/product/161-0801, https://parts.cat.com/en/catcorp/product/190-0330, https://parts.cat.com/en/catcorp/product/301-3043, https://parts.cat.com/en/catcorp/product/110-3754, https://parts.cat.com/en/catcorp/product/5L-6954, https://parts.cat.com/en/catcorp/product/160-8765.


## Marine fuel, lubrication and cooling references (2026-11-23)

Migration `202611232560_expand_marine_fuel_lube_cooling_parts.sql` adds 15 official Cat Parts Store references. All are search-only `REFERENCE` rows; price and stock remain unset/zero and image URLs are not guessed.

| Part number | Cat item | Group | Marine engine families |
|---|---|---|---|
| 9Y-5068 | Auxiliary Sea Water Pump Impeller | Cooling / sea water | 3500 |
| 10R-9598 | Reman Auxiliary Sea Water Pump | Cooling / sea water | 3516 |
| 520-2924 | Engine Oil Pump | Lubrication | C32, 3412E |
| 557-7650 | Engine Oil Pump | Lubrication | C32, C32B |
| 20R-1516 | Reman Engine Oil Pump | Lubrication | C32 |
| 0R-7724 | Reman Auxiliary Water Pump | Cooling / sea water | 3500 |
| 5N-9021 | Auxiliary Sea Water Pump Impeller | Cooling / sea water | 3500 |
| 318-2579 | Auxiliary Sea Water Pump | Cooling / sea water | 3500 |
| 416-0613 | Water Pump with Impeller | Cooling | 3512C, 3516 |
| 0R-8210 | Reman Engine Oil Pump | Lubrication | C30, C32, 3412C/E |
| 20R-0675 | Reman Fuel Injector | Fuel / injection | C280-6/8/12/16 |
| 572-5881 | 12 Volt Fuel Priming Pump | Fuel / priming | C18 |
| 292-8125 | Fuel Line Tube Assembly | Fuel / lines | C18 |
| 140-9545 | Fuel Cooler Core | Fuel / cooling | C18, 3406E |
| 313-2650 | Water Pump | Cooling | 3516 |

Application flags are derived from the Cat Compatible Models section: `MARINE` is used only when the displayed list contains a marine engine class and no non-marine engine class; `BOTH` when Cat lists both. The category labels group components by function, not by a claim of serial-number-level fitment.

Official sources: https://parts.cat.com/en/catcorp/product/9Y-5068, https://parts.cat.com/en/catcorp/product/10R-9598, https://parts.cat.com/en/catcorp/product/520-2924, https://parts.cat.com/en/catcorp/product/557-7650, https://parts.cat.com/en/catcorp/product/20R-1516, https://parts.cat.com/en/catcorp/product/0R-7724, https://parts.cat.com/en/catcorp/product/5N-9021, https://parts.cat.com/en/catcorp/product/318-2579, https://parts.cat.com/en/catcorp/product/416-0613, https://parts.cat.com/en/catcorp/product/0R-8210, https://parts.cat.com/en/catcorp/product/20R-0675, https://parts.cat.com/en/catcorp/product/572-5881, https://parts.cat.com/en/catcorp/product/292-8125, https://parts.cat.com/en/catcorp/product/140-9545; 313-2650: https://parts.cat.com/en/catcorp/313-2650.

## Further C32 fuel and 3500-series marine service parts (2026-11-23)

Migration `202611232570_add_verified_c32_fuel_and_3500_cooling_parts.sql` adds 10 more verified reference records:

| Part number | Description | Group | Application |
|---|---|---|---|
| 298-2020 | Fuel Lines Tube | C32 fuel | Marine |
| 272-1272 | 7.04mm Fuel Lines Tube | C32 fuel | Marine |
| 472-4908 | Fuel Lines Tube Assembly | C32 fuel | Marine + land |
| 364-8678 | Fuel Supply Tube | C32 fuel | Marine + land |
| 364-8677 | Fuel Lines Hose | C32 fuel | Marine |
| 364-9372 | Fuel Filter Lines Hose Assembly | C32 fuel | Marine + land |
| 364-5893 | Fuel Hose Assembly | C32 fuel | Marine + land |
| 5N-9022 | Auxiliary Sea Water Pump Port Plate | 3500 cooling | Marine + land |
| 5N-2618 | Auxiliary Sea Water Pump Impeller | 3500 cooling | Marine + land |
| 0R-4345 | Reman Engine Oil Pump | 3500 lubrication | Marine + land |

Application tags follow the compatible-model classes shown on each official Cat page. For example, 298-2020 and 272-1272 list only Marine Engine/Marine Auxiliary C32, while 472-4908 lists both Marine Engine and Generator Set models.

Official sources: https://parts.cat.com/en/catcorp/product/298-2020, https://parts.cat.com/en/catcorp/product/272-1272, https://parts.cat.com/en/catcorp/product/472-4908, https://parts.cat.com/en/catcorp/product/364-8678, https://parts.cat.com/en/catcorp/product/364-8677, https://parts.cat.com/en/catcorp/product/364-9372, https://parts.cat.com/en/catcorp/product/364-5893, https://parts.cat.com/en/catcorp/product/5N-9022, https://parts.cat.com/en/catcorp/product/5N-2618, https://parts.cat.com/en/catcorp/product/0R-4345.

## C18 and 3500-series marine turbo, cooling, electrical and mechanical references (2026-11-23)

Migration `202611232580_add_verified_c18_and_3500_marine_parts.sql` adds nine official Cat Parts Store references. They remain reference-only, with no fabricated price, stock or image URL.

| Part number | Description | Group | Application |
|---|---|---|---|
| 338-1664 | Turbocharger | C18 air / turbo | Marine |
| 20R-2734 | Cat Reman Turbocharger | C18 air / turbo | Marine |
| 20R-3623 | Cat Reman Turbocharger | 3500 air / turbo | Marine + land |
| 553-3686 | Hose Assembly Water | 3500 cooling / hose | Marine + land |
| 7E-0688 | Turbocharger Cartridge Seal Ring | 3516 air / turbo | Marine + land |
| 150-3141 | Cover Group-Mechanical | C18 mechanical | Marine + land |
| 223-8225 | Control-Dual | C18 controls | Marine + land |
| 243-0762 | Harness Assembly | C18 electrical | Marine + land |
| 255-6451 | Harness Assembly | C18 electrical | Marine + land |

Application labels follow the engine classes displayed by Cat: marine-only compatible lists are marked Marine; lists containing marine and non-marine classes are marked Marine + land. These are model-family references, not serial-number-level fitment guarantees.

Official sources: https://parts.cat.com/en/catcorp/product/338-1664, https://parts.cat.com/en/catcorp/product/20R-2734, https://parts.cat.com/en/catcorp/product/20R-3623, https://parts.cat.com/en/catcorp/product/553-3686, https://parts.cat.com/en/catcorp/product/7E-0688, https://parts.cat.com/en/catcorp/product/150-3141, https://parts.cat.com/en/catcorp/product/223-8225, https://parts.cat.com/en/catcorp/product/243-0762, https://parts.cat.com/en/catcorp/product/255-6451.

## Application-label evidence correction (2026-11-23)

Migration `202611232590_remove_unproven_land_application_tags.sql` changes eight product labels from `LAND` to internal `UNVERIFIED`: `CAT-20R-2510`, `CAT-20R-5367`, `CAT-30R-0084`, `CAT-593-5344`, `CAT-0R-8200`, `CAT-9X-3406`, `CAT-260-3406` and `CAT-20R-3958`. The checked public pages did not prove land-only exclusivity; absence of a marine listing is not sufficient evidence for a definitive land label. The storefront suppresses unknown application labels, so users see only supported «دریایی»، «خشکی» or «هر دو» labels.

## C32 and 3500-series fuel, turbo-cooling and lubrication references (2026-11-23)

Migration `202611232600_add_verified_c32_3500_cooling_and_fuel_parts.sql` adds nine Cat Parts Store reference records:

| Part number | Description | Engine family | Application |
|---|---|---|---|
| 167-1751 | Turbocharger Water Lines Tube | 3516 / 3516B | Marine + land |
| 8N-0419 | Turbocharger Water Lines Tube | 3508 / 3512 | Marine + land |
| 097-7404 | DM Bulk Tube | 3500 / C280 | Marine + land |
| 487-0039 | Fuel Tube Assembly | C32 | Marine + land |
| 525-7148 | Fuel Tube Assembly | C32 / C32B | Marine + land |
| 309-4499 | Support | C32 | Marine + land |
| 368-9037 | Fuel Hose Assembly | C32 | Marine + land |
| 1W-2447 | Oil Cooler Outlet Adapter | 3512 / 3516 | Marine + land |
| 339-5148 | Engine Oil Filter Cover | 3500 | Marine + land |

Each application label follows Cat's published Compatible Models classes. These entries remain reference-only, without fabricated pricing, stock, or image links. Family-level compatibility does not replace serial-number-specific parts validation.

Official Cat source pages: https://parts.cat.com/en/catcorp/product/167-1751, https://parts.cat.com/en/catcorp/product/8N-0419, https://parts.cat.com/en/catcorp/product/097-7404, https://parts.cat.com/en/catcorp/product/487-0039, https://parts.cat.com/en/catcorp/product/525-7148, https://parts.cat.com/en/catcorp/product/309-4499, https://parts.cat.com/en/catcorp/product/368-9037, https://parts.cat.com/en/catcorp/product/1W-2447, https://parts.cat.com/en/catcorp/product/339-5148.


## Additional C18, C32, 3500 and C280 marine references (2026-11-24)

Migration `202611240010_expand_verified_marine_engine_parts.sql` adds 24 Cat Parts Store references with explicit Marine Engine or Marine Auxiliary compatible-model evidence. All remain `REFERENCE`; prices and stock are not populated, and no product images are guessed.

| Part number | Engine family | Technical group | Application |
|---|---|---|---|
| 455-1186 | C18 | Major overhaul | Marine |
| 455-7246 | C18 | Major overhaul | Marine |
| 455-7248 | C18 | Top-end overhaul | Marine |
| 488-1675 | C18 | General engine | Marine + land |
| 493-9456 | C18 | Housing / body | Marine + land |
| 30R-0925 | C18 | Cylinder pack | Marine |
| 384-7486 | C18 / C32 | Engine mount | Marine |
| 174-5517 | C18 / C30 / C32 / 3412E | Flexible mount | Marine |
| 324-6140 | C32 | Cylinder block | Marine |
| 634-6936 | C32 | Overhaul kit | Marine |
| 233-8685 | C32 | Wiring harness | Marine |
| 415-4994 | C32 | Cylinder-head install kit | Marine |
| 384-7484 | C32 | Engine mount | Marine |
| 502-3895 | C32 | Converter | Marine |
| 30R-0624 | C32 | Cylinder pack | Marine |
| 519-7628 | C32 / C32B | Hose adapter | Marine |
| 641-7871 | C32 / C32B | Oil lubrication | Marine |
| 578-1572 | C32 / 3516E | Separator | Marine + land |
| 161-0801 | 3516 | Mechanical bar | Marine |
| 068-0005 | 3516 | Tube / connection | Marine + land |
| 114-3378 | 3512 / 3516 | Cover | Marine + land |
| 8T-5361 | C15 / 3406E / 3500 / C280 / C30 / C32 | Multi-family engine component | Marine + land |
| 4P-0710 | 3500 air system | Air filter | Marine + land |
| 441-4878 | 3500 / C280 / C175-16 | Damper | Marine + land |
| 110-3754 | C280 / 3608 | Adapter | Marine + land |

"Marine" means the Cat page explicitly lists a marine engine/auxiliary application; it does not claim the part is exclusive to marine use. "Marine + land" is used when the same Cat page also lists explicit industrial, off-highway, or other non-marine equipment applications. Verify exact engine serial number and Arrangement before accepting an order.

Official Cat source pages are linked in the migration for each row.


## C32B and C280 marine support, cooling, electrical and fluid references (2026-11-24)

Migration `202611240020_expand_c32b_c280_marine_parts.sql` adds 16 further Cat Parts Store references. All are reference-only and retain null price / zero stock semantics; Cat's listed engine family is not a substitute for serial and Arrangement validation.

| Part number | Engine family | Technical group | Application |
|---|---|---|---|
| 578-5820 | C32B | Cylinder block | Marine |
| 583-7208 | C32B / C32 | Support and mount | Marine |
| 281-8173 | C280 / 3500 | Fittings | Marine + land |
| 7C-4416 | 3500 / C280 / 3600 | Body and housing | Marine + land |
| 242-8912 | C32 | Oil lubrication | Marine + land |
| 644-4976 | C32B | Cooling | Marine |
| 644-4975 | C32B | Cooling | Marine |
| 7T-0094 | C7.1 / C9.3 / C18 / C32 / 3500 | Multi-family engine part | Marine + land |
| 141-4318 | C280 / 3600 | Adapter | Marine + land |
| 334-2667 | C280 / C32 / 3512E / 3516E | Electrical control | Marine + land |
| 457-9158 | C32 / C32B | Fluid tube | Marine |
| 6V-7485 | C280 / 3600 | Pipe fitting | Marine + land |
| 603-6493 | C32 / C32B | Tube assembly | Marine + land |
| 393-3404 | C280 / 3500 / C175-16 | Control label | Marine |
| 107-4385 | C280 / 3600 | Tube assembly | Marine + land |
| 142-2930 | C280 / 3600 | Plate | Marine |

The application tag is based on the official Cat Compatible Models class: `MARINE` where the page lists a marine class and no explicit non-marine machine/industrial fitment; `BOTH` where the same page also lists industrial, off-highway, locomotive or other non-marine equipment classes.


## C18 turbocharger and C280/C32 additional marine references (2026-11-24)

Migration `202611240030_expand_verified_c280_c32_turbo_parts.sql` adds 10 additional Cat Parts Store reference records. These remain non-sale reference records; no price, stock, or image URL is invented.

| Part number | Engine family | Technical group | Application |
|---|---|---|---|
| 338-1664 | C18 | Turbocharger / air system | Marine |
| 190-0330 | C280 / 3600 | Module / control | Marine + land |
| 4W-7490 | C280 / 3600 | Adapter / fitting | Marine + land |
| 165-4292 | C280 / 3600 | Tube assembly | Marine + land |
| 192-1406 | C280 / 3500 | Ferrule / fitting | Marine + land |
| 7E-7154 | C280 / 3600 | Mechanical / journal | Marine + land |
| 174-9012 | C280 / 3600 | Mounting / support | Marine + land |
| 516-5982 | C32 / C32B | Hose / fluid routing | Marine + land |
| 574-0279 | C32 / C32B | Cylinder block | Marine + land |
| 552-8508 | C32 / C32B | Tube / fluid routing | Marine + land |

The `MARINE` / `BOTH` distinction follows the classes explicitly listed by Cat on each linked Compatible Models page. In particular, Generator Set, Petroleum Engine, Gas Engine, Locomotive and Industrial Engine are treated as non-marine applications for this catalog label. Model-family matches do not replace serial-number and Arrangement verification.


## C15 / 3406 Cat Reman, bearing and piston-cooling references (2026-11-24)

Migration `202611240170_add_c15_cat_reman_bearing_oiljet_references.sql` adds five official Cat Parts Store reference records. These remain reference-only: Cat customer pricing requires dealer sign-in, and no stock or sale price is inferred.

| Part number | Official description | Engine family | Application |
|---|---|---|---|
| 10R-1503 | Cat Reman cylinder pack, C15, 16.6:1 | C15 | Land |
| 0R-9942 | Cat Reman cylinder pack, C15 low HP, 18:1 | C15 | Land |
| 328-5573 | Connecting rod bearing | C15 / 3406 | Marine + land |
| 277-3076 | Oil jet brazed tube | C15 / 3406 | Marine + land |
| 0R-9449 | Cat Reman 3406E one-section oil pump | C15 / C18 / 3406 / 3408 / 3412 | Marine + land |

Application labels follow the compatible equipment classes shown on each official Cat product page. They are family-level catalog evidence, not serial-number-specific fitment guarantees. Verify engine serial number and Arrangement before accepting an order.

Official Cat sources: https://parts.cat.com/en/catcorp/product/10R-1503, https://parts.cat.com/en/catcorp/product/0R-9942, https://parts.cat.com/en/catcorp/product/328-5573, https://parts.cat.com/en/catcorp/product/277-3076, https://parts.cat.com/en/catcorp/product/0R-9449.

## Additional official Cat service and engine references (2026-11-24)

Migration `202611240180_add_verified_cat_c15_3500_service_references.sql` adds seven Cat Parts Store reference records. All remain `REFERENCE`: no customer price, stock, or serial-level fitment is inferred.

| Part number | Official description | Engine family | Application |
|---|---|---|---|
| 0R-3361 | Cat Reman Oil Cooler Core | C15 / 3406 | Marine + land |
| 1W-4674 | KIT-PUMP GP | 3512 / 3516 | Marine + land |
| 222-5152 | Main Water Pump Rebuild Kit | 3508 / 3512 / 3516 / C32 | Marine + land |
| 4N-0933 | Gasket | C15 / C18 / 3406 / 3408 | Land |
| 202-2783 | Plate-Alternator | 3406 / 3408 / 3512 / 3516 / C15 / C18 | Land |
| 10R-5488 | Cat Reman Electronic Control Module | 3508 / 3512 / 3516 | Marine + land |
| 20R-5462 | Cat Reman Solenoid Kit | C9 / C15 / C18 / 3406 / 3408 / 3500 family | Marine + land |

The application tag follows the equipment classes explicitly listed by Cat on each official page. A family-level listing is not a serial-number-specific fitment guarantee; verify the full engine serial number and Arrangement before accepting an order. The official source URLs are stored per row in the migration.


## Off Road filter candidates cross-checked against official Cat pages — 25 Nov 2026

Five identifiers from the Off Road public popular-parts index were checked against exact Cat Parts Store product pages. These are reference records, not priced inventory.

| CAT part number | Official Cat description | Public Cat evidence | Fitment handling |
|---|---|---|---|
| 1R-0749 | Secondary Fuel Filter; Advanced High Efficiency; spin-on; 3.689 in diameter × 10.571 in length | Compatible-model list includes C18/C15/C16/C13/C11 and 3406/3408/3176 families | Model-class reference only; exact serial/Arrangement still required |
| 1R-1808 | Engine Oil Filter; Advanced Efficiency; spin-on; 5.346 in diameter × 12.087 in length | Compatible-model list includes C18/C15/C13/C11/C9/C7 and 3406/3408 families | C18 appears under Power Pack and C18 Marine GS generator-set results, not as a distinct Marine Engine C18 class; do not tag as C18 marine-engine fitment |
| 326-1644 | Fuel Water Separator; Advanced Efficiency; spin-on; 4.264 in diameter × 7.323 in length | Cat explicitly lists Marine Engine 3406B and many non-marine engine/machine classes | BOTH at model-class level only; serial/Arrangement required |
| 360-8960 | Engine Fuel Filter Element; Ultra High Efficiency; cartridge; 3.209 in diameter × 6.102 in length | Cat explicitly lists Marine Engine C7.1 and multiple non-marine classes | BOTH at model-class level only; serial/Arrangement required |
| 7W-2326 | Engine Oil Filter; Standard Efficiency; spin-on; 3.78 in diameter × 6.717 in length | Cat lists 3054 and machine families; no Marine Engine class shown in retrieved result | No marine tag; model-class reference only |

All five raw identifiers appear in the Off Road public 500-part index. The Off Road index descriptions are abbreviated and the brand column is blank; CAT authenticity and descriptions above come from the exact Cat product pages, not from the reseller's index. Off Road is not an authorized Caterpillar dealer. No prices, stock quantities, interchange claims or saleable SKUs were created.

Official evidence:
- https://parts.cat.com/en/catcorp/product/1R-0749
- https://parts.cat.com/en/catcorp/product/1R-1808
- https://parts.cat.com/en/catcorp/product/326-1644
- https://parts.cat.com/en/catcorp/product/360-8960
- https://parts.cat.com/en/catcorp/product/7W-2326
- Off Road discovery list: https://offroadeq.com/parts


## Second Off Road filter batch cross-checked against official Cat pages — 25 Nov 2026

Six additional Off Road public-index filter identifiers were matched to exact Cat Parts Store pages:

| CAT part number | Official Cat description | Technical evidence | Application handling |
|---|---|---|---|
| 1G-8878 | Hydraulic/Transmission Oil Filter, Advanced Efficiency, spin-on | 3.709 in diameter × 9.441 in length; Out-to-In | CAT page lists many machine classes. Its comparison panel shows 102-2828 and 156-0214 as alternate products, not a confirmed direct interchange |
| 1R-0739 | Standard Efficiency Engine Oil Filter | 4.248 in diameter × 10.122 in length; Out-to-In | CAT comparison panel displays 1R-1807 as an alternate product; no supersession/interchange assumed |
| 1R-0750 | Advanced Efficiency Secondary Fuel Filter | 3.374 in diameter × 7.146 in length; Out-to-In | CAT explicitly lists Marine Engine C12, 3116, 3208, 3306B, 3304 and C9, plus land classes; BOTH at model-class level |
| 1R-0751 | Advanced Efficiency Fuel Filter | 3.374 in diameter × 7.252 in length; Out-to-In | No Marine Engine class in retrieved compatible-model result; no marine tag |
| 1R-0762 | Advanced High Efficiency Engine Fuel Filter | 3.681 in diameter × 10.504 in length; Out-to-In | C13 and machine families listed; no Marine Engine class in retrieved result |
| 1R-1807 | Advanced Efficiency Engine Oil Filter | Cat comparison panel shows 4.248 in diameter × 10.024 in length | C7/3126/3306/3116 and machine families listed; no distinct Marine Engine class in retrieved result |

Official product pages:
- https://parts.cat.com/en/catcorp/product/1G-8878
- https://parts.cat.com/en/catcorp/product/1R-0739
- https://parts.cat.com/en/catcorp/product/1R-0750
- https://parts.cat.com/en/catcorp/product/1R-0751
- https://parts.cat.com/en/catcorp/product/1R-0762
- https://parts.cat.com/en/catcorp/product/1R-1807

Off Road's public index lists the same raw identifiers with abbreviated descriptions and no brand value. The CAT descriptions and technical details above are based on CAT product pages. CAT comparison panels are recorded as alternate-product suggestions only, not direct interchange or supersession. No prices, stock quantities or saleable SKUs were created.


## 1R-0716 official CAT document verification — 25 Nov 2026

Off Road public index lists 1R0716 as FILTER A. No current exact Cat Parts Store product page was returned in the web search, but two official Caterpillar documents provide direct evidence:

- [Cat Advanced High Efficiency Engine Oil Filters (2015)](https://s7d2.scene7.com/is/content/Caterpillar/CM20150415-45165-44935) identifies 1R-0716 as the standard-efficiency oil filter and 1R-1808 as the approved upgrade option for engines using 1R-0716.
- [Cat preventive-maintenance kits](https://caterpillar.scene7.com/is/content/Caterpillar/CM20230906-5d3e7-f57c3) lists 1R-0716 for 3176, 3406/B/C/E, C-10, C-12, C-15 and C-16 engine families. It lists 1R-1808 in the related kit family with additional C11/C13/C15 references.

The project records 1R-0716 as a CAT official-document reference, not a serial-specific fitment guarantee. The documented 1R-0716 → 1R-1808 relationship is an approved upgrade option, not an unconditional replacement instruction for every machine. Check serial number and Arrangement before fitment.
