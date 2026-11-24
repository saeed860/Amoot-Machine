# Marine engine source expansion — C18 / C15

Last reviewed: 2026-11-24

## OEM source availability

Caterpillar's public Parts Store exposes a dedicated **C18 Marine Engine** parts-diagram entry point:
- https://parts.cat.com/en/catcorp/equipment/marine-engine/C18-47/parts-diagram

The C15 Marine Engine equipment entry point is also published, although it returned a temporary technical error during this review:
- https://parts.cat.com/en/catcorp/equipment/marine-engine/C15-47

Both pages require the engine serial number to display the relevant parts diagrams. Cat's own manual guidance says parts manuals provide exploded views and serviced part numbers, and that publications are selected by serial-number prefix or serial number:
- https://www.cat.com/en_US/articles/for-owners/know-your-machine-better-with-manuals.html
- https://parts.cat.com/en/catcorp/parts-diagram

## Exact Cat Parts Store model-class evidence

The following exact product pages publish C18 and/or C15 under the **MARINE ENGINE** compatible-model class. These are model-class observations only; they do not establish fitment to every serial/Arrangement or presence in a particular assembly.

| Part number | Cat page title | Marine Engine models shown | Notes |
|---|---|---|---|
| 493-9456 | HOUSING-CL | C18 | C15 appears under generic Engine/Industrial Engine, not Marine Engine on this page |
| 150-3141 | Cover Group-Mech -C | C18, C15, 3406E | Page description/specification is incomplete |
| 247-0825 | HARNESS AS | C18, C15, and other engine families | Broad marine compatible-model list |
| 323-7317 | Engine Electronic Control | C18 | Generator Set C18 is also listed |
| 20R-1288 | Cat Reman C15 Fuel Injector | C18 only | Important title/list mismatch: do not infer C15 Marine fitment from product title |
| 229-8568 | BLOCK AS - C | C18, C15, 3406E | Marine Engine class explicit |
| 109-5326 | BOLT | C18, C15 among listed models | Marine Engine class explicit |
| 222-2886 | Hose Assembly | C18, C15 | Marine Engine class explicit |
| 241-5732 | ADAPTER-DAMP | C18, C18 MARINE, C15 | Marine Engine class explicit |
| 279-9884 | HOUSING (Water Pump Housing) | C18, C15, 3406E | Marine Engine class explicit |
| 488-1675 | Cartridge-Sleeve Bearing | C18 | C15 appears in other classes, not Marine Engine in returned list |
| 4N-4387 | CASE A | C18 and several older marine engines | C18 MARINE explicitly listed |

Official product pages:
- https://parts.cat.com/en/catcorp/product/493-9456
- https://parts.cat.com/en/catcorp/product/150-3141
- https://parts.cat.com/en/catcorp/product/247-0825
- https://parts.cat.com/en/catcorp/product/323-7317
- https://parts.cat.com/en/catcorp/product/20R-1288
- https://parts.cat.com/en/catcorp/product/229-8568
- https://parts.cat.com/en/catcorp/product/109-5326
- https://parts.cat.com/en/catcorp/product/222-2886
- https://parts.cat.com/en/catcorp/product/241-5732
- https://parts.cat.com/en/catcorp/product/279-9884
- https://parts.cat.com/en/catcorp/product/488-1675
- https://parts.cat.com/en/catcorp/product/4N-4387

## Additional exact C15 OEM model-class checks (24 Nov 2026)

A separate exact-number search found three further Cat Parts Store pages that explicitly include C15 in the **MARINE ENGINE** compatible-model class:

| Part number | Cat page title | Compatible-model evidence | Application |
|---|---|---|---|
| **3N-6059** | SHAFT | C15 under MARINE ENGINE, with non-marine model classes also listed | **BOTH** |
| **4N-0933** | GASKET | C15 under MARINE ENGINE and Industrial Engine / Generator Set classes | **BOTH** |
| **105-5081** | Air Starting Motor | C15 under MARINE ENGINE; Cat's description says air starters are generally applied to large industrial and marine engines | **BOTH** |

Official pages:
- https://parts.cat.com/en/catcorp/product/3N-6059
- https://parts.cat.com/en/catcorp/product/4N-0933
- https://parts.cat.com/en/catcorp/product/105-5081

These pages strengthen the published C15 marine model-class evidence. They do not prove fitment to all C15 serial prefixes or Arrangements; confirm in SIS before quoting. Note that **4N-0933** is a generic gasket page, not a C15 marine-specific kit.

## Handling and next extraction step

