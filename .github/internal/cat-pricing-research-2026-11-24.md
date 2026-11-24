# Cat parts and supplier price research — 24 November 2026

## Public price updates (approved 1.65 multiplier)

Only exact-match, publicly visible supplier listings were priced. Public product prices are final Amoot USD prices; source prices and evidence stay internal. No stock is promised.

| SKU | Source / condition | Observed source price | Amoot USD (×1.65) | Treatment |
|---|---|---:|---:|---|
| CAT-7W-0009 | Aftermarket Express; NEW AFTERMARKET; seller lists Florida stock | $1,955.00 | **$3,225.75** | Public price entered; brand set to Aftermarket; shipping excluded |
| CAT-5N-4504 | Aftermarket Express; NEW AFTERMARKET; seller lists Florida stock | $264.52 | **$436.46** | Public price entered; brand set to Aftermarket; shipping excluded |
| CAT-8T-6765 | Heavy Duty Pros; seller-listed replacement part, OEM authenticity not established | $1.05 | **$1.73** | Public price entered; brand set to Replacement (OEM status unverified) |
| CAT-4N-1114 | PartSell; Caterpillar listing, condition not specified; seller showed 6 units | RUB 3,969 (USD 48.34 at 0.01218) | **$79.76** | Public price entered; currency conversion uses 24 Nov 2026 mid-market rate; reconfirm condition and stock |
| CAT-1L-9049 | WSTPARTS 3512 catalog; spring listing, condition/stock not specified | CNY 25.01 (USD 3.75 at 0.15005552) | **$6.19** | Public price entered; currency conversion uses 24 Nov 2026 mid-market rate; confirm condition and stock |
| CAT-260-3406 | eBay seller discountdepot; New / Open Box; authenticity not independently verified | $44.99 (+$9.99 shipping) | **$74.23** | Public price entered; seller rating 99.9%; shipping excluded; verify item condition and stock |

Sources:
- https://aftermarket.express/caterpillar/7w0009 — explicitly states NEW AFTERMARKET, USD 1,955, OEM benchmark USD 4,118.78, and seller disclaimer that it is not an authorized Caterpillar dealer.
- https://aftermarket.express/caterpillar/5n4504 — explicitly states NEW AFTERMARKET, USD 264.52, OEM benchmark USD 331.63, and seller disclaimer that it is not an authorized Caterpillar dealer.
- https://www.heavydutypros.com/caterpillar-3126-6jk-engine-parts-engine-parts.aspx — lists replacement 8T6765 at USD 1.05; do not represent as Cat genuine without confirmation.

All six products remain stock quantity 0 / quote-first. Source shipping, handling, taxes and international freight are not included. Supplier price and availability must be reconfirmed at order time.

## Remaining 19 of the original 25 items

No public price was inserted for the remaining items because exact price, currency, condition or SKU match was not sufficiently established:
- 0S-0699
- 2W-9215
- 3349111411
- 8B-9725
- AC30A-03-D
- CAT-0R-8200
- CAT-10R-9063
- CAT-10R-9954
- CAT-202-2785
- CAT-20R-0043
- CAT-20R-2510
- CAT-20R-3958
- CAT-20R-4278
- CAT-20R-5367
- CAT-30R-0084
- CAT-321-6970
- CAT-453-1607
- CAT-593-5344
- CAT-9X-3406

Additional sources:
- https://www.ebay.com/shop/g3516?_nkw=g3516 — eBay listing for Caterpillar hose assembly 260-3406 by discountdepot at USD 44.99, condition New / Open Box, with USD 9.99 shipping. Seller feedback shown as 99.9% positive; condition/authenticity and availability must be reconfirmed.

- https://www.wstparts.cn/caterpillar-3512-parts/ — 1L9049 spring listed at CNY 25.01 in the 3512 catalog. Condition and stock are not specified. Converted at 1 CNY = USD 0.15005552 (mid-market reference on 2026-11-24); supplier spread and shipping excluded.

- https://partsell.ru/catalog/4n-1114 — seller listing for Caterpillar 4N-1114 at RUB 3,969 and 6 units shown. Listing condition is not explicit. Currency converted at 1 RUB = USD 0.01218 (mid-market reference on 2026-11-24); shipping and payment spread excluded.

Important excluded leads:
- 4N-1114: a surfaced USD 27.28 listing was used/second-hand and excluded; the separate PartSell listing at RUB 3,969 is now used as a seller-reference price, but condition remains unconfirmed.
- 1L-9049: a WSTPARTS catalog listing at CNY 25.01 is now used as a seller-reference price, converted at the 2026-11-24 mid-market rate; condition and stock remain unconfirmed.
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
- **782 descriptions** (+13)
- **423 images** (unchanged; no image URL was fabricated)
- **406 rows with compatible-model associations** (+16)
- **415 rows with engine-model associations** (unchanged)
- **204 rows with structured specifications** (+12)

The remaining five rows without descriptions are 1L-5011, 238-3262, 397-4971, 3T-2160 and 447-8618. The 127-2176 description and its published specifications/model associations were added from the official Cat Parts Store page. Public Cat pages identify these products and, where available, publish model/specification data, but do not provide substantive descriptions. Their source names, source URLs, verification status and any explicit compatible-model/specification data were retained or enriched; no generic fitment or invented technical description was added.

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


## Manual Cat Parts enrichment checkpoints — 24 November 2026

### Batch 001/010 — completed (10/10)
Method: manually inspect publicly indexed official Cat Parts Store product pages and category listings; do not use authenticated customer pricing or infer model fitment. Supabase rows remain `REFERENCE`; source evidence is recorded per row.

| Part number | Official Cat identity | Official data captured | Compatible models |
|---|---|---|---|
| 000-5242 | Screw | Hex head; 2.625 in bolt length; 1.5 in grip; coarse 1/2-13 RH thread; alloy mixed metal; hole-in-head locking feature | Not published |
| 000-5251 | Washer | Spring-conical; alloy mixed metal; 0.06 in thickness; 0.877 in ID; 1.97 in OD | Not published |
| 000-5252 | Rivet | Alloy mixed metal | Not published |
| 000-5253 | Stud | No public specifications | Not published |
| 000-5265 | Dowel | Alloy mixed metal | Not published |
| 000-5562 | Guide | No public specifications exposed | Not published |
| 000-5564 | Pin-Eng (engine pin) | Alloy mixed metal | Not published |
| 000-5571 | Nut | Alloy mixed metal | Not published |
| 000-5585 | Gasket | No public specifications | Not published |
| 000-5595 | Nut | RH thread; hex; alloy mixed metal; 0.328 in thickness; 0.012 in thread size as displayed; 0.5 in drive | Not published |

Official source pages checked:
- https://parts.cat.com/en/catcorp/product/000-5242
- https://parts.cat.com/en/catcorp/product/000-5251
- https://parts.cat.com/en/catcorp/product/000-5252
- https://parts.cat.com/en/catcorp/product/000-5253
- https://parts.cat.com/en/catcorp/product/000-5265
- https://parts.cat.com/en/catcorp/product/000-5562
- https://parts.cat.com/en/catcorp/product/000-5564
- https://parts.cat.com/en/catcorp/product/000-5571
- https://parts.cat.com/en/catcorp/product/000-5585
- https://parts.cat.com/en/catcorp/product/000-5595
- https://parts.cat.com/en/catcorp/category/hw-seals-consumables-hardware
- https://parts.cat.com/en/catcorp/category/pins-dowel
- https://parts.cat.com/en/catcorp/category/hw-seals-consumables-foam-insulation-liners

Database checkpoint: 10/10 rows verified in `public.part_catalog`; official specifications stored for 8 rows, 2 rows have no published specifications; all 10 have empty compatible-model arrays because Cat's public pages state that compatibility is unavailable. No image URL or fitment was invented. The generic Scene7 fallback URL already present on these records was not changed in this batch.


### Batch 002/010 — completed (10/10)
| Part number | Official Cat identity | Official data captured | Compatible models |
|---|---|---|---|
| 000-5596 | Stud | Cat page publishes no specifications | Not published |
| 000-5677 | Retainer | Alloy Mixed: Metal | Not published |
| 000-5678 | Spring | Alloy Mixed: Metal | Not published |
| 000-5683 | Bushing | Sleeve ID 1.22 in; OD 1.502 in; overall length 1.203 in; alloy mixed metal / bronze; no cross holes; no unique features | Not published |
| 000-5710 | Stud | No specifications exposed in retrieved product page | Not published |
| 000-5732 | Gasket | Product page retrieved; no technical data or compatibility exposed in returned content | Not published |
| 036-1865 | Zinc Plated Heat Exchanger Radiator Cap | Cat cap for radiators/hydraulic oil coolers; direct OEM replacement; gasket diameter 36.85 (unit not stated); official product photo | 163 model identifiers captured from Cat's public list |
| 095-0670 | M12-1.75 × 45 mm Hex Socket Head Bolt | RH; alloy steel/alloy zinc; 0.207 in grip; socket head; ISO 898-1 Class 12.9; 1.772 in length; Cat matched-fastener system description | Extensive list not fully captured; no new fitment list inserted |
| 097-7404 | DM Bulk Tube | Material: Other Hose | 41 model identifiers; 29 engine-model identifiers |
| 0R-0916 | Cat 3408 Reman Connecting Rod (Wide Taper) | Cat Reman; core inspection/cleaning, new rod bushings and load test described by Cat; official product photo | 90 model identifiers; 14 engine-model identifiers |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/000-5596
- https://parts.cat.com/en/catcorp/product/000-5677
- https://parts.cat.com/fr/catcorp/product/000-5678
- https://parts.cat.com/en/catcorp/product/000-5683
- https://parts.cat.com/en/catcorp/product/000-5710
- https://parts.cat.com/en/catcorp/product/000-5732
- https://parts.cat.com/en/catcorp/product/036-1865
- https://parts.cat.com/en/catcorp/product/095-0670
- https://parts.cat.com/en/catcorp/product/097-7404
- https://parts.cat.com/en/catcorp/product/0R-0916
- https://parts.cat.com/en/catcorp/category/hw-seals-consumables-hardware
- https://parts.cat.com/en/catcorp/category/pins-dowel

