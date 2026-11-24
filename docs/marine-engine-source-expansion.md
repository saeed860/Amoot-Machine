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
