# CAT parts source register

Last reviewed: 2026-11-24


| [Off Road Equipment](https://offroadeq.com/) | Public popular-parts index (500 part numbers), exact detail pages, OEM List Price benchmark, displayed condition and supplier-reported quantities | Owner-approved fallback: when the actual Off Road unit price is hidden behind login, use the displayed valid OEM List Price × 1.65 as a provisional Amoot USD reference price. Keep it explicitly classified as OEM-list-based, never as supplier acquisition cost. If a supplier unit price is legitimately visible or supplied by quote/export, prefer it and calculate separately by condition. |

See [Off Road Equipment pricing-source assessment](offroadeq-pricing-source.md) and [price-import template](../offroadeq-price-import-template.csv). Public page 116-1980 showed OEM List Price USD 2,024.61 and hid actual New Aftermarket / Used unit prices. Under the owner's later approved fallback, the OEM benchmark may be multiplied by 1.65 and stored as a provisional reference, with source type preserved.


## Source roles

| Source | Useful for | Limits / handling |
|---|---|---|
| [Cat Parts Store](https://parts.cat.com/) | Current part description, published compatible-model classes, replacement/product metadata where displayed | Primary public reference for fitment checks; exact machine serial/arrangement may still be required |
| [K-Part CAT catalog](https://k-part.com/catalog/caterpillar/) | Independent model + serial-prefix navigation, parts diagrams and assembly tables when the interactive catalog returns them | Third-party source. Record model, prefix, group and diagram reference. Never infer serial fitment from model name alone |
| [engine.od.ua CAT manuals](https://engine.od.ua/cat-download-free) | Public sample contents pages for CAT parts manuals, technical documents and engine/system references | Third-party library/host. Samples are excerpts, not complete catalogs. Preserve media number, edition/date, serial scope, page and group; verify fitment against Cat sources before promotion |
| [BinUnlock Caterpillar manual library](https://binunlock.com/r/caterpillar-engines-and-machines-service-manual-library.418/) | Discovery of candidate parts manuals, prefix-specific wiring diagrams, marine/generator service manuals and technical references across C7/C9/C15/C18/C32/3400/3500 families and machines | Third-party forum archive; download requires sign-in and files are hosted on external cloud links. The post disclaims authorship/ownership and does not independently establish document provenance, revision, completeness or permission to redistribute. Treat every file as unverified until its publication number, revision, serial scope and contents are inspected; do not bulk-copy or republish manuals |
| [MashinYar](https://mashinyarco.ir/) | Persian-language repair training, diagnostics and expert/technical context | Not a public CAT parts catalog; do not harvest part-number fitment from course descriptions |
| [Off Road Equipment](https://offroadeq.com/) | Supplier lead and public popular-parts index (500 part numbers); detail pages expose OEM list-price benchmarks and inventory-condition labels | Actual unit prices are hidden behind login. Do not treat OEM list price as supplier sale price or calculate the 65% margin from it. Use authorized supplier quotations/exports; record condition, currency, quantity and timestamp separately |



See [Off Road Equipment pricing-source assessment](offroadeq-pricing-source.md) and [price-import template](../offroadeq-price-import-template.csv). Tested public overlap: 116-1980. Public page showed OEM List Price USD 2,024.61 but hid actual unit prices for New Aftermarket, Call For Pricing and Used inventory. No price or stock was imported.

## Off Road Equipment pricing-source assessment (24 Nov 2026)

See the dedicated [pricing-source assessment](offroadeq-pricing-source.md). The public 1161980 detail page reports OEM List Price USD 2,024.61 while supplier unit prices are login-gated. Per the owner's approved fallback, OEM List Price × 1.65 may be used as a provisional Amoot USD reference, but must not be described as Off Road's supplier unit price.

## BinUnlock library assessment (24 Nov 2026)

The public resource page lists a multi-document archive and requires a forum sign-in before download. The page was created 17 Nov 2025 and shows last update 17 Nov 2025. At the time of review it displayed 32 downloads, 3,235 views and one 5-star rating; these are page counters, not a technical quality audit.

Useful items explicitly named in its file inventory include:

- **Parts manuals:** C9 Marine Auxiliary and Gen Set Engine Parts Manual; C9 Industrial Engine Parts Manual; C15 Engine Parts Manual; C15 Standby Generator Set Parts Manual; 3406 Engine Parts Manual; 3406C Generator Set Parts Manual; D6R tractor, 416E backhoe, 773D haul truck, 938G II wheel loader and other machine parts manuals.
- **Marine / engine service references:** 3408C and 3412C Marine Generator Sets Service Manual; C18 maintenance manual; C27/C32 Generator Set troubleshooting and service manuals; Marine Controls Installation Guide; 3600/C280 fluids recommendation.
- **Prefix-specific wiring:** multiple 3126B/3126E, 3406E, C10/C12/C13/C15/C7/C9 entries, including serial-prefix and serial-range variants.
- **Other technical material:** diagnostic flash codes, ET/CCM PC manuals, engine control-system references and training slides.

### Source decision

**Useful for discovery and candidate document acquisition — not yet a verified catalog source.** Its strongest project value is locating:
1. C9 Marine Auxiliary parts manual;
2. C15 engine parts manual (application must be determined from the document's actual title page and serial scope; the listed C15 standby-generator manual is not marine evidence);
3. 3406 engine and 3406C generator-set parts manuals;
4. prefix-specific wiring diagrams for C7/C9/C15 and related families;
5. 3408C/3412C marine-generator service documentation.

The listed archive is heterogeneous: marine, generator, industrial, on-highway and machine documents are mixed together. A filename containing an engine family is not enough to establish marine fitment. In particular, do not label a C9/C15/C32 component MARINE merely because a similarly named engine or generator manual appears in the archive.

### Required validation before using any downloaded file

For each file, capture the document title page and publication metadata: Cat media/publication number (SEBP/RENR/LEBM/LEBM etc.), revision/date, engine or machine model, full serial-number range/prefix, arrangement scope, and whether it is a parts catalog, service manual, O&M manual or wiring schematic. For parts manuals, record group/diagram/page, part number, description and quantity. Cross-check exact part numbers and compatible application against Cat Parts Store; use SIS with full serial number and Arrangement for final fitment.

The resource page says files are collected from public/open internet sources, disclaims authorship/ownership and points to third-party cloud hosting. Therefore provenance and redistribution rights are not established. Use only lawfully accessible copies for internal research; do not automate around login, cloud-provider controls or access limits, and do not republish the archive or complete manuals. No file was downloaded or independently inspected in this review, and no part rows were imported from BinUnlock.

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

### Expanded C32 marine candidate extraction (K-Part public UI, 24 Nov 2026)

The completed Playwright run `45357078431` opened component tables in the selected C32 books. It returned **58 numbered component rows** across three fully loaded groups; all three tables reported `parts_complete=true`. These remain third-party **CANDIDATE** observations, not OEM-confirmed fitment.

| C32 prefix | Assembly/group | Diagram reference | Numbered rows |
|---|---|---|---:|
| SDN | 361-1283 AFTERCOOLER GP-RAW WATER | SEBP61470236 | 27 |
| SDN | 207-2422 FILTER GP-WATER SEP & FUEL | SEBP61470305 | 2 |
| SDN | 305-8921 ALTERNATOR GP-CHARGING | SEBP61470344 | 27 |
| RSD | 207-2422 FILTER GP-WATER SEP & FUEL | SEBP64650304 | 2 |

The collector also attempted four further group titles (two in each book), but the public UI did not expose those exact rows; they are **not** counted as extracted:
- SDN: 418-9241 water-cooled exhaust plug group
- RSD: 418-8363 auxiliary sea-water pump group
- RSD: 344-3387 sea-water pressure sensor group
- RSD: 562-4336 marine communication installation group

The extracted rows include source quantities and diagram references. Repeated part numbers across different prefixes/groups are retained as separate evidence scopes. No component has been promoted into sellable `part_catalog`, and no prices or inventory have been set. The workflow artifact is retained in GitHub Actions run [45357078431](https://github.com/saeed860/Amoot-Machine/actions/runs/45357078431) for seven days. Next review should match candidate part numbers to Cat Parts Store and, for serial fitment, SIS with full serial and Arrangement.

### Cat Parts Store OEM cross-check — C32 marine candidates (24 Nov 2026)

Public Cat Parts Store product pages were checked for the four exact part/group numbers surfaced by the C32 SDN/RSD work:

| Part number | Cat Parts Store result | Published compatible application | Handling |
|---|---|---|---|
| **353-9049** | Exact product page found; description is EXCHANGER GP | Marine Engine C32 + Generator Set C32 | OEM model-class evidence supports **BOTH**; still serial/arrangement-specific |
| **207-2422** | Exact product page found; FILTER-SEPAR | Marine Engine (including C32/C32B and other marine models), Marine Auxiliary C32, Generator Set C32, plus land equipment | OEM model-class evidence supports **BOTH** |
| **305-8921** | Exact product page found; 24 V 75 A Charging Alternator | Marine Engine C32/C32B, Marine Auxiliary C32B, Generator Set C32, plus RC7 | OEM model-class evidence supports **BOTH**; note Cat's displayed Marine Auxiliary list is C32B, not C32 |
| **116-1980** | Exact product page found; Oil Pump Group; explicitly marked **Discontinued** | Marine Engine C30/C32/3412C/3412E and Marine Auxiliary C32, plus multiple land/industrial classes | OEM model-class evidence supports **BOTH**; Cat displays 0R-8210 as a Cat Reman alternative, not a universal supersession guarantee |

Official product pages:
- https://parts.cat.com/en/catcorp/product/353-9049
- https://parts.cat.com/en/catcorp/product/207-2422
- https://parts.cat.com/en/catcorp/product/305-8921
- https://parts.cat.com/en/catcorp/product/116-1980

**Not yet OEM-cross-checked:** the internal K-Part component-table scopes for **361-1283 AFTERCOOLER GP-RAW WATER** (SDN) and **586-1380 HEAT EXCHANGER GP-SEA WATER** (RSD). Searches for those exact group numbers did not return a matching Cat Parts Store product page in this pass. Keep their component rows as K-Part CANDIDATE evidence only; do not infer marine fitment from the group title or prefix alone. The same caution applies to the remaining 54 component rows from the 58-row extraction unless each exact part number receives its own OEM check.

This cross-check confirms published Cat model/application classes for the four exact numbers above; it does not replace SIS lookup using the complete engine serial number and Arrangement. No sellable SKU, price, stock or blanket fitment was created.

#### Additional component-level OEM matches from the 58-row extraction

Exact Cat Parts Store pages were also found for three component numbers inside the K-Part tables:

| Part number | K-Part scope | Cat Parts Store evidence | Application / status |
|---|---|---|---|
| **316-9954** | SDN fuel-water separator group | Exact Cat page; compatible classes include Marine Engine C32/3412E, Marine Auxiliary C32 and Generator Set C32 | **BOTH**; Cat marks the part **Discontinued**. Do not offer as current new stock or imply a direct replacement without dealer confirmation |
| **438-5385** | RSD fuel-water separator group | Exact Cat page; compatible classes include Marine Engine C32/C32B and Marine Auxiliary C32, plus Generator Set and land equipment | **BOTH**; page shows alternative 438-5386, but do not assume it is a universal supersession |
| **362-0801** | SDN raw-water aftercooler group | Exact Cat page; compatible classes include Marine Engine C32/C32B, Marine Auxiliary C32B and Generator Set C32 | **BOTH**; the published Marine Auxiliary class is C32B, not C32 |

Official product pages:
- https://parts.cat.com/en/catcorp/product/316-9954
- https://parts.cat.com/en/catcorp/product/438-5385
- https://parts.cat.com/en/catcorp/product/362-0801

These matches verify the exact component numbers and published model classes at Cat Parts Store level. They do not prove the exact SDN/RSD assembly inclusion/quantity for every engine serial; retain K-Part diagram/quantity as scoped candidate evidence and use SIS with complete serial + Arrangement for order-level fitment. Other component rows remain unverified until individually checked.

#### Further Cat Parts Store matches — C32 aftercooler, heat-exchanger and alternator components

A second exact-number lookup pass found these additional official product records among the K-Part component rows:

| Part number | K-Part extraction scope | Official Cat page evidence | Application interpretation |
|---|---|---|---|
| **175-7060** | SDN and RSD fuel-water separator groups | Cat lists C32 Marine Engine, C32 Marine Auxiliary, Generator Set C32 and land equipment | **BOTH** |
| **353-9029** | RSD sea-water heat exchanger group | Cat lists C32/C32B Marine Engine and Generator Set C32 | **BOTH** |
| **353-9037** | SDN sea-water heat exchanger group | Cat lists C32/C32B Marine Engine and Generator Set C32 | **BOTH** |
| **229-9407** | SDN alternator bearing assembly | Cat lists Marine Engine C32 and Marine Auxiliary C32B, plus Generator Set C32 and land classes | **BOTH** at published model-class level; auxiliary list is C32B, not C32 |
| **5P-3419** | SDN alternator bearing inner race | Cat lists Marine Engine C32 and Marine Auxiliary C32/C32B, plus Generator Set C32 and land classes | **BOTH** |
| **231-6133** | SDN alternator bearing kit | Cat kit page lists Marine Engine C32 and Marine Auxiliary C32, and includes 5P-3419 + 229-9407 as its two kit components | **BOTH**; Cat kit contents are useful corroboration of the extracted bearing pair |
| **231-6134** | SDN alternator rectifier kit | Cat lists Marine Engine C32 and Marine Auxiliary C32B, plus Generator Set C32 and land classes | **BOTH** at published model-class level; auxiliary list is C32B, not C32 |
| **3T-6354** | SDN alternator voltage regulator assembly | Cat page lists C32 among Generator Set and Engine categories, including C32 MARINE | **BOTH** |

Official product pages:
- https://parts.cat.com/en/catcorp/product/175-7060
- https://parts.cat.com/en/catcorp/product/353-9029
- https://parts.cat.com/en/catcorp/product/353-9037
- https://parts.cat.com/en/catcorp/product/229-9407
- https://parts.cat.com/en/catcorp/product/5P-3419
- https://parts.cat.com/en/catcorp/product/231-6133
- https://parts.cat.com/en/catcorp/product/231-6134
- https://parts.cat.com/en/catcorp/product/3T-6354

The official pages substantiate Cat's published compatible-model classes for these part numbers. They do not, by themselves, certify that every listed item is present in every SDN/RSD serial-specific assembly or establish order quantity. The K-Part diagram remains scoped third-party evidence; final fitment still requires the full engine serial and Arrangement in SIS/Cat's serial-specific diagram. Continue to retain these as reference/evidence, not automatically sellable stock.

#### Third component cross-check pass — C32 heat-exchanger internals

Additional exact-number Cat Parts Store pages found:

| Part number | K-Part diagram context | Cat page result | Application classification |
|---|---|---|---|
| **353-9033** | SDN sea-water heat exchanger housing | Official Cat description explicitly identifies a water-jacket housing transferring seawater through the engine heat-exchanger system; compatible classes include C32/C32B Marine Engine and Generator Set C32 | **BOTH**; marine-system function explicitly documented |
| **135-2654** | SDN sea-water heat exchanger O-ring | Cat compatible classes include C32/C32B Marine Engine, Generator Set C32 and land engine models | **BOTH** |
| **111-4374** | SDN and RSD sea-water heat exchanger vent-line valve | Cat page compatible classes include C32/C32 Marine Engine and multiple marine auxiliary/engine/generator classes, alongside land applications | **BOTH** |

Official pages:
- https://parts.cat.com/en/catcorp/product/353-9033
- https://parts.cat.com/en/catcorp/product/135-2654
- https://parts.cat.com/en/catcorp/product/111-4374

These are official part-number/model-class matches. For 353-9033, the marine seawater function is explicitly stated in Cat's description. For 135-2654 and 111-4374, the broad compatible-model lists establish both application classes, but do not independently prove the precise assembly usage/quantity in each SDN/RSD book. Maintain the K-Part assembly reference and quantity as third-party evidence pending serial-specific SIS confirmation.

#### Fourth Cat Parts Store exact-number pass — aftercooler and alternator internals (24 Nov 2026)

This pass checked exact part numbers from the 58-row K-Part extraction. The table distinguishes a positive Cat model-class match from a page that does not publish enough compatible-model evidence for C32 marine classification.

| Part number | K-Part group context | Official Cat page finding | Handling |
|---|---|---|---|
| **347-8906** | RSD 586-1380 sea-water heat exchanger spacer | Cat describes it as a heat-exchanger spacer used in the seawater heat exchanger; compatible classes include C32/C32B Marine Engine and Generator Set C32 | **BOTH** |
| **365-4457** | SDN 361-1283 raw-water aftercooler seal | Cat describes it as a press-in-place seal for the aftercooler; compatible classes include C32/C32B Marine Engine and Generator Set C32 | **BOTH** |
| **229-8906** | SDN 305-8921 alternator capacitor | Cat compatible classes include C32/C32B Marine Engine, Marine Auxiliary C32B, and Generator Set C32, plus land classes | **BOTH** at published model-class level; Marine Auxiliary listing is C32B |
| **202-8647** | SDN 305-8921 alternator stator | Cat compatible classes include Marine Engine C32/C32B, Marine Auxiliary C32/C32B and Generator Set C32, plus land classes | **BOTH** |
| **202-2708** | SDN 305-8921 alternator diode | Cat compatible classes include Marine Engine C32/C32B and Marine Auxiliary C32/C32B, plus Generator Set and land classes | **BOTH** |
| **202-2703** | SDN 305-8921 alternator coil | Cat compatible classes include Marine Engine C32/C32B, Marine Auxiliary C32/C32B and Generator Set C32, plus land classes | **BOTH**; Cat's page description text appears inconsistent with the product title, so use title/part identity and compatible list cautiously |
| **202-7713** | SDN 305-8921 alternator frame | Cat compatible classes include C32 Marine Engine, C32B Marine Auxiliary, Generator Set C32 and land classes | **BOTH** |
| **238-5081** | SDN 361-1283 aftercooler seal | Exact Cat page found, but displayed compatible-model list does not include the C32 marine classes | Do not classify as C32 marine from the current evidence |
| **6V-3535** | SDN 361-1283 aftercooler dowel | Exact Cat page found, but displayed compatible-model list does not include C32 Marine Engine / C32 Marine Auxiliary | Do not classify as C32 marine from the current evidence |
| **360-3693** | SDN 361-1283 aftercooler plug | Exact Cat page found; the returned page excerpt did not provide a C32 marine compatible-model match | Keep application unconfirmed |
| **5C-2874** | SDN 305-8921 alternator nut | Exact Cat hardware page found; returned compatible-model list does not show C32 marine | Do not classify as C32 marine from current evidence |
| **3K-0360** | SDN 361-1283 aftercooler O-ring | Exact Cat page found; returned compatible-model list does not establish C32 marine compatibility (a C13 MARINE entry appears, not C32) | Do not classify as C32 marine |
| **100-6531** | SDN 305-8921 alternator fan | Exact Cat page found, but the returned page excerpt did not establish C32 marine compatibility | Keep application unconfirmed |
| **9S-2390** | SDN 305-8921 alternator rotor retainer | Exact Cat page found; returned excerpt did not establish C32 marine compatible-model classes | Keep application unconfirmed |
| **8T-0328** | SDN 305-8921 alternator washer | Exact Cat page found; returned compatible-model excerpt does not establish C32 marine compatibility | Do not classify as C32 marine |

Official Cat pages:
- https://parts.cat.com/en/catcorp/product/347-8906
- https://parts.cat.com/en/catcorp/product/365-4457
- https://parts.cat.com/en/catcorp/product/229-8906
- https://parts.cat.com/en/catcorp/product/202-8647
- https://parts.cat.com/en/catcorp/product/202-2708
- https://parts.cat.com/en/catcorp/product/202-2703
- https://parts.cat.com/en/catcorp/product/202-7713
- https://parts.cat.com/en/catcorp/product/238-5081
- https://parts.cat.com/en/catcorp/product/6V-3535
- https://parts.cat.com/en/catcorp/product/360-3693
- https://parts.cat.com/en/catcorp/product/5C-2874
- https://parts.cat.com/en/catcorp/product/3K-0360
- https://parts.cat.com/en/catcorp/product/100-6531
- https://parts.cat.com/en/catcorp/product/9S-2390
- https://parts.cat.com/en/catcorp/product/8T-0328

This pass adds seven further exact Cat model-class matches (including the heat-exchanger spacer and six alternator internals) while explicitly withholding marine classification from the other eight numbers. Exact assembly presence/quantity remains sourced to the third-party K-Part diagrams and must be checked in SIS against full serial number + Arrangement before order-level fitment. No candidate was promoted to sellable inventory and no price/stock was created.

#### Fifth exact-number OEM pass — C32 heat exchanger and alternator subcomponents (24 Nov 2026)

The next Cat Parts Store lookup pass returned five more exact component matches:

| Part number | K-Part table scope | Official Cat compatible-model evidence | Application |
|---|---|---|---|
| **347-8906** | RSD 586-1380 sea-water heat exchanger | Cat description explicitly identifies the spacer as used in the seawater heat exchanger; compatible models include C32/C32B Marine Engine and Generator Set C32 | **BOTH** |
| **202-2708** | SDN 305-8921 charging alternator | Cat lists C32/C32B Marine Engine and C32/C32B Marine Auxiliary, alongside Generator Set and land models | **BOTH** |
| **202-2703** | SDN 305-8921 charging alternator | Cat lists C32/C32B Marine Engine and C32/C32B Marine Auxiliary, alongside Generator Set and land models | **BOTH**; note Cat's descriptive paragraph appears mismatched to the product title, so validate identity through dealer/SIS before sale |
| **202-7713** | SDN 305-8921 charging alternator | Cat lists C32 Marine Engine, C32B Marine Auxiliary and Generator Set C32, plus land models | **BOTH** |
| **365-4457** | SDN 361-1283 raw-water aftercooler | Cat description identifies an aftercooler press-in-place seal; compatible models include C32/C32B Marine Engine and Generator Set C32 | **BOTH** |

Official Cat pages:
- https://parts.cat.com/en/catcorp/product/347-8906
- https://parts.cat.com/en/catcorp/product/202-2708
- https://parts.cat.com/en/catcorp/product/202-2703
- https://parts.cat.com/en/catcorp/product/202-7713
- https://parts.cat.com/en/catcorp/product/365-4457

These are exact part-number/model-class matches only. They do not certify every serial-specific SDN/RSD assembly relationship or quantity. K-Part remains the source for the observed group/diagram/quantity, and Cat/SIS with full serial + Arrangement remains the final fitment authority. No price, stock or sellable product was created.

#### Sixth Cat Parts Store pass — C32 fasteners and alternator hardware (24 Nov 2026)

This pass reviewed further exact numbers from the SDN/RSD candidate tables. Cat's published compatible-model lists support the following classifications:

| Part number | K-Part context | Cat Parts Store compatible-model evidence | Handling |
|---|---|---|---|
| **8F-1434** | SDN alternator lockwasher | Marine Auxiliary C32/C32B, Power Package C32 and multiple generator-set classes are explicitly listed | **BOTH** at published model-class level; the page excerpt does not itself show Marine Engine C32 |
| **0S-1594** | SDN aftercooler bolt | Marine Engine includes C32 MARINE and C32; Engine category also includes C32 MARINE | **BOTH** |
| **0S-1571** | SDN aftercooler bolt | Exact Cat page found; the available excerpt includes C32 in equipment/model listings but did not expose a clear marine-specific class in the returned section | Keep application unconfirmed pending a full compatible-model check |
| **8T-4171** | SDN alternator bolt | Cat lists C32 under ENGINE - MACHINE, but the returned compatible list does not explicitly identify Marine Engine or Marine Auxiliary C32 | Do not infer marine application |
| **1T-0720** | SDN alternator bolt | Returned compatible-model list does not show C32 marine classes | Do not classify as C32 marine |
| **8T-0328** | SDN alternator washer | Returned compatible-model list includes C32 in Petroleum Engine / Industrial Engine classes, but no explicit C32 Marine Engine or Marine Auxiliary entry | Do not infer marine application |
| **8F-1434** | SDN alternator lockwasher | Cat's page is a generic fastener page, but its compatible-model data explicitly includes C32 Marine Auxiliary | Retain model-class evidence; verify exact assembly usage in SIS |

Official Cat pages:
- https://parts.cat.com/en/catcorp/product/8F-1434
- https://parts.cat.com/en/catcorp/product/0S-1594
- https://parts.cat.com/en/catcorp/product/0S-1571
- https://parts.cat.com/en/catcorp/product/8T-4171
- https://parts.cat.com/en/catcorp/product/1T-0720
- https://parts.cat.com/en/catcorp/product/8T-0328

The exact K-Part diagram usage/quantity remains third-party evidence; Cat model-class lists alone do not prove that the fastener is installed in every SDN/RSD arrangement. No sellable catalog, price or inventory was changed.

## Consolidated OEM verification batch — remaining C32 SDN/RSD component rows (24 Nov 2026)

To reduce fragmented reviews, exact-number checks were run as a single batch against public Cat Parts Store product pages. Only the compatible-model list on an exact official product page is treated as model-class evidence; generic descriptions and related-parts carousels do not establish C32 marine fitment.

### Positive Cat model-class matches

| Part number | K-Part group / description | Cat compatible-model evidence | Application |
|---|---|---|---|
| 108-1478 | SDN 361-1283 — aftercooler drain valve | C32 MARINE appears under Engine/Marine Engine and C32/C32B under Marine Auxiliary | BOTH |
| 586-1389 | RSD 586-1380 — heat-exchanger bonnet | Cat compatible-model list explicitly shows Marine Engine C32 | MARINE |
| 331-3521 | RSD 586-1380 — O-ring seal | Generator Set C32 and Marine Engine C32/C32B | BOTH |
| 353-9036 | SDN 353-9049 — heat-exchanger bonnet | Generator Set C32 and Marine Engine C32/C32B | BOTH |
| 289-4232 | SDN/RSD heat-exchanger fastener | Compatible list includes Marine Engine C32/C32B and Generator Set C32, as well as land equipment | BOTH |
| 8T-9377 | SDN 361-1283 — aftercooler bolt | Cat lists Marine Engine C32/C32B, Marine Auxiliary C32/C32B and Generator Set C32, alongside land classes | BOTH |
| 202-9897 | SDN 305-8921 — alternator bearing | Cat lists Marine Engine C32/C32B and Marine Auxiliary C32/C32B, plus non-marine classes | BOTH |
| 202-8647 | SDN 305-8921 — alternator stator | Cat lists Marine Engine C32/C32B, Marine Auxiliary C32/C32B and Generator Set C32, plus land classes | BOTH |
| 100-6531 | SDN 305-8921 — alternator fan | Cat lists C32 Marine Auxiliary, but the returned list does not show Marine Engine C32 | MARINE at published model-class level; confirm exact SDN assembly fitment |

Official product pages:
- https://parts.cat.com/en/catcorp/product/108-1478
- https://parts.cat.com/en/catcorp/product/586-1389
- https://parts.cat.com/en/catcorp/product/331-3521
- https://parts.cat.com/en/catcorp/product/353-9036
- https://parts.cat.com/en/catcorp/product/289-4232
- https://parts.cat.com/en/catcorp/product/8T-9377
- https://parts.cat.com/en/catcorp/product/202-9897
- https://parts.cat.com/en/catcorp/product/202-8647
- https://parts.cat.com/en/catcorp/product/100-6531

### Exact Cat pages found, but C32 marine class not established

| Part number | K-Part context | Cat page finding | Decision |
|---|---|---|---|
| 202-2783 | SDN alternator plate | Compatible list includes C32 in Industrial Engine, not a marine C32 class | No marine tag |
| 7D-1649 | SDN aftercooler washer | Compatible list excerpt does not show C32 marine | No marine tag |
| 8F-8544 | SDN aftercooler bolt | Returned compatible list does not establish C32 marine | No marine tag |
| 0L-1352 | SDN aftercooler bolt | Exact page found, but returned compatible-model evidence was insufficient | Unconfirmed |
| 0S-1571 | SDN aftercooler bolt | Returned excerpt did not establish a marine C32 class | Unconfirmed |
| 8T-4171 | SDN alternator bolt | C32 machine/engine listings without explicit marine class in returned evidence | No marine tag |
| 1T-0720 | SDN aftercooler bolt | Returned compatible-model evidence did not show C32 marine | No marine tag |
| 8T-0328 | SDN alternator washer | C32 industrial/petroleum classes, but no explicit C32 Marine Engine / Marine Auxiliary class | No marine tag |
| 238-5081 | SDN aftercooler O-ring | Returned compatible-model list did not include C32 marine | No marine tag |
| 6V-3535 | SDN aftercooler dowel | Returned compatible-model list did not include C32 marine | No marine tag |
| 360-3693 | SDN aftercooler plug | Exact page found; no C32 marine class established in returned excerpt | Unconfirmed |
| 5C-2874 | SDN alternator nut | No C32 marine compatible-model evidence in returned excerpt | No marine tag |
| 3K-0360 | SDN aftercooler O-ring | Returned model list did not establish C32 marine; a C13 Marine listing is not evidence for C32 | No marine tag |
| 9S-2390 | SDN alternator retainer | Exact page evidence did not establish C32 marine | Unconfirmed |
| 202-2708 | SDN alternator diode | Exact Cat page lists Marine Engine C32/C32B and Marine Auxiliary C32/C32B, plus generator/land | BOTH |
| 202-2703 | SDN alternator coil | Exact Cat page lists C32/C32B marine classes; description paragraph appears inconsistent with product title | BOTH; identity requires SIS/dealer validation before sale |
| 202-7713 | SDN alternator frame | Exact Cat page lists C32 Marine Engine and C32B Marine Auxiliary plus Generator Set C32 | BOTH |
| 347-8906 | RSD heat-exchanger spacer | Cat description explicitly says it is used in the seawater heat exchanger; C32 Marine Engine and Generator Set C32 listed | BOTH |
| 365-4457 | SDN aftercooler seal | Cat describes an aftercooler seal; C32/C32B Marine Engine and Generator Set C32 listed | BOTH |

Official product pages for this section:
- https://parts.cat.com/en/catcorp/product/202-2783
- https://parts.cat.com/en/catcorp/0L-1352
- https://parts.cat.com/en/catcorp/product/7D-1649
- https://parts.cat.com/en/catcorp/product/8F-8544
- https://parts.cat.com/en/catcorp/product/0S-1571
- https://parts.cat.com/en/catcorp/product/8T-4171
- https://parts.cat.com/en/catcorp/product/1T-0720
- https://parts.cat.com/en/catcorp/product/8T-0328
- https://parts.cat.com/en/catcorp/product/238-5081
- https://parts.cat.com/en/catcorp/product/6V-3535
- https://parts.cat.com/en/catcorp/product/360-3693
- https://parts.cat.com/en/catcorp/product/5C-2874
- https://parts.cat.com/en/catcorp/product/3K-0360
- https://parts.cat.com/en/catcorp/product/9S-2390
- https://parts.cat.com/en/catcorp/product/202-2708
- https://parts.cat.com/en/catcorp/product/202-2703
- https://parts.cat.com/en/catcorp/product/202-7713
- https://parts.cat.com/en/catcorp/product/347-8906
- https://parts.cat.com/en/catcorp/product/365-4457

### No usable exact official product page in this search batch

The following extracted numbers did not return a usable exact Cat product page in this pass; retain their K-Part group/diagram/quantity as third-party candidate evidence only:
226-5613, 358-8879, 358-9051, 361-1263, 362-0734, 366-4700, 147-0323, 7B-3235, 9X-6458, 131-3983, 353-9034, 376-0526, 586-1397, 313-8953, 313-8951, 313-9206, 315-3574, 315-5495.

**Reconciliation note:** Cat compatible-model lists support model-class application, while K-Part supplies the observed assembly, diagram and quantity. Neither alone certifies a particular engine serial/Arrangement. Final order fitment still requires SIS/Cat serial-specific lookup. No row in this batch was promoted to sellable inventory; no price or stock quantity was created.

## Additional marine engine coverage — C18 / C15 (24 Nov 2026)

The OEM C18/C15 discovery pass and exact Cat Parts Store model-class findings are documented in [marine-engine-source-expansion.md](marine-engine-source-expansion.md). The public C18 Marine Engine parts-diagram entry point is available; C15 Marine Engine entry point is published but returned a temporary technical error in this pass. Exact Cat product pages confirm multiple C18/C15 Marine Engine model-class matches, but serial/Arrangement-specific fitment remains mandatory. The note also records title/model mismatches to prevent false C15 tagging.

## K-Part C32 candidate artifact reconciliation (24 Nov 2026)

The retained GitHub Actions artifact kpart-c32-marine-groups (run [45357078431](https://github.com/saeed860/Amoot-Machine/actions/runs/45357078431), artifact ID 14903007171) was downloaded and independently recounted: **58 numbered rows**, **57 unique part numbers**, across four successfully loaded component tables (SDN 361-1283: 27; SDN 207-2422: 2; SDN 305-8921: 27; RSD 207-2422: 2). Part **175-7060** occurs twice in separate SDN/RSD evidence scopes and must remain two records. Four other requested groups timed out and contributed zero rows. All 58 remain third-party K-Part CANDIDATE evidence; no database ingestion, sellable SKU, price or stock update is claimed.


## Additional marine engine coverage — C9, C15 and 3400 family (24 Nov 2026)

The C9 and legacy 3400-family research is recorded in [marine-engine-c9-3400-expansion.md](marine-engine-c9-3400-expansion.md). It includes the Logan Marine C9 system-group discovery list, exact Cat Parts Store checks for C9 components, dedicated Cat 3406/3406C Marine Engine diagram entry points, and model-class checks for 3406/3408/3412-family parts. C9 exact Cat matches include 6L-2280, 2N-0178 and 294-2787; 190-3562 is explicitly withheld from marine classification because Cat's returned compatible-model list does not show C9 under Marine Engine. 3400 examples with published marine and non-marine classes include 4W-6412, 4W-4901, 6N-7421 and 3N-8455. These are model-class references only, not serial/Arrangement fitment or sellable stock.

The C15 evidence in [marine-engine-source-expansion.md](marine-engine-source-expansion.md) now also includes exact Cat Parts Store pages for 3N-6059, 4N-0933 and 105-5081, each listing C15 under Marine Engine and at least one non-marine class. All are BOTH at published model-class level; serial/Arrangement confirmation remains mandatory.


## C9 exact Cat page follow-up and Off Road recheck (24 Nov 2026)

The C9 marine evidence document now includes exact Cat Parts Store checks for **149-3239** (fuel-cooler hose), **315-8339** (aftercooler core), **113-1110** (auxiliary seawater-pump cam), and **170-6116** (auxiliary pump group). Cat's published model classes support BOTH for all four; **170-6116 is discontinued** and must not be treated as currently orderable. Exact serial/Arrangement fitment remains unverified. Logan Marine still supplies discovery group context, not OEM proof: [C9 expansion](marine-engine-c9-3400-expansion.md).

Off Road Equipment's public /parts page was rechecked and still lists 500 popular parts; its login page publishes parts@offroadeq.com and +1 865-379-7895 and states it is not an authorized Caterpillar dealer. Actual supplier unit prices remain gated. See [updated pricing-source assessment](offroadeq-pricing-source.md). No Amoot selling prices or stock quantities were changed.


## Off Road search-page access check and C9 follow-up (24 Nov 2026)

The Off Road full inventory search page was tested again. Its public content exposes the search/batch-import interface but explicitly requires login to shop; no anonymous result, actual supplier unit price or full-inventory availability is exposed. The public top-500 popular-parts index was checked against the four newly researched C9 candidates **258-0794, 197-5987, 242-5336 and 245-3777**; none appears in that public list. This does not establish absence from the full inventory, which remains login-gated. No Amoot price or stock change was made.

The C9 research document now records these four as third-party discovery candidates. In particular, the third-party EPC listing for **245-3777** says it is a keel-cooled-only auxiliary seawater pump group and cannot be used with heat-exchanger options; it must not be treated as a universal C9 pump fit. The same third-party page lists **170-6116** as a component, but Cat's separate status for 170-6116 is discontinued. Neither source proves current orderability or serial/Arrangement fitment.

See [C9 marine expansion](marine-engine-c9-3400-expansion.md) and [Off Road pricing-source assessment](offroadeq-pricing-source.md).


## Owner-approved OEM fallback pricing (24 Nov 2026)

The project owner approved using a public Off Road **OEM List Price** as the fallback benchmark when actual supplier unit prices are login-gated. Record the OEM benchmark separately and calculate a provisional Amoot reference at **OEM List Price × 1.65**. Label it “provisional — based on OEM list, not Off Road acquisition cost”; do not represent it as Off Road's actual sale price or a firm quote. Keep condition and supplier inventory snapshots separate; do not turn supplier quantities into Amoot stock. See [expanded OEM fallback batch and part-level evidence](offroadeq-pricing-source.md). No live prices, public prices, stock quantities or sellable SKUs were changed.


## Additional Off Road OEM benchmark batch (24 Nov 2026)

Three more exact public Off Road detail pages were found: **0816876**, **4619930**, and **1886126**. Their OEM list prices and provisional ×1.65 reference values, together with related alternatives and source-specific inventory snapshots, are recorded in [the Off Road pricing assessment](offroadeq-pricing-source.md). The exact 0816876 page has no inventory; alternatives 2H1618, 7X0445 and 1364188 remain separate and are not assumed interchangeable. 4619930 and 1886126 have public inventory snapshots. Actual supplier unit prices remain login-gated. No Amoot stock, firm public price or sellable SKU was changed.


## Marine-engine Off Road index batch (24 Nov 2026)

A targeted public-index cross-check covered C32/C9 numbers 305-8921, 207-2422, 353-9049, 362-0801, 438-5385, 258-0794, 197-5987, 242-5336, 245-3777, 6L-2280, 149-3239, 315-8339 and 113-1110. None appeared in the public 500-part index; this is not a full-inventory stock check and does not establish non-availability. Exact Off Road OEM prices and quantities remain unknown for this batch. The index does include 4619930, whose exact page was already documented. Third-party retail/cross-reference observations for 4385385, 6L2280 and 3058921 are kept separate and are not Off Road quotes or Cat-confirmed supersessions. See [the detailed Off Road pricing-source assessment](offroadeq-pricing-source.md). No Amoot price, stock or sellable SKU was changed.


## C18/C15 and 3400-family Off Road public-index batch (24 Nov 2026)

The public Off Road 500-part index was cross-checked against 18 additional C18/C15/3400-family part numbers: 493-9456, 150-3141, 247-0825, 323-7317, 229-8568, 109-5326, 222-2886, 241-5732, 279-9884, 488-1675, 4N-4387, 3N-6059, 4N-0933, 105-5081, 4W-6412, 4W-4901, 6N-7421 and 3N-8455. None appeared in the public index; this is not a full-inventory availability check. No exact Off Road OEM list prices or stock quantities were established, and no fallback prices were calculated. See [the detailed Off Road pricing assessment](offroadeq-pricing-source.md). No Amoot price or stock was changed.


## Independent market-price leads — 6L-2280 and 315-8339 (24 Nov 2026)

Public third-party price observations are recorded separately from Off Road supplier data and Cat OEM list prices. For 6L-2280, observed retail references include Tecnoseal aftermarket equivalent GBP 7.93 (Anode Outlet), Cat-branded listing EUR 16.52 VAT included (Motortec), and a Lancing Marine price-book line GBP 8.60 (tax/stock details not stated). For 315-8339, Advanced Truck Parts lists a Caterpillar-branded offer at USD 4,152.91 but marks it sold out; DeedParts lists a new aftermarket “For CAT” offer at USD 1,750.32 and says in stock; a Made-in-China supplier listing shows USD 825 MOQ 1 without independently established brand/certification. These are not directly comparable and are not Off Road quotes. See [price-source assessment](offroadeq-pricing-source.md).

Official Cat pages reconfirm the model-class context for 6L-2280, 315-8339, 305-8921, 207-2422, 353-9049, 149-3239, 113-1110, 493-9456 and 247-0825. Cat customer prices remain login-gated in the retrieved pages. A C9 Marine parts-manual extract places 315-8339 as a quantity-1 core in aftercooler group 242-5336; this is third-party document evidence and does not replace serial/Arrangement fitment. No price or stock was changed in Amoot.


## Off Road price-source policy alignment (24 Nov 2026)

The project owner confirmed that Off Road Equipment displayed prices are accepted as valid sourcing references for both OEM/genuine and non-OEM categories. For C32/C18/C9 marine part candidates, record exact Off Road supplier price, currency, brand, condition/category, quantity, observation time and source URL whenever an exact listing exposes them. Keep OEM List Price separate from Off Road supplier unit price; use the owner-approved OEM List Price × 1.65 fallback only when supplier unit price is not displayed, and label it provisional. For actual displayed supplier prices, apply the approved ×1.65 reference factor separately by condition and currency. Keep all conditions distinct; Call For Pricing, blank and invalid/zero prices do not produce a calculated amount. Supplier quantity is not Amoot-owned stock and must be rechecked before order confirmation. See [Off Road pricing assessment](offroadeq-pricing-source.md) and [owner-approved policy](offroadeq-price-validation-policy.md).

The latest public recheck did not expose new exact detail-page price records for 3539049, 3058921, 2072422, 4939456, 1503141 or 2470825. The 500-part public index is only a discovery subset; no absence conclusion is made for the supplier's full inventory. No price, stock, fitment or sellable status was changed.


## C18 official Cat Parts Store cooling-system extraction — 24 Nov 2026

A public Cat Parts Store pass added eight exact C18 seawater-cooling references: **495-3931**, **495-3930**, **342-1616**, **364-8252**, **364-8247**, **586-1378**, **586-1377**, and **202-7531**. Cat's exact product pages publish C18 Marine Engine compatible-model evidence for all eight; 342-1616 is Marine Engine C18 only in the returned model list, while the other seven also show generator/petroleum or C32 classes. Application tags are recorded as MARINE for 342-1616 and BOTH for the other seven, at model-class level only. The Cat C18 Marine Engine diagram entry point is reachable but requires the engine serial number for exact parts diagrams. Product pages did not expose public customer prices. Full evidence and official links: [C18 marine source expansion](marine-engine-source-expansion.md#c18-marine-diagram-and-seawater-cooling-parts--public-cat-parts-store-pass-24-nov-2026). No Off Road prices, Amoot prices, stock or sellable SKUs were created from this pass.


## C18 seawater-pump Cat Parts Store follow-up (24 Nov 2026)

The official Sea Water Pumps category shows 33 products. Exact product-page checks added these model-class references to the C18 cooling evidence: **524-3160** (Sea Water Auxiliary Pump), **20R-7175** (Cat Reman Auxiliary Sea Water Pump; keep REMAN condition separate), **524-3157** (Water Pump Body) and **524-3154** (Water Pump Shaft). All four pages list C18 in the MARINE ENGINE compatible-model class and also show non-marine model classes; customer application is therefore BOTH at model-class level. Exact serial/Arrangement and assembly inclusion remain unconfirmed. Cat customer prices were login-gated. Official evidence and URLs are recorded in [C18/C15 source expansion](marine-engine-source-expansion.md#c18-seawater-pump-assembly-expansion--official-cat-parts-store-24-nov-2026). No price, stock or sellable SKU was created.


## C18 fuel-system official Cat follow-up (24 Nov 2026)

Exact Cat Parts Store pages confirm C18 MARINE ENGINE model-class evidence for **361-5093** (fuel priming pump), **448-4451** and **448-4452** (fuel transfer pump kits). The kits have distinct included pump assemblies (384-8612 and 388-7286 respectively); do not merge them or infer interchangeability. Cat C18 marine specification sheets confirm the gear-driven fuel transfer pump and manual priming-pump architecture. Customer pricing remains login-gated. The same sheets identify a gear-driven oil pump, but this pass did not establish a serial-specific oil-pump part number. **1R-1808** is not assigned a marine tag because the retrieved exact Cat compatible-model list did not show an explicit MARINE ENGINE C18 class. Full evidence and official URLs: [C18 marine source expansion](marine-engine-source-expansion.md#c18-fuel-system-cat-parts-store-extraction--24-nov-2026). No prices, stock or sellable SKUs were created.


## C18 fuel-system Off Road public-index check (24 Nov 2026)

The Off Road public 500-part popular-parts index was checked for **361-5093**, **448-4451** and **448-4452**; none appears in that subset. The full supplier search remains login-gated, so no conclusion about full inventory, actual supplier price or availability is made. No Amoot price, stock or sellable SKU was changed. See [Off Road pricing-source assessment](offroadeq-pricing-source.md).


## C18 lubrication-system official Cat follow-up (24 Nov 2026)

Exact Cat Parts Store pages add model-class references for **226-1191** (one-section gear engine oil pump), **161-4113** (one-section engine oil gear pump), **20R-4330** (Cat Reman gear pump), **6I-4575** (oil-pump drive gear) and **258-9978** (engine-oil filter tube line). Each retrieved exact page lists C18 under MARINE ENGINE; all are BOTH at published model-class level. Keep 20R-4330 REMAN separate and do not assume interchangeability among pump assemblies. Full evidence and official URLs: [C18 marine source expansion](marine-engine-source-expansion.md#c18-lubrication-system-cat-parts-store-extraction--24-nov-2026). No public Cat customer prices, stock or sellable SKUs were established.


## Additional public catalog sources reviewed — 25 Nov 2026

| Source | Role in Amoot research | Evidence handling |
|---|---|---|
| [Cat Parts Cross Reference](https://parts.cat.com/en/catcorp/cat-parts-cross-reference) | Official CAT lookup for competitor filter numbers; covers air, engine-oil, hydraulic/transmission and fuel filters | **A — OEM confirmation** only for exact results actually returned. Keep competitor and CAT identifiers separate; cross-reference alone does not prove machine fitment |
| [Cat Shop by Category](https://parts.cat.com/en/catcorp/shop-all-categories) | Official taxonomy: Attachments, Cabs, Drivetrain, Electrical, Engine, Filters & Fluids, GET, Hardware/Seals, Hoses, Hydraulics, Structures, Undercarriage, Kits and Workshop Supplies | **A — OEM taxonomy**, not a part-number source by itself |
| [Cat Parts Reference Guides](https://www.cat.com/en_US/support/maintenance/parts-reference-guides.html) | Free machine-family guides with common wear and maintenance part numbers | **A — OEM document** for exact numbers and applications shown in each guide. Record guide, model, serial scope, page and revision |
| [Cat SIS2GO](https://www.cat.com/sis2go) | Cat-authored parts and service information tied to equipment/serial number; subscription may be required | **A — OEM source** when exact equipment/serial record is accessible. Preserve serial and arrangement scope |
| [SF-Filter Cross Reference](https://www.sf-filter.com/en/cross-reference-list) | Provider states nearly 900,000 OEM/aftermarket filter identifiers and technical checks for dimensions, thread, seals, filtration and valve characteristics | **B — specialist filter cross-reference**. Candidate matches only until verified; preserve SF-Filter and CAT numbers separately |
| [SF-Filter Caterpillar machine catalogue](https://www.sf-filter.com/en/products/filters-for-mobile/construction-machines?brandname=caterpillar) | Filter discovery by machine make, model and type/year/engine | **B — supplier catalogue**. Capture exact selected configuration; do not assume model-only fitment |
| [Donaldson filter cross-reference PDF](https://dcngli4g50fhp.cloudfront.net/userfiles/ad/donaldson/documents/donaldson_p552006_catalog.pdf) | Multi-brand cross-reference tables across Donaldson, Baldwin, Fleetguard, Fram, Luber-finer and Wix | **B/C — dated catalogue lead**. The located PDF is old; use to generate candidates, then verify with current manufacturer data |
| [Off Road Equipment public popular-parts index](https://offroadeq.com/parts) | Public index states 500 frequently searched CAT part numbers | **C — independent reseller**. Seller describes a mix of genuine surplus OEM and aftermarket parts and states it is not an authorized CAT dealer |
| [Off Road Equipment search](https://www.offroadeq.com/search) | Public search and batch-import entry point; shopping requires login | **C — reseller search**. Do not claim access to login-only inventory, price or availability |

### Data rules added

1. Keep raw and normalized part numbers, identifier role, brand/manufacturer, source class, source URL, retrieval date, verification status and fitment scope separately.
2. CAT OEM number, aftermarket MPN, seller SKU, supplier stock code, supersession and kit/component number are distinct roles. Never merge by similar strings or descriptions alone.
3. A cross-reference confirms only the relationship explicitly stated by its source; it does not independently prove machine/engine compatibility, serial range, stock or price.
4. For filter equivalents, compare dimensions, thread, seal, filtration rating/efficiency, bypass valve and anti-drainback specifications where applicable.
5. Do not create saleable Amoot product rows from source directories alone. Create reference candidates first; require exact detail-page evidence and applicable approval before publishing or pricing.
6. Off Road's public 500-number list is already represented in data/cat-part-number-discovery-offroadeq.txt. Do not append duplicate part rows.

### Research checkpoint — 25 Nov 2026

- Repository inspected: saeed860/Amoot-Machine, default branch main.
- Existing CAT reference and Off Road discovery datasets were found in data/; source register and CAT catalog docs in docs/.
- This batch documents official CAT category/cross-reference/reference-guide/SIS2GO sources and SF-Filter/Donaldson sources.
- No new individual part number is claimed as newly extracted from these sources in this batch.
- Off Road authenticated inventory, batch-import results and account-only supplier prices remain uninspected because no authenticated browser session is available in this chat.
- Next: extract exact Off Road filter candidates and compare against CAT's official cross-reference and current filter-manufacturer catalogues. Keep source observations separate before deduplication.


## Off Road public-index coverage reconciliation — 25 Nov 2026

The Off Road discovery queue is now synchronized to all **500** rows embedded in the site's Off Road catalog seed: 500 unique raw identifiers, zero duplicate identifiers. The prior text queue contained only a subset; it has been replaced by the complete 500-row candidate list. The 12 filter-related identifiers are enumerated in the queue, with 12 exact CAT page cross-checks recorded separately. The index remains a reseller discovery subset, not the supplier's complete authenticated inventory. Login-only stock, condition and supplier pricing remain unverified.


## CAT filter application evidence and product-image integration — 25 Nov 2026

Exact Cat Parts Store Compatible Models sections were checked for all 12 filter identifiers. Marine Engine categories are explicitly present for 1R-0716, 1R-0739, 1R-0749, 1R-0750, 1R-0751, 1R-1807, 1R-1808, 326-1644, 360-8960 and 7W-2326. 1R-0762 lists land machine/engine groups without a Marine Engine group. 1G-8878 has a C13 MARINE string under Paving Compactor but no distinct Marine Engine category; it remains UNVERIFIED rather than being tagged marine.

Ten new sellable catalogue rows were added with exact CAT product images, source URLs, stock zero and price NULL pending source price-type validation. Existing CAT-1R-0749 and CAT-1R-1808 rows were retained and their application tags corrected to BOTH. This adds images and official product descriptions without inventing prices or Amoot-owned stock.


## Off Road fuel-system batch — 25 Nov 2026

Eight more public Off Road candidate identifiers were checked against exact Cat Parts Store pages: 134-0467, 8N-7005, 392-0206, 20R-0849, 20R-4179, 324-0532, 375-2647 and 591-2386. Seven were added as catalogue products with official CAT Scene7 images. 134-0467 is retained as a reference-only row because its current CAT page returned a fallback image. Marine tags are based only on explicit CAT Marine Engine / Marine Auxiliary groups; Cat Reman condition is retained as a distinct brand identity. No price or Amoot stock was inferred.


## Off Road pump, injector and cooling batch — 25 Nov 2026

Eight additional public Off Road identifiers were checked against exact CAT pages: 4P-9075, 137-5541, 352-0211, 172-7767, 352-0206, 350-0666, 2W-9978 and 8J-6730. Six were added as products with official CAT images; 172-7767 remains reference-only pending exact image retrieval, and 8J-6730 is explicitly discontinued. Marine tags use only CAT's explicit Marine Engine category. CAT Reman alternatives remain distinct identifiers. No price or Amoot stock was inferred.


## Additional extraction sources — 25 Nov 2026

### K-Part — user-requested CAT EPC source
- URL: https://k-part.com/catalog/caterpillar/
- Public page states that CAT catalog search is available without sign-in; start with exact machine model and serial prefix, then select the matching prefix before opening a parts group.
- Public checked examples linked from the landing page: M325B / BGN, 320D, 330D, D6R, D9R, 950H, 966H, 420F, C7 and C9.
- Intended fields to capture per K-Part catalog row: machine model, serial prefix/range, parts group, diagram reference, part number, description and quantity.
- Access note: the landing page was readable, but the interactive CAT catalog route requires model/prefix selection inside the site. The available read-only browser connector cannot submit those selections. No K-Part part rows are claimed as extracted in this batch. Continue with public indexed pages and resume direct row extraction when interactive catalog control is available.
- K-Part is an independent catalog, not Caterpillar's official EPC; record it as secondary evidence and always compare model, edition and serial range.

### CAT Digital Marketplace — user-requested ordinary site check
- URL: https://digital.cat.com/
- The public site exposes an applications catalog, API catalog and documentation hub. The API product documented on the public landing page is ISO 15143-3 / AEMP 2.0 fleet telemetry (asset/fleet data), not a public part-number or illustrated-parts API.
- Parts and Service Guide / SIS access is directed through Parts.Cat.com and dealer-linked access. API credentials and paid/premium telematics subscriptions are separate from parts-catalog access.
- Therefore, do not treat Digital Marketplace telemetry API results as part-number evidence. Use it as a navigation/access source for SIS/Parts & Service, not as a parts data feed.

### Filter cross-reference sources used
- IXIN Filters: https://www.ixinfilters.com/en/filter-cross-reference/
- Baldwin / Hastings heavy-duty quick cross-reference PDF: https://test.baldwinfilters.com/content/dam/Parker-com/Literature/EMAM/EMAM_Baldwin_Hastings_Heavy-Duty_Quick_Cross-Reference_Form648.pdf
- SF-Filter: https://www.sf-filter.com/en/cross-reference-list
- RTL Equipment CAT filter listing and CAT cross-reference charts: https://parts.rtlequipment.com/collections/cat-filters and https://parts.rtlequipment.com/pages/filter-cross-reference
- Crossfilters: https://crossfilters.com/pages/cross-reference-index
- SearchForPart: https://searchforpart.com/

These are discovery/cross-reference sources, not automatic OEM fitment approvals. Alternate-brand references remain separately stored with UNVERIFIED_SOURCE_ROW status until checked against the filter maker's own current catalog and exact machine/engine serial applicability.
