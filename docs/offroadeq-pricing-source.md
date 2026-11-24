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