1. These exact pages are OEM model-class evidence, not serial-specific fitment. Keep them in the reference/evidence layer.
2. Do not tag 493-9456 as C15 marine based on its generic Engine/Industrial Engine entries.
3. Do not tag 20R-1288 as C15 marine based on its title: its displayed Marine Engine compatible model is C18.
4. Use C18/C15 marine engine serial + Arrangement in Cat Parts Store/SIS before associating any component with an order.
5. Next extraction should target C18 marine parts diagrams by system (fuel, lubrication, jacket-water/sea-water cooling, air/exhaust, electrical/controls), then C15 once its parts-diagram route responds. Record exact diagram/group, serial scope, part number and quantity separately from Cat model-class evidence.
6. Do not add prices, stock or sellable SKUs from these reference pages.


## C18 marine diagram and seawater-cooling parts — public Cat Parts Store pass (24 Nov 2026)

The official C18 Marine Engine parts-diagram route is publicly reachable and exposes system navigation (including Air Inlet and Exhaust System and Basic Engine). The page requests the engine serial number for exact diagrams:
- https://parts.cat.com/en/catcorp/equipment/marine-engine/C18-47/parts-diagram
- Serial-specific diagram guidance: https://parts.cat.com/en/catcorp/parts-diagram

Exact Cat product pages/search-index records reviewed in this pass:

| Part number | Cat description | Published compatible-model evidence | Application tag | Evidence note |
|---|---|---|---|---|
| **495-3931** | Sea Water Heat Exchanger | Generator Set C18; Marine Engine C18; Petroleum Package C18 | **BOTH** | Official page explicitly describes a seawater heat exchanger |
| **495-3930** | Heat Exchanger Frame | Generator Set C18; Marine Engine C18; Petroleum Package C18 | **BOTH** | Official description says it supports seawater heat exchange |
| **342-1616** | Auxiliary Sea Water Pump Impeller Kit | Marine Engine C18 | **MARINE** | Official application text explicitly describes seawater circulation through engine cooling |
| **364-8252** | Heat Exchanger Housing | Generator Set C18/C18 Marine GS; Marine Engine C18/C18 Marine; Petroleum Package C18 | **BOTH** | Official description identifies an aluminum seawater heat-exchanger housing |
| **364-8247** | Heat Exchanger Housing | Generator Set C18/C18 Marine GS; Marine Engine C18/C18 Marine; Petroleum Package C18 | **BOTH** | Official description identifies an aluminum seawater heat-exchanger housing |
| **586-1378** | Heat Exchanger Bonnet | Generator Set C18/C18 Marine GS; Marine Engine C18/C18 Marine | **BOTH** | Official description identifies seawater inlet/outlet bonnet; mentions C18 engine and generator applications |
| **586-1377** | Heat Exchanger Bonnet | Generator Set C18/C18 Marine GS; Marine Engine C18/C18 Marine | **BOTH** | Official description identifies seawater heat-exchanger bonnet |
| **202-7531** | Heat Exchanger Channel Plate | Generator Set C18; Marine Engine C18 and C32; Petroleum Package C18 | **BOTH** | Official description says seawater cools engine jacket water; model list includes C18/C32 Marine Engine |

Official product pages:
- https://parts.cat.com/en/catcorp/product/495-3931
- https://parts.cat.com/en/catcorp/product/495-3930
- https://parts.cat.com/en/catcorp/product/342-1616
- https://parts.cat.com/en/catcorp/product/364-8252
- https://parts.cat.com/en/catcorp/product/364-8247
- https://parts.cat.com/en/catcorp/product/586-1378
- https://parts.cat.com/en/catcorp/product/586-1377
- https://parts.cat.com/en/catcorp/product/202-7531

The official Cat Sea Water Pumps category also exposes a public list of 33 items and includes descriptions naming C18 among certain pump/reman listings, but category cards alone are not sufficient to assign exact C18 fitment. Those items are discovery leads only until their exact product pages and compatible-model lists are checked:
- https://parts.cat.com/en/catcorp/category/water-pumps-components-sea-water-pumps

**Price status:** the retrieved Cat product pages did not expose a public customer price (some explicitly require sign-in). No price is inferred from the part number, description or other models. This pass adds OEM reference/model-class evidence only; no Off Road quote, Amoot price, stock or sellable SKU was created.

**Fitment limit:** these published model-class matches do not establish serial/Arrangement-specific fitment or prove inclusion in every C18 cooling arrangement. Confirm the full engine serial number and Arrangement in SIS/Cat before order-level fitment.


## C18 seawater-pump assembly expansion — official Cat Parts Store (24 Nov 2026)

A targeted exact-number pass on Cat's Sea Water Pumps category and product pages identified the following additional C18 marine cooling references:

