# Caterpillar part-number catalog and fitment evidence

Amoot's public catalog is designed to let customers search by a full or partial Cat part number **without entering a machine serial number**. The serial number is not a prerequisite for discovering a part number.

Keep two separate questions separate:

- **Part-number discovery:** Is this a known Caterpillar part reference? Use public Cat sources and clearly labeled supplier references.
- **Exact machine fitment:** Is this exact part correct for this individual engine/equipment? Confirm against the applicable Cat parts information, often using model, serial number and Arrangement.

## Source priority

1. **Cat Parts Store public product pages and public Cat Parts Reference Guides** — preferred for public part-number discovery and official cross-checks.
2. **Cat SIS 2.0 / SIS2GO** — authoritative technical reference for parts information, diagrams, groups and serial-/Arrangement-specific fitment where available to an authorized user.
3. **Independent supplier catalogs** — useful for discovery and coverage only; always labeled as supplier reference, never represented as Cat-confirmed fitment.

Useful official starting points:
- Cat Parts Store: https://parts.cat.com/
- Cat Parts Diagram: https://parts.cat.com/en/catcorp/parts-diagram
- Cat Parts Reference Guides: https://www.cat.com/en_US/support/maintenance/parts-reference-guides.html
- Cat SIS2GO: https://www.cat.com/sis2go

Do not assume Cat provides a freely downloadable global dump/API of every part number. Do not scrape authenticated Cat SIS sessions, bypass dealer/customer permissions, or store Cat login credentials, cookies or tokens.

## Public part-number import (no serial number required)

1. Find the part on a public Cat Parts Store page or in an official public Cat reference guide.
2. Record the exact part number, Cat product/part description, source page/document and any explicit model/application wording actually shown by that source.
3. Import the row through the Amoot admin part-catalog import. Batches may contain up to 500 rows.
4. Set `sourceName` to a precise label such as `Cat Parts Store (official)` or `Cat Parts Reference Guide (official)`; set `verificationStatus` to `REFERENCE` unless the record meets the serial-specific evidence rule below.
5. Do not infer engine compatibility from a search alias, broad family name, supplier listing or visually similar part.

A public Cat part page can support the existence/description of a part reference; it does not automatically prove fitment to every engine in a family.

## Optional serial-specific fitment verification

Serial number and Arrangement are **optional for catalog discovery**, but may be needed to confirm exact fitment for a particular engine/equipment.

For a serial-specific SIS verification:
1. Use an authorized Cat SIS 2.0 / SIS2GO account and select the relevant equipment/engine using its serial number.
2. Locate the applicable system, Arrangement and parts group; record the exact part number and the SIS document/illustration reference.
3. Preserve the serial number, Arrangement, document reference and source URL/reference with the imported row.
4. Only then set `verificationStatus` to `OEM_VERIFIED`.

The API and database reject `OEM_VERIFIED` unless the source identifies Cat SIS/SIS2GO and includes the serial number, Arrangement and document reference. For public part-number records without this evidence, use `REFERENCE` or `NEEDS_SERIAL_CHECK`.

## Import columns

| Column | Required | Meaning |
|---|---|---|
| partNumber | Yes | Exact part number; punctuation is normalized for search |
| name | Yes | Part description |
| engineModels | Yes | Only models explicitly supported by the source; multiple values separated by semicolon |
| sourceName | Yes | Exact source label, e.g. Cat Parts Store (official) |
| sourceUrl | Yes | Public Cat page or documented SIS reference |
| technicalGroup | No | System/component group |
| description | No | Additional source description |
| sourceNote | No | Limits, supersession or verification note |
| verificationStatus | Yes | REFERENCE, NEEDS_SERIAL_CHECK or OEM_VERIFIED |
| sourceSerialNumber | OEM_VERIFIED only | Exact equipment/engine serial used in SIS |
| arrangementNumber | OEM_VERIFIED only | Arrangement from SIS |
| sourceDocumentRef | OEM_VERIFIED only | SIS illustration/group/document reference |

## Search and display rules

- Full and partial part-number searches work without a serial number.
- Search results from the reference catalog are not inventory. Real stock and sale price come only from the store's `products` records.
- A catalog-only or out-of-stock result must offer **استعلام از فروشنده**; never invent stock or price.
- `3512CB` and `3516CB` may be normalized as search aliases under `3512` and `3516` to discover candidate references. This alias is not evidence that a part fits a CB engine.
- Display the source and verification status. Exact fitment should be confirmed separately when required.

## CSV template

Use `docs/cat-sis-import-template.csv`. The sample row is intentionally blank; do not invent part numbers or compatibility.
