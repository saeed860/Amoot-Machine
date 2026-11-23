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

The sellable storefront catalog has been expanded with ten further Cat Parts Store records in migration `202611231500_expand_cat_oem_engine_products.sql`. Each row uses the exact Cat part number (prefixed with `CAT-` in Amoot's SKU), the Cat product page as its source, and a Cat Scene7 product image. Price is NULL and stock is 0, so each item is quote-only until supplier pricing and availability are confirmed.

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

| CAT-20R-4278 | 20R-4278 | https://parts.cat.com/en/catcorp/product/20R-4278 | 3406 Reman Long Block |
| CAT-10R-9063 | 10R-9063 | https://parts.cat.com/en/catcorp/product/10R-9063 | C15 Reman Short Block |

These are distinct Cat catalogue records, not a claim that every part fits every variant of the seven engine families. In particular, G-series references are not automatically interchangeable with diesel engine model references; C18 Reman engine numbers also have different machine/application configurations. Always check Cat SIS / dealer fitment by full serial number and Arrangement before order acceptance. Cat product images and descriptions are linked to Caterpillar's public Parts Store; commercial image reuse remains subject to Caterpillar's terms.