Database checkpoint: all 10 rows updated in `public.part_catalog`; 036-1865, 095-0670 and 0R-0916 have verified Cat product photos captured from official Scene7 image links; no image was fabricated. 095-0670's public compatible-model list is unusually long and remains unmodified rather than storing a partial list. 0R-0916 remains clearly classified as Cat Reman, not standard new Cat; core-return requirements must be disclosed at order time. All imported rows remain REFERENCE pending serial-specific SIS confirmation.


### Batch 003/010 — completed (10/10)
| Part number | Official Cat identity | Specifications / evidence | Compatible models |
|---|---|---|---|
| 0R-0921 | Cat Reman Connecting Rod (D379/D398/D399) | Alloy Nickel; Cat describes core inspection, magnetic-particle checks, new rod bushings, load testing and finish processing | 12 model identifiers across D379/D398/D399 and G379/G398/G399 engine families |
| 0R-0999 | Cat Reman Water Pump (3300) | 13.1 in length; 8.0 in height; Sealants/Adhesives Adhesive material | G3306; G3304; G3306B |
| 0R-1003 | Cat Reman Water Pump (3300) | 13.1 in length; 8.0 in height; Sealants/Adhesives Adhesive material | 58 model identifiers |
| 0R-1039 | Cat Reman Fan Drive Group (3512/3516) | No specifications published; Cat describes belt-driven fan mounting and reman core inspection | 13 model identifiers |
| 0R-1571 | Cat Reman Cylinder Pack (3408/3412), 14.5:1 | Preassembled liner/piston/rings/pin/retainers/rod/seals; Cat recommends 3408/3412; no structured specs | 3412 and 3406 listed under compatible models |
| 0R-1572 | Cat Reman Cylinder Pack (3408/3412), 14.3:1 | 6.8 in length; 18.6 in height; no separate component list available | 65 model identifiers |
| 0R-2235 | Cat C9 Reman UTN Crankshaft (ACERT) | No structured specs; Cat describes new UTN crankshaft, possible undersize grinding and qualifying-core return | 75 model identifiers |
| 0R-2657 | Cat 3408 Reman UTN Crankshaft | Cat describes heat-treated UTN crankshaft; no structured specs | 58 model identifiers |
| 0R-2897 | Cat Reman Air Compressor (Basic), TU FLO 501 | 14.3 in length; 9.4 in height; Cat describes reground/polished crankshaft and journal surfaces, rehoned bores and new wear components | 3116, 3114, 3126 |
| 0R-3021 | Camshaft Kit | Cat page states no parts are currently associated with this kit | 3208, PS-500, 227, 229, 225, 225B, CS-553, CS-551, CP-553, CB-614 |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/0R-0921
- https://parts.cat.com/en/catcorp/product/0R-0999
- https://parts.cat.com/en/catcorp/product/0R-1003
- https://parts.cat.com/en/catcorp/product/0R-1039
- https://parts.cat.com/en/catcorp/product/0R-1571
- https://parts.cat.com/en/catcorp/product/0R-1572
- https://parts.cat.com/en/catcorp/product/0R-2235
- https://parts.cat.com/en/catcorp/product/0R-2657
- https://parts.cat.com/en/catcorp/product/0R-2897
- https://parts.cat.com/en/catcorp/product/0R-3021

Database checkpoint: 10/10 records updated; all ten are classified as Cat Reman where the product page identifies the Reman line. Five exact official product images were attached (0R-0999, 0R-1003, 0R-1571, 0R-2897, 0R-3021). No image was assigned where the retrieved Cat asset was only a low-resolution thumbnail or generic logo. Core-return obligations and Cat's model/application-specific warranty remain order-time checks. All records remain REFERENCE, not serial-confirmed fitment.


### Batch 004/010 — completed (10/10)
| Part number | Official Cat identity | Specifications / evidence | Compatible models |
|---|---|---|---|
| 0R-3025 | Cat Reman Camshaft Kit (3204) | Matched camshaft + Cat Reman valve lifters; high-grade steel, precision balance and heat treatment; no structured specs | 35 model identifiers |
| 0R-3026 | Cat Reman Camshaft Kit | Matched camshaft + Cat Reman valve lifters; no structured specs | 21 model identifiers |
| 0R-3270 | Cat Reman Valve Lifter (G353D/D353C) | Component: Lash Adjuster | 10 model identifiers |
| 0R-3271 | Cat Reman Valve Lifter (D379/D398/D399C) | Cat page reports no compatible-model list or structured specs | Not published |
| 0R-3361 | Cat Reman Oil Cooler Core | No structured specs; core deposit refundable subject to dealer acceptance criteria | 17 model identifiers |
| 0R-3422 | Cat Reman Fuel Injector Nozzle (3406 DI) | 8.7 in length; 1.5 in height; Fuel Fluid material | 43 model identifiers |
| 0R-3425 | Cat 3406 Reman Fuel Injector Nozzle | 8.7 in length; 1.5 in height; Fuel Fluid material | 7 model identifiers |
| 0R-3536 | Cat 3408 Reman Fuel Injector Nozzle | 8.7 in length; 1.5 in height; Fuel Fluid material | 24 model identifiers |
| 0R-3841 | Cat Reman 13.0:1 Compression Ratio Cylinder Pack | 43.54 lb; Cat also lists 13.0:1 compression ratio | 13 model/application identifiers |
| 0R-4285 | Cat 3406A Reman Cylinder Pack (460 HP) | No structured specs | 12 model identifiers |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/0R-3025
- https://parts.cat.com/en/catcorp/product/0R-3026
- https://parts.cat.com/en/catcorp/product/0R-3270
- https://parts.cat.com/en/catcorp/product/0R-3271
- https://parts.cat.com/en/catcorp/product/0R-3361
- https://parts.cat.com/en/catcorp/product/0R-3422
- https://parts.cat.com/en/catcorp/product/0R-3425
- https://parts.cat.com/en/catcorp/product/0R-3536
- https://parts.cat.com/en/catcorp/product/0R-3841
- https://parts.cat.com/en/catcorp/product/0R-4285

Database checkpoint: all 10 rows updated and retained as Cat Reman. Seven exact Cat product images were linked from official Scene7 assets (0R-3271, 0R-3361, 0R-3422, 0R-3425, 0R-3536, 0R-3841, 0R-4285); low-resolution 80px thumbnails were not used for the two camshaft kits. Core deposits/returns and model-specific warranty terms remain subject to dealer confirmation. All model data is public catalog reference, not serial-number verified fitment.


### Batch 005/010 — completed (10/10)
| Part number | Official Cat identity | Specifications / evidence | Compatible models |
|---|---|---|---|
| 0R-4449 | Cat Reman G3500 SI Cylinder Pack | 8.0:1 compression ratio; preassembled liner/piston/rings/pin/retainers/rod/seals; recommended application G3500 SI | G3508, G3512, G3516 |
| 0R-4657 | Cat Reman Valve Lifter | Tappet follows camshaft lobes to operate intake/exhaust valves; qualifying core return; no public specs | G379, G398, D399, D398 |
| 0R-4680 | Cat Reman Water Pump (B), 3406/3408/3412 | 13.1 in length × 8.0 in height; stainless shaft, durable impeller, hardened retainers, new bearings and improved seals | 42 model identifiers; engine subset 9 |
| 0R-4812 | Cat 3406B Reman Short Block (Wide Rod Journal Crank) | Block, crankshaft, pistons and rods; inspection/cleaning and resurfacing; no structured dimensions | 19 model identifiers; recommended application 3406B |
| 0R-5739 | Cat Reman A/C Refrigerant Compressor (24V) | Cat describes core disassembly, cleaning, inspection and original-spec testing; no structured specs | 79 model identifiers captured |
| 0R-6364 | Cat Reman Turbocharger | 20.5 in length × 18.0 in height; center housing seal test, dynamic balancing and new thrust/antifriction bearings | 9 model identifiers |
| 0R-6756 | Cat Reman A/C Refrigerant Compressor (24V) | Official page explicitly says no longer available; dealer replacement options only | 29 identifiers retained as historical reference; record deactivated |
| 0R-7164 | Cat Reman Turbocharger | 17.6 in length × 18.7 in height | 2 engine-family identifiers (3512, 3516) |
| 0R-7721 | Cat 3400/3500 Reman Auxiliary Water Pump | 16.0 in length × 11.0 in height; stainless shaft and hardened bearing retainer; qualifying core return | 13 engine-family identifiers |
| 0R-7722 | Cat Reman Sea Water Pump | Official name PUMP GP AUX; marine application | 3412D, 3412 |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/0R-4449
- https://parts.cat.com/en/catcorp/product/0R-4657
- https://parts.cat.com/en/catcorp/product/0R-4680
- https://parts.cat.com/en/catcorp/product/0R-4812
- https://parts.cat.com/en/catcorp/product/0R-5739
- https://parts.cat.com/en/catcorp/product/0R-6364
- https://parts.cat.com/en/catcorp/product/0R-6756
- https://parts.cat.com/en/catcorp/product/0R-7164
- https://parts.cat.com/en/catcorp/product/0R-7721
- https://parts.cat.com/en/catcorp/product/0R-7722

