# Off Road Equipment pricing-source assessment

Reviewed: 2026-11-24
Source: https://offroadeq.com/

## Decision

Off Road Equipment is a useful **supplier/market-price lead**, but the public pages do not expose its actual sell prices to anonymous visitors. Do not scrape around its login requirement, use private endpoints, or treat the visible OEM list price as the supplier's sell price.

The public /parts page lists 500 frequently searched Caterpillar part numbers and links each to a detail page. The full inventory search page requires a part-number query and states that users must be logged in to shop.

## Exact overlap tested

Part **1161980** (Caterpillar 116-1980 Engine Oil Pump Group) appears on the public popular-parts list and has a public detail page:

https://offroadeq.com/parts/1161980

Publicly visible fields:
- OEM List Price: **USD 2,024.61**
- Inventory rows: **10 available — New Aftermarket**, **2 available — Call For Pricing**, **1 available — Used**
- Actual unit price for each inventory row: **Login to view**
- Alternative part variant 5202924 has OEM List Price USD 2,117.50; the page says it is not found in exact inventory.
- Alternative 0R8210 has OEM List Price USD 847.01; the page says it is not found in exact inventory.

The visible USD 2,024.61 is explicitly an **OEM List Price**, not the supplier's actual unit price. The supplier's New Aftermarket, Call For Pricing and Used unit prices are hidden behind sign-in. Consequently, no reliable +65% selling price can be calculated from the public record. Do not calculate or publish USD 3,340.61 as if it were based on Off Road Equipment's sale price; that would incorrectly apply the margin to the OEM list price.

## Pricing workflow for Amoot

For every supplier quotation or legitimately accessible price record:
1. Match exact normalized part number (punctuation-insensitive), brand and description. Never match by description alone.
2. Capture condition separately: NEW OEM, NEW AFTERMARKET, REMAN, USED, or CALL FOR PRICING. Do not merge conditions into one price.
3. Capture the supplier's actual unit price, source currency, availability, quantity, observation timestamp and source URL.
4. Calculate the Amoot reference price as `supplier_unit_price × 1.65` (65% markup on supplier price), with currency and rounding explicit.
5. Do not add freight, import duty, tax, bank fees or FX unless those costs are supplied and separately modeled.
6. Never infer availability from an old snapshot. Mark it as supplier-reported and re-check before quote/order.
7. Do not create sellable stock from supplier inventory; supplier availability is not Amoot-owned stock.
8. Keep the original supplier price and calculated price in a private admin-only sourcing record. Public catalog price must be approved by an administrator before publication.
9. If the supplier only shows OEM List Price or Call For Pricing, store it as a benchmark/status only; leave the Amoot selling price unset.

## Import access and current limitation

Off Road Equipment promotes a batch-import search workflow for up to 1,000 part numbers, but the public search page requires login to shop. This review used only public pages. No login, account, hidden price, private endpoint or access-control bypass was used. No source price was imported into Amoot and no live product price or inventory was changed.

For an actual supplier-price batch, use a supplier quotation/export or authenticated access explicitly authorized for the account. Then populate the accompanying template and review the generated 65% price before publication.

## Source links
- Popular parts list: https://offroadeq.com/parts
- Full inventory search: https://offroadeq.com/search
- Tested part 1161980: https://offroadeq.com/parts/1161980
- Pricing/process overview: https://offroadeq.com/process
- Company states it is not an authorized Caterpillar dealer: https://offroadeq.com/


## Public top-500 cross-check against existing C32 marine references

The public popular-parts index was checked for normalized exact matches against selected previously reviewed marine/C32 numbers:
- **116-1980** — present; detail page examined.
- **305-8921, 207-2422, 353-9049, 362-0801, 438-5385** — not present in the public top-500 list at the time of review.

This is only a check of the public popular-parts list, not the full supplier inventory. The full inventory search is gated by sign-in; absence from the top-500 list must not be interpreted as supplier non-availability.


## Follow-up public-source recheck (24 Nov 2026)

The public popular-parts page was re-opened. It still advertises **500 parts** and says each number can be selected to check current availability. The full-inventory search is linked separately. The public login page displays the supplier's contact details:
- Email: **parts@offroadeq.com**
- Phone: **+1 865-379-7895**
- Live chat: Monday–Friday, 8:00 a.m.–5:00 p.m. Eastern Time

