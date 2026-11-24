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