Database checkpoint: all 10 records updated and verified in `public.part_catalog`. Seven exact official Cat product images linked (0R-4680, 0R-4812, 0R-5739, 0R-6364, 0R-6756, 0R-7164, 0R-7721). No image was assigned to 0R-4449 because the image returned by the Cat page was visibly a connecting rod rather than a cylinder pack; 0R-4657 and 0R-7722 returned fallback images only. 0R-6756 set `is_active=false` because Cat says the part is no longer available. Core-return terms remain subject to dealer confirmation. All catalog fitment remains reference data, not serial-number-confirmed fitment.


### Batch 006/010 — completed (10/10)
| Part number | Official Cat identity | Specifications / evidence | Compatible models |
|---|---|---|---|
| 0R-7724 | Cat Reman Auxiliary Sea Water Pump (Basic) | 20.0 × 14.2 in; marine auxiliary cooling pump | 8 model identifiers across 3512/3516/3508 families and SR4 |
| 0R-7725 | Cat Reman Auxiliary Sea Water Pump | 23.5 × 16.5 in; marine auxiliary cooling pump | 6 model identifiers across 3512/3516/3508 families |
| 0R-7726 | Cat Reman Auxiliary Sea Water Pump (Basic) | Official Cat page marks DISCONTINUED | No fitment added; deactivated |
| 0R-7728 | Cat Reman Auxiliary Water Pump (3406/3406G Marine) | 14.0 × 8.2 in; recommended application 3406/3406G Marine | G3406 |
| 0R-7731 | Cat Reman Auxiliary Sea Water Pump | Official Cat page says no longer available; dealer replacement options only | No fitment added; deactivated |
| 0R-7732 | Cat Reman Auxiliary Sea Water Pump (3412E) | 18.0 × 12.5 in | 3412E, C32 |
| 0R-7847 | Cat Reman Crankshaft Damper | Viscous damper; torsional vibration absorption; internal-fluid sampling port; no structured dimensions | 11 model identifiers including 3600/C280 and 797 families |
| 0R-7853 | Cat Reman Crankshaft Damper (3600) | Torsional vibration absorption; internal-fluid sampling port; no structured dimensions | 10 model identifiers including 3612/3616/3618 and C280 families |
| 0R-7867 | Cat Reman Sea Water Pump (PUMP GP-AUX) | Marine auxiliary cooling pump; no structured dimensions | D353E, D343, D353C, D353D |
| 0R-7880 | Cat Reman Sea Water Pump (PUMP GP WTR) | 14.9 × 12.9 in | 3406B marine engine |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/0R-7724
- https://parts.cat.com/en/catcorp/product/0R-7725
- https://parts.cat.com/en/catcorp/product/0R-7726
- https://parts.cat.com/en/catcorp/product/0R-7728
- https://parts.cat.com/en/catcorp/product/0R-7731
- https://parts.cat.com/en/catcorp/product/0R-7732
- https://parts.cat.com/en/catcorp/product/0R-7847
- https://parts.cat.com/en/catcorp/product/0R-7853
- https://parts.cat.com/en/catcorp/product/0R-7867
- https://parts.cat.com/en/catcorp/product/0R-7880

Database checkpoint: all 10 records updated and query-verified. Eight exact official Cat product images linked (0R-7724, 0R-7725, 0R-7728, 0R-7732, 0R-7847, 0R-7853, 0R-7867, 0R-7880). 0R-7726 and 0R-7731 are marked `is_active=false` because Cat explicitly lists them as discontinued/no longer available; they are not to be sold as active stock. Core-return and warranty terms remain subject to dealer confirmation. Model references are not serial-number-confirmed fitment.


### Batch 007/010 — completed (10/10)
| Part number | Official Cat identity | Specifications / evidence | Compatible models |
|---|---|---|---|
| 0R-7892 | Cat Reman Auxiliary Water Pump (Sea Water) | 10.7 × 6.3 in; stainless shaft, hardened bearing retainer, cleaned/inspected core | 5 model identifiers: 3406 family, SR4, G3406 |
| 0R-7895 | Cat Reman Sea Water Pump (PUMP GP AUX) | Cat page marks DISCONTINUED | 3208 (historical listing); deactivated |
| 0R-7904 | Cat Reman Auxiliary Sea Water Pump (Tier 2, C32) | Italian official Cat page marks RETIRED; recommended C32 | C32, 3412E, C30; deactivated |
| 0R-8200 | Cat 3408/3412 Reman Cylinder Pack | 15.5:1 compression ratio; 35.0 lb; preassembled liner/piston/rings/pin/rod/seals | 25 model identifiers; recommended 3408/3412 family |
| 0R-8210 | Cat 3408/3412 Reman Engine Oil Pump | 13.8 × 6.22 in; new springs, seals, gaskets and steel gears | 66 model identifiers; 6 engine identifiers |
| 0R-8385 | Cat 3406E Reman Short Block (Tier 2) | Recommended 3406E; block/crankshaft/pistons/rods; no structured specs | 8 model identifiers |
| 0R-8502 | Cat 3508B Reman UTN Crankshaft | New UTN crankshaft; may be ground undersize for second life; qualifying core return | 14 model identifiers; engine family 3508 |
| 0R-8787 | Cat 3406B Reman Fuel Injector Nozzle (DI) | 8.7 × 1.5 in | 8 model identifiers; 3412/3408B/C family |
| 0R-9043 | Cat Reman Wheel Arrangement | Material: acrylic adhesive; heavy-duty reman wheel arrangement | 789, 789B, 789C, 789D |
| 0R-9200 | Cat 3500 Reman Connecting Rod | Core magnetic-particle inspection, new bushings, load testing and finish processing to Cat specs | 57 model identifiers; 17 engine-family identifiers |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/0R-7892
- https://parts.cat.com/en/catcorp/product/0R-7895
- https://parts.cat.com/it/catcorp/product/0R-7904
- https://parts.cat.com/en/catcorp/product/0R-8200
- https://parts.cat.com/en/catcorp/product/0R-8210
- https://parts.cat.com/en/catcorp/product/0R-8385
- https://parts.cat.com/en/catcorp/product/0R-8502
- https://parts.cat.com/en/catcorp/product/0R-8787
- https://parts.cat.com/en/catcorp/product/0R-9043
- https://parts.cat.com/en/catcorp/product/0R-9200
- https://parts.cat.com/en/catcorp/category/water-pumps-components-sea-water-pumps

Database checkpoint: all 10 rows checked; 8 were enriched with verified public Cat details and 2 discontinued records (0R-7895, 0R-7904) deactivated. Six exact official product images linked (0R-7892, 0R-8210, 0R-8385, 0R-8787, 0R-9043, 0R-9200 = 6 image links); 0R-8200 image thumbnail was too small/ambiguous and 0R-8502 returned fallback only, so neither was assigned an image. 0R-7904 English page was inaccessible, but Cat's official Italian page confirmed retired status, recommended C32 and compatibility list. All Cat Reman core and warranty terms remain dealer-confirmation items. Model data remains catalog reference, not serial-number-confirmed fitment.


### Batch 008/010 — completed (10/10)
| Part number | Official Cat identity | Specifications / evidence | Compatible models |
|---|---|---|---|
| 0R-9448 | Cat 3406C Reman Engine Oil Pump (Steel Gear) | 14.3 × 7.2 in; new springs/seals/gaskets and steel gears | 50 identifiers captured |
| 0R-9449 | Cat 3406E Reman Engine Oil Pump (One Section) | 14.3 × 7.2 in; new springs/seals/gaskets and steel gears | 53 identifiers captured |
| 0R-9667 | Cat 3600 Reman Valve Lifter | Tappet follows camshaft lobes; no public specs | 8 identifiers (3600/C280/3612/3616 families) |
| 0R-9668 | Cat 3500 Reman Valve Lifter | Recommended application 3500; no public specs | 12 identifiers (3600/C280/G360x families) |
| 0R-9697 | Cat Reman Engine Oil Pump (Two-Section Gear) | No public specs; new springs/seals/gaskets and steel gears | 15 identifiers |
| 0R-9736 | Cat 3512B Reman UTN Crankshaft | Heat-treated, new UTN crankshaft; qualifying core return | 16 identifiers |
| 0R-9737 | Cat 3516 Reman UTN Crankshaft | New UTN crankshaft; may be ground undersize for second life | 24 identifiers |
| 0R-9739 | Cat 3512B Reman UTN Crankshaft (Long Stroke) | Cat page says no longer available | 12 historical identifiers; deactivated |
| 0R-9751 | Cat 3412 Reman UTN Crankshaft (Wide Gear) | 56.0 × 15.5 in; new UTN crankshaft; qualifying core return | 26 identifiers |
| 0R-9942 | Cat C15 Reman Cylinder Pack (Low HP, 18:1) | Preassembled liner/piston/rings/pin/rod/seals; no structured specs | C-15 |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/0R-9448
- https://parts.cat.com/en/catcorp/product/0R-9449
- https://parts.cat.com/en/catcorp/product/0R-9667
- https://parts.cat.com/en/catcorp/product/0R-9668
- https://parts.cat.com/en/catcorp/product/0R-9697
- https://parts.cat.com/en/catcorp/product/0R-9736
- https://parts.cat.com/en/catcorp/product/0R-9737
- https://parts.cat.com/en/catcorp/product/0R-9739
- https://parts.cat.com/en/catcorp/product/0R-9751
- https://parts.cat.com/en/catcorp/product/0R-9942

Database checkpoint: all 10 rows updated and query-verified. Six exact official Cat product images linked (0R-9448, 0R-9449, 0R-9697, 0R-9736, 0R-9751, 0R-9942). Images for 0R-9667/9668 and 0R-9737 were only 80px thumbnails and were not assigned. 0R-9739 was explicitly unavailable and deactivated (is_active=false); historical compatibility retained. Customer-specific prices remain behind Cat login and were not inferred. UTN core return and Cat Reman warranty limitations remain dealer-confirmation items.