The same login page states that Off Road Equipment Parts, Inc. is **not an authorized Caterpillar dealer**. Its own site describes inventory as a mixture of genuine surplus OEM and aftermarket parts. Therefore, every quote must retain condition and provenance; do not describe all stock as new genuine Cat OEM.

This recheck did not reveal anonymous supplier unit prices or a public downloadable price export. The previous 1161980 detail-page test remains the only exact public price/inventory example in this project: its visible OEM List Price is not the supplier unit price, and actual unit prices remain login-gated. No price, availability or stock was changed in Amoot.

**Recommended supplier request:** ask Off Road Equipment for an authorized quote/export containing exact part number, description, brand, condition (NEW OEM / NEW AFTERMARKET / REMAN / USED), supplier unit price, currency, quantity available, lead time, quote date/expiry and shipping origin. The +65% calculation should be applied only to the supplier's actual unit price, separately for each condition and currency.


## Off Road search-page test and C9 candidate check (24 Nov 2026)

The full inventory search page was opened and rechecked: https://offroadeq.com/search. It exposes the part-number search and batch-import interface, but its public page explicitly states **“You must be logged in to shop.”** The page does not expose anonymous search results, supplier quantities or unit prices. No authentication, private endpoint or access-control bypass was attempted.

The public popular-parts index (https://offroadeq.com/parts) still exposes a 500-part list. The C9 discovery candidates **258-0794, 197-5987, 242-5336 and 245-3777** were not found in that public top-500 index. This is not a negative stock check: the full inventory is separate and login-gated. Therefore their Off Road availability and actual supplier prices remain **unknown**, not “unavailable.”

For these and future C9 candidates, use the supplier search only through an authorized account or quote/export. Capture exact part number, brand, description, condition, actual supplier unit price, currency, available quantity, lead time and observation date. Apply Amoot's 1.65 multiplier only to the actual supplier unit price. Do not calculate from Cat OEM List Price or infer a price from the public popular-parts index.

No Amoot price, inventory quantity or public SKU was changed in this pass.


## Expanded public detail-page batch (24 Nov 2026)

A public-page batch was checked for exact part-number records. The supplier's actual unit price remains hidden on every inventory row inspected; the USD values below are explicitly the page's **OEM List Price**, not an Off Road sale/quote price. Inventory figures are the quantities displayed by the public page at crawl/review time and must be rechecked before ordering.

| Part number | Description | OEM List Price (USD) | Publicly displayed inventory | Actual supplier unit price |
|---|---|---:|---|---|
| 5J1193 | BEARING | 91.15 | 162 New Aftermarket | Login to view |
| 5P1948 | CONE | 2,557.93 | 12 New Aftermarket; 1 New Genuine Surplus; 4 Used | Login to view |
| 8T4224 | WASHER-ZC | 0.47 | 254,039 New Genuine Surplus; 6,948 New Aftermarket | Login to view |
| 2807856 | MOTOR GP-P | 5,081.35 | 7 New Aftermarket | Login to view |
| 2V7390 | SHIM PACK | 60.12 | 28 New Genuine Surplus; 20 New Aftermarket | Login to view |
| 1R0751 | FILTER AS | 25.46 | 365 New Aftermarket | Login to view |
| 2681900 | PUMP GP F | 943.36 | 2 Used | Login to view |
| 8H9789 | BEARING | 39.16 | 665 New Genuine Surplus; 1,694 New Aftermarket | Login to view |

Additional public alternatives visible on those pages:
- **5J1193**: alternative 3828046 / CLASSIC, OEM List Price USD 41.01; exact inventory not found.
- **5P1948**: alternative H247549 / CONE, OEM List Price USD 2,445.74; exact inventory not found.
- **8T4224**: alternative 9M1974 / WASHER-PC, OEM List Price USD 0.37; 51 New Genuine Surplus and 10,028 New Aftermarket shown.
- **2807856**: alternatives 2208162 (USD 4,834.30), 10R3336 (USD 3,142.28), 1429020 (USD 4,834.30), and 10R6129 (USD 3,302.85); those exact alternatives were not found in inventory on the page.
- **2V7390**: alternatives 5U3131, 5U3132, 5U3130 and 5U3133; each displayed OEM List Price USD 57.49 and no exact inventory.
- **1R0751**: alternative P551315 showed OEM List Price USD 0.00 (not a usable price) and 148 New Aftermarket; do not use the zero value for pricing.
- **2681900**: alternative 3137770 / PUMP GP-F XF, OEM List Price USD 1,370.34; 28 New Genuine Surplus, 120 New Aftermarket and 2 Used shown.
- **8H9789**: alternative 1999929, OEM List Price USD 37.46; 25 New Genuine Surplus shown. Alternative 1B4109 showed 55 New Aftermarket and 5 New Genuine Surplus.

Source detail pages:
- https://offroadeq.com/parts/5J1193
- https://offroadeq.com/parts/5P1948
- https://offroadeq.com/parts/8T4224
- https://offroadeq.com/parts/2807856
- https://offroadeq.com/parts/2V7390
- https://offroadeq.com/parts/1R0751
- https://offroadeq.com/parts/2681900
- https://offroadeq.com/parts/8H9789

### Commercial interpretation

This batch proves the public pages are useful for **OEM list-price benchmarks, condition segmentation and displayed inventory quantities**, but not for Off Road's actual buy price. The list-price values must not be used as supplier acquisition cost and must not be multiplied by 1.65 to create Amoot's selling price. The sourcing-price field stays empty until an authenticated supplier quote or authorized price response is obtained. Public inventory snapshots are not Amoot-owned stock and are not an order confirmation.

The public top-500 list includes 1161980, but the checked C32/C9 numbers 3058921, 2072422, 3539049, 3620801, 4385385, 2580794, 1975987, 2425336 and 2453777 did not produce public detail-page price records in this pass. Their full-inventory availability and supplier prices remain unknown; absence from the public top-500 list is not proof of non-availability.


## User-approved OEM fallback pricing policy (24 Nov 2026)

The project owner explicitly approved using the public **OEM List Price** when Off Road's actual supplier unit price is hidden behind login. This supersedes the earlier rule that left the Amoot reference price blank whenever only OEM List Price was visible.

Handling:
- Store the visible OEM List Price as the **OEM benchmark price (USD)** and preserve the source URL and observation date.
- For a provisional Amoot reference/suggested price, apply the existing 1.65 factor to that OEM benchmark (65% markup). Keep the calculation transparent and label it **provisional — based on OEM list, not Off Road acquisition cost**.
- Do not describe the OEM benchmark as Off Road's selling price, purchase cost, quote, or guaranteed market price.
- Do not convert currency or add freight, duties, tax, FX or fees without sourced values.
- Keep supplier condition and displayed quantity in separate fields. A quantity shown on the public page is a dated supplier snapshot, not Amoot-owned stock and not a confirmed order.
- If a part page has no visible OEM price, do not invent one; leave price blank and continue to the next item.
- No price should be published as a firm offer until an admin approves it and current availability/condition is rechecked.

### Public detail-page batch with OEM fallback

| Part number | Description | OEM benchmark USD | Provisional Amoot reference USD (×1.65) | Public inventory snapshot | Detail page |
|---|---|---:|---:|---|---|
| 116-1980 | PUMP GP-EN / Engine Oil Pump | 2,024.61 | 3,340.61 | 15 New Aftermarket; 2 Call For Pricing (page snapshot also previously showed 1 Used) | https://offroadeq.com/parts/1161980 |
| 5J1193 | BEARING | 91.15 | 150.40 | 162 New Aftermarket | https://offroadeq.com/parts/5J1193 |
| 5P1948 | CONE | 2,557.93 | 4,220.58 | 12 New Aftermarket; 1 New Genuine Surplus; 4 Used | https://offroadeq.com/parts/5P1948 |
| 2807856 | MOTOR GP-P | 5,081.35 | 8,384.23 | 7 New Aftermarket | https://offroadeq.com/parts/2807856 |
| 2V7390 | SHIM PACK | 60.12 | 99.20 | 28 New Genuine Surplus; 20 New Aftermarket | https://offroadeq.com/parts/2V7390 |
| 1R0751 | FILTER AS | 25.46 | 42.01 | 365 New Aftermarket | https://offroadeq.com/parts/1R0751 |
| 2681900 | PUMP GP F | 943.36 | 1,556.54 | 2 Used | https://offroadeq.com/parts/2681900 |
| 8H9789 | BEARING | 39.16 | 64.61 | 670 New Genuine Surplus; 1,484 New Aftermarket | https://offroadeq.com/parts/8H9789 |
| 6R4385 | WHEEL A | 1,430.22 | 2,359.86 | Exact part not found; alternative variants listed | https://offroadeq.com/parts/6R4385 |
| 2P0220 | GASKET | 6.67 | 11.01 | Alternative 3982927: 12 New Genuine Surplus; exact part not shown | https://offroadeq.com/parts/2P0220 |

The 8H9789 inventory values were consolidated from the public exact/alternative-bearing detail pages; recheck before quoting. All actual Off Road unit prices remain login-gated. The provisional figures above are mathematical estimates from the OEM list-price benchmark only, not supplier-cost-plus-65% quotes. The 1R0751 alternative P551315 displays OEM List Price USD 0.00 and is excluded from pricing.

### C32/C9 exact-number batch outcome

A direct public detail-page attempt for 305-8921, 207-2422, 353-9049, 362-0801, 438-5385, 258-0794, 197-5987, 242-5336 and 245-3777 did not return accessible public detail records in this review. Their OEM benchmark prices and Off Road inventory remain **not established**; do not substitute prices from other parts or infer unavailability. The public top-500 list is only a discovery index, not the complete inventory.

No Amoot live price, public catalog price, stock quantity or sellable SKU was changed by this documentation pass.


## Additional public Off Road batch — exact detail pages and related variants (24 Nov 2026)

A further public search batch located three additional exact detail pages with visible OEM list prices. Actual Off Road unit prices remain login-gated. Calculations below use the owner-approved provisional factor of 1.65 and are OEM-list-based benchmarks, not Off Road acquisition costs.

| Part number | Description | OEM benchmark USD | Provisional reference USD (×1.65) | Public inventory snapshot | Source |
|---|---|---:|---:|---|---|
| 0816876 | BOLT-PC | 27.35 | 45.13 | Exact 0816876: no inventory found | https://www.offroadeq.com/parts/0816876 |
| 4619930 | GEAR-RING | 2,145.59 | 3,540.22 | 54 New Aftermarket | https://offroadeq.com/parts/4619930 |
| 1886126 | GASKET | 1.18 | 1.95 | 47 New Genuine Surplus; 2,320 New Aftermarket | https://offroadeq.com/parts/1886126 |

### Related alternatives — kept separate from exact-number records

| Related part number | Description | OEM benchmark USD | Provisional reference USD (×1.65) | Public inventory snapshot | Relationship |
|---|---|---:|---:|---|---|
| 2H1618 | BOLT-PC | 27.35 | 45.13 | 485 New Aftermarket; 1 New Genuine Surplus | Listed as alternative to 0816876; exact 0816876 itself not found |
| 7X0445 | BOLT-ZC | 29.78 | 49.14 | 15 New Aftermarket | Listed on 0816876 page as alternative |
| 1364188 | BOLT-PC | 28.60 | 47.19 | 337 New Aftermarket | Listed on 0816876 page as alternative |
| 3356121 | GEAR-RING | 2,051.49 | 3,384.96 | 32 New Aftermarket | Alternative to 4619930 |
| 9G8639 | GEAR-RING | 2,051.49 | 3,384.96 | Exact alternative inventory not found | Alternative to 4619930 |
| 4923491 | CLASSIC | 793.15 | 1,308.70 | Exact alternative inventory not found | Alternative to 4619930; different listed variant |
| 0T0225 | GASKET | 3.32 | 5.48 | 108 New Genuine Surplus; 882 New Aftermarket | Alternative to 1886126 |
| 9Y3595 | GASKET | 1.13 | 1.86 | 14 New Genuine Surplus | Alternative to 1886126 |

Source pages:
- https://www.offroadeq.com/parts/0816876
- https://offroadeq.com/parts/4619930
- https://offroadeq.com/parts/1886126

The 0816876 page explicitly says the exact part was not found; its alternatives must not be treated as interchangeable without Cat/SIS verification. The 4619930 and 1886126 inventory figures are public supplier snapshots, not Amoot-owned stock. The 1886126 alternatives carry different OEM list prices and remain separate candidate numbers. Do not publish any alternative as a replacement solely because Off Road lists it as a related option.

### Price and inventory interpretation

- All provisional figures are calculated as visible OEM List Price multiplied by 1.65, rounded to USD cents.
- The supplier's actual unit price remains “Login to view”; these are not supplier quotes or landed costs.
- No shipping, customs, tax, currency conversion or payment fees have been added.
- Recheck stock, condition and price with the supplier before quotation or purchase.
- No live Amoot product price, stock, or sellable SKU was changed in this research pass.


## Marine-engine targeted Off Road batch — public index cross-check (24 Nov 2026)

A further batch targeted the C32, C9 and marine engine references already present in the Amoot research register. The public popular-parts page was opened and its 500 visible part-number rows were checked by normalized digits. It is a discovery index only; the separate full inventory search remains login-gated. The following exact-number outcomes were recorded:

| Part number | Target context | Public top-500 index | Public Off Road exact OEM price / inventory | Handling |
|---|---|---|---|---|
| 305-8921 | C32 charging alternator group | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 207-2422 | C32 fuel/water separator group | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 353-9049 | C32 sea-water heat-exchanger group | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 362-0801 | C32 marine candidate | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 438-5385 | C32/C175 fuel-water separator filter | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 258-0794 | C9 fuel cooler group candidate | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 197-5987 | C9 water-cooled exhaust manifold candidate | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 242-5336 | C9 aftercooler group candidate | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 245-3777 | C9 auxiliary sea-water pump candidate | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 6L-2280 | C9 auxiliary sea-water pump zinc anode | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 149-3239 | C9 fuel-cooler hose | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 315-8339 | C9 aftercooler core | Not listed | Not established in this pass | Keep price and supplier availability unknown |
| 113-1110 | C9 sea-water pump cam | Not listed | Not established in this pass | Keep price and supplier availability unknown |

The exact normalized number **4619930** (the recently researched GEAR-RING page) does appear in the 500-part index, consistent with its public detail page. The index also contains 1161980 and other previously documented numbers. The tested C32/C9 targets above do not appear in that index. This absence is not proof of full-inventory non-availability; it is not a substitute for a logged-in authorized search or supplier quotation.

### Related public-source checks — not Off Road quotations

- **4385385** appears on third-party parts pages as a fuel/water separator. One third-party listing describes broad equipment/engine applications including C32/C32 Marine; another UK listing cross-references it with 4385386, 3169954 and other filter numbers. These are not Off Road records and do not establish Cat supersession or exact marine serial fitment. No Off Road price is inferred.
- **6L2280** appears on a UK marine-anode retailer page as a zinc anode, with a displayed retail price of GBP 14.00 and stock status; a separate aftermarket listing shows USD 9.65. Neither is an Off Road price or Cat OEM list-price record, and the listings differ in manufacturer/offer context. Do not import either as an Off Road benchmark.
- **3058921** appears as a cross-reference on a third-party alternator listing for 240-36485. This does not prove the listing is the same exact Cat assembly or establish an Off Road price. Keep it as a cross-reference lead only.

Sources checked:
- Public 500-part index: https://offroadeq.com/parts
- Full inventory search (login required to shop): https://offroadeq.com/search
- Off Road exact page for 4619930: https://offroadeq.com/parts/4619930
- Third-party 4385385 application/offer example: https://irondt.com/product/4385385/
- Third-party 4385385 UK cross-reference example: https://www.pallmanfilter.com/product/pff50110/
- Third-party 6L2280 UK anode offer: https://www.anodefactory.co.uk/products/zinkanod-caterpillar-%E1%B4%9312-40-motor-3-8unc-endast-anod
- Third-party 3058921 cross-reference example: https://www.robertsandson.com/alternators/alternators/240-36485.html

No additional OEM benchmark or provisional ×1.65 value was created in this pass because no new exact Off Road detail page with a visible OEM List Price was established. No Amoot price, inventory, or sellable SKU was changed.


## C18/C15 and 3400-family Off Road public-index batch (24 Nov 2026)

A second marine-engine batch checked normalized exact numbers from the previously documented C18, C15 and 3400-family Cat model-class research against the same public 500-part index. None of these 18 target numbers appeared in the visible index:

| Part number | Research context | Public index result | Off Road exact price / stock |
|---|---|---|---|
| 493-9456 | C18 housing | Not listed | Not established |
| 150-3141 | C18/C15 cover group | Not listed | Not established |
| 247-0825 | C18/C15 harness | Not listed | Not established |
| 323-7317 | C18 electronic control | Not listed | Not established |
| 229-8568 | C18/C15 block assembly | Not listed | Not established |
| 109-5326 | C18/C15 bolt | Not listed | Not established |
| 222-2886 | C18/C15 hose assembly | Not listed | Not established |
| 241-5732 | C18/C15 adapter-damper | Not listed | Not established |
| 279-9884 | C18/C15 water-pump housing | Not listed | Not established |
| 488-1675 | C18 cartridge/sleeve bearing | Not listed | Not established |
| 4N-4387 | C18 case | Not listed | Not established |
| 3N-6059 | C15 shaft | Not listed | Not established |
| 4N-0933 | C15 gasket | Not listed | Not established |
| 105-5081 | C15 air-starting motor | Not listed | Not established |
| 4W-6412 | 3400-family marine component | Not listed | Not established |
| 4W-4901 | 3400-family marine component | Not listed | Not established |
| 6N-7421 | 3400-family marine component | Not listed | Not established |
| 3N-8455 | 3400-family marine component | Not listed | Not established |

As with the previous batch, this result describes only the public popular-parts index. It does not establish that Off Road does not carry these parts; the complete inventory search remains separate and login-gated. No OEM List Price or provisional ×1.65 reference was added because no exact public Off Road detail record with a visible OEM List Price was located for these numbers. Do not infer an alternative or price from a similarly described part.

Source: https://offroadeq.com/parts (500 frequently searched parts; full inventory search: https://offroadeq.com/search).


## Independent public supplier-price leads — marine engine parts (24 Nov 2026)

These are public third-party retail/market offers, **not Off Road quotes and not Cat OEM List Prices**. They are recorded in a separate market-reference layer. Brand, condition, VAT treatment and stock state must remain distinct; no Amoot selling price is published from these observations.

| Cat part number | Product / seller | Displayed price | Currency / tax | Brand / condition as represented | Availability shown | Source |
|---|---|---:|---|---|---|---|
| 6L-2280 | Tecnoseal 02027 zinc rod, Anode Outlet | 7.93 | GBP; tax treatment not stated in result | Tecnoseal aftermarket equivalent; listing says same as Cat 6L2280/6L2281 | Estimated delivery 2–3 working days | https://www.anodeoutlet.co.uk/02027-tecnoseal-caterpillar-zinc-rod-anode-6l2280/ |
| 6L-2280 | Cat Zinc 6L-2280, Motortec | 16.52 | EUR, VAT included | Cat-branded listing | Same-day dispatch claim; stock quantity not shown | https://motortecpower.com/product/zinc-6l-2280/ |
| 6L-2280 | Tecnoseal/Caterpillar type 2027, Lancing Marine price book | 8.60 | GBP; price-book tax treatment not stated | Catalog line maps 2027 to OEM ref 6L2280; manufacturer/condition not specified in excerpt | No stock status in price-book excerpt | https://www.lancingmarine.com/price-book/page-104/ |
| 315-8339 | CAT 615.9 mm After Cooler Core, Advanced Truck Parts | 4,152.91 (was 5,191.14) | USD; tax treatment not stated | Listed Brand: Caterpillar; condition not explicit | Sold out | https://advancedtruckparts.com/collections/cat-cat/products/315-8339-cat-615-9mm-length-after-cooler-core |
| 315-8339 | Core Aftercooler CA3158339, DeedParts | 1,750.32 | USD; tax treatment not stated | New aftermarket, “For CAT” (not genuine Cat) | In stock (seller page) | https://www.deedparts.com/core-as-aftercooler-ca3158339-315-8339-3158339-for-caterpillar-cat-engine-c9.html |
| 315-8339 | C9 aftercooler core, Made-in-China listing | 825.00 | USD; MOQ 1; tax/freight not stated | Manufacturer offer; exact brand/quality certification not established in snippet | Listing offer; availability must be confirmed | https://www.made-in-china.com/products-search/hot-china-products/Core_Aftercooler_Price.html |

### Interpretation / controls

- The three 6L-2280 offers are not directly comparable: Tecnoseal aftermarket equivalence, a Cat-branded retail offer, and a marine price-book line have different provenance and tax/stock detail. Do not average them or treat them as Off Road costs.
- The 315-8339 offers differ materially in price and condition. Advanced Truck Parts shows a Cat-branded listing but currently **sold out**; DeedParts explicitly describes a new aftermarket “For CAT” product; the Made-in-China listing is a supplier offer with no independently verified brand or certification. They must not be merged into one price.
- Official Cat Parts Store pages confirm 6L-2280 as a zinc anode for auxiliary sea-water pumps/heat exchangers, and confirm 315-8339 as a C9 aftercooler core. Cat customer prices are login-gated in the returned pages; no OEM price was extracted from them.
- Official Cat model-class evidence also reconfirmed 305-8921 (C32 Marine Engine/Generator Set), 207-2422 (C32 marine/generator and other classes), 353-9049 (C32 Marine Engine + Generator Set), 149-3239 (C9 Marine Engine/Generator Set), 113-1110 (C9 Marine Engine plus Generator Set/Petroleum), 493-9456 (C18 Marine Engine plus non-marine classes), and 247-0825 (Marine Engine applications including C18/C15/C32/C9). These are application-class observations only; serial/Arrangement fitment still governs.
- 315-8339 is independently shown as a component in a C9 Marine parts-manual extract for aftercooler group 242-5336, quantity 1. This third-party manual extract is useful assembly context, but the Cat Parts Store compatible-model list and full serial/Arrangement lookup remain the controlling fitment checks.

No supplier quote was obtained, no Off Road price was inferred, no ×1.65 Amoot price was calculated from these third-party retail offers, and no public catalog price or stock was changed.


## Owner clarification — Off Road prices are accepted sourcing evidence (24 Nov 2026)

The project owner explicitly confirmed that prices shown by Off Road Equipment are accepted as valid price evidence for Amoot, whether the listing is OEM/genuine or another category (aftermarket, rebuilt/remanufactured, used, etc.). This approval supersedes earlier wording in this file that broadly characterized Off Road prices as unverified or unusable.

Apply these distinctions:
- If an exact Off Road listing exposes a supplier unit price, accept and record that displayed amount as the Off Road supplier-price reference, with currency, brand, condition/category, quantity, observation time and exact URL.
- If the page exposes only OEM List Price, accept it as an OEM benchmark, not as the Off Road acquisition price. The previously approved fallback is OEM List Price × 1.65, clearly labeled provisional and not an acquisition-cost quote.
- Apply ×1.65 to an actual displayed supplier unit price when available, separately for each condition and currency. Preserve the original amount and calculation.
- Keep New Genuine Surplus, New Genuine - Less Than Perfect, New Aftermarket, Rebuilt, Used and Call For Pricing as distinct records. Do not average or merge conditions.
- Do not calculate on Call For Pricing, blank or invalid/zero prices. Do not add freight, tax, duties, FX or fees without separate source evidence.
- Off Road availability and quantity are accepted as supplier-reported snapshots at observation time, not Amoot-owned inventory; recheck before order confirmation.
- Sourcing prices remain admin-only until approved for customer publication. Source approval does not itself create Amoot stock or a sellable SKU.

## Follow-up public access check (24 Nov 2026)

The current public Off Road pages were rechecked. The public popular-parts index still exposes 500 frequently searched numbers and links to the separate full-inventory search. Off Road's FAQ states that an account/login can be created to view price and availability; no account credentials were supplied for this research pass, and no login-gated prices were accessed. The FAQ also confirms the supplier carries genuine, aftermarket, used and rebuilt parts and describes a 90-day warranty for new and rebuilt parts. These source statements support recording the listing's exact condition rather than treating every listing as OEM.

Targeted public detail URL checks for the marine references 3539049, 3058921, 2072422, 4939456, 1503141 and 2470825 did not return accessible public detail pages in this pass. No new Off Road amount or quantity was therefore recorded for those exact numbers. Their absence from the 500-part index or an inaccessible detail URL is not proof of full-inventory non-availability.

Sources:
- https://offroadeq.com/parts
- https://offroadeq.com/search
- https://surpluscatparts.com/faq/
- https://offroadeq.com/process

No Amoot database price, public catalog price, stock quantity or sellable SKU was changed by this documentation update.


## C18 fuel-system part-number public-index check (24 Nov 2026)

Following the Cat Parts Store extraction, the public Off Road Equipment 500-part popular-parts index was checked for **361-5093**, **448-4451** and **448-4452**. None appears in that public index. This is only a limited public-index result; it does not establish absence from Off Road's full inventory. The full search interface says users must be logged in to shop and expose price/availability, so no exact Off Road unit price, condition, quantity or supplier availability could be recorded for these numbers in this pass. Do not calculate a ×1.65 supplier-price reference without an actual displayed supplier unit price or an applicable OEM list benchmark. The public Off Road search page advertises batch import, but its results remain login-gated: https://www.offroadeq.com/search . No price or inventory was changed on Amoot.
