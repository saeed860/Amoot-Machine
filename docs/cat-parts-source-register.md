# CAT parts source register

Last reviewed: 2026-11-24

## Source roles

| Source | Useful for | Limits / handling |
|---|---|---|
| [Cat Parts Store](https://parts.cat.com/) | Current part description, published compatible-model classes, replacement/product metadata where displayed | Primary public reference for fitment checks; exact machine serial/arrangement may still be required |
| [K-Part CAT catalog](https://k-part.com/catalog/caterpillar/) | Independent model + serial-prefix navigation, parts diagrams and assembly tables when the interactive catalog returns them | Third-party source. Record model, prefix, group and diagram reference. Never infer serial fitment from model name alone |
| [engine.od.ua CAT manuals](https://engine.od.ua/cat-download-free) | Public sample contents pages for CAT parts manuals, technical documents and engine/system references | Third-party library/host. Samples are excerpts, not complete catalogs. Preserve media number, edition/date, serial scope, page and group; verify fitment against Cat sources before promotion |
| [MashinYar](https://mashinyarco.ir/) | Persian-language repair training, diagnostics and expert/technical context | Not a public CAT parts catalog; do not harvest part-number fitment from course descriptions |

## Confirmed public CAT sample parts catalogs on engine.od.ua

The [samples index](https://engine.od.ua/samples) exposes readable sample-page PDFs for these Caterpillar publications:

- **SEBP4321-47 — C9 Generator Set**, serial scopes C9E1-UP (Generator Set), C9L1-UP (C9 Engine), G5A1-UP (LC5000 Generator); sample PDF: https://engine.od.ua/files/sample/SEBP4321-47-CONTENTS.pdf
- **SEBP3780-67 — 3608 Generator, Industrial, Locomotive and Marine**, serial scope 6NC1-UP; sample PDF: https://engine.od.ua/files/sample/SEBP3780-67-CONTENTS.pdf
- **UE034303-00 — D353E Marine Engine**, serial scope 47B1-UP; sample PDF: https://engine.od.ua/files/sample/UE034303-00-CONTENTS.pdf

The index advertises full manuals separately. These sample PDFs do not establish access to the complete paid manuals. Do not copy complete publications or bulk-republish their contents.

## Small, cross-checked discovery examples

### SEBP3780-67 — 3608
The sample contents pages list:
- **5B-9169 — threaded plug**, quantity 1 in each of the 2W-2760 and 122-4947 **LINES GP-AUXILIARY SEA WATER** groups.
- **6L-2288 — zinc rod**, quantity 1 in each of those same auxiliary sea-water groups.

These are candidate source relationships, not proof that every 3608 serial-number arrangement uses those parts. The sample catalog scope is 6NC1-UP. Cat Parts Store cross-checks:
- https://parts.cat.com/en/catcorp/product/5B-9169
- https://parts.cat.com/en/catcorp/product/6L-2288

The current Cat Parts Store compatible-model list for 6L-2288 includes 3608 under **Gen Set Engine**, not under **Marine Engine**. Therefore do not claim 3608 Marine Engine fitment for 6L-2288 solely from this sample catalog.

### SEBP4321-47 — C9 Generator Set
The sample pages include, among other entries:
- **1R-1808 — Engine Oil Filter (Advanced Efficiency)**, within filter group 220-1998, serial S9L1-UP.
- **5N-5692 — Charging Alternator Group**, 24 V / 45 A, serial S9L1-UP.
- **242-0674 — Camshaft Group**, serial S9L1-UP.

These are generator-set sample references only; do not assign marine application based on this document.

## Ingestion rules

1. Keep third-party sample/manual-derived records separate from sellable inventory and pricing.
2. Capture source document number, publication revision/date, model, serial scope, section/group, page, diagram reference (if present), part number, name and quantity.
3. Mark sample-derived records as CANDIDATE until the current Cat Parts Store or an appropriate serial-specific OEM catalog confirms the exact part and application.
4. Application tags remain only MARINE, LAND, or BOTH in the customer UI. Use MARINE only when a marine-specific Cat model/application or marine system is explicit; BOTH only when both marine and non-marine classes are explicitly supported.
5. Never convert a generator-set model into a marine-engine fitment claim. Do not infer supersessions, interchangeability, current stock or price from sample PDFs.

## C32 public catalog navigation result (K-Part)

A live Chromium session submitted the model query **C32** and received 34 selectable serial-prefix books:

`132, B2C, BT4, DSJ, JAZ, JSJ, K7C, KNM, MED, NRC, NST, PEF, PEK, PHT, RNC, RND, RNE, RNF, RNR, RNX, RNY, RNZ, RPM, RSD, RTK, RXB, SDK, SDN, SLT, SMP, SXC, T3T, TLD, TZJ, WDR`.

This confirms the CAT catalog model lookup and serial-prefix selection are live. It does **not** identify which prefix corresponds to a specific C32 marine installation; prefix-to-application mapping must come from the engine dataplate, OEM publication scope or explicit catalog evidence. Do not label all 34 as marine.

The guest UI reported a shared allowance of 50 actions, with 50 remaining at session start; registration does not reset that shared allowance. Keep testing economical and use the browser's normal public UI only. No CAPTCHA, login, rate-limit or access-control bypass is permitted.

The C32 query returned model/prefix choices only. A selected book must still be opened, then system/group contents and the parts table captured with its prefix scope before any part is staged. No part rows are inferred from this list.

### OEM-confirmed C32 marine serial-prefix mapping

Caterpillar's own **C32 SCAC Marine Project Guide, LEBM0009-05** explicitly maps:
- **SDN** — C32 MP3MC Marine Propulsion high-performance engine
- **RSD** — C32 MGE3MC Marine Auxiliary / Gen Set engine

The K-Part public C32 prefix choices include both **SDN** and **RSD**. These two are therefore the first priority for a marine-focused parts-book probe. Do not assume other C32 prefixes are marine without their own OEM evidence.

OEM references:
- Caterpillar C32 SCAC Marine Project Guide: https://emc.cat.com/n/api/pubdirect?media_string_id=LEBM0009-05.pdf
- Caterpillar C32 Marine Engine Parts Store: https://parts.cat.com/en/catcorp/equipment/marine-engine/C32-47
- Caterpillar C32 marine repair/order matrix: https://s7d2.scene7.com/is/content/Caterpillar/CM20170109-54307-34066

The official guide documents marine-specific cooling, sea-water pump, exhaust, fuel, lubrication and starting-system sections. This is useful for organizing the parts intake taxonomy, but the project guide is not a substitute for a serial-specific parts book.

### K-Part C32 / B2C catalog-tree probe (navigation only)

A public UI session opened the **C32 / B2C** book successfully. It returned 11 section-tree entries, including:
- Basic engine (two catalog branches)
- Lubrication system — 32 listed assembly/group entries
- Cooling system — 53 entries, including Auxiliary Sea Water lines/pumps and Sea Water heat-exchanger groups
- Air inlet and exhaust — 50 entries, including raw-water aftercooler groups and water-cooled exhaust manifold
- Fuel system — 25 entries
- Electrical and electronics — 109 entries
- Power train, frame/guards/enclosure and undercarriage

The catalog selection consumed one of the shared guest actions (allowance changed from 50/50 to 49/50). The book did not return an OEM-confirmed marine application for prefix B2C. Therefore this tree is retained as a navigation test only; **no B2C part is to be tagged MARINE or imported as marine fitment**. The next targeted books are SDN (OEM-confirmed marine propulsion) and RSD (OEM-confirmed marine auxiliary/genset).

### K-Part C32 SDN / RSD catalog-tree results

The live public catalog collector successfully opened both OEM-mapped marine books:
- **C32 / SDN** — 10 section-tree entries. Key counts: Lubrication 38 groups, Cooling 60, Air inlet/exhaust 62, Fuel 44, Electrical/electronics 144.
- **C32 / RSD** — 10 section-tree entries. Key counts: Lubrication 38 groups, Cooling 74, Air inlet/exhaust 57, Fuel 38, Electrical/electronics 165.

The group tree is an assembly index, not the internal parts table. A group title beginning with a Cat number is an assembly/group reference; it is not proof of the individual components inside that assembly. Do not claim complete component-level extraction from the tree alone.

Cross-checked catalog-group examples now stored as REFERENCE-only rows in `part_catalog`:
- **355-0325** — Auxiliary Sea Water Pump Group. Listed in both SDN and RSD Cooling System trees. Cat Parts Store lists Marine Engine C32 only → **MARINE**.
- **353-9049** — Sea Water Heat Exchanger Group. Listed in SDN Cooling System. Cat Parts Store lists Marine Engine C32 and Generator Set C32 → **BOTH**.
- **116-1980** — Engine Oil Pump Group. Listed in SDN and RSD Lubrication System. Cat Parts Store lists Marine Engine C32 and Marine Auxiliary C32 plus non-marine equipment; it is marked discontinued and shows 0R-8210 as a Cat Reman alternative → **BOTH**.
- **207-2422** — Fuel/Water Separator Filter Group. Listed in SDN and RSD Fuel System. Cat Parts Store lists marine, generator-set and land applications → **BOTH**.

No prices, stock quantities, or universal serial fitment were created. The full engine serial and arrangement remain necessary for final fitment.


### K-Part component-table extraction — C32 marine heat exchangers

A subsequent public-UI run opened the internal parts tables for two specific sea-water heat-exchanger assemblies. These are **third-party catalog observations scoped to the selected book/prefix**, not independent Cat Parts Store compatibility confirmation and not a claim of fitment to every C32.

**C32 / SDN — group 353-9049 HEAT EXCHANGER GP-SEA WATER** (diagram page SEBP61470191):

| Part number | Description as displayed | Qty |
|---|---|---:|
| 111-4374 | VALVE AS (VENT LINES) | 1 |
| 135-2654 | SEAL-O-RING | 8 |
| 353-9033 | HOUSING | 1 |
| 353-9034 | SPACER | 2 |
| 353-9036 | BONNET | 2 |
| 353-9037 | HEAT EXCHANGER | 2 |
| 376-0526 | BONNET | 1 |
| 131-3983 | BOLT-SOCKET HEAD (M8X1.25X35-MM) | 16 |
| 289-4232 | BOLT (M6X1X16-MM) | 12 |

**C32 / RSD — group 586-1380 HEAT EXCHANGER GP-SEA WATER** (diagram page SEBP64650188):

| Part number | Description as displayed | Qty |
|---|---|---:|
| 111-4374 | VALVE AS (VENT LINES) | 1 |
| 347-8906 | SPACER | 1 |
| 353-9028 | HOUSING (HEAT EXCHANGER) | 1 |
| 353-9029 | CORE AS (HEAT EXCHANGER) | 1 |
| 353-9030 | BONNET-RETURN | 1 |
| 586-1389 | BONNET | 1 |
| 131-3983 | BOLT-SOCKET HEAD (M8X1.25X35-MM) | 8 |
| 289-4232 | BOLT (M6X1X16-MM) | 6 |
| 331-3521 | SEAL-O-RING | 4 |
| 586-1397 | SEAL | 1 |

The UI also returned a non-part source note in the SDN table; it is intentionally excluded from part rows. These observations should be staged as K-Part **CANDIDATE** evidence with the exact model, prefix, assembly, diagram page, quantity and source URL. They must not be promoted to OEM-verified or sellable catalog records solely from this extraction. Reconcile the exact part numbers against Cat Parts Store/SIS and the full engine serial/Arrangement before confirming fitment. No price or inventory was added.