### Batch 009/010 — completed (10/10)
| Part number | Official Cat identity | Specifications / evidence | Compatible models |
|---|---|---|---|
| 0R-9943 | Cat 3406 Reman Fuel Injector Nozzle (DI) | 8.7 × 1.5 in; fuel spray pattern supports combustion/emissions/fuel economy | 19 identifiers |
| 0R-9952 | Cat Reman Valve Rocker Arm | 6.1 × 2.6 in; cores cleaned and inspected, particularly socket/contact wear | 91 identifiers |
| 0R-9983 | Cat Reman Flywheel (3114/3116/C7) | Balanced to original specs; ring gear inspected/replaced as needed; bolt holes inspected/restored | 6 engine identifiers |
| 0R-9986 | Cat Reman Flywheel (C9/C10/C11/C12/C13) | Balanced to original specs; ring gear inspected/replaced as needed; bolt holes inspected/restored | 11 engine identifiers |
| 100-3878 | Cat 44mm OD Heavy-Duty Fuel Injector Compression Spring | 3.45 in length; 0.31 in cross-section/wire; 1.72 in OD; steel/carbon steel | 43 identifiers; 13 engine identifiers |
| 100-4095 | Cat Turbocharger Cartridge | 10.1 × 13.3 in; ductile spheroidal iron and adhesive material | 12 identifiers |
| 102-0290 | Cat Basic Turbocharger | 71.21 lb; 15.1 × 15.9 in; anti-seize compound and ductile iron | 12 identifiers |
| 102-0294 | Cat Turbocharger Group | 17.2 × 15.7 in; ductile iron and anti-seize compound | 8 identifiers |
| 102-0296 | Cat Basic Turbocharger | 17.2 × 15.7 in; ductile iron and anti-seize compound | 6 identifiers |
| 102-0297 | Cat Basic Engine Turbocharger | 15.9 × 14.3 in; ductile iron and anti-seize compound | 7 identifiers |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/0R-9943
- https://parts.cat.com/en/catcorp/product/0R-9952
- https://parts.cat.com/en/catcorp/product/0R-9983
- https://parts.cat.com/en/catcorp/product/0R-9986
- https://parts.cat.com/en/catcorp/product/100-3878
- https://parts.cat.com/en/catcorp/product/100-4095
- https://parts.cat.com/en/catcorp/product/102-0290
- https://parts.cat.com/en/catcorp/product/102-0294
- https://parts.cat.com/en/catcorp/product/102-0296
- https://parts.cat.com/en/catcorp/product/102-0297

Database checkpoint: all 10 records updated and query-verified. Six exact official Cat images linked (0R-9943, 100-4095, 102-0290, 102-0294, 102-0296, 102-0297). Images for 0R-9952, 0R-9983, 0R-9986 and 100-3878 were only 80px thumbnails and were not assigned. Cat Reman parts remain separately identified from standard Cat products; core and warranty conditions require dealer confirmation.


### Batch 010/010 — completed (10/10)
| Part number | Official Cat identity | Specifications / evidence | Compatible models |
|---|---|---|---|
| 102-0299 | Cat Turbocharger Group | 15.1 × 15.9 in | 3512, 3516 |
| 102-8802 | Cat 2-Pin Receptacle Connector Kit | Nylon receptacle + lock wedge; components 3E-3364 and 3E-3365; no structured specs | 35 identifiers captured |
| 106-0933 | Cat Universal Joint Assembly (10C) | Steel; Lube-for-Life; pilot dia 8.375 in and swing dia 8.879 in after installation; dust shields, spider, seals and bearings | 48 identifiers captured |
| 107-0266 | Cat Standard-Efficiency Cab Air Duct Filter | 2.185 in height with seal; 1.791 in without; 10.748 in width; 11.811 in length; urethane panel, standard media | 104 identifiers captured |
| 107-7330 | Cat 144.45mm OD Connecting Rod Bearing | 6.4 × 3.6 in; steel-backed aluminum bearing | 49 identifiers; 15 engine-family identifiers |
| 108-6630 | Cat Fuel Injection Pump | 6.1 × 2.6 in; computer-tested at 20 quality points; 12-month Cat warranty | 3406B, 3406C, 3412 |
| 109-5738 | Cat Polycarbonate Interface Film | Polycarbonate plastic; no usable image or detailed description | 52 identifiers; 40 engine-family identifiers |
| 10R-0482 | Cat Reman Water Pump (3406 family) | 13.1 × 8.0 in; stainless shaft, durable impeller, hardened bearing retainers, new bearings and improved seals | 41 identifiers |
| 10R-0484 | Cat Reman Water Pump with Mounting Gasket Kit (C15/C16) | 13.1 × 8.0 in; adhesive material; recommended C15/C16 | 78 identifiers |
| 10R-0707 | Cat Reman Crankshaft Damper | Viscous damper absorbs torsional vibration; sampling port for fluid analysis; no structured specs | 45 identifiers |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/102-0299
- https://parts.cat.com/en/catcorp/product/102-8802
- https://parts.cat.com/en/catcorp/product/106-0933
- https://parts.cat.com/en/catcorp/product/107-0266
- https://parts.cat.com/en/catcorp/product/107-7330
- https://parts.cat.com/en/catcorp/product/108-6630
- https://parts.cat.com/en/catcorp/product/109-5738
- https://parts.cat.com/en/catcorp/product/10R-0482
- https://parts.cat.com/en/catcorp/product/10R-0484
- https://parts.cat.com/ar/catcorp/product/10R-0707
- https://parts.cat.com/de/catcorp/product/10R-0707
- https://parts.cat.com/en/catcorp/category/reman-products-crankshaft-dampers

Database checkpoint: all 10 rows updated and query-verified. Four exact official Cat images linked (102-0299, 108-6630, 10R-0482, 10R-0484). 102-8802, 106-0933, 107-0266 and 107-7330 only exposed 80px thumbnails and were not assigned; 109-5738 and 10R-0707 exposed fallback images only and were not assigned. Cat Reman water pumps and crankshaft damper remain separately identified; qualifying core returns and application-specific warranty terms require dealer confirmation.


## Updated extraction checkpoint — 50 batches / 500 parts

The manual Cat Parts enrichment run is extended from 10 batches to 50 batches, with 10 SKUs per batch (500 SKUs total). The first 10 batches (SKUs 1–100) are complete. Continue at batch 11 (SKUs 101–110). Record progress and verify database writes at each 10-batch milestone: 200, 300, 400, and 500 SKUs. Stop after batch 50 / SKU 500 and wait for the user's next instruction. Preserve source-backed descriptions, compatibility, structured specifications, and exact official product images only; do not assign tiny thumbnails or fallback images, and do not infer fitment or availability.


## Batch 11/50 — SKUs 101–110 (10R-0711 through 10R-1273)

Official Cat Parts Store pages were manually reviewed for all ten SKUs and the Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Availability / image treatment |
|---|---|---|
| 10R-0711 | Cat Reman Crankshaft Damper; torsional-vibration damping, viscous-fluid sampling port, reman core inspection and Cat warranty details; 48 compatible model identifiers, including industrial engine 3306B | Active; existing exact official image retained |
| 10R-0715 | Cat Reman Crankshaft Damper; official page says no longer available | Discontinued; deactivated; no image |
| 10R-0716 | Cat Reman Crankshaft Damper; 3208, 613C, 231D/225D and CS-553/CS-551/CP-553/CB-614 compatible-model entries | Active; Cat-logo fallback only, no image assigned |
| 10R-0717 | Cat Reman Crankshaft Damper; official page says no longer available | Discontinued; deactivated; no image |
| 10R-0718 | Cat Reman Crankshaft Damper; Challenger 75/75C and Truck Engine 3176/3176B; reman process and warranty captured | Active; Cat-logo fallback only, no image assigned |
| 10R-0739 | Cat Reman Radiator (Bolted Core); 3412/3412C/3412E/3408E and G3412 family references; core-return and warranty notes | Active; fallback only, no image assigned |
| 10R-0745 | Cat Reman Radiator (Bolted Core); compatible engine families include 3406, 3408, 3412 and 3512; core-return and warranty notes | Active; fallback only, no image assigned |
| 10R-0747 | Cat Reman Radiator (Bolted Core); material attribute and compatible models captured | Discontinued; deactivated; existing official product image retained |
| 10R-0956 | Cat Reman Electronic Fuel Injector with coated plunger; C-15/3406E; 14.8 in length × 3.0 in height | Active; exact official Scene7 image linked |
| 10R-1273 | Cat Reman Fuel Injector (EI550/EUI/C15); C15; 14.8 in length × 3.0 in height | Active; exact official Scene7 image linked |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/10R-0711
- https://parts.cat.com/en/catcorp/product/10R-0715
- https://parts.cat.com/en/catcorp/product/10R-0716
- https://parts.cat.com/en/catcorp/product/10R-0717
- https://parts.cat.com/en/catcorp/product/10R-0718
- https://parts.cat.com/en/catcorp/product/10R-0739
- https://parts.cat.com/en/catcorp/product/10R-0745
- https://parts.cat.com/en/catcorp/product/10R-0747
- https://parts.cat.com/en/catcorp/product/10R-0956
- https://parts.cat.com/en/catcorp/product/10R-1273

Database checkpoint: all 10 records updated and verified. Three parts explicitly marked discontinued by Cat (10R-0715, 10R-0717, 10R-0747) were deactivated. Two exact product images were newly linked (10R-0956, 10R-1273); existing verified images for 10R-0711 and 10R-0747 were retained. No Cat-logo or fallback image was assigned. Overall manual progress: 11/50 batches, 110/500 SKUs.


