# Internal Off Road filter price observations — 25 Nov 2026

This is an internal review record. Do not link it from public navigation or expose raw source observations as customer prices.

## What was captured

The site's embedded Off Road detail observations contain numeric values and unit weights for the following 12 filter-related part numbers. The capture did not preserve a visible price label/type, currency label, condition, quantity, availability timestamp or authenticated supplier quote. These numbers are therefore **unclassified observations**, not confirmed supplier unit prices and not confirmed OEM List Prices.

| CAT part number | Detail-capture amount | Unit weight (lb) | Price type | Condition | Amoot calculation |
|---|---:|---:|---|---|---|
| 1G-8878 | 134.29 | 3.1 | Unknown | Not captured | Not calculated |
| 1R-0716 | 54.99 | 3.7 | Unknown | Not captured | Not calculated |
| 1R-0739 | 29.88 | 2.2 | Unknown | Not captured | Not calculated |
| 1R-0749 | 45.97 | 2.6 | Unknown | Not captured | Not calculated |
| 1R-0750 | 38.12 | 1.5 | Unknown | Not captured | Not calculated |
| 1R-0751 | 42.01 | 1.6 | Unknown | Not captured | Not calculated |
| 1R-0762 | 60.18 | 2.1 | Unknown | Not captured | Not calculated |
| 1R-1807 | 39.39 | 2.3 | Unknown | Not captured | Not calculated |
| 1R-1808 | 73.28 | 3.5 | Unknown | Not captured | Not calculated |
| 326-1644 | 76.40 | 2.2 | Unknown | Not captured | Not calculated |
| 360-8960 | 46.32 | 2.7 | Unknown | Not captured | Not calculated |
| 7W-2326 | 27.55 | 1.5 | Unknown | Not captured | Not calculated |

The public index is at https://offroadeq.com/parts. Individual Off Road detail pages were not retrievable in this session, so no exact listing labels or current supplier prices are claimed.

## Important separation in the Amoot code

The prior array named offRoadPriceRows contained values that match already-audited Amoot reference prices from independent sellers, not Off Road supplier prices. Examples in docs/internal-offroad-price-audit.md:
- 1R-0749: USD 78.53 source listing × 1.65 = USD 129.57 (FilterFinder)
- 1R-1808: USD 36.99 source listing × 1.65 = USD 61.03 (FinditParts)
- 1G-8878: USD 36.10 source listing × 1.65 = USD 59.57 (KMP)
- 326-1644: USD 27.30 source listing × 1.65 = USD 45.05 (AMT Equipment Parts)

The array has been renamed to auditedAmootPriceRows and its provenance is now marked INDEPENDENT_SELLER_AUDIT. The detail-capture numeric value is retained separately as offRoadPriceObservation with priceType=UNCLASSIFIED. This prevents an Off Road numeric observation from being mislabeled as an Amoot sale price.

## Publication decision

- Ten new CAT filter products were added with official CAT product images, zero Amoot stock and NULL USD price.
- Existing CAT-1R-0749 and CAT-1R-1808 product prices remain the previously audited independent-seller Amoot references; they were not overwritten by the unclassified Off Road observations.
- Do not apply the approved 1.65 multiplier to the 12 observations until the exact Off Road listing establishes whether each amount is a supplier unit price or OEM List Price and captures the displayed currency/condition.
- When the type is known, preserve the source amount and apply the owner-approved price policy separately by condition and price type.
