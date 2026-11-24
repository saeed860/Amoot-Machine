# Off Road Equipment pricing-source assessment

Reviewed: 2026-11-24
Source: https://offroadeq.com/

## Owner-approved pricing rule

The owner approved Off Road Equipment as a usable source for Caterpillar part references and pricing, including OEM and non-OEM conditions. Use this hierarchy:

1. If an authenticated, authorized listing or supplier quotation explicitly exposes an Off Road supplier unit price, use that amount as the source basis. Preserve condition (New Genuine Surplus, New Aftermarket, Reman, Used, etc.), currency, quantity and timestamp separately.
2. If the supplier unit price is hidden behind login but the public detail page shows a valid **OEM List Price in USD**, use **OEM List Price × 1.65** as a provisional Amoot USD reference.
3. Never label an OEM-list-based calculation as Off Road's acquisition cost or supplier sale price. Keep its price type as `OEM_LIST_FALLBACK`.
4. Do not calculate from Call For Pricing, zero/invalid amounts, missing currency, or a value whose type cannot be established.
5. Keep supplier-reported inventory separate from Amoot-owned stock. Recheck condition, availability and price before confirming an order.

The 1.65 multiplier is the approved Amoot pricing factor. Do not add freight, customs, taxes, FX or bank fees unless separately sourced and modeled.

## Public access and limitations

The public `/parts` page lists 500 frequently searched part numbers and links to individual detail pages. The full inventory search supports part-number and batch searches, but shopping and actual unit prices can require sign-in. Do not bypass login, inspect private endpoints, or automate use of credentials that have not been explicitly provided and authorized.

The public detail page for **1161980** (https://offroadeq.com/parts/1161980) showed:
- OEM List Price: USD 2,024.61
- Supplier inventory conditions: New Aftermarket, Call For Pricing and Used
- Actual unit prices: login-gated

Under the owner's approved fallback, the public OEM benchmark can be used as a provisional reference at USD 3,340.61 (2,024.61 × 1.65), rounded to two decimals. This is explicitly not the supplier unit price.

## Import fields

For each public detail page capture:
- Exact part number, description and exact source URL
- OEM List Price USD, if present
- Supplier unit price and currency only when explicitly visible
- Condition and inventory quantities shown
- Price type: `SUPPLIER_UNIT`, `OEM_LIST_FALLBACK`, or `CALL_FOR_PRICING`
- Calculated Amoot USD = eligible reference amount × 1.65
- Observation timestamp and scrape/quote status

Do not combine OEM, aftermarket, remanufactured and used prices into a single undifferentiated item when separate source rows are available.

## Relationship to existing Amoot pricing

The existing 505-row internal Amoot price audit contains source-identified benchmark/listing prices collected from independent sellers and marketplaces. Those records must retain their own source and price basis. They must not be relabelled as Off Road prices. The new Off Road batch is an additional independent source and should update an existing part only when an exact normalized part-number match and valid Off Road price type are captured.

## Source links

- Public popular parts list: https://offroadeq.com/parts
- Full inventory search: https://offroadeq.com/search
- Tested public detail: https://offroadeq.com/parts/1161980
- Pricing and condition overview: https://offroadeq.com/process
- Company states it is not an authorized Caterpillar dealer: https://offroadeq.com/
