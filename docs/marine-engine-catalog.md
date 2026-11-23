# Cat Marine Engine Directory and Application Classification

Updated: 2026-11-23

## Public marine engine directory

The directory is sourced from Caterpillar's official Marine Power Systems navigation and is not a stock or price list. The API endpoint is `GET /api/marine-engines`; the homepage presents the same directory in four groups.

### Commercial propulsion engines
C7.1, C9.3, C12, C18, C32, C32B, 3406C, 3512C, 3512E, 3516C, 3516E, 3516E High Output, C280-6, C280-8, C280-12, C280-16.

### High-performance propulsion engines
C7.1, C12, C18, C32, C32B Twin Turbo, C32B Sequential Turbo, 3516E High Output.

### Marine generator sets
C1.5, C2.2, C2.2B Genset, C4.4, C4.4 (Electronic), C7.1, C9.3, C18, C32, 3512C, C280-6, C280-8, C280-12, C280-16.

### Auxiliary engines
C4.4 (Electronic), C7.1 (Electronic), C9.3 Auxiliary Engine, C18, C32, C32B, 3512E, 3516E, C280.

Official sources:
- https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/
- https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/high-performance-propulsion-and-maneuvering-solutions/
- https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/

## Application labels

Database fields added to `public.products` and `public.part_catalog`:
- `application_type`: `MARINE`, `LAND`, `BOTH`, or `UNVERIFIED`.
- `application_evidence`: short reason supporting the label.
- `application_source_url`: official source used for the classification.

The storefront and part-number search show a Persian application label next to each item:
- MARINE — کاربری دریایی
- LAND — کاربری خشکی
- BOTH — کاربری دریا و خشکی
- UNVERIFIED — کاربری نیازمند بررسی

UNVERIFIED is intentional. It prevents the site from claiming a land or marine fitment when the available public source does not establish one.

## Classified Cat sellable products

- CAT-10R-9954 — MARINE; 3516B Marine Propulsion top-end overhaul kit.
- CAT-20R-0043 — MARINE; 3512B Marine Propulsion top-end overhaul kit.
- CAT-5N-4504 — BOTH; seawater-pump port plate, with Cat listing Marine Auxiliary and generator-set/engine applications.
- CAT-7W-0009 — BOTH; Cat Compatible Models includes Marine Engine 3406B as well as truck, generator-set and industrial applications.
- CAT-20R-2510 — LAND; Cat lists off-highway machine applications.
- CAT-20R-5367 — LAND; Cat lists D6T track-type tractor applications.
- CAT-30R-0084 — LAND; Cat lists 988K wheel-loader application.
- CAT-593-5344 — LAND; Cat identifies an electric-power 3516B natural-gas conversion kit; no marine application was stated on the checked page.
- CAT-0R-8200 — LAND; checked Cat page identifies industrial 3408E/3412E applications, with no marine fitment stated.
- CAT-9X-3406 — LAND; checked Cat page lists G-series generator-set/gas-engine applications, not marine applications.
- CAT-260-3406 — LAND; checked Cat page lists G3516B/C generator-set applications, not marine applications.
- CAT-20R-3958 — LAND; checked Cat page describes 3406B Reman Short Block and listed non-marine applications.

All other products remain UNVERIFIED until a reliable product-level application source is reviewed. Marine and land labels are not interchangeable with exact serial-number/Arrangement fitment.

## Classified reference-only Cat parts

The official Sea Water Pumps listing references whose product descriptions explicitly identify sea-water pumps are labeled MARINE. The Fresh Water item 20R-4292 is deliberately not labeled marine, despite appearing inside the Sea Water Pumps category. 519-6373 is a pump shaft and remains UNVERIFIED rather than inheriting a marine label from its category breadcrumb.

The public part catalog remains reference-only; it does not create sellable stock or an OEM fitment guarantee.
