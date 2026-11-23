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