## Batch 12/50 — SKUs 111–120 (10R-1417 through 10R-3479)

Official Cat Parts Store pages were reviewed for nine SKUs; 10R-1503's direct page returned 403, so its official indexed Cat product content was used and explicitly recorded as such. All ten database rows were updated or enriched and query-verified.

| SKU | Official identity / captured detail | Image / source handling |
|---|---|---|
| 10R-1417 | Cat Reman Fan Drive Group for 3408/3412; belt-driven fan mounting, cooling-system function, reman core inspection and 12-month limited warranty | Page only exposed fallback image; omitted |
| 10R-1503 | Cat Reman Cylinder Pack for C15, 16.6:1 compression; preassembled liner, piston, rings, pin, retainers, connecting rod and seals | Official indexed product content used because direct page returned 403; no image assigned |
| 10R-1669 | Cat Reman Engine Water Pump; 15.1 × 15.9 in; oil-fluid/plastic material attributes; stainless shaft, impeller, replaced bearings, seals; broad 3500-family compatibility | Exact official Scene7 image linked |
| 10R-1670 | Cat Reman Water Pump (3500); 15.1 × 15.9 in; plastic/oil-fluid material attributes; stainless shaft, impeller, replaced bearings, seals | Exact official Scene7 image linked |
| 10R-2356 | Cat Reman Flywheel; balanced to original specifications; ring gear and bolt-hole inspection; compatible Challenger MTC/MT and 3406E/3406C/3406B/C15/C16/C18 families | Exact official Scene7 image linked |
| 10R-2788 | Cat C11 Reman Connecting Rod; heat-treated; core magnetic-particle inspection; new bushings, load testing and finish processing | Fallback image only; omitted |
| 10R-3138 | Cat Reman UTN Valve Lifter (3500A); tappet follows camshaft lobes; compatible 3500-family generators, power modules, marine, petroleum and industrial applications | Existing exact official image retained |
| 10R-3139 | Cat Reman UTN Valve Lifter (3500B); tappet follows camshaft lobes; broad 3500B-family, marine, petroleum, mining, truck and industrial applications | Existing exact official image retained |
| 10R-3261 | Cat Reman EI550 C15 EUI fuel injector; 14.8 in length × 3.0 in height; wear-life and fuel-economy engineering | Exact official Scene7 image linked |
| 10R-3479 | Cat Reman G3300 inlet valve rocker arm; 8.0 in length × 0.9 in height; compatible 3304/3306 and gas-engine families | Exact official Scene7 image linked |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/10R-1417
- https://parts.cat.com/en/catcorp/product/10R-1503 (indexed official content; direct request returned 403)
- https://parts.cat.com/en/catcorp/product/10R-1669
- https://parts.cat.com/en/catcorp/product/10R-1670
- https://parts.cat.com/en/catcorp/product/10R-2356
- https://parts.cat.com/en/catcorp/product/10R-2788
- https://parts.cat.com/en/catcorp/product/10R-3138
- https://parts.cat.com/en/catcorp/product/10R-3139
- https://parts.cat.com/en/catcorp/product/10R-3261
- https://parts.cat.com/en/catcorp/product/10R-3479

Database checkpoint: all 10 records updated and query-verified; five exact official images newly linked (10R-1669, 10R-1670, 10R-2356, 10R-3261, 10R-3479), and exact existing images for 10R-3138/10R-3139 retained. No discontinued status was stated on the reviewed pages. Overall manual progress: 12/50 batches, 120/500 SKUs.


## Batch 13/50 — SKUs 121–130 (10R-3480 through 10R-5647)

All ten official Cat product records were reviewed and updated in Supabase. One item is explicitly discontinued by Cat and was deactivated.

| SKU | Official identity / captured detail | Availability / image treatment |
|---|---|---|
| 10R-3480 | Cat Reman G3300 exhaust rocker arm; 5.1 × 1.3 in; compatible G3300/3304/3306 and related gas-engine families | Exact official Scene7 image newly linked |
| 10R-3578 | Cat Reman variable valve actuator, inlet, C15; controls engine braking through cylinder pressure and air/fuel ratio | Existing exact official image retained |
| 10R-3833 | Cat Reman 3508B crankshaft damper; 23.3 in outer diameter; viscous torsional-vibration damping and fluid sampling port | Existing exact official image retained |
| 10R-4343 | Cat Reman 3500B cylinder pack; 14.0:1 compression; preassembled liner/piston/rings/pin/retainers/rod/seals; broad 3500B compatibility | Existing exact official image retained |
| 10R-4374 | Cat Reman 11 mm fuel injection pump; official compatible models 3406B and 3406C truck engines | Exact official Scene7 image newly linked |
| 10R-4471 | Cat 3516 Reman cylinder pack; 8.0:1 compression; compatible Generator SR4B and G3508/G3512/G3516 generator-set/gas-engine families | Existing exact official image retained |
| 10R-5407 | Cat Reman water pump with mounting gasket kit for C7/C9; 8.8 × 9.5 in; stainless shaft, durable impeller, replacement bearings and improved seals | Exact official Scene7 image newly linked |
| 10R-5466 | Cat Reman fixed-displacement axial piston hydraulic motor; 27.5 × 20.0 in; compatible 793/797/795/794/796/798 off-highway trucks and 994K | Existing exact official image retained |
| 10R-5488 | Cat Reman ECM (Remote Annunciator); monitors and communicates machine-system data; returned core physically/electrically inspected and tested | Fallback image only; omitted |
| 10R-5647 | Cat Reman A4E4V2 ECM; Cat page states part is no longer available | Discontinued; deactivated; existing exact official image retained for historical identification |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/10R-3480
- https://parts.cat.com/en/catcorp/product/10R-3578
- https://parts.cat.com/en/catcorp/product/10R-3833
- https://parts.cat.com/en/catcorp/product/10R-4343
- https://parts.cat.com/en/catcorp/product/10R-4374
- https://parts.cat.com/en/catcorp/product/10R-4471
- https://parts.cat.com/en/catcorp/product/10R-5407
- https://parts.cat.com/en/catcorp/product/10R-5466
- https://parts.cat.com/en/catcorp/product/10R-5488
- https://parts.cat.com/en/catcorp/product/10R-5647

Database checkpoint: all 10 records updated and query-verified. Three exact official images newly linked (10R-3480, 10R-4374, 10R-5407); existing exact images retained for 10R-3578, 10R-3833, 10R-4343, 10R-4471, 10R-5466 and discontinued 10R-5647. 10R-5647 explicitly marked Discontinued and deactivated. Overall manual progress: 13/50 batches, 130/500 SKUs.


## Batch 14/50 — SKUs 131–140 (10R-6211 through 10R-7172)

All ten official Cat product pages were reviewed, their product/fitment/specification data was updated in Supabase, and all ten rows were query-verified.

| SKU | Official identity / captured detail | Image treatment |
|---|---|---|
| 10R-6211 | Cat C9 Reman Connecting Rod (9.3L); core magnetic-particle inspection, new bushings and load testing; C9, TH31-E61, TH31-C9T, 966M XE | Exact official Scene7 image newly linked |
| 10R-6213 | Cat Reman C9 Cylinder Pack; 17.5:1 compression, 9.3L; compatible C9/C-9 | Exact official Scene7 image newly linked |
| 10R-6334 | Cat C11/C13 Reman Variable Valve Actuator; engine-braking control; TH35-E81 and TH35-C13T included in Cat compatibility list | Existing exact official image retained |
| 10R-6335 | Cat Reman C11/C13 Variable Valve Actuator (Cat Brake) | Existing exact official image retained |
| 10R-6336 | Cat C11/C13 Reman Variable Valve Actuator (Brake); engine-braking control | Existing exact official image retained |
| 10R-6341 | Cat Reman Electronic Actuator (Governor Control); engine-speed/fuel-air regulation; compatible G3516B/G3520B/SR4B/C280-6/PMG3516/G3606B/G3608/G3612/G3616 | Existing exact official image retained |
| 10R-6400 | Cat Reman C27 Water Pump; 13.1 × 8.0 in; compatible C27/C32, SR5, D10/D11, 854K, 993K/992K, 777 and related applications | Exact official Scene7 image newly linked |
| 10R-6691 | Cat C11/C13 Reman Variable Valve Actuator (12V); official compatible list C13, TH35-E81, TH35-C13T | Existing exact official image retained |
| 10R-7021 | Cat 3408 Reman Long Block (DI) complete assembly; core return/destruction requirement recorded for U.S. and U.S. territories; D9R, 637E, 631E, 771C, 769C, PR-450, 988F | Exact official Scene7 image newly linked |
| 10R-7172 | Cat Reman C15 Cylinder Pack; 16.0:1 compression; preassembled liner/piston/rings/pin/retainers/rod/seals; generator and industrial C15/C18 family compatibility | Existing exact official image retained |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/10R-6211
- https://parts.cat.com/en/catcorp/product/10R-6213
- https://parts.cat.com/en/catcorp/product/10R-6334
- https://parts.cat.com/en/catcorp/product/10R-6335
- https://parts.cat.com/en/catcorp/product/10R-6336
- https://parts.cat.com/en/catcorp/product/10R-6341
- https://parts.cat.com/en/catcorp/product/10R-6400
- https://parts.cat.com/en/catcorp/product/10R-6691
- https://parts.cat.com/en/catcorp/product/10R-7021
- https://parts.cat.com/en/catcorp/product/10R-7172

Database checkpoint: all 10 records updated and verified. Four exact official images newly linked (10R-6211, 10R-6213, 10R-6400, 10R-7021); existing exact official images retained for the other six. No discontinuation statement was found in this batch. Overall manual progress: 14/50 batches, 140/500 SKUs.


## Batch 15/50 — SKUs 141–150 (10R-7231 through 10R-8760)

