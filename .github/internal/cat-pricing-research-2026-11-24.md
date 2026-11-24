# Cat parts and supplier price research — 24 November 2026

## Public price updates (approved 1.65 multiplier)

Only exact-match, publicly visible supplier listings were priced. Public product prices are final Amoot USD prices; source prices and evidence stay internal. No stock is promised.

| SKU | Source / condition | Observed source price | Amoot USD (×1.65) | Treatment |
|---|---|---:|---:|---|
| CAT-7W-0009 | Aftermarket Express; NEW AFTERMARKET; seller lists Florida stock | $1,955.00 | **$3,225.75** | Public price entered; brand set to Aftermarket; shipping excluded |
| CAT-5N-4504 | Aftermarket Express; NEW AFTERMARKET; seller lists Florida stock | $264.52 | **$436.46** | Public price entered; brand set to Aftermarket; shipping excluded |
| CAT-8T-6765 | Heavy Duty Pros; seller-listed replacement part, OEM authenticity not established | $1.05 | **$1.73** | Public price entered; brand set to Replacement (OEM status unverified) |

Sources:
- https://aftermarket.express/caterpillar/7w0009 — explicitly states NEW AFTERMARKET, USD 1,955, OEM benchmark USD 4,118.78, and seller disclaimer that it is not an authorized Caterpillar dealer.
- https://aftermarket.express/caterpillar/5n4504 — explicitly states NEW AFTERMARKET, USD 264.52, OEM benchmark USD 331.63, and seller disclaimer that it is not an authorized Caterpillar dealer.
- https://www.heavydutypros.com/caterpillar-3126-6jk-engine-parts-engine-parts.aspx — lists replacement 8T6765 at USD 1.05; do not represent as Cat genuine without confirmation.

All three products remain stock quantity 0 / quote-first. Source shipping, handling, taxes and international freight are not included. Supplier price and availability must be reconfirmed at order time.

## Remaining 22 of the original 25 items

No public price was inserted for the remaining items because exact price, currency, condition or SKU match was not sufficiently established:
- 0S-0699
- 2W-9215
- 3349111411
- 8B-9725
- AC30A-03-D
- CAT-0R-8200
- CAT-10R-9063
- CAT-10R-9954
- CAT-1L-9049
- CAT-202-2785
- CAT-20R-0043
- CAT-20R-2510
- CAT-20R-3958
- CAT-20R-4278
- CAT-20R-5367
- CAT-260-3406
- CAT-30R-0084
- CAT-321-6970
- CAT-453-1607
- CAT-4N-1114
- CAT-593-5344
- CAT-9X-3406

Important excluded leads:
- 4N-1114: a surfaced USD 27.28 listing was used/second-hand, not a verified new part price.
- 1L-9049: a surfaced listing was in CNY, not USD; no FX basis was approved for conversion.
- 202-2785: a public procurement document surfaced an amount but did not establish a comparable currency/market/condition basis for the Amoot product.
- 20R-5367: a WesTrac amount included a 60-month/10,000-hour protection program, not a clean engine-only price.
- Cat Reman engines, short/long blocks and overhaul kits commonly show “Login to view your customer price” or “Check Price”. Core-return obligations/refunds can materially affect net cost. No price was estimated from kit components or similar engines.
- 3349111411 has a conflicting identity in surfaced public references (Parker catalog material describes a 160-bar safety block, while the current Amoot record describes a PGP511 gear pump). Keep it unpriced pending exact Parker order-code verification.

## Official Cat public-page enrichment

The prior run report was misleading when it described the extraction as zero: it reflected a failed direct-page automation run, not the already-populated production catalog. A direct database audit found 787 official Cat reference rows, most already enriched.

Before this pass:
- 787 official Cat reference rows
- 769 descriptions
- 423 product images
- 390 rows with compatible-model associations
- 415 rows with engine-model associations
- 192 rows with structured specifications

After this pass:
- **787 rows**
- **781 descriptions** (+12)
- **423 images** (unchanged; no image URL was fabricated)
- **405 rows with compatible-model associations** (+15)
- **415 rows with engine-model associations** (unchanged)
- **203 rows with structured specifications** (+11)

The remaining six rows without descriptions are 127-2176, 1L-5011, 238-3262, 397-4971, 3T-2160 and 447-8618. Public Cat pages identify these products and, where available, publish model/specification data, but do not provide substantive descriptions. Their source names, source URLs, verification status and any explicit compatible-model/specification data were retained or enriched; no generic fitment or invented technical description was added.

Enrichment used indexed public Cat Parts Store product pages, not authenticated SIS sessions. Examples of the newly checked public pages:
- https://parts.cat.com/en/catcorp/product/100-3878
- https://parts.cat.com/en/catcorp/product/338-3454
- https://parts.cat.com/en/catcorp/product/375-4809
- https://parts.cat.com/en/catcorp/product/392-0200
- https://parts.cat.com/en/catcorp/product/392-0216
- https://parts.cat.com/en/catcorp/product/392-0217
- https://parts.cat.com/en/catcorp/product/392-0219
- https://parts.cat.com/en/catcorp/product/392-0222
- https://parts.cat.com/en/catcorp/product/397-4971
- https://parts.cat.com/en/catcorp/product/397-5051
- https://parts.cat.com/en/catcorp/product/3T-2160
- https://parts.cat.com/en/catcorp/product/7C-0877
- https://parts.cat.com/en/catcorp/product/8N-8836

Notable corrections:
- 397-5051 is marked discontinued on the official Cat page.
- 7C-0877 is marked discontinued; Cat displays 0R-1756 as an available Reman alternative.
- Injector references 392-0200 / 392-0216 / 392-0217 / 392-0219 / 392-0222 gained official page descriptions, dimensions and model associations.
- 375-4809 gained marine model associations and its published material/outer-diameter data.
- 100-3878 gained spring dimensions and published material/performance data.

## Next extraction method

Direct bulk navigation to parts.cat.com remains unreliable because the storefront may block automated navigation. Continue in bounded batches using:
1. indexed public Cat product pages for part-number descriptions, specs, images and compatible-model classes;
2. public Cat Parts Reference Guides and lawful public sample pages from engine.od.ua for parts-group/page references;
3. K-Part public catalog for independent model/serial-prefix navigation, recorded as third-party evidence;
4. supplier catalogs only as supplier references, not OEM fitment proof.

Keep all imported Cat records at REFERENCE unless serial-specific Cat SIS/SIS2GO evidence exists. Do not bypass logins, scrape authenticated SIS sessions, infer fitment from family names, or republish manuals. For serial-specific fitment, require serial number, Arrangement and document/illustration reference.
