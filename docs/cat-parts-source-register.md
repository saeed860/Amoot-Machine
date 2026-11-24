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