All ten official Cat product pages were reviewed, all ten Supabase rows were updated and query-verified. Important correction: previous catalog notes incorrectly described 10R-8415 and 10R-8417 as discontinued. The current official Cat pages do not say that; both records remain active and their descriptions/status were corrected.

| SKU | Official identity / captured detail | Image / availability treatment |
|---|---|---|
| 10R-7231 | Cat Reman Fuel Injector; 14.8 × 3.0 in; coated plunger; C18/C32/C27 and related generator/marine applications | Existing exact official image retained |
| 10R-7302 | Cat Reman VVA Repair Kit for C11/C13/C15/C18; contents: 220-0684 ×8, 221-9939 ×8, 326-1100 ×2 | Existing exact official image retained |
| 10R-8157 | Cat Reman C9 Cylinder Pack; 17.0:1 compression, 8.8L; C9/C-9, 627G, 330D L/LN, 160M | Exact official Scene7 image newly linked |
| 10R-8415 | Cat 3512 Reman Upgrade-to-New Cylinder Block; broad 3512-family and related equipment applications; U.S. engine-core return/destruction requirement recorded | Active; exact official Scene7 image newly linked; not discontinued |
| 10R-8417 | Cat 3516 Reman Upgrade-to-New Bare Block; 96.0 × 33.5 in; 3516 generator, marine, mining, industrial and truck applications; U.S. engine-core return/destruction requirement recorded | Active; image only exposed as 80px thumbnail, omitted; not discontinued |
| 10R-8499 | Cat Reman Fuel Injector Kit (set of 6) for 3406E Reman Engine; includes 10R-8502 ×6 | Kit image only tiny; omitted |
| 10R-8500 | Cat Reman Fuel Injector Kit (set of 6) for 3406; includes 10R-8501 ×6 | No separate high-resolution kit image verified; omitted |
| 10R-8501 | Cat Reman EI550/EUI Fuel Injector for 3406E; 14.8 × 3.0 in | Exact official Scene7 image newly linked |
| 10R-8618 | Cat Reman Cylinder Head; 16.55 × 10.1 in; core cleaning/inspection, combustion-deck resurfacing and original-specification testing | Existing exact official image retained |
| 10R-8760 | Cat C18 Reman Cylinder Pack (High HP); 18.0:1 compression; preassembled liner/piston/rings/pin/retainers/rod/seals | Existing exact official image retained |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/10R-7231
- https://parts.cat.com/en/catcorp/product/10R-7302
- https://parts.cat.com/en/catcorp/product/10R-8157
- https://parts.cat.com/en/catcorp/product/10R-8415
- https://parts.cat.com/en/catcorp/product/10R-8417
- https://parts.cat.com/en/catcorp/product/10R-8499
- https://parts.cat.com/en/catcorp/product/10R-8500
- https://parts.cat.com/en/catcorp/product/10R-8501
- https://parts.cat.com/en/catcorp/product/10R-8618
- https://parts.cat.com/en/catcorp/product/10R-8760

Database checkpoint: all 10 records updated and verified. Three exact official images newly linked (10R-8157, 10R-8415, 10R-8501); existing exact images retained for 10R-7231, 10R-7302, 10R-8618 and 10R-8760. No discontinued status was confirmed in this batch. Overall manual progress: 15/50 batches, 150/500 SKUs.


## Batch 16/50 — SKUs 151–160 (10R-8762 through 110-6331)

All ten official Cat product pages were reviewed; all ten Supabase records were enriched and query-verified.

| SKU | Official identity / captured detail | Image treatment |
|---|---|---|
| 10R-8762 | Cat Reman 3500C Cylinder Pack; 14.7:1 compression; recommended 3500C; 3500C family compatible models | Official image only exposed as 80px thumbnail; omitted |
| 10R-8763 | Cat Reman C18 Cylinder Pack; 16.3:1; C18, 657E/G, 772, PM-200/201, 836H, 385C, 6015/6015 FS | Existing exact official image retained |
| 10R-9025 | Cat C18 Reman Cylinder Pack; 16.5:1; 6.8 × 18.6 in; POWER SYS/C18 generator, truck and marine applications | Existing exact official image retained |
| 10R-9224 | Cat Reman 3500 Cylinder Pack; 15.3:1; compatible 3512B/3516B generator, marine, truck, locomotive and 994F/994H loader applications | Official image only exposed as 80px thumbnail; omitted |
| 10R-9343 | Cat Reman Gold C15 overhaul kit; 16.6:1; includes 0R-8915 ×6 and 603-6644 ×1; assembled core-return refund conditions captured | Existing exact official image retained |
| 10R-9345 | Cat Reman Gold C15 overhaul kit; 16.6:1; includes 10R-1503 ×6 and 603-6644 ×1; C-15 compatibility and assembled core-return refund conditions captured | Existing exact official image retained |
| 10R-9787 | Cat 3406E Reman EI550/EUI fuel injector; 14.75 × 3.0 in; compatible 3456, C-18 and 3406E applications | Exact official Scene7 image newly linked |
| 10R-9923 | Cat Reman Gold C15 overhaul kit; includes 10R-3304 ×6 and 606-0909 ×1; C15 compatibility | Existing exact official image retained |
| 110-6326 | Cat Standard-Efficiency Primary Engine Air Cleaner Element; normal-duty primary filtration; extensive multi-terrain loader, compact-track loader, skid steer, backhoe, telehandler, compactor and engine fitment list | Existing exact official image retained |
| 110-6331 | Cat Standard-Efficiency Secondary Engine Air Filter; last-line protection during primary-filter changes/breaches; same broad compact equipment and engine family coverage | Existing exact official image retained |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/10R-8762
- https://parts.cat.com/en/catcorp/product/10R-8763
- https://parts.cat.com/en/catcorp/product/10R-9025
- https://parts.cat.com/en/catcorp/product/10R-9224
- https://parts.cat.com/en/catcorp/product/10R-9343
- https://parts.cat.com/en/catcorp/product/10R-9345
- https://parts.cat.com/en/catcorp/product/10R-9787
- https://parts.cat.com/en/catcorp/product/10R-9923
- https://parts.cat.com/en/catcorp/product/110-6326
- https://parts.cat.com/en/catcorp/product/110-6331

Database checkpoint: all 10 rows updated and verified. One exact official image newly linked (10R-9787); existing exact images retained for 10R-8763, 10R-9025, 10R-9343, 10R-9345, 10R-9923, 110-6326 and 110-6331. Two low-resolution thumbnails (10R-8762, 10R-9224) were intentionally omitted. Overall manual progress: 16/50 batches, 160/500 SKUs.


## Batch 17/50 — SKUs 161–170 (110-8463 through 11R-0025)

All ten Cat records were reviewed using official pages; all ten Supabase rows were updated and query-verified. Two stator pages (11R-0024/11R-0025) were inaccessible in English but official localized Cat pages/category search confirmed product identities and NWC descriptions.

| SKU | Official identity / captured detail | Image treatment |
|---|---|---|
| 110-8463 | Cat Turbocharger Group; 15.6 × 17.0 in; ductile spheroidal iron; 3406B/3406C, SR4, C-15 applications | Cat explicitly says displayed image is representative, not necessarily exact; omitted |
| 110-8897 | Cat Fuel Injection Pump; 23.58 × 9.28 in; 20-point computer test and 12-month warranty; RR-250B, SS-250B, 3406B/C, SR4 and RM-250C fitment | Gallery assets resolved to mismatched cylinder-head imagery; omitted |
| 111-7785 | Cat Radiator Mounting Cap; 22 mm length × 71 mm OD; 3508/3512/3516 generator, marine, petroleum, industrial and power-module applications | Exact official Scene7 image newly linked |
| 115-2422 | Cat 12V heavy-duty maintenance-free wet battery; 31 BCI; 1000 CCA | Existing exact official image retained; no fitment list published |
| 115-5674 | Cat Unit Injector Rubber Boot; heat-resistant rubber seal protecting injector/cylinder-head interface, electrical connections and fuel delivery; broad generator/marine/petroleum/industrial/truck compatibility | Exact official Scene7 image newly linked |
| 115-5699 | Cat Fuel Injection Pump; 23.7 × 10.4 in; Truck Engine 3406C | Exact official Scene7 pump image newly linked |
| 118-2989 | Cat Turbocharger Group; 15.1 × 15.9 in; Cat turbocharger design/testing and 12-month warranty; earlier 3500-family model associations retained with fitment caveat | Cat page showed fallback image only; omitted |
| 11R-0023 | Cat Reman NWC Stator for 988K XE motor, with shipping stand; acceptable core exchange; R2900 XE and 988K XE | Only small thumbnail; omitted |
| 11R-0024 | Cat Reman NWC Stator for 988K XE generator, with shipping stand; acceptable core exchange | Localized Cat product/category sources; no verified high-resolution image |
| 11R-0025 | Cat Reman NWC Stator for D6R XE motor, with shipping stand; Cat publishes no compatible-model list | Localized Cat sources; no verified high-resolution image |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/110-8463
- https://parts.cat.com/en/catcorp/product/110-8897
- https://parts.cat.com/en/catcorp/product/111-7785
- https://parts.cat.com/en/catcorp/product/115-2422
- https://parts.cat.com/en/catcorp/product/115-5674
- https://parts.cat.com/en/catcorp/product/115-5699
- https://parts.cat.com/en/catcorp/product/118-2989
- https://parts.cat.com/en/catcorp/product/11R-0023
- https://parts.cat.com/en/catcorp/category/reman-products-generator-ends (11R-0024/11R-0025)
- https://parts.cat.com/de/catcorp/product/11R-0024
- https://parts.cat.com/de/catcorp/product/11R-0025

