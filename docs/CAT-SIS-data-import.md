# Importing official Caterpillar SIS data into Amoot Machine

## Source priority

1. Cat SIS 2.0 / SIS2GO (primary authoritative source).
2. Cat Parts Store product and parts-diagram pages (official public cross-check).
3. Independent supplier catalogs (discovery-only; always marked REFERENCE).

Amoot does not scrape authenticated Cat SIS sessions, bypass dealer/customer permissions, or store Cat login credentials, cookies, or tokens. The public Cat Parts Store diagram lookup explicitly asks for equipment and serial number to show accurate parts diagrams. Cat states SIS2GO provides Caterpillar-authored parts information; parts and OMM information are available without charge in the app, while service-manual features may require subscription. See:
- https://www.cat.com/sis2go
- https://parts.cat.com/en/catcorp/parts-diagram
- https://www.cat.com/en_US/blog/top-tips-to-finding-the-right-parts.html

## Official workflow

1. Create/sign in to an authorized Cat account and open SIS2GO or SIS 2.0 through Parts.Cat.com.
2. Add the relevant engine/equipment using its serial number.
3. Navigate to the correct system/arrangement and export or copy the parts list using the export/download options available to that account. Do not use automated scraping or share account credentials.
4. Preserve the exact Cat part number, Cat description, engine model, serial number, Arrangement, illustration/group or SIS document reference, and source URL/reference.
5. Import the resulting CSV/XLSX through the Amoot admin part-catalog import. Split large files into batches of at most 500 rows.
6. Rows lacking a serial-specific SIS reference must remain REFERENCE or NEEDS_SERIAL_CHECK. Never mark a generic model-family match as OEM_VERIFIED.

## Import columns

| Column | Required | Meaning |
|---|---|---|
| partNumber | Yes | Exact Cat part number |
| name | Yes | Cat description |
| engineModels | Yes | Engine model; multiple values separated by semicolon |
| sourceName | Yes | Use Cat SIS or Cat SIS2GO for official records |
| sourceUrl | Yes | Official Cat page or documented SIS reference URL |
| technicalGroup | No | System/component group |
| description | No | Additional Cat description |
| sourceNote | No | Context or supersession note |
| verificationStatus | Yes | REFERENCE, NEEDS_SERIAL_CHECK, or OEM_VERIFIED |
| sourceSerialNumber | For OEM_VERIFIED | Exact equipment/engine serial used in SIS |
| arrangementNumber | For OEM_VERIFIED | Arrangement from SIS |
| sourceDocumentRef | For OEM_VERIFIED | SIS illustration/group/document reference |

The API rejects OEM_VERIFIED unless sourceName identifies Cat SIS/SIS2GO and serial number, Arrangement, and document reference are all supplied. This is a database-enforced evidence requirement as well as an API validation.

## CSV template

Use the companion file `docs/cat-sis-import-template.csv`. It contains a deliberately blank sample row; do not invent example part numbers or compatibility.
