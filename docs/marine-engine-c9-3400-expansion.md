# Marine engine source expansion — C9 and 3400 families

Last reviewed: 2026-11-24

## Scope and evidence policy

This pass expands marine-engine references for Caterpillar C9 and legacy 3400-family engines. It deliberately separates:
- Cat Parts Store's published compatible-model classes (OEM model-class evidence);
- third-party supplier/catalog lists (discovery and candidate evidence);
- serial/Arrangement-specific fitment (must be checked in SIS or the serial-specific Cat parts diagram).

No price, stock, sellable SKU or database ingestion is claimed by this document. A model-class match does not prove presence in a particular engine assembly or serial range.

## C9 Marine — discovery source

[Logan Marine's C9 parts reference](https://loganmarine.co.uk/cat-c9/) explicitly describes its list as a spare-parts reference for the Caterpillar C9 marine diesel engine and says its part numbers match OEM service manuals. It is a supplier reference, not a Caterpillar publication; its claims should be treated as candidate data until checked against Cat/SIS.

The public list is organized into system groups, including:
- Engine core (38 entries shown in the heading)
- Fuel system (17)
- Air, exhaust & turbocharger (21)
- Drive train (24)
- Pumps (24)
- Valves & regulators (50)

Useful marine-system candidates surfaced in the public list:
| Part number | Description in Logan Marine list | Group | Treatment |
|---|---|---|---|
| 258-0794 | Cooler GP-Fuel | Fuel system | Candidate only |
| 149-3239 | Cooler AS-Fuel | Fuel system | Candidate only |
| 197-5987 | Manifold GP-Exhaust (Water Cooled) | Air/exhaust | Candidate only |
| 242-5336 | Aftercooler GP | Air/exhaust | Candidate only |
| 315-8339 | Core AS-Aftercooler | Air/exhaust | Candidate only |
| 6L-2280 | Pump GP-Auxiliary SEA Water | Pumps | Exact Cat page also supports C9 Marine Engine and C9 Generator Set |
| 245-3777 | Pump GP-Auxiliary SEA Water | Pumps | Candidate only |
| 170-6116 | Pump GP-Auxiliary SEA Water | Pumps | Candidate only |
| 113-1110 | CAM-SEA Water Pump | Pumps | Candidate only |
| 195-8098 | Pump GP-Engine OIL | Pumps | Candidate only |
| 242-3456 | Pump GP-Fuel Injection | Pumps | Candidate only |

The Logan page lists many additional C9 components. Do not promote every listed row to marine fitment without exact Cat compatible-model or serial-specific evidence.

## Additional exact C9 OEM cross-checks (24 Nov 2026)

The following Logan Marine C9-list candidates were checked against exact Cat Parts Store pages:

| Part number | Cat Parts Store result | Application / handling |
|---|---|---|
| **149-3239** | Fuel cooler hose; compatible models include C9 under MARINE ENGINE and C9 under GENERATOR SET | **BOTH** at published model-class level |
| **315-8339** | Aftercooler core; compatible models include C9 under MARINE ENGINE, GENERATOR SET and PETROLEUM ENGINE | **BOTH** at published model-class level |
| **113-1110** | Auxiliary seawater-pump cam; compatible models include C9 under MARINE ENGINE and GENERATOR SET, plus other marine/industrial models | **BOTH** at published model-class level; explicit seawater-pump function |
| **170-6116** | Auxiliary pump group; Cat lists C9 under MARINE ENGINE and GENERATOR SET, but marks the part **DISCONTINUED** | Historical **BOTH** model-class evidence only; do not offer as current new stock or price without verified replacement |
 
Official Cat pages:
- https://parts.cat.com/en/catcorp/product/149-3239
- https://parts.cat.com/en/catcorp/product/315-8339
- https://parts.cat.com/en/catcorp/product/113-1110
- https://parts.cat.com/en/catcorp/product/170-6116

The exact Cat pages confirm model-class evidence. The Logan Marine list separately places 149-3239 in Fuel System, 315-8339 in Air/Exhaust & Turbocharger, and 113-1110 / 170-6116 in Pumps. The public Logan list is a third-party discovery source; it does not establish the precise serial-specific assembly or current supplier stock. For 170-6116, Cat's discontinued status overrides any assumption of current availability.

**Not confirmed in this pass:** 258-0794, 197-5987, 242-5336, 245-3777. They remain third-party candidates until an exact Cat page and serial-specific diagram establish the required fitment.

## C9 — exact Cat Parts Store checks

| Part number | Cat Parts Store finding | Model-class handling |
|---|---|---|
| **6L-2280** | Cat describes it as a zinc anode rod for auxiliary sea-water pump and heat exchanger. Its compatible-model list explicitly includes C9 under MARINE ENGINE and C9 under GENERATOR SET. | **BOTH** at published model-class level |
| **2N-0178** | Cat compatible-model list explicitly includes C9 under MARINE ENGINE and C9 under GENERATOR SET. | **BOTH** at published model-class level; Cat page title/description is sparse, so retain the OEM page as evidence rather than infer system role |
| **294-2787** | Cat identifies an aftercooler seal kit; compatible-model list includes C9 under MARINE ENGINE and C9 under GENERATOR SET. | **BOTH** at published model-class level |
| **190-3562** | Cat page identifies a cylinder liner and lists C9 in Truck Engine / Generator Set / Industrial classes, but not in the returned MARINE ENGINE class. | Do **not** classify as C9 marine from this evidence, despite its appearance in a third-party C9 reference |

Official Cat pages:
- https://parts.cat.com/en/catcorp/product/6L-2280
- https://parts.cat.com/en/catcorp/product/2N-0178
- https://parts.cat.com/en/catcorp/product/294-2787
- https://parts.cat.com/en/catcorp/product/190-3562

The Cat compatible-model list supports application class only. For 6L-2280, the product description also explicitly identifies the sea-water/anode use. Exact engine serial, arrangement, quantity and assembly location still require SIS/serial-specific diagram confirmation.

## C15 Marine — exact Cat Parts Store checks

The following exact Cat product pages include C15 in the **MARINE ENGINE** compatible-model class:

| Part number | Cat page title / description | Evidence |
|---|---|---|
| **3N-6059** | SHAFT | Compatible Models explicitly includes C15 under MARINE ENGINE; also lists non-marine classes |
| **4N-0933** | GASKET | Compatible Models explicitly includes C15 under MARINE ENGINE; also lists Industrial Engine and Generator Set classes |
| **105-5081** | Air Starting Motor | Compatible Models explicitly includes C15 under MARINE ENGINE. Cat description says air starting motors are generally applied to large industrial and marine engines |

Official Cat pages:
- https://parts.cat.com/en/catcorp/product/3N-6059
- https://parts.cat.com/en/catcorp/product/4N-0933
- https://parts.cat.com/en/catcorp/product/105-5081

These are **BOTH** at the published model-class level because Cat lists C15 in Marine Engine and in other non-marine classes. They do not prove every C15 serial/Arrangement uses the parts. In particular, a third-party C15 replacement-parts PDF is not used to infer Cat OEM part-number equivalence unless the exact Cat number and serial scope are confirmed.

## 3400 family — marine parts reference coverage

Cat Parts Store exposes dedicated marine equipment pages for:
- [3406 Marine Engine](https://parts.cat.com/en/catcorp/equipment/marine-engine/3406-47/shop-parts)
- [3406C Marine Engine](https://parts.cat.com/en/catcorp/equipment/marine-engine/3406C-47/shop-parts)

The official 3406 and 3406C pages expose a serial-number input and Parts Diagram entry point. The diagram content is not fully rendered in the public text view without equipment identification, so no complete parts-list extraction is claimed.

Cat exact-number compatible-model checks:

| Part number | Cat compatible-model finding | Application |
|---|---|---|
| **4W-6412** | Marine Engine list includes 3408B, 3408C, 3406B, 3406C, 3408, 3412 and 3412C; other generator/industrial model classes are also listed | **BOTH** |
| **4W-4901** | Marine Engine list includes 3408, 3408B, 3408C, 3412 and 3412C; Generator Set and Industrial Engine classes are also listed | **BOTH** |
| **6N-7421** | Marine Engine list includes 3408, 3408B, 3408C and 3406C; Generator Set and Industrial Engine classes are also listed | **BOTH** |
| **3N-8455** | Marine Engine list includes 3408B, 3408C, 3408, 3412C, 3412E, 3412D and 3412; non-marine classes are also listed | **BOTH** |
| **7C-0972** | The returned compatible-model list includes 3406C/3408C/3412C in Gen Set Engine/Generator Set but does not show these 3400 models in Marine Engine; Marine Engine entries are 3508/3512/3516 family | Do not infer 3400 marine fitment |

Official Cat pages:
- https://parts.cat.com/en/catcorp/product/4W-6412
- https://parts.cat.com/en/catcorp/product/4W-4901
- https://parts.cat.com/en/catcorp/product/6N-7421
- https://parts.cat.com/en/catcorp/product/3N-8455
- https://parts.cat.com/en/catcorp/product/7C-0972

Additional official marine-engine references:
- Cat Parts Store 3406 Marine Engine page: https://parts.cat.com/en/catcorp/equipment/marine-engine/3406-47/shop-parts
- Cat Parts Store 3406C Marine Engine page: https://parts.cat.com/en/catcorp/equipment/marine-engine/3406C-47/shop-parts
- Cat publication SEBU6497-11 (March 2020) covers 3408C, 3412, 3412C and 3412D High Performance Marine Engines, with listed serial scopes 8RG 1-UP, 7BL 1-UP, 3JK 1-UP and REA 1-UP respectively: https://catpublications.com/previews/SEBU6497.pdf

The 3400 engine family is not a single fitment scope: 3406/3406C, 3408/3408C, 3412/3412C/3412D and their serial prefixes must remain distinct. Do not merge their parts lists based only on family naming.

## Catalog and source limitations

- The KMP Engine Book PDF is a third-party aftermarket catalog dated February 2013. It has family sections for 3406, 3408, 3412, C9 and C15, but it is not an OEM Cat parts book and is too old to establish current supersessions or exact marine serial fitment. Use it only for discovery, not as an automatic import source: https://www.dumper-spb.ru/generic/uploaded/katalogi/cat.pdf
- The public Cat Parts Store model-class list is useful for classifying MARINE / LAND / BOTH, but serial-number and Arrangement confirmation remains required before quoting a part as a confirmed fit.
- The public Cat 3406/3406C equipment pages expose diagram navigation but do not make the entire serial-specific parts book available in the text view.
- No complete C9/C15/3400 parts manual was downloaded or republished in this pass.

## Next controlled extraction

1. Prioritize C9 marine system groups: sea-water cooling, fuel, lube oil, aftercooler, water-cooled exhaust and electrical/controls.
2. For each candidate, capture exact source document/catalog, model, prefix/serial scope, group/diagram, part number, description and quantity.
3. Check the exact part number against Cat Parts Store; record Cat's compatible-model class separately from third-party assembly evidence.
4. Use full engine serial and Arrangement in SIS before declaring order-level fitment.
5. Keep all these rows in the reference/evidence layer until reviewed; do not create price, stock or public sellable SKUs from catalog evidence alone.