Database checkpoint: all 10 rows updated and verified. Three exact official images newly linked (111-7785, 115-5674, 115-5699); existing exact image for 115-2422 retained. Representative, mismatched, fallback and low-resolution images were not assigned. Overall manual progress: 17/50 batches, 170/500 SKUs.


## Batch 18/50 — SKUs 171–180 (11R-1405 through 11R-2442)

All ten official Cat pages were reviewed and all ten Supabase records were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 11R-1405 | Cat 3512 Tier 4 Reman NWC Bare Block; ready to build into engine; acceptable core exchange; U.S. replacement-engine core return/destruction requirement recorded | Exact official bare-block image newly linked; 3512 retained as engine designation only |
| 11R-1406 | Cat 3516 Tier 4 Reman NWC Bare Block; official compatible list 3516E engine and 994K wheel loader | Exact official bare-block image newly linked |
| 11R-2060 | Cat Reman NWC Prechamber; 3.701 in grip length and 5.118 in bolt length; no compatible-model list published | Exact official Scene7 image newly linked; no fitment inferred |
| 11R-2061 | Cat Reman NWC Prechamber (G3600); G3600 application identified by title; no compatible-model list published | Exact official Scene7 image newly linked |
| 11R-2113 | Cat Reman Stator (D6 GEN); Cat 12-month Reman warranty; no compatible-model list published | Page image was NWC promotional artwork, not the stator; omitted |
| 11R-2194 | Cat NWC Group 31 HD maintenance-free wet battery; 12V, 1000 CCA, USA only; compatible Generator Set C4.4 | Existing exact official battery image retained |
| 11R-2387 | Cat Reman NWC Valve Lifter (3500A); compatible Generator Set G3512 | Exact official Scene7 image newly linked |
| 11R-2388 | Cat Reman NWC Valve Lifter (3500B); Cat page does not publish compatible-model list | Exact official Scene7 image newly linked; no fitment inferred |
| 11R-2389 | Cat Reman NWC Valve Lifter (G3600); compatible Gas Engine G3608 | Exact official Scene7 image newly linked |
| 11R-2442 | Cat Reman NWC Valve Rocker Arm; valve-train opening/closing function; no compatible-model list published | Exact official Scene7 image newly linked; previous unsupported C27 fitment removed |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/11R-1405
- https://parts.cat.com/en/catcorp/product/11R-1406
- https://parts.cat.com/en/catcorp/product/11R-2060
- https://parts.cat.com/en/catcorp/product/11R-2061
- https://parts.cat.com/en/catcorp/product/11R-2113
- https://parts.cat.com/en/catcorp/product/11R-2194
- https://parts.cat.com/en/catcorp/product/11R-2387
- https://parts.cat.com/en/catcorp/product/11R-2388
- https://parts.cat.com/en/catcorp/product/11R-2389
- https://parts.cat.com/en/catcorp/product/11R-2442

Database checkpoint: all 10 records updated and query-verified. Eight exact official product images newly linked (11R-1405, 11R-1406, 11R-2060, 11R-2061, 11R-2387, 11R-2388, 11R-2389, 11R-2442); existing exact battery image retained for 11R-2194. 11R-2113 promotional artwork deliberately not assigned. Overall manual progress: 18/50 batches, 180/500 SKUs.


## Batch 19/50 — SKUs 181–190 (121-2630 through 128-8614)

All ten official Cat product pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 121-2630 | Cat Fuel Injector Group; 12.3 × 4.8 in; coated plunger; 3512/3516 generator, marine and industrial engine applications | Exact official Scene7 image newly linked |
| 122-2311 | Cat Adapter; compatible Gen Set Engine 3608/3606/3616, Marine Engine C280-16/C280-12/C280-6/C280-8 and Petroleum Engine C280-12; Cat publishes no function/specification | Fallback image omitted |
| 126-1768 | Cat 19 mm Long Connector Socket for lighting wiring harness; extensive Cat equipment list across integrated toolcarriers, utility vehicles, mini excavators, drills, harvesters and excavators | Existing exact official image retained; 91 model IDs stored as representative fitment subset |
| 126-8588 | Cat Undercarriage Rear Bogie; compatible D10N/D10R/D10T2/D10T | Existing exact official image retained |
| 127-2176 | Cat 1.6 mm Carrier-Thick Edge-Bonded Seal; 0.063 in thickness, HNBR primary seal, 2-bolt flange, -40 to 115 °C service range; extensive engine/equipment fitment | Exact official Scene7 image newly linked |
| 127-2441 | Cat Exhaust Kit; 111-5819 ×1, 111-5822 ×1, 136-7730 ×8, 166-4572 ×1, 2W-0439 ×1; 3600/C280 generator, marine, industrial and petroleum engines | Fallback image omitted |
| 127-2442 | Cat Exhaust Kit Parts; 133-5179 ×2, 133-8081 ×2, 619-3057 ×1; 3606 generator and C280 marine applications | Fallback image omitted |
| 128-4414 | Cat Undercarriage Front Bogie; alloy/structural steel; compatible D10N/D10R/D10T2/D10/D10T | Existing exact official image retained |
| 128-7256 | Cat Undercarriage Front Bogie; structural/alloy steel; compatible D11N/D11R/D11T/D11 XE/D11 | Existing exact official image retained |
| 128-8614 | Cat Water Collection Bowl Seal Kit; seals for element header, drain valve, bowl header and bowl bolt; very broad Cat machine compatibility | Existing exact official image retained; 156 model IDs stored from Cat's extensive list |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/121-2630
- https://parts.cat.com/en/catcorp/product/122-2311
- https://parts.cat.com/en/catcorp/product/126-1768
- https://parts.cat.com/en/catcorp/product/126-8588
- https://parts.cat.com/en/catcorp/product/127-2176
- https://parts.cat.com/en/catcorp/product/127-2441
- https://parts.cat.com/en/catcorp/product/127-2442
- https://parts.cat.com/en/catcorp/product/128-4414
- https://parts.cat.com/en/catcorp/product/128-7256
- https://parts.cat.com/en/catcorp/product/128-8614

Database checkpoint: all 10 records updated and verified. Two exact official images newly linked (121-2630, 127-2176); existing exact images retained for 126-1768, 126-8588, 128-4414, 128-7256 and 128-8614. No fallback kit/adapter images assigned. Overall manual progress: 19/50 batches, 190/500 SKUs.


## Batch 20/50 — SKUs 191–200 (130-5789 through 140-9545)

All ten official Cat product pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 130-5789 | Cat Fuel Injection Pump Group; 24.0 × 9.2 in; compatible 3406B/3406C, SM-350, RM-350 and PM-465 | Gallery resolved to a cylinder-head asset, not a verified pump; no image assigned |
| 131-5459 | Cat Control Assembly; no function/specification published; 3512/3508/3516/3412C generator, SR4, PP3516, marine auxiliary and G3612/G3616/G3406 gas-engine applications | Fallback image omitted |
| 134-2679 | Cat Undercarriage Front Bogie Assembly; D9T/D9/D9R/D9N/D9 GC, ripper 9, bulldozer 9SU/9U and winch 59N/58/58L/59L | Existing exact official image retained |
| 134-2680 | Cat Undercarriage Rear Bogie; alloy/structural steel; same D9-family, ripper, bulldozer and winch applications | Existing exact official image retained |
| 134-5402 | Cat Engine Turbocharger; A/R 0.81, turbine 111 mm, compressor 118 mm; 15.9 × 14.3 in; 3508/3512/3516 generator, marine and industrial applications | Existing exact official image retained |
| 135-9349 | Cat 1216.8 mm Cutting Edge; compatible Motor Grader 24H/24M/24 | Existing exact official image retained |
| 139-2016 | Cat Upper Track Roller Frame Guard around idler; compatible D11R/D11T/D11 XE/D11 | Existing exact official image retained |
| 139-2019 | Cat Rubber Idler Front Guard; rubber with steel plating and black topcoat; 11.84 × 15.75 × 1.57 in, 0.98 in thick; D11R/D11T/D11 XE/D11 | Existing exact official image retained |
| 140-4238 | Cat Radiator Coolant Recovery Tank Cap; seals coolant recovery tank and prevents coolant loss; compatible mini excavators and compact wheel loaders | Existing exact official image retained; earlier dimensions retained but not republished on current Cat page |
| 140-9545 | Cat Fuel Cooler Core; cools fuel before engine; C18 generator set, C18/3406E marine engines and C18 petroleum package | Exact official Scene7 image newly linked |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/130-5789
- https://parts.cat.com/en/catcorp/product/131-5459
- https://parts.cat.com/en/catcorp/product/134-2679
- https://parts.cat.com/en/catcorp/product/134-2680
- https://parts.cat.com/en/catcorp/product/134-5402
- https://parts.cat.com/en/catcorp/product/135-9349
- https://parts.cat.com/en/catcorp/product/139-2016
- https://parts.cat.com/en/catcorp/product/139-2019
- https://parts.cat.com/en/catcorp/product/140-4238
- https://parts.cat.com/en/catcorp/product/140-9545

Database checkpoint: all 10 records updated and verified. One exact official product image newly linked (140-9545); existing exact images retained for 134-2679, 134-2680, 134-5402, 135-9349, 139-2016, 139-2019 and 140-4238. No fallback or mismatched images assigned. Overall manual progress: 20/50 batches, 200/500 SKUs. This is the first 200-SKU milestone; next checkpoint is 300 SKUs.


## Batch 21/50 — SKUs 201–210 (141-7015 through 153-2994)

