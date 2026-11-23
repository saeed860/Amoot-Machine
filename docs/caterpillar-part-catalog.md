# Caterpillar part-number catalog

The store keeps Caterpillar references in `public.part_catalog`, separate from saleable inventory. Search results are reference-only until the exact engine serial number and Arrangement are checked.

## Current seed coverage

As of 2026-11-23, the repository seed contains 237 unique part-number references. Model counts overlap because one part may be listed for multiple engine families.

| Engine family | Current references | Public directory count |
|---|---:|---:|
| 3406 / 3408 (combined family directory) | 14 | 14 |
| C9 / C9.3 | 74 | 125 |
| C15 | 142 | 142 |
| C18 | 114 | 144 |
| 3508 / 3512 / 3516 family | 65 for 3512 and 65 for 3516 | 144 combined |

The public directory is a third-party reference, not Cat SIS. All imported rows are marked `REFERENCE`, not `OEM_VERIFIED`. A third-party supplier listing for part `392-0217` is the only direct `3512CB` reference in this seed. Searches for `3512CB` and `3516CB` also return candidates from the base 3512 / 3516 family, clearly labeled as family-level results; that is not confirmation of CB-specific fitment.

## Search and import

- Public search: `GET /api/products?q=PART_NUMBER` searches saleable products and the separate part catalog.
- Admin import: `POST /api/admin/parts/import` accepts up to 500 rows with part number, name, engine models, technical group and HTTPS source URL.
- The admin Products panel accepts Excel/CSV imports for the part catalog.
- Part references have no price or stock and cannot be mistaken for available inventory.

## Remaining work

The public C9, C18 and 3500-family directories advertise more references than are currently seeded. The remaining pages still need extraction and review. For OEM-complete data, use Cat SIS / the authorized parts catalog with the full engine model, serial number and Arrangement number. Never promote a family-level match to OEM-confirmed compatibility without that check.