| Part number | Official Cat description | Published model/application evidence | Customer application | Condition / note |
|---|---|---|---|---|
| **524-3160** | Sea Water Auxiliary Pump | Compatible-model classes include MARINE ENGINE C18/C18 MARINE, GENERATOR SET C18 and PETROLEUM PACKAGE C18 | **BOTH** | Cat new/genuine listing; customer price requires sign-in |
| **20R-7175** | Cat Reman Auxiliary Sea Water Pump | Compatible-model classes include MARINE ENGINE C18, GENERATOR SET C18 and PETROLEUM PACKAGE C18 | **BOTH** | **REMAN**; Cat page recommends 3406E/C18 and states marine seawater cooling use; price requires sign-in |
| **524-3157** | BODY-HALF / Water Pump Body | Compatible-model classes include MARINE ENGINE C18/C18 MARINE, GENERATOR SET C18 and PETROLEUM PACKAGE C18 | **BOTH** | Cat product page; water-pump body component |
| **524-3154** | Water Pump Shaft | Compatible-model classes include MARINE ENGINE C18/C18 MARINE and C15/3406E, plus generator/petroleum classes | **BOTH** | Cat product page; stainless-steel shaft; page application text names C18/C15/3406E |

Official Cat pages:
- https://parts.cat.com/en/catcorp/product/524-3160
- https://parts.cat.com/en/catcorp/product/20R-7175
- https://parts.cat.com/en/catcorp/product/524-3157
- https://parts.cat.com/en/catcorp/product/524-3154

Cat also exposes 524-3159 (PUMP GP-AUX) with C18 in its MARINE ENGINE model class, but the retrieved public page has sparse description and no useful assembly detail. Keep it as a discovery lead pending serial-specific diagram/group confirmation rather than treating it as a confirmed component relationship.

The public Sea Water Pumps category currently displays 33 items; only exact product pages with compatible-model evidence were promoted into this reference table. Cat customer pricing remains login-gated on the reviewed pages. No Off Road price, Amoot selling price, stock, or sellable SKU was created from this OEM-only pass.

**Fitment limit:** model-class compatibility is not serial/Arrangement confirmation. Confirm the full engine serial number, Arrangement and pump configuration in Cat SIS / the serial-specific parts diagram before quoting or accepting an order. Keep the Reman condition of 20R-7175 distinct from new Cat parts.


## C18 fuel-system Cat Parts Store extraction — 24 Nov 2026

A targeted official Cat Parts Store check identified these fuel-system references with explicit C18 **MARINE ENGINE** compatible-model evidence:

| Part number | Official Cat description | Cat model-class evidence | Customer application | Handling |
|---|---|---|---|---|
| **361-5093** | 12V Fuel Pump Housing Base / Fuel Priming Pump | MARINE ENGINE C18; also Engine C15/C18 and Industrial Engine C18/C9.3/C13/C15 | **BOTH** | Cat genuine listing; exact engine serial/Arrangement still required |
| **448-4451** | Fuel Transfer Pump Kit | MARINE ENGINE C18; also Generator Set C18 and Petroleum Package C18 | **BOTH** | Cat kit; includes transfer pump 384-8612 and installation hardware; exact configuration still required |
| **448-4452** | Kit-Fuel Transfer Pump | MARINE ENGINE C18 and C18 MARINE; also Generator Set C18/C18 MARINE GS and Petroleum Package C18 | **BOTH** | Cat kit; includes transfer pump 388-7286 and seals/bolts; exact configuration still required |

Official Cat product pages:
- https://parts.cat.com/en/catcorp/product/361-5093
- https://parts.cat.com/en/catcorp/product/448-4451
- https://parts.cat.com/en/catcorp/product/448-4452

Caterpillar's C18 marine project-guide material independently confirms the engine fuel-system architecture includes a gear-driven fuel transfer pump and manual fuel priming pump. The Cat C18 propulsion and auxiliary/generator marine specification sheets also describe the front-service simplex fuel system. These are system-level design references, not substitutes for serial-specific parts diagrams:
- https://emc.cat.com/n/api/pubdirect?media_string_id=MSS-MAR-18493267-003.pdf
- https://emc.cat.com/n/api/pubdirect?media_string_id=MSS-MAR-18501232-005.pdf

**Lubrication-system boundary:** the same OEM specification sheets confirm a front-service simplex oil system and gear-driven oil pump. However, this pass did not establish a serial-specific Cat part number for the C18 marine oil-pump assembly. The Cat page for 1R-1808 lists C18 in several non-marine classes but did not provide an explicit MARINE ENGINE C18 match in the retrieved compatible-model section; therefore it is not tagged MARINE or BOTH here. A third-party SEBP5331 sample lists 1R-1808 in a C18 oil-filter group, but its serial scope is PRL1-UP and the sample alone is not sufficient to assert fitment to all C18 marine variants.

Cat customer prices on reviewed pages are login-gated. No prices, stock quantities, or sellable SKUs were created from this extraction. Application labels are model-class-level only; verify full engine serial number, Arrangement and fuel-system configuration in Cat SIS before quoting or accepting an order.
