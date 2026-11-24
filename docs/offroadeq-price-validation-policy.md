# Off Road Equipment price validation policy

Effective: 2026-11-24
Approved by the project owner.

## Owner decision

Prices displayed by Off Road Equipment are accepted as valid, usable price evidence for Amoot Machine, whether the listing is OEM/genuine or another condition/category (including aftermarket, remanufactured, used, and call-for-pricing records).

Do not reject an Off Road price merely because it is not OEM. The source is accepted; the product identity, brand, condition, currency, and price type must still be preserved exactly as displayed.

## Required capture rules

For every Off Road record, capture where available:
- Exact part number and listing description
- Brand / manufacturer and OEM-vs-aftermarket identity as shown
- Condition/category exactly as shown (for example New Genuine Surplus, New Aftermarket, Reman, Used, or Call For Pricing)
- Displayed price and currency
- Price type/label exactly as shown (for example supplier unit price versus OEM List Price)
- Displayed quantity/availability and lead time
- Observation timestamp and exact source URL

A displayed Off Road supplier unit price is an accepted supplier-price reference. A displayed OEM List Price is an accepted OEM benchmark price. Keep these two price types distinct; never relabel an OEM List Price as the supplier's acquisition cost or as an Off Road sale price unless the listing explicitly identifies it that way.

## Amoot pricing calculation

- When an Off Road supplier unit price is available, use that amount as the supplier-price basis for the Amoot reference-price calculation under the existing approved 1.65 multiplier, separately by currency and condition.
- When only an OEM List Price is available, the owner-approved fallback remains OEM List Price × 1.65. Label the result: "provisional — based on OEM list, not Off Road acquisition cost".
- Do not apply the multiplier to Call For Pricing, zero/invalid prices, missing prices, or a price whose currency/type cannot be established.
- Do not combine OEM, aftermarket, remanufactured, and used prices into one average or one undifferentiated SKU price.
- Do not add freight, customs, taxes, FX, bank fees, or other costs unless separately sourced and recorded.
- Preserve the original Off Road amount alongside any calculated Amoot reference price.

## Availability and publication

Off Road's displayed quantity and availability are accepted as valid supplier-reported snapshots at the observation time. They are not Amoot-owned stock and are not a guarantee that the item remains available at order time. Recheck current price, condition, and availability before confirming a customer order or purchase.

Keep sourcing prices and calculated references private/admin-only until an administrator approves publication. This policy validates Off Road as a source; it does not automatically create Amoot stock, publish a customer-facing price, promote a candidate to a sellable SKU, or certify serial/Arrangement fitment.

## Relationship to earlier research notes

This owner-approved policy supersedes any wording in earlier research notes that broadly dismisses Off Road prices as unverified or unusable. The distinction between supplier unit price and OEM List Price remains mandatory. Public-index absence is not proof of no inventory; use an actual Off Road listing/quote record when available.

No product, database price, public catalog price, stock quantity, or sellable SKU is changed by recording this policy.
