# Caterpillar part-number catalog

The store keeps Caterpillar references in `public.part_catalog`, separate from saleable inventory. Search results are reference-only until the exact engine serial number and Arrangement are checked.

## Current seed coverage

As of 2026-11-23, the initial seed contained 237 unique references. After page-by-page expansion and official Cat injector-reference corrections, the migrations now produce 394 unique part-number records. Model counts overlap because one part may be listed for multiple engine families; cross-family references can also make a tagged family count differ from the third-party directory's own total.

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
- `202611231780`: attachments and structures.
- `202611231790`: cab filters/cameras, equipment upgrades, hose/cap parts, repair kits and workshop supplies.
- `202611231800`: product-specific image corrections for `575-2083` and `626-4231`.

All these rows remain `REFERENCE`, with no price or stock. Fitment is recorded only where Cat's product page explicitly lists the model; category membership alone is not treated as machine compatibility.

**Coverage limitation:** many Cat category pages display only 1–16 of 1,200 results (75 pages), and their subcategories contain additional inventories. This batch captures the visible first-page samples and selected official product pages; it is not a complete export of all Cat part numbers or a substitute for Cat SIS. Continue crawling remaining pages/categories or obtain an authorized complete catalog feed before claiming full coverage.