All ten official Cat pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 141-7015 | Cat Marine Engine Wiring Harness Assembly; marine engine 3508B/3516B/3512B/3516/3512 and marine auxiliary applications; no function/pinout published | Fallback image omitted |
| 142-8937 | Cat Lockable Non-Vent Hydraulic Tank Cap; black polyamide plastic, composite exterior, overall size 63.5 (unit not specified), non-vented; broad grader/compactor/tractor/loader/excavator/telehandler compatibility | Existing exact official image retained; 207 model identifiers stored |
| 144-0503 | Cat Piston & Ring Kit; Cat page publishes broad 3406/3306/3176/3500-series engine and machine compatibility but no kit contents/specifications | No verified image; omitted; 72 model identifiers stored |
| 147-5331 | Cat Track Roller Frame Rear Guard; compatible D10R/D10T2/D10/D10T | Existing exact official image retained |
| 147-5332 | Cat Track Guide Front Guard; upper track roller-frame guard around idler; compatible D10R/D10T2/D10/D10T | Existing exact official image retained |
| 149-1912 | Cat Standard-Efficiency Cabin Air Filter; urethane round, standard media; 11.772 in height with/without seal, 6.472 × 6.472 in width/length; normal-duty cab filtration | Existing exact official image retained |
| 150-3141 | Cat Mechanical Cover Group (C); Cat publishes no functional description/specification; broad C18/C15/3406E/3456 generator, marine, truck, industrial, petroleum and machine compatibility | Fallback image omitted |
| 150-8355 | Cat 14.5C Interlock Universal Joint; steel, Lube-for-Life, 322 mm swing diameter; compatible 793F/797 truck variants | Existing exact official image retained |
| 151-5565 | Cat Engine Block; carbon steel; compatible 3516/3516B/3508B/3512/3512C generator, marine and industrial engine families | Fallback image omitted |
| 153-2994 | Cat 7/8-inch STOR Hydraulic Hose Quick Disconnector; fluid quick-connect, plated steel/alloy zinc/alloy steel/carbon steel; broad Cat work-tool and machine fitment | Cat explicitly labels the image reference-only and says construction may differ; image removed; 357 model identifiers stored |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/141-7015
- https://parts.cat.com/en/catcorp/product/142-8937
- https://parts.cat.com/en/catcorp/product/144-0503
- https://parts.cat.com/en/catcorp/product/147-5331
- https://parts.cat.com/en/catcorp/product/147-5332
- https://parts.cat.com/en/catcorp/product/149-1912
- https://parts.cat.com/en/catcorp/product/150-3141
- https://parts.cat.com/en/catcorp/product/150-8355
- https://parts.cat.com/en/catcorp/product/151-5565
- https://parts.cat.com/en/catcorp/product/153-2994

Database checkpoint: all 10 records updated and verified. No new exact images were added; existing exact images retained for 142-8937, 147-5331, 147-5332, 149-1912 and 150-8355. The non-exact/reference-only 153-2994 image was removed. Overall manual progress: 21/50 batches, 210/500 SKUs.


## Batch 22/50 — SKUs 211–220 (153-5710 through 162-7864)

All ten official Cat product pages were reviewed; all ten Supabase records were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 153-5710 | Cat 12V 4D BCI maintenance-free wet battery; 1400 CCA, 200 Ah, 425-min reserve, 19.3 × 8.6 × 9.9 in, SAE posts, polypropylene casing, calcium-lead grid; broad Cat fitment | Existing exact official image retained; 295 model identifiers stored |
| 153-5720 | Cat 12V 8D BCI maintenance-free wet battery; 1500 CCA, 210 Ah, 465-min reserve, 20.5 × 10.8 × 8.7 in, 1800 CA; generator, C175, truck, shovel and other applications | Existing exact official image retained; 63 model identifiers stored |
| 155-2260 | Cat 3-pin sealed nylon plug connector kit; 155-2266 ×1, 155-2276 ×1, 169-8670 ×1; black connector/green wedge lock | Existing exact official image retained; 127 model identifiers stored |
| 155-2270 | Cat 2-pin sealed V-0 flame-resistant nylon plug connector kit; 155-2261 ×1, 155-2269 ×1; black connector/green wedge lock | Existing exact official image retained; 142 model identifiers stored |
| 155-9879 | Cat Duo-Cone metal-face seal; 137.57 mm assembled OD, 33 mm axial width; compatible D11N/D11R/D11T/D11 XE/D11 | Existing exact official image retained |
| 156-4208 | Cat right-side minor bogie, 0.3°; boron/microalloy steel; compatible D10R/D10T | Existing exact official image retained |
| 156-4209 | Cat left-side minor bogie, 0.3°; microalloy/boron steel; compatible D10R/D10T | Existing exact official image retained |
| 160-8765 | Cat Fitting Assembly; Cat does not publish function/specification; D11R, 3508/3516 generator, marine, locomotive, industrial, mining and 854G/992G applications | Fallback image omitted |
| 162-7863 | Cat Duo-Cone metal-face seal; 106.18 mm assembled OD, 35.6 mm axial width; D8/D9/D10 track tractors and PL83/PL87/583/587 pipelayers | Existing exact official image retained |
| 162-7864 | Cat Duo-Cone metal-face seal; 113.75 mm assembled OD, 35.6 mm axial width; D10/D11 track tractors | Existing exact official image retained |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/153-5710
- https://parts.cat.com/en/catcorp/product/153-5720
- https://parts.cat.com/en/catcorp/product/155-2260
- https://parts.cat.com/en/catcorp/product/155-2270
- https://parts.cat.com/en/catcorp/product/155-9879
- https://parts.cat.com/en/catcorp/product/156-4208
- https://parts.cat.com/en/catcorp/product/156-4209
- https://parts.cat.com/en/catcorp/product/160-8765
- https://parts.cat.com/en/catcorp/product/162-7863
- https://parts.cat.com/en/catcorp/product/162-7864

Database checkpoint: all 10 rows updated and verified. Existing exact official images retained for 153-5710, 153-5720, 155-2260, 155-2270, 155-9879, 156-4208, 156-4209, 162-7863 and 162-7864. No image assigned to 160-8765 because Cat page exposed only fallback. Overall manual progress: 22/50 batches, 220/500 SKUs.


## Batch 23/50 — SKUs 221–230 (163-9366 through 184-4396)

All ten catalog rows were updated and query-verified. Nine Cat product pages were reviewed in detail; 184-4395 page retries timed out, so its previously captured official catalog data was retained with a verification caveat.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 163-9366 | Cat 2.413 mm Outer Brake Separator Plate; 0.095 in thick, 144-tooth external spline, steel hardness/surface finish optimized for brake life | Existing exact official image retained; Cat publishes no compatible-model list |
| 165-6170 | Cat 24.13 mm OD Non-Threaded Engine Oil Level Gauge Plug; nitrile rubber; direct OEM replacement | Existing exact official image retained; Cat publishes no compatible-model list |
| 167-1751 | Cat Turbocharger Water Lines Tube; 0.75 in OD, steel; compatible Marine Engine 3516B/3516, Industrial Engine 3516B and Locomotive Engine 3516B | Exact official Scene7 tube image newly linked |
| 169-7372 | Cat 4 oz PET ribbed fluid-sampling bottle; 200-pack, 2.0 in diameter, 3.5 in high, 0.046 lb, polyethylene; 3126/C-10/C-12/3176, 637K, 825H, 824H, 826H | Existing exact official bottle image retained |
| 169-7373 | Cat 2.5 oz PET ribbed fluid-sampling bottle; 200-pack, 1.53 in diameter, 2.7 in high, PVC; Cat publishes no compatible models | Existing exact official bottle image retained |
| 169-8373 | Cat fluid-sampling bottle set; 300 × 4 oz bottles + 500 cap/probe sets; compatible 2.5 oz bottles; 75C/85E/95E, C-10/C-12/3126/3116/3176, 637K, 772G/777C, 825H, 312C, 824H/834H, 836H/826H, 988H | Single-bottle image removed because it misrepresented the bulk set |
| 170-4007 | Cat Fuel Transfer Pump; moves fuel from tank to engine; 3406C/3412/3512/3512B/3508B/3516/3516B/3508/3412C generator sets, PM3508/PM3516/PM3412/PM3512 and G3516 | Exact official Scene7 pump image newly linked |
| 177-9343 | Cat Fluid-Sampling Probe and Cap Set; bottles not included; two tapered cap holes and clear probe tube; compatible 4 oz/2.5 oz bottles; 3126/C-10/C-12/3176, 637K, 825H, 824H, 826H | Bottle-only image removed because it misrepresented the probe/cap set |
| 184-4395 | Cat Roller Guard Short Center; both sides position and both sides of frame; boron/low-alloy steel; previously captured D8/D9/PL83/PL87/583/587 associations retained | Existing exact official image retained; latest Cat page retry timed out |
| 184-4396 | Cat Steel Undercarriage Roller Guide; boron steel; guides/protects link assembly and rollers; D10N/D10R/D10T2/D10/D10T and pipelayer 589 | Existing exact official image retained |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/163-9366
- https://parts.cat.com/en/catcorp/product/165-6170
- https://parts.cat.com/en/catcorp/product/167-1751
- https://parts.cat.com/en/catcorp/product/169-7372
- https://parts.cat.com/en/catcorp/product/169-7373
- https://parts.cat.com/en/catcorp/product/169-8373
- https://parts.cat.com/en/catcorp/product/170-4007
- https://parts.cat.com/en/catcorp/product/177-9343
- https://parts.cat.com/en/catcorp/product/184-4395
- https://parts.cat.com/en/catcorp/product/184-4396

Database checkpoint: all 10 records updated and verified. Two exact official images newly linked (167-1751, 170-4007); existing exact images retained for 163-9366, 165-6170, 169-7372, 169-7373, 184-4395 and 184-4396. Two misleading images removed (169-8373, 177-9343). Overall manual progress: 23/50 batches, 230/500 SKUs.
