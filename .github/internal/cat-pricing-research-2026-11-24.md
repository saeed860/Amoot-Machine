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


## Batch 24/50 — SKUs 231–240 (184-6305 through 1M-9011)

All ten official Cat product pages were reviewed; all ten Supabase records were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 184-6305 | Cat Single-Flange D11 Track Roller; 11.299 in tread, 19.219 in mounting width, 25.276 in shaft, 16.063 in outside link spread, 5.697 in inside spread; carrier-roller compatible | Existing exact official image retained; D11N/R/T/XE/D11 |
| 184-6306 | Cat Double-Flange D11 Track Roller; 10.906 in tread, 19.219 in mounting width, 25.276 in shaft, 13.56 in outside link spread; not carrier-roller compatible | Existing exact official image retained; D11N/R/T/XE/D11 |
| 185-3630 | Cat Filter Strap Wrench; service tool for loosening/removing spin-on filters; no machine fitment published | Existing exact official tool image retained |
| 186-2002 | Cat 101.6 mm ID Hump Hose; material Other Hose; broad large-engine marine/generator/industrial/petroleum applications | Existing exact official image retained; 26 engine/model identifiers stored |
| 187-3298 | Cat Hardened-Steel Undercarriage Roller Guide; D11N/R/T/XE/D11 | Existing exact official image retained |
| 189-3032 | Cat Wear Strip, Rear Position, Both Sides; structural steel; D6R/D6T variants and PL72 | Existing exact official image retained |
| 193-1468 | Cat Auxiliary Water Pump Install Kit; 12 components with exact part numbers/quantities (including O-rings, water-pump seal, water-lines gasket, retaining rings and lip seal); 3508B/SR4B/3516B/3512B/3512C/PM3508/PM3516/PM3512 and related trucks/tractors | Cat page lists component images but no single kit image verified; no image assigned |
| 1L-5011 | Cat Valve; Cat publishes no function/specifications; broad generator-set, generator, marine, truck, industrial, petroleum and gas-engine fitment | Fallback image omitted; 54 model identifiers stored |
| 1M-8747 | Cat Class C Duo-Cone Seal; 96.38 mm assembled OD, 72.81 mm seal-ring ID, 32 mm axial width; extensive track-loader, D5–D8 tractor, Challenger, paver, ripper, pipelayer and excavator compatibility | Existing exact official image retained; 140 model identifiers stored |
| 1M-9011 | Cat 224.90 mm ID NBR Toric Seal; 12.7 mm cross section, -40 to 212 °F; fuel/LPG/hydraulic/power-steering/radiator applications and broad equipment fitment | Existing exact official image retained; 140 model identifiers stored |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/184-6305
- https://parts.cat.com/en/catcorp/product/184-6306
- https://parts.cat.com/en/catcorp/product/185-3630
- https://parts.cat.com/en/catcorp/product/186-2002
- https://parts.cat.com/en/catcorp/product/187-3298
- https://parts.cat.com/en/catcorp/product/189-3032
- https://parts.cat.com/en/catcorp/product/193-1468
- https://parts.cat.com/en/catcorp/product/1L-5011
- https://parts.cat.com/en/catcorp/product/1M-8747
- https://parts.cat.com/en/catcorp/product/1M-9011

Database checkpoint: all 10 rows updated and verified. Existing exact official images retained for 184-6305, 184-6306, 185-3630, 186-2002, 187-3298, 189-3032, 1M-8747 and 1M-9011. No unverified kit/valve image assigned. Overall manual progress: 24/50 batches, 240/500 SKUs.


## Batch 25/50 — SKUs 241–250 (1P-1120 through 1W-6316)

All ten official Cat product pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 1P-1120 | Cat Turbocharger Cartridge Seal Ring; 4.5 × 0.1 in; broad generator, truck-engine, toolcarrier, tractor/scraper, loader, industrial, marine and track-type tractor fitment | Existing exact official image retained; 271 model identifiers stored |
| 1R-0749 | Cat Spin-On Fuel Filter; 3.689 in diameter × 10.571 in length; Out-to-In; carbon steel/mixed metal-nonmetal; acrylic beads, spiral roving, nylon center tube and molded end caps | Existing exact official image retained; 447 model identifiers stored |
| 1R-0762 | Cat Advanced-High-Efficiency Spin-On Fuel Filter; 3.681 × 10.504 in; Out-to-In; carbon steel/mixed metal-nonmetal; extensive truck, grader, tractor, excavator, loader, compactor and engine fitment | Existing exact official image retained; 292 model identifiers stored |
| 1U-5516 | Cat 2 in Aluminum Oxide Type A-Coarse Surface Conditioning Disc; 25,000 max/18,000 optimum RPM; R-style quarter-turn; Cat page discrepancy recorded: description says 2 in/50.8 mm, structured spec says 1.0 in | Existing exact official disc image retained; discrepancy explicitly flagged |
| 1U-5517 | Cat 3 in Aluminum Oxide Type A-Coarse Surface Conditioning Disc; 18,000 max/15,000 optimum RPM; R-style quarter-turn | Existing exact official disc image retained |
| 1W-1052 | Cat 3406C Turbocharger Group; 13.6 × 17.0 in; 3406C/3406/3406B generator-set, SR4 generator and 3406 industrial applications | Cat explicitly says image is representative, not exact; omitted |
| 1W-2447 | Cat 118 mm Long Oil Cooler Outlet Adapter; 28.5 × 1.5 × 3.78 in; 1.5 in diameter; 13.49 lb; grey iron; broad marine/generator/truck/industrial/petroleum fitment | Exact official Scene7 adapter image newly linked; 94 model identifiers stored |
| 1W-4674 | Cat Pump Group Kit; Cat has no description/specifications yet; 3512/3516 generator, marine, industrial, petroleum and gas-engine applications | Fallback image omitted |
| 1W-6312 | Cat Fuel Injection Line No. 2 for double-walled cylinder; 15.3 × 4.0 in; 3408B/3408C/3408 | Exact official Scene7 line image newly linked |
| 1W-6316 | Cat Fuel Injection Line No. 6 for double-walled cylinder; 22.3 × 3.0 in; 3408B/3408C/3408 | Exact official Scene7 line image newly linked |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/1P-1120
- https://parts.cat.com/en/catcorp/product/1R-0749
- https://parts.cat.com/en/catcorp/product/1R-0762
- https://parts.cat.com/en/catcorp/product/1U-5516
- https://parts.cat.com/en/catcorp/product/1U-5517
- https://parts.cat.com/en/catcorp/product/1W-1052
- https://parts.cat.com/en/catcorp/product/1W-2447
- https://parts.cat.com/en/catcorp/product/1W-4674
- https://parts.cat.com/en/catcorp/product/1W-6312
- https://parts.cat.com/en/catcorp/product/1W-6316

Database checkpoint: all 10 records updated and verified. Three exact official images newly linked (1W-2447, 1W-6312, 1W-6316); existing exact images retained for 1P-1120, 1R-0749, 1R-0762, 1U-5516 and 1U-5517. Representative/fallback images not assigned. Overall manual progress: 25/50 batches, 250/500 SKUs.


## Batch 26/50 — SKUs 251–260 (1W-8922 through 20R-0582)

All ten official Cat product pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 1W-8922 | Cat Piston Ring Kit; includes 134-3761 ×1, 2P-2817 ×1, 7N-7078 ×1; broad 3406/3408/3412 engine and associated machine fitment | Single-ring image did not represent the 3-ring kit; omitted; 93 model identifiers stored |
| 200-5272 | Cat Fuel Transfer Pump Cap; 4.5 × 0.9 in; generator-set engines 3406C/3412/3512/3512B/3508B/3516/3516B/3508/3412C, PM3508/PM3516/PM3412/PM3512 and G3516 | Exact official Scene7 cap image newly linked |
| 202-2175 | Cat Auxiliary Water Pump Installation Kit; 13 components including O-rings, water-pump seal, water-lines gaskets, retaining ring and lip seal; 3512B/3508B/3516B/G3516B, SR4B/SR4BHV, PMG3516, marine/industrial/locomotive/petroleum fitment | No single exact kit image verified; omitted |
| 202-2783 | Cat Alternator Plate; Cat publishes no functional description/specifications; broad generator, engine, pumper, marine, truck, grader, paver, mining, petroleum and loader fitment | Image resolved to generic Cat logo; omitted; 221 model identifiers stored |
| 202-4296 | Cat Standard-Application Idler Group; 189.8 mm rim width, interchangeable, 545 mm conventional tread; D6R/D6T variants | Existing exact official image retained |
| 20R-0268 | Cat Reman C15/C18 Variable Valve Actuator (12V Cat Brake); engine braking control; compatible 740/735, 772/770, 834H, 24M and 988H | Existing exact official image retained |
| 20R-0271 | Cat Reman C15/C18 Variable Valve Actuator (12V Cat Brake); C15 truck engine and C18 industrial engine | Exact official Scene7 actuator image newly linked |
| 20R-0272 | Cat Reman C15/C18 Variable Valve Actuator (24V Brake); C15 truck engine and C18 industrial engine | Existing exact official image retained |
| 20R-0505 | Cat Reman G3500 Water Pump; 15.9 × 14.6 in; stainless shaft, durable impeller, new bearings and improved seals; G3520/G3516C/E/H, 3512E, 789G, 994K and related applications | Exact official Scene7 water-pump image newly linked |
| 20R-0582 | Cat Reman 3500C HD Cylinder Pack; 14.7:1; preassembled liner/piston/rings/pin/retainers/rod/seals; 3516C/B, 3512C, XQC1200/1600, 789D/785D and related applications | Existing exact official Scene7 cylinder-pack image retained |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/1W-8922
- https://parts.cat.com/en/catcorp/product/200-5272
- https://parts.cat.com/en/catcorp/product/202-2175
- https://parts.cat.com/en/catcorp/product/202-2783
- https://parts.cat.com/en/catcorp/product/202-4296
- https://parts.cat.com/en/catcorp/product/20R-0268
- https://parts.cat.com/en/catcorp/product/20R-0271
- https://parts.cat.com/en/catcorp/product/20R-0272
- https://parts.cat.com/en/catcorp/product/20R-0505
- https://parts.cat.com/en/catcorp/product/20R-0582

Database checkpoint: all 10 records updated and verified. Three exact official images newly linked (200-5272, 20R-0271, 20R-0505); existing exact images retained for 202-4296, 20R-0268, 20R-0272 and 20R-0582. Single-component, generic-logo and unverified kit images omitted. Overall manual progress: 26/50 batches, 260/500 SKUs.


## Batch 27/50 — SKUs 261–270 (20R-0583 through 20R-1270)

All ten official Cat pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-0583 | Cat Reman 3500 HD Monotherm Cylinder Pack; 14.7:1; preassembled liner/piston/rings/pin/retainers/rod/seals; recommended 3500 HD; Cat publishes no compatible-model list | No verified image: available image was a connecting rod, not the cylinder pack; omitted |
| 20R-0615 | Cat Reman C9 Cylinder Pack; 15.5:1, 8.8L; recommended C9; preassembled cylinder pack and up to one hour saved per cylinder | Exact official Scene7 cylinder-pack image newly linked; C9 retained as recommended engine application, not a separate fitment list |
| 20R-0632 | Cat Reman C18 Cylinder Pack; 14.5:1; recommended C18; preassembled cylinder pack | Existing exact official image retained; C18 retained as recommended engine application, not a separate fitment list |
| 20R-0651 | Cat Reman Platinum Engine Overhaul Kit (3126B); 210 HP; includes Gold kit plus piston packs, block, head, injector pump, gerotor pump and injectors; title says 3126B while Recommended Application field says 3216B; Compatible Models lists Truck Engine 3126E | No verified full-kit image; omitted; source discrepancy preserved |
| 20R-0675 | Cat Reman C280 Fuel Injector; 23.6 × 9.3 in; compatible 3608/3606/C280-16/3616 generator, C280 marine/petroleum and 3612 locomotive engines | Exact official Scene7 injector image newly linked |
| 20R-0744 | Cat Reman Gold C15 Engine Overhaul Kit; 18.0:1; includes 10R-9611 ×6 and 606-0909 ×1; C15 compatibility; assembled core-return terms captured | Exact official Scene7 kit-layout image newly linked |
| 20R-0759 | Cat Reman Basic Fuel Injector (3408/3412, HIA450 Prime); Compatible Models lists Industrial Engine 3408E; Cat publishes no specifications | Exact official Scene7 injector image newly linked |
| 20R-0925 | Cat Reman C13 Connecting Rod (Drilled/Fracture-Split); microalloy/alloy steel; POWER SYS, C13 XQ350/XQ375, 623H/621H/627H, 352F/349 excavators, 404F-22 grader, 980K/980K HLG | Existing exact official rod image retained; 24 model identifiers stored |
| 20R-1136 | Cat Reman C9 Tier 4 Valve Rocker Arm; 6.8 × 2.2 in; generator, C9.3, grader, loader, D6/D7, truck, marine, excavator and mobile-hydraulic fitment | Exact official Scene7 rocker-arm image newly linked; 61 model identifiers stored |
| 20R-1270 | Cat Reman 3500B Fuel Injector (EI800B/EUI); compatible 3512B/3508B/3516B generator, SR4B, PM3516/PM3512/PM3508, marine, industrial, petroleum, locomotive, 854G and 992G applications | Exact official Scene7 injector image newly linked; 11 model identifiers stored |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-0583
- https://parts.cat.com/en/catcorp/product/20R-0615
- https://parts.cat.com/en/catcorp/product/20R-0632
- https://parts.cat.com/en/catcorp/product/20R-0651
- https://parts.cat.com/en/catcorp/product/20R-0675
- https://parts.cat.com/en/catcorp/product/20R-0744
- https://parts.cat.com/en/catcorp/product/20R-0759
- https://parts.cat.com/en/catcorp/product/20R-0925
- https://parts.cat.com/en/catcorp/product/20R-1136
- https://parts.cat.com/en/catcorp/product/20R-1270

Database checkpoint: all 10 rows updated and verified. Six exact official images newly linked (20R-0615, 20R-0675, 20R-0744, 20R-0759, 20R-1136, 20R-1270); existing exact images retained for 20R-0632 and 20R-0925. Unverified cylinder-pack/kit imagery was omitted. Overall manual progress: 27/50 batches, 270/500 SKUs.


## Batch 28/50 — SKUs 271–280 (20R-1275 through 20R-2284)

All ten official Cat product pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-1275 | Cat Reman Electronic Fuel Injector; 14.8 × 3.0 in; marine 3508B/3516B/3512B/3508/3512, marine auxiliary 3512B, industrial 3508B/3512B/3516B and locomotive 3512B/3516B/3508B | Exact official Scene7 injector image newly linked |
| 20R-1306 | Cat Reman MEUI-C 10mm Fuel Injector (Tier 4 Interim); 12.3 × 4.8 in; compatible Industrial Engine C15 and Petroleum Engine C15 | Exact official Scene7 injector image newly linked |
| 20R-1367 | Cat C18 Reman Long Block; block/crankshaft/cylinder packs/head/camshaft/valve mechanism/front housing/gears/water pump/lifting eyes; fuel transfer pump and oil cooler shipped loose; C18 recommended, compatible 657G and C18 industrial | Only 80px exploded-engine thumbnail available; omitted |
| 20R-1369 | Cat C15 Reman Long Block; block/crankshaft/cylinder packs/head/camshaft/VVA/front housing/gears/water pump/lifting eyes; fuel transfer pump/oil cooler shipped loose; U.S. engine-core return/destruction requirement | Exact official Scene7 long-block image newly linked; Cat publishes no compatible-model list |
| 20R-1516 | Cat Reman C32 Engine Oil Pump; Cat publishes no specs; compatible SR5, AD63, C32/C27 generator/petroleum/marine/industrial, 777G, 844H/854K, 24, 6015B/6020B/6030, 993K/990K/992K, MD6250/MD6310 and related trucks | Only 80px image; omitted; 35 model identifiers stored |
| 20R-1626 | Cat Reman 3500-Series Valve Lifter; pumper, generator, power-module, petroleum, locomotive, D11N/R, 854G, 992G/994D, 5230B/5130B, 785/797/793C/777 and related marine/industrial applications | Existing exact official image retained; 42 model identifiers stored |
| 20R-1828 | Cat Reman 3400-Series Valve Lifter; extensive 3406/3408/3412 engine and pumper, generator, truck, grader, tractor, marine, pipelayer, compactor, loader, scraper, reclaimer, industrial and petroleum fitment | Existing exact official image retained; 154 model identifiers stored |
| 20R-1859 | Cat Reman C27/C32 Water Pump; 17.5 × 9.9 in; AD63, C27/C32 generator/petroleum/locomotive/industrial, 777G, 854K/844K, 24, 6015B/6020B/6030, 993K/990K/992K, D11T/D10T2/D11 and related applications | Exact official Scene7 water-pump image newly linked; 27 model identifiers stored |
| 20R-2009 | Cat Reman Double Piston Hydraulic Pump; 48.6 × 23.0 in; Sealants/Adhesives Adhesive; compatible Hydraulic Shovel 6060 | Existing exact official image retained |
| 20R-2284 | Cat Reman Fuel Injector; coated plungers, engineering updates and reliability testing; Cat does not publish compatible models or structured specifications | Existing catalog image retained with fitment unverified; no fitment inferred |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-1275
- https://parts.cat.com/en/catcorp/product/20R-1306
- https://parts.cat.com/en/catcorp/product/20R-1367
- https://parts.cat.com/en/catcorp/product/20R-1369
- https://parts.cat.com/en/catcorp/product/20R-1516
- https://parts.cat.com/en/catcorp/product/20R-1626
- https://parts.cat.com/en/catcorp/product/20R-1828
- https://parts.cat.com/en/catcorp/product/20R-1859
- https://parts.cat.com/en/catcorp/product/20R-2009
- https://parts.cat.com/en/catcorp/product/20R-2284

Database checkpoint: all 10 rows updated and verified. Four exact official images newly linked (20R-1275, 20R-1306, 20R-1369, 20R-1859); existing images retained for 20R-1626, 20R-1828, 20R-2009 and 20R-2284. Low-resolution/representative images omitted. Overall manual progress: 28/50 batches, 280/500 SKUs.


## Batch 29/50 — SKUs 281–290 (20R-2447 through 20R-3321)

All ten official Cat pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-2447 | Cat Reman 3400-Series Valve Lifter; tappet follows camshaft lobes to open/close intake/exhaust valves; Cat 12-month warranty; no compatible-model list published | Only 80px image; omitted |
| 20R-2647 | Cat Reman Cylinder Head Assembly Kit; 21 component lines with exact quantities; 49.75 × 15.0 in; extensive generator/truck/tractor/shovel/marine/pipelayer/excavator/petroleum/loader fitment | Existing exact official kit image retained; 186 model identifiers stored |
| 20R-2734 | Cat Reman C18 Turbocharger; 15.6 × 17.0 in; compatible Marine Engine C18 | Exact official Scene7 turbocharger image newly linked |
| 20R-2861 | Cat C9 Reman Short Block; 9.3L, Tier 4; compatible D6T/D7E, 627H, 586C, 336E family, 12M/160M/140M graders, MHPU and 966K/972K loaders | Exact official Scene7 short-block image newly linked; 21 model identifiers stored |
| 20R-3163 | Cat Reman Turbocharger; 15.1 × 15.9 in; compatible gen-set 3408B/3408C/3408, marine 3408B/3408/3412 and gas engines G3408C/G3408/G3408B | Exact official Scene7 turbocharger image newly linked |
| 20R-3317 | Cat Reman Valve Rocker Arm; pushrod/camshaft valve actuation; core inspection, engineering updates and testing; no compatible-model list published | Exact official Scene7 rocker-arm image newly linked |
| 20R-3318 | Cat Reman C15 Valve Rocker Arm; rocker/pushrod/camshaft function; no separate compatible-model list published | Only 80px image; omitted; C15 retained as engine designation only |
| 20R-3319 | Cat Reman Unit Injector Rocker Arm; valve/injector rocker function and core inspection; no compatible-model list published | Existing exact official image retained |
| 20R-3320 | Cat Reman Valve Rocker Arm; rocker/pushrod/camshaft function; no compatible-model list published | Existing exact official image retained |
| 20R-3321 | Cat Reman Valve Rocker Arm; rocker/pushrod/camshaft function; no compatible-model list published | Existing exact official image retained |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-2447
- https://parts.cat.com/en/catcorp/product/20R-2647
- https://parts.cat.com/en/catcorp/product/20R-2734
- https://parts.cat.com/en/catcorp/product/20R-2861
- https://parts.cat.com/en/catcorp/product/20R-3163
- https://parts.cat.com/en/catcorp/product/20R-3317
- https://parts.cat.com/en/catcorp/product/20R-3318
- https://parts.cat.com/en/catcorp/product/20R-3319
- https://parts.cat.com/en/catcorp/product/20R-3320
- https://parts.cat.com/en/catcorp/product/20R-3321

Database checkpoint: all 10 rows updated and verified. Four exact official images newly linked (20R-2734, 20R-2861, 20R-3163, 20R-3317); existing exact images retained for 20R-2647, 20R-3319, 20R-3320 and 20R-3321. Low-resolution lifter images omitted. Overall manual progress: 29/50 batches, 290/500 SKUs.


## Batch 30/50 — SKUs 291–300 (20R-3322 through 20R-3623)

All ten official Cat pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-3322 | Cat Reman Unit Injector Rocker Arm; official fitment includes SR4/XQP500, AD30, 3406E/C15/C16/C18, PM3456, R2900/R3000H, D8/D9, 6015/6018, 385C/5090B, 623/637/657, 825H, 834/824, 826/836, 986/988 and many more | Only 80px images; omitted; 141 model identifiers stored |
| 20R-3323 | Cat Reman C15 Unit Injector Rocker Arm; core cleaning/inspection and same-as-new 12-month warranty; Cat publishes no separate compatible-model list | Only 80px images; omitted; C15 retained as engine designation only |
| 20R-3324 | Cat Reman C15 Valve Rocker Arm; Compatible Models explicitly lists Truck Engine C15 | Existing exact official image retained |
| 20R-3440 | Cat 3508 Reman Bare Block; cleaned/inspected, deck resurfaced, standard crankshaft bores and new main-cap bolts; U.S. core return/destruction requirement; 3508, 3508B/C, G3508, D11N/R, 854G, 992G, 5130/5130B, 777 variants and more | Exact official Scene7 bare-block image newly linked; 29 model identifiers stored; remains active—Cat page does not state discontinued |
| 20R-3441 | Cat 3512 Reman Bare Block (Service, 12-cylinder); U.S. core return/destruction requirement; 3512/3512B/C/E, G3512, XQC1200/PM3512, MD6540C, 785/797 trucks, 784C and more | Exact official Scene7 bare-block image newly linked; 35 model identifiers stored; remains active |
| 20R-3442 | Cat 3516 Reman Bare Block; recommended 3516; compatible Power Module 3516B/3516C and Gas Engine G3516B; U.S. core return/destruction requirement | Exact official Scene7 bare-block image newly linked; remains active |
| 20R-3543 | Cat Reman D3500B Cylinder Head (Shot-Peened); core disassembly/inspection, deck resurfacing, engineering updates and original-spec testing; 3512B/3516B | Existing exact official image retained |
| 20R-3545 | Cat Reman D3500C Cylinder Head (Nitrided Seats); same reman inspection/process; 3512B/3512C/3516B/3516C | Existing exact official image retained |
| 20R-3549 | Cat Reman G3500 Cylinder Head (3-Angle); 11.55 × 16.55 × 10.1 in, 106.9 lb; G3516B/G3516/G3512/G3512B | Existing exact official image retained |
| 20R-3623 | Cat Reman Turbocharger; Cat describes center-housing seal-integrity testing and dynamic balancing; no compatible-model list or structured specifications published | Only 80px image; omitted; no fitment inferred |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-3322
- https://parts.cat.com/en/catcorp/product/20R-3323
- https://parts.cat.com/en/catcorp/product/20R-3324
- https://parts.cat.com/en/catcorp/product/20R-3440
- https://parts.cat.com/en/catcorp/product/20R-3441
- https://parts.cat.com/en/catcorp/product/20R-3442
- https://parts.cat.com/en/catcorp/product/20R-3543
- https://parts.cat.com/en/catcorp/product/20R-3545
- https://parts.cat.com/en/catcorp/product/20R-3549
- https://parts.cat.com/en/catcorp/product/20R-3623

Database checkpoint: all 10 rows updated and verified. Three exact official images newly linked (20R-3440, 20R-3441, 20R-3442); existing exact images retained for 20R-3324, 20R-3543, 20R-3545 and 20R-3549. Low-resolution images omitted. Important correction: 20R-3440/3441/3442 remain active; Cat's “Replaced” key label is not a discontinuation notice. Overall manual progress: 30/50 batches, 300/500 SKUs.


## Batch 31/50 — SKUs 301–310 (20R-3666 through 20R-4292)

All ten official Cat pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-3666 | Cat Reman UTN Diesel Particulate Filter Kit; 582-7467 Filter Kit ×1; soot regeneration/ash service/crack inspection; qualifying core return; 12-month warranty; XQ425, 637D/621K, 657/627K/623K, C15, R1700/R2900, 740/730, 18M3/16M3, 986/988, D8/D9, PL83/87, 352F and more | Existing exact official DPF kit image retained; 59 model identifiers stored |
| 20R-3915 | Cat Reman C27/C32 Variable Valve Actuator; 24V Cat Brake; compatible D1500, 775G/775F/773G/773F, 777G/777F, 854K/844K, 24, 990K/993K/992K | Existing exact official actuator image retained; 18 model identifiers stored |
| 20R-4147 | Cat Reman Basic Fuel Injector (3408/3412); 14.2 × 5.3 in; Cat publishes no compatible-model list | Existing exact official injector image retained; no fitment inferred |
| 20R-4195 | Cat C18 Reman UTN Crankshaft (Tier 4 Final); heat-treated/hardened, tested; qualifying core return; 12-month warranty | Exact official Scene7 crankshaft image newly linked; no separate fitment list published |
| 20R-4263 | Cat Reman C175-16 Common-Rail Fuel Rail (RH); generator set C175-16/C175-16GENSET, 793F/795F/794 AC truck variants, petroleum/locomotive C175-16, 796 AC/798 AC off-highway trucks | Exact official Scene7 RH fuel-rail image newly linked; 12 model identifiers stored |
| 20R-4264 | Cat Reman C175-16 Common-Rail Fuel Rail (LH); C175-16 generator/marine/industrial/petroleum/locomotive applications, 793F/795F/794 AC truck variants, 796 AC/798 AC off-highway trucks | Exact official Scene7 LH fuel-rail image newly linked; 11 model identifiers stored |
| 20R-4266 | Cat Reman C175-20 Common-Rail Fuel Rail (RH); compatible C175-20 generator set and 797F/797/797B trucks | Exact official Scene7 RH fuel-rail image newly linked |
| 20R-4267 | Cat Reman C175-20 Common-Rail Fuel Rail (LH); compatible C175-20 generator set and 797F/797/797B trucks | Exact official Scene7 LH fuel-rail image newly linked |
| 20R-4277 | Cat 3406C Reman Complete Long Block (DI-TA); block/crankshaft/cylinder packs/head/camshaft/valve mechanism/gears/water pump/accessory drive; U.S. core return/destruction requirement; D8R/D8R II, 621/623/627 series, 825G, 824G, 826G and 980G | Exact official Scene7 long-block image newly linked; 17 model identifiers stored |
| 20R-4292 | Cat Reman G3306 Auxiliary Fresh-Water Pump; stainless-steel shaft, hardened bearing retainer; G3306 generator set, XQG135 power module, G3304/G3306B gas engines and G3306B petroleum gen set | Exact official Scene7 pump image newly linked; 4 model identifiers stored |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-3666
- https://parts.cat.com/en/catcorp/product/20R-3915
- https://parts.cat.com/en/catcorp/product/20R-4147
- https://parts.cat.com/en/catcorp/product/20R-4195
- https://parts.cat.com/en/catcorp/product/20R-4263
- https://parts.cat.com/en/catcorp/product/20R-4264
- https://parts.cat.com/en/catcorp/product/20R-4266
- https://parts.cat.com/en/catcorp/product/20R-4267
- https://parts.cat.com/en/catcorp/product/20R-4277
- https://parts.cat.com/en/catcorp/product/20R-4292

Database checkpoint: all 10 records updated and verified. Seven exact official images newly linked (20R-4195, 20R-4263, 20R-4264, 20R-4266, 20R-4267, 20R-4277, 20R-4292); existing exact images retained for 20R-3666, 20R-3915 and 20R-4147. Overall manual progress: 31/50 batches, 310/500 SKUs.


## Batch 32/50 — SKUs 311–320 (20R-4306 through 20R-5379)

All ten official Cat pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-4306 | Cat Reman C9 Cylinder Pack; 17.0:1, 9.3L, Tier 4; compatible SR4B, C9.3 genset, 627K/637K, PM312/313/310, 140M/150/12M/160M graders, 966M/972M, D6T/D7E, 725C, PL72, 336F excavators, MHPU and 973 | Image link returned a connecting rod, not the cylinder pack; omitted; 42 model identifiers stored |
| 20R-4505 | Cat Reman C13 Unit Injector Rocker Arm (Tier 4); pushrod/camshaft valve actuation; core cleaning/inspection and 12-month warranty; no separate compatible-model list | Exact official Scene7 rocker-arm image newly linked |
| 20R-4602 | Cat C175 Reman Crankshaft Damper (Gen II); C175-16/20 generator sets, C175-16 marine/industrial/petroleum, 793F/795F/794 AC trucks and 798/796 AC off-highway trucks | Existing exact official damper image retained; 13 model identifiers stored |
| 20R-4700 | Cat Reman Crankshaft Damper; compatible Vibratory Compactor CP-563C and Motor Grader 120H ES | Exact official Scene7 damper image newly linked |
| 20R-5005 | Cat Reman C18 Turbocharger Cartridge; compatible POWER SYS gen-set engine, C18 generator set, C18 marine engine and C18 petroleum package | Exact official Scene7 turbocharger-cartridge image newly linked |
| 20R-5075 | Cat Reman Common-Rail Fuel Injector (CR350, C9); low-sulfur/low-lubricity fuel capability, coated plungers, reliability testing and engineering updates; no separate Compatible Models list | Existing exact official injector image retained; C9 kept as engine designation only |
| 20R-5152 | Cat Reman Fuel Injection Pump; compatible SR4, 3408B/3408/3406 truck engines, 621/639D/627B/657E/637D/623B/631D/633D/651E tractors, 825C/824C/834B/826C/992C, 3406/3408/3412 gen-set/marine/industrial engines, 769C/773B, 245, 772B/768C and 834U/834S/824S/825 | Image link returned an O-ring, not the pump; omitted; 44 model identifiers stored |
| 20R-5191 | Cat Reman Auxiliary Sea-Water Pump (3500); compatible gen-set engines 3508/3512/3516, 3512B generator set, 3500-series marine/marine-auxiliary/industrial engines and G3512/G3516 gas engines | Exact official Scene7 sea-water-pump image newly linked; 13 model identifiers stored |
| 20R-5199 | Cat C175-16 Reman Upgrade-to-New Bare Block; new bare block at reduced cost; compatible C175-16 generator/marine/engine/industrial/petroleum/locomotive, 793F/795F trucks and 798/794/796 AC off-highway trucks; U.S. core return/destruction requirement | Only 80px engine thumbnail; omitted; remains active—Cat page does not state discontinued |
| 20R-5379 | Cat C9 Reman Complete Long Block (4-valve, HEUI-B, ATAAC, Tier 3, HEP10, ADEM4); includes block/crankshaft/cylinder packs/head/camshaft/valve mechanism/front housing/gears/fuel transfer pump/lifting eyes; oil cooler/oil pump shipped loose; U.S. core return/destruction requirement | Image resolved to generic Cat logo; omitted; no compatible-model list published |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-4306
- https://parts.cat.com/en/catcorp/product/20R-4505
- https://parts.cat.com/en/catcorp/product/20R-4602
- https://parts.cat.com/en/catcorp/product/20R-4700
- https://parts.cat.com/en/catcorp/product/20R-5005
- https://parts.cat.com/en/catcorp/product/20R-5075
- https://parts.cat.com/en/catcorp/product/20R-5152
- https://parts.cat.com/en/catcorp/product/20R-5191
- https://parts.cat.com/en/catcorp/product/20R-5199
- https://parts.cat.com/en/catcorp/product/20R-5379

Database checkpoint: all 10 rows updated and verified. Four exact official images newly linked (20R-4505, 20R-4700, 20R-5005, 20R-5191); existing exact images retained for 20R-4602 and 20R-5075. Incorrect, low-resolution and generic images omitted. Overall manual progress: 32/50 batches, 320/500 SKUs.


## Batch 33/50 — SKUs 321–330 (20R-5393 through 20R-6518)

All ten official Cat pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-5393 | Cat C175 Reman Crankshaft Damper (Gen I); absorbs torsional vibration; C175-20 generator set and 797F/797/797B trucks | Exact official Scene7 damper image newly linked |
| 20R-5420 | Cat Reman G3520 Crankshaft Damper; viscous damper with fluid-sampling port; qualifying core return and 12-month warranty; G3520 gen-set engine and G3520C/E/H/G3520 generator sets | Image resolved to generic Cat logo; omitted |
| 20R-5462 | Cat Reman 24V Starter Solenoid Kit (50MT); kit has one solenoid, no separately listed components; 12-month warranty; broad generator, truck, engine, marine, grader, tractor, excavator, loader and other fitment | Exact official Scene7 solenoid image newly linked; 242 model identifiers stored |
| 20R-5566 | Cat Reman Common-Rail Fuel Injector (CR1100, C175); compatible C175-16/C175-20 generator sets, C175-16 marine/industrial, 797F/797/793F/795F truck variants, locomotive C175-16 and 796/798 AC off-highway trucks | Existing exact official injector image retained; 13 model identifiers stored |
| 20R-5616 | Cat Reman 3500 HD Cylinder Pack; 15.3:1; compatible 3516B/3512B generator sets, 793D/793C/797/797B trucks, 3512B/3516B locomotive engines and 994F/994H loaders | Existing exact official cylinder-pack image retained; 8 model identifiers stored |
| 20R-5629 | Cat Reman 3512/3516 Cylinder Pack; 14.7:1; compatible Marine Engine 3516C/3512C and Wheel Loader 962K | Product image showed a connecting-rod/piston component, not a full kit; omitted |
| 20R-5677 | Cat PL542 Reman Electronic Control/Telematics Assembly; PL641E radio, 8/12-pin interfaces, cellular/Wi-Fi/GPS, 9–32V; extensive compact/miniexcavator, excavator, loader, drill, grader, tractor, paver, truck, marine, generator and industrial fitment | Existing exact official telematics image retained; 458 model identifiers stored |
| 20R-5681 | Cat Reman Upgrade-to-New Valve Rocker Arm; new replacement at reduced cost with qualifying core return; no compatible-model list published | Exact official Scene7 rocker-arm image newly linked |
| 20R-6263 | Cat Reman 3400-Series Valve Rocker Arm; core inspection/salvage/engineering updates; extensive pumper, generator, truck-engine, grader, tractor, marine, pipelayer, excavator, loader, scraper, compactor and gas-engine fitment | Exact official Scene7 rocker-arm image newly linked; 163 model identifiers stored |
| 20R-6518 | Cat Reman G3600 A4 Cylinder Head; material attribute Sealants/Adhesives Adhesive; compatible Marine C280-16/C280-6, Industrial G3606B and Gas Engines G3608/G3612/G3606/G3616 | Existing exact official cylinder-head image retained; 7 model identifiers stored |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-5393
- https://parts.cat.com/en/catcorp/product/20R-5420
- https://parts.cat.com/en/catcorp/product/20R-5462
- https://parts.cat.com/en/catcorp/product/20R-5566
- https://parts.cat.com/en/catcorp/product/20R-5616
- https://parts.cat.com/en/catcorp/product/20R-5629
- https://parts.cat.com/en/catcorp/product/20R-5677
- https://parts.cat.com/en/catcorp/product/20R-5681
- https://parts.cat.com/en/catcorp/product/20R-6263
- https://parts.cat.com/en/catcorp/product/20R-6518

Database checkpoint: all 10 rows updated and verified. Four exact official images newly linked (20R-5393, 20R-5462, 20R-5681, 20R-6263); existing exact images retained for 20R-5566, 20R-5616, 20R-5677 and 20R-6518. Generic/incorrect kit imagery omitted. Overall manual progress: 33/50 batches, 330/500 SKUs.


## Batch 34/50 — SKUs 331–340 (20R-6618 through 20R-7555)

All ten official Cat pages were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-6618 | Cat Reman D3500 Cylinder Pack; 14.0:1, Monotherm piston; recommended D3500; preassembled liner/piston/rings/pin/retainers/rod/seals; no separate compatible-model list | Available image was a connecting rod, not the cylinder pack; omitted |
| 20R-6628 | Cat Reman G3600 Prechamber Kit with Check Valve; 20R-3466 ×1 and 454-8324 ×1; G3600 application; core return and 12-month warranty; no separate fitment list | Existing exact official kit image retained |
| 20R-6833 | Cat Reman Variable Valve Actuator (24V Cat Brake); C15/C18 engines; compatible 740/745C/735C/740GC/735B, 631K/637K, 657, 772G/770G, 834H/834K, 24M, 988K/986K and related loaders/trucks | Existing exact official actuator image retained; 28 model identifiers stored |
| 20R-7175 | Cat Reman Auxiliary Sea-Water Pump (Tier 3, 3406E/C18); compatible POWER SYS gen-set engine, C18 generator set, C18 marine, C-15 petroleum engine and C18 petroleum package | Exact official Scene7 pump image newly linked |
| 20R-7306 | Cat Reman 24V UTN HID Flood Lamp; wide-beam lighting, qualifying core return, 12-month warranty; compatible D9T/D11T/D8T/D10T/D7E, AP-500E/AP-555E pavers, 390D/345D/349D/374D excavators, 844/854 dozers, 16M/12M/24M graders, 836H, 993K/988/990/966/962/986/950/972/980/994/992 loaders | Existing exact official image retained; Cat explicitly says part is no longer available—record deactivated; 45 model identifiers retained |
| 20R-7307 | Cat Reman 24V UTN HID Flood Lamp; qualifying core return and 12-month warranty; compatible D10T2/D10T/D11T, IT62H, 613G, 793F/795F/797F/773F/789D/785D/777F trucks, excavators, dozers, 16M grader, 836H/836K and loaders | Existing exact official image retained; remains active; 62 model identifiers stored |
| 20R-7411 | Cat Reman Platinum C15 Engine Overhaul Kit; 18.0:1; nine Parts Included lines: 0R-9449 ×1, 10R-1273 ×6, 10R-3304 ×6, 20R-2648 ×1, 20R-9847 ×1, 440-4722 ×1, 440-4723 ×1, 443-1278 ×1, 606-0909 ×1; complete out-of-frame overhaul and assembled core-refund terms | Existing exact official kit image retained; no separate compatible-model list published |
| 20R-7547 | Cat Reman Camshaft Kit (3406B); camshaft plus Cat Reman valve lifters; high-grade steel, precision-balanced, patented heat treatment and journal grinding; compatible Truck Engine 3406C/3406B and Industrial Engine 3406B | Exact official Scene7 camshaft-kit image newly linked |
| 20R-7549 | Cat Reman Camshaft Kit (3406C); camshaft plus Cat Reman valve lifters; precision balance, patented heat treatment and journal grinding; compatible Truck Engine 3406C | Exact official Scene7 camshaft-kit image newly linked |
| 20R-7555 | Cat Reman Camshaft Kit (3408); camshaft plus Cat Reman valve lifters; high-grade steel, precision balance, patented heat treatment and journal grinding; recommended application 3408; no Compatible Models data | Only 80px image; omitted |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-6618
- https://parts.cat.com/en/catcorp/product/20R-6628
- https://parts.cat.com/en/catcorp/product/20R-6833
- https://parts.cat.com/en/catcorp/product/20R-7175
- https://parts.cat.com/en/catcorp/product/20R-7306
- https://parts.cat.com/en/catcorp/product/20R-7307
- https://parts.cat.com/en/catcorp/product/20R-7411
- https://parts.cat.com/en/catcorp/product/20R-7547
- https://parts.cat.com/en/catcorp/product/20R-7549
- https://parts.cat.com/de/catcorp/product/20R-7555
- https://parts.cat.com/en/catcorp/category/engine-components-camshaft-kits

Database checkpoint: all 10 rows updated and verified. Three exact official images newly linked (20R-7175, 20R-7547, 20R-7549); existing exact images retained for 20R-6628, 20R-6833, 20R-7306, 20R-7307 and 20R-7411. Incorrect/low-resolution images omitted. 20R-7306 deactivated based on Cat's explicit “Part is no longer available” notice; 20R-7307 remains active. Overall manual progress: 34/50 batches, 340/500 SKUs.


## Batch 35/50 — SKUs 341–350 (20R-7560 through 20R-8390)

All ten Cat catalog entries were reviewed; all ten Supabase rows were updated and query-verified. For fan-clutch SKUs, Cat explicitly provides no description, specifications or compatible-model data, so no fitment was inferred.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-7560 | Cat Reman Camshaft Kit (3412); category listing confirms 3412 application; generic Cat kit description includes camshaft and Cat Reman valve lifters, high-grade steel, precision balance, patented heat treatment and journal grinding; no compatible-model list | No verified image; omitted |
| 20R-8060 | Cat Reman Fuel Injector H1315B (C9), 1.96 SF; low-sulfur/low-lubricity fuel design, specialized metallurgy and reliability testing; compatible Truck Engine C9 | Exact official Scene7 injector image newly linked |
| 20R-8352 | Cat Reman Fan Clutch; Cat provides no description, specifications or compatible models | No image or fitment inferred |
| 20R-8360 | Cat Reman Fan Clutch; Cat provides no description, specifications or compatible models | No image or fitment inferred |
| 20R-8364 | Cat Reman Fan Clutch; Cat provides no description, specifications or compatible models | No image or fitment inferred |
| 20R-8369 | Cat Reman Fan Clutch; Cat provides no description, specifications or compatible models | No image or fitment inferred |
| 20R-8373 | Cat Reman Fan Clutch; Cat provides no description, specifications or compatible models | No image or fitment inferred |
| 20R-8380 | Cat Reman Fan Clutch; Cat provides no description, specifications or compatible models | Fallback image only; omitted |
| 20R-8381 | Cat Reman Fan Clutch; Cat provides no description, specifications or compatible models | Fallback image only; omitted |
| 20R-8390 | Cat Reman Fan Clutch; Cat provides no description, specifications or compatible models | Fallback image only; omitted |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/category/engine-components-camshaft-kits
- https://parts.cat.com/en/catcorp/product/20R-8060
- https://parts.cat.com/en/catcorp/category/reman-products-fan-clutches
- https://parts.cat.com/en/catcorp/product/20R-8352
- https://parts.cat.com/te/catcorp/product/20R-8360
- https://parts.cat.com/cs/catcorp/product/20R-8364
- https://parts.cat.com/de/catcorp/product/20R-8369
- https://parts.cat.com/pl/catcorp/product/20R-8373
- https://parts.cat.com/en/catcorp/product/20R-8380
- https://parts.cat.com/en/catcorp/product/20R-8381
- https://parts.cat.com/cs/catcorp/product/20R-8390

Database checkpoint: all 10 rows updated and verified. One exact official image newly linked (20R-8060). Fallback and unavailable fan-clutch images omitted. All eight fan-clutch records remain active because Cat does not explicitly state that they are no longer available; the “Replaced” key alone is not treated as a discontinuation notice. Overall manual progress: 35/50 batches, 350/500 SKUs.


## Batch 36/50 — SKUs 351–360 (20R-8403 through 20R-9480)

All ten catalog entries were reviewed; all ten Supabase rows were updated and query-verified.

| SKU | Official identity / captured detail | Image / fitment treatment |
|---|---|---|
| 20R-8403 | Cat Reman Fan Clutch; Cat page inaccessible and catalog provides no description, specifications or compatible models | No image or fitment inferred |
| 20R-8406 | Cat Reman Fan Clutch; Cat explicitly provides no description, specifications or compatible models | Fallback image only; omitted |
| 20R-8418 | Cat Reman Fan Clutch; Cat explicitly provides no description, specifications or compatible models | Fallback image only; omitted |
| 20R-8517 | Cat Reman Valve Rocker Arm (Additional Lube Supply); compatible D10T tractor, D1500 generator set, C32 marine engine, C27 locomotive engine and 24 grader | Existing exact official rocker-arm image retained; 5 model identifiers stored |
| 20R-8812 | Cat Reman Auxiliary Fresh-Water Pump; stainless shaft, hardened bearing retainer, core inspection and 12-month warranty; compatible SR4B, 3500-series generator sets, power modules, petroleum/marine/industrial/locomotive engines, 789D, 854G, 994/992 loaders, 5230B/5130 mining excavators, CAT WDS and 776D/776C/784C tractors | Only 80px official image; omitted; 81 model identifiers stored |
| 20R-8981 | Cat Reman 3600-Series Valve Lifter; recommended 3600; compatible G3606B industrial engine and G3608/G3612/G3606/G3616 gas engines | Cat explicitly states part is no longer available; record deactivated; only 80px images omitted |
| 20R-9045 | Cat Reman Gear Pump (Counterclockwise); hydraulic oil flow/pressure, high-capacity bearings/bushings, high-pressure seals, qualifying core return and 12-month warranty; no compatible-model list | Exact official Scene7 gear-pump image newly linked |
| 20R-9122 | Cat Reman 3600-Series Water Pump (Standard Rotation); stainless shaft, durable impeller, hardened retainers, 100% bearing replacement and improved seals; recommended application 3600, no fitment list | Exact official Scene7 water-pump image newly linked |
| 20R-9124 | Cat Reman 3600-Series Water Pump (Standard Rotation); same published 3600 application and pump features; no compatible-model list | Exact official Scene7 water-pump image newly linked |
| 20R-9480 | Cat Reman 3512E DGB Cylinder Pack; Tier 4, Monotherm piston; preassembled liner/piston/rings/pin/retainers/rod/seals; compatible Engine 3512E | Exact official Scene7 cylinder-pack image newly linked; 1 model identifier stored |

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-8403
- https://parts.cat.com/en/catcorp/product/20R-8406
- https://parts.cat.com/en/catcorp/product/20R-8418
- https://parts.cat.com/en/catcorp/product/20R-8517
- https://parts.cat.com/en/catcorp/product/20R-8812
- https://parts.cat.com/en/catcorp/product/20R-8981
- https://parts.cat.com/en/catcorp/product/20R-9045
- https://parts.cat.com/en/catcorp/product/20R-9122
- https://parts.cat.com/en/catcorp/product/20R-9124
- https://parts.cat.com/en/catcorp/product/20R-9480

Database checkpoint: all 10 rows updated and verified. Four exact official images newly linked (20R-9045, 20R-9122, 20R-9124, 20R-9480); existing exact image retained for 20R-8517. Low-resolution/fallback images omitted. 20R-8981 deactivated based on Cat's explicit “Part is no longer available” notice. Overall manual progress: 36/50 batches, 360/500 SKUs.


## Batch 18/50 — SKUs 171–180 (11R-1405 through 11R-2442)

All ten official Cat Parts Store product pages were opened and reviewed; all ten Supabase rows were queried and verified as enriched. No unsupported compatibility was added.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 11R-1405 | Cat 3512 Reman NWC Bare Block, Tier 4 | Existing exact official Scene7 image retained |
| 11R-1406 | Cat 3516 Reman NWC Bare Block, Tier 4; 3516E and 994K | Existing exact official image retained |
| 11R-2060 | Cat Reman NWC Prechamber; 3.701 in grip, 5.118 in bolt; no compatible-model list | Existing product image URL retained; gallery currently resolves only to tiny thumbnail |
| 11R-2061 | Cat Reman NWC Prechamber (G3600); G3600 application; no specific compatible-model list | Existing product image URL retained; gallery currently resolves only to tiny thumbnail |
| 11R-2113 | Cat Reman Stator (D6 GEN); same-as-new 12-month Cat Reman warranty subject to limitations | Page image link resolved to generic Reman banner, not stator photo; no image assigned |
| 11R-2194 | Cat NWC Group 31 heavy-duty maintenance-free wet battery; 12V, 1000 CCA, USA only; C4.4 generator-set fitment | Existing exact official image retained |
| 11R-2387 | Cat Reman NWC Valve Lifter (3500A); G3512 generator set | Existing exact official image retained |
| 11R-2388 | Cat Reman NWC Valve Lifter (3500B); no compatible-model list | Existing exact official image retained |
| 11R-2389 | Cat Reman NWC Valve Lifter (G3600); G3608 gas engine | Existing exact official image retained |
| 11R-2442 | Cat Reman NWC Valve Rocker Arm; no compatible-model list | Existing exact official image retained |

Official pages checked: https://parts.cat.com/en/catcorp/product/11R-1405; /11R-1406; /11R-2060; /11R-2061; /11R-2113; /11R-2194; /11R-2387; /11R-2388; /11R-2389; /11R-2442.

Database checkpoint: all 10 rows verified. No questionable/thumbnail images were added. Overall manual progress: 18/50 batches, 180/500 SKUs.


## Batch 19/50 — SKUs 181–190 (121-2630 through 128-8614)

All ten official Cat product pages were opened and checked; all ten corresponding Supabase rows were queried. Catalog identities, published specifications, compatible-model arrays and exact-image decisions were checked against the official pages. Existing enrichment was retained where it matched; no generic fallback imagery was added.

| SKU | Official identity / source-verified detail | Image treatment |
|---|---|---|
| 121-2630 | Cat Fuel Injector Group; 12.3 in length × 4.8 in height; coated plungers, low-sulfur/low-lubricity fuel design and 12-month warranty; 3512/3516 generator, marine and industrial engines | Existing exact official Scene7 image retained |
| 122-2311 | Cat Adapter; Cat publishes fitment for 3608/3606/3616 generator engines and C280-16/-12/-6/-8 marine/petroleum engines; no function/specifications published | Fallback image only; omitted |
| 126-1768 | Cat 19 mm Long Connector Socket for lighting wiring harness; extensive integrated-toolcarrier, utility vehicle, mini-excavator, rotary-drill, forestry and excavator fitment | Existing exact official Scene7 image retained |
| 126-8588 | Cat Undercarriage Rear Bogie; structural/alloy steel; D10N/D10R/D10T2/D10T track-type tractors | Existing exact official Scene7 image retained |
| 127-2176 | Cat 1.6 mm Carrier-Thick Integral Seal Gasket (Edge-Bonded); HNBR seal, 0.063 in thickness, 2-bolt flange; extensive 3500-family, generator, marine, mining, truck and industrial fitment | Existing exact official Scene7 image retained |
| 127-2441 | Cat Exhaust Kit; 111-5819 ×1, 111-5822 ×1, 136-7730 ×8, 166-4572 ×1, 2W-0439 ×1; 3606/3608/3612/3616 and C280 applications | Kit image is fallback; component photos are not the kit; omitted |
| 127-2442 | Cat Exhaust Kit Parts; 133-5179 ×2, 133-8081 ×2, 619-3057 ×1; 3606 generator and C280 marine applications | Kit image is fallback; component photos are not the kit; omitted |
| 128-4414 | Cat Undercarriage Front Bogie; alloy/structural steel; D10N/D10R/D10T2/D10/D10T | Existing exact official Scene7 image retained |
| 128-7256 | Cat Undercarriage Front Bogie; structural/alloy steel; D11N/D11R/D11T/D11 XE/D11 | Existing exact official Scene7 image retained |
| 128-8614 | Cat Seal Kit for Water Collection Bowl; seals for element header, drain valve, bowl header and bowl bolt; broad Cat truck-engine, toolcarrier, grader, skidder, tractor, excavator, paver, compactor and loader fitment | Existing exact official Scene7 image retained |

Official Cat pages checked:
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

Database checkpoint: all 10 rows verified. Existing exact official images retained for 8 products; the adapter and exhaust-kit fallback images were deliberately omitted. Overall manual progress: 19/50 batches, 190/500 SKUs.


## Batch 20/50 — SKUs 191–200 (130-5789 through 140-9545)

All ten official Cat product pages were opened and reviewed; all ten Supabase rows were query-verified. One record (135-9349) was further enriched with the full official cutting-edge specifications and source note. Images were not added where Cat exposed only a fallback or 80px thumbnail.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 130-5789 | Cat Fuel Injection Pump; 24.0 × 9.2 in; computer-tested at 20 quality points, 12-month warranty; 3406B/C, SM-350, RM-350 and PM-465 | Gallery link resolves to 80px image; omitted |
| 131-5459 | Cat Control Assembly; Cat publishes no description/specs; fitment includes 3512/3512B, 3508/3508B, 3516/3516B, 3412C, SR4, PP3516, marine auxiliary and G3612/G3616/G3406 | Fallback image; omitted |
| 134-2679 | Cat Front Bogie Assembly; alloy/structural steel; D9T/D9/D9R/D9N/D9 GC, ripper 9, bulldozer 9SU/9U and winch 59N/58/58L/59L | Existing exact official image retained |
| 134-2680 | Cat Rear Bogie; alloy/structural steel; same D9-family, ripper, bulldozer and winch application list | Existing exact official image retained |
| 134-5402 | Cat Engine Turbocharger; A/R 0.81, 111 mm turbine wheel, 118 mm compressor wheel; 15.9 × 14.3 in; 3508/3512/3516 and SR4/G3512 applications | Existing exact official image retained |
| 135-9349 | Cat 1216.8 mm Flat Cutting Edge for Motor Grader 24H/24M/24; DH2 boron steel, 2.362 in thick, 47.906 in long, 15.984 in wide, 9 bolt holes, 6 in spacing | Existing exact official image retained; full spec set updated in DB |
| 139-2016 | Cat Upper Track Roller Frame Guard; reduces material flow around idler through link-roller system; D11R/D11T/D11 XE/D11 | Existing exact official image retained |
| 139-2019 | Cat Rubber Idler Front Guard; rubber with steel plating, 11.84 × 15.75 × 1.57 in, 0.98 in thick; D11R/D11T/D11 XE/D11 | Existing exact official image retained |
| 140-4238 | Cat Radiator Coolant Recovery Tank Cap; 2.185 in long, 6.122 in high, 0.37 in tube diameter; mini hydraulic excavators and compact wheel loaders | Existing exact official image retained |
| 140-9545 | Cat Fuel Cooler Core; cools fuel before engine, improves density/combustion and helps prevent vapor lock; C18 generator set, C18/3406E marine and C18 petroleum package | Existing exact official image retained |

Official Cat pages checked:
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

Database checkpoint: all 10 rows verified; 135-9349 full specifications and source evidence updated. Existing exact images retained for seven records; no fallback/low-resolution images assigned for 130-5789 or 131-5459. Overall manual progress: 20/50 batches, 200/500 SKUs.


## Batch 21/50 — SKUs 201–210 (141-7015 through 153-2994)

All ten official Cat Parts Store pages were reviewed; all ten Supabase records were queried and verified. The current records preserve the official model lists and published technical data. No image was added for fallback-only or reference-only galleries.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 141-7015 | Cat Wiring Harness Assembly; Cat lists 3508B/3516B/3512B/3516/3512 marine engines and 3512B/3508B/3512/3516B marine auxiliary applications; no function/pinout published | Fallback only; omitted |
| 142-8937 | Cat Lockable Non-Vent Plastic Hydraulic Tank Cap; black polyamide/composite; overall size 63.5 (unit not stated); broad grader, compactor, tractor, paver, excavator, loader and telehandler fitment | Existing exact official image retained |
| 144-0503 | Cat Piston & Ring Kit; Cat provides no kit contents/specifications; compatible across 3306/3406/3176, 3508/3512/3516, trucks, wheel tractors, graders, loaders, compactors and excavators | Fallback only; omitted |
| 147-5331 | Cat Track Roller Frame Rear Guard; D10R/D10T2/D10/D10T | Existing exact official image retained |
| 147-5332 | Cat Track Guide Front Guard; D10R/D10T2/D10/D10T | Existing exact official image retained |
| 149-1912 | Cat Standard-Efficiency Cabin Air Filter, urethane round; 11.772 in high, 6.472 in wide/long; D10R, 953C/963C/973C, 775/773/777 trucks and 12M/14M/16M/18M graders | Existing exact official image retained |
| 150-3141 | Cat Mechanical Cover Group (C); no functional description/specifications published; SR4/SR4B, C18/C15/3406E/3456, RM-500, 825H/834H/834K/824H, 24M, 836H/826H/988H, Challenger MTC/MT and 772G/770G applications | Fallback only; omitted |
| 150-8355 | Cat Universal Joint Assembly (14.5C Interlock); Lube-for-Life; 322 mm swing diameter; carbon steel; 793/797 truck family | Existing exact official image retained |
| 151-5565 | Cat Block; no function/dimensions published; carbon steel; 3516B/3516/3508B/3512/3512C/3512B generator, marine, industrial and petroleum applications | Fallback only; omitted |
| 153-2994 | Cat 7/8-in STOR hydraulic hose quick disconnector; plated steel; alloy zinc/alloy steel/carbon steel material options; broad Cat attachment, excavator, loader, telehandler and compact equipment list. Cat states image is reference-only and actual construction may differ | No image assigned because Cat explicitly marks image reference-only |

Official Cat pages checked:
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

Database checkpoint: all 10 rows verified. Existing exact official images retained for 6 products; no fallback/reference-only images assigned to 141-7015, 144-0503, 150-3141, 151-5565 or 153-2994. Overall manual progress: 21/50 batches, 210/500 SKUs.



## Batch 22/500 — SKUs 211–220 (153-5710 through 162-7864)

The checkpoint target was expanded by user instruction from 500 to 5,000 products: 500 batches of 10. This batch reviewed all ten official Cat Parts Store pages and queried all ten matching Supabase records. All ten rows were present and verified; no unsupported fitment or replacement data was added.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 153-5710 | Cat 12V heavy-duty maintenance-free accessible wet battery, 4D BCI, 1,400 CCA, 200 Ah, 425-minute reserve capacity; 19.3 × 8.6 × 9.9 in; polypropylene case, calcium-lead-alloy grid, SAE posts; extensive construction, mining, power, truck, generator and engine fitment | Exact Cat image retained |
| 153-5720 | Cat 12V heavy-duty maintenance-free accessible wet battery, 8D BCI, 1,500 CCA; 210 Ah, 465-minute reserve capacity, 1,800 CA; 20.5 × 10.8 × 8.7 in; generator, C175, mining truck, planer, grader, shovel and loader fitment | Exact Cat image retained |
| 155-2260 | Cat 3-pin plug connector kit; nylon; Cat compatible-model list includes integrated toolcarriers, wheel harvesters, power packs, rotary drills, mini hydraulic excavators, feller bunchers and harvesters | Exact Cat image retained |
| 155-2270 | Cat 2-pin plug connector kit used to connect harness wires; nylon; Cat compatible-model list includes integrated toolcarriers, wheel harvesters, power packs, military gensets, mini hydraulic excavators, rotary drills and feller bunchers | Exact Cat image retained |
| 155-9879 | Cat Duo-Cone seal group; 137.57 mm assembled OD, 33 mm axial width; D11N/D11R/D11T/D11 XE/D11 | Exact Cat image retained |
| 156-4208 | Cat right-hand minor bogie, 0.3°; boron steel and microalloy steel; suspended undercarriage shock absorption; D10R/D10T | Exact Cat image retained |
| 156-4209 | Cat left-hand minor bogie, 0.3°; microalloy steel and boron steel; suspended undercarriage shock absorption; D10R/D10T | Exact Cat image retained |
| 160-8765 | Cat Fitting Assembly; Cat publishes no functional description/specifications; listed fitment includes D11R, 3508/3508B/3516/3516B genset engines, PP3516, 3516/3508 marine, 5230B/5230 mining excavators, 854G and 992G | Fallback image only; omitted |
| 162-7863 | Cat Duo-Cone metal-face seal; 106.18 mm assembled OD, 35.6 mm axial width; prevents oil loss and dirt entry in idlers/rollers; D8/D9/D10 track-type tractors and PL83/589/PL87/583/587 pipelayers | Exact Cat image retained |
| 162-7864 | Cat Duo-Cone metal-face seal; 113.75 mm assembled OD, 35.6 mm axial width; prevents oil loss and dirt entry in idlers/rollers; D10/D11 track-type tractors | Exact Cat image retained |

Official Cat pages checked:
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

Database checkpoint: all 10 matching rows queried and verified. Exact official images retained for nine products; fallback-only image omitted for 160-8765. Overall reviewed progress: 22/500 batches, 220/5,000 products. Current source list contains 787 unique Cat part numbers, so after exhausting that list, additional official Cat part numbers must be discovered and validated before the 5,000-product target can be met.


## Batch 23/500 — SKUs 221–230 (163-9366 through 184-4396)

All ten official Cat product pages were opened; detailed compatibility/specification sections were checked where published. All ten matching Supabase records were queried. Two records were materially enriched from the current official pages: 163-9366 gained full brake-plate dimensions, material and fitment; 165-6170 gained Cat's rubber-material specification and a 74-model verified compatibility subset. The remaining records were verified against the official descriptions and existing database values. No fallback image was introduced.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 163-9366 | Cat 2.413 mm thick outer brake separator plate; carbon steel, 144-tooth external spline, 21.25 in ID, 29.144 in OD, 0.095 in thickness; broad truck/tractor fitment including D10R, 785/773/775/789/777 families, 776/784 tractors and 992D | Exact Cat image retained; DB spec and compatible models updated |
| 165-6170 | Cat 24.13 mm OD non-threaded engine-oil-level-gauge plug; direct OEM replacement; nitrile/NBR/HNBR/XNBR rubber; Cat publishes extensive compatibility across generator, engine, scraper, tractor, excavator, loader, dozer, truck, marine and track-type tractor families | Exact Cat image retained; DB updated with 74 verified compatible-model examples |
| 167-1751 | Cat turbocharger water-lines tube; routes coolant through turbocharger; 0.75 in OD, steel; 3516B/3516 marine, 3516B industrial and locomotive engine applications | Exact Cat image retained |
| 169-7372 | Cat pet ribbed round fluid-sampling bottle; 200 C-PET bottles, 4 oz each; 3/4 fill mark; polyethylene plastic, 2 in diameter, 3.5 in high, 0.046 lb; 3126/C-10/C-12/3176 engines and 637K/825H/824H/826H applications | Exact Cat image retained |
| 169-7373 | Cat pet ribbed round fluid-sampling bottle; 200 C-PET bottles, 2.5 oz each; PVC plastic, 1.53 in diameter, 2.7 in high; Cat currently publishes no compatible-model data | Exact Cat image retained |
| 169-8373 | Cat bottle set for non-pressurized compartment fluid sampling; 300 four-ounce bottle assemblies plus 500 cap-and-probe sets; also accepts 2.5 oz bottles; compatible Challenger, truck-engine, scraper, compactor, excavator, dozer and loader applications | No image assigned pending exact image verification |
| 170-4007 | Cat fuel transfer pump assembly; transfers fuel from tank to engine; 7 in length and 7 in height; compatible 3406C/3412/3512/3512B/3508B/3516/3516B/3508/3412C genset engines, PM3508/PM3516/PM3412/PM3512 power modules and G3516 gas engine | Exact Cat image retained |
| 177-9343 | Cat probe and cap set for fluid sampling from non-pressurized compartments; bottles not included; compatible with 4 oz and 2.5 oz bottles; two tapered cap holes and clear probe tube; Cat-listed 3126/C-10/C-12/3176, 637K, 825H, 824H and 826H applications | No image assigned pending exact image verification |
| 184-4395 | Cat short-center roller guard; both sides of frame and both-side position; boron/low-alloy steel; HDXL/HD undercarriage systems; D8/D9 track-type tractors, 3508B genset and PL83/PL87/583/587 pipelayers | Exact Cat image retained |
| 184-4396 | Cat steel undercarriage roller guide; D10N/D10R/D10T2/D10/D10T and 589 pipelayer | Exact Cat image retained |

Official Cat pages checked:
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

Database checkpoint: all 10 rows queried; 163-9366 and 165-6170 updated and re-queried successfully. Exact official images retained for eight products; no unverified image assigned for 169-8373 or 177-9343. Overall reviewed progress: 23/500 batches, 230/5,000 products.


## Batch 24/500 — SKUs 231–240 (184-6305 through 1M-9011)

All ten official Cat Parts Store pages were reviewed and all ten Supabase rows queried. Official compatibility and dimensional data matched the existing catalog entries. The official image for 193-1468 was opened at 960×960, visually matched to the auxiliary water-pump installation kit, then saved to the database and re-queried. No fallback image was assigned to 1L-5011.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 184-6305 | Cat single-flange track roller group; standard HD application; 287 mm tread diameter, 488.16 mm mounting width, 25.276 in shaft length, 16.063 in link outside spread, 5.697 in inside spread, 5.365 in shaft OD, 12.638 in outer flange diameter; carrier-roller compatible; D11N/D11R/D11T/D11 XE/D11 | Exact Cat image retained |
| 184-6306 | Cat double-flange track roller group; standard HD application; 277 mm tread diameter, 488.16 mm mounting width, 25.276 in shaft length, 13.56 in link outside spread, 5.365 in shaft OD, 12.638 in outer flange diameter; not carrier-roller compatible; D11 family | Exact Cat image retained |
| 185-3630 | Cat filter strap wrench assembly for tightening/loosening spin-on oil and fuel filters; no dimensions or machine fitment published | Exact Cat image retained |
| 186-2002 | Cat 101.6 mm ID air-line hump hose; material listed as Other Hose; broad fitment across AD45, scraper/tractor, 3508B genset, R1700, 770/772/773/775/777 trucks, D8/D9/D10/D11 tractors and pipelayers | Exact Cat image retained |
| 187-3298 | Cat hardened-steel undercarriage roller guide; D11N/D11R/D11T/D11 XE/D11 | Exact Cat image retained |
| 189-3032 | Cat rear-position wear strip, left/right sides; structural steel, HDXL undercarriage; D6R/D6T variants and PL72 pipelayer | Exact Cat image retained |
| 193-1468 | Cat auxiliary water-pump installation kit; 12 component types including O-rings, water-pump seal, water-lines gasket, retaining rings, flange gasket and lip seal; existing DB kit contents retained | Exact 960×960 Cat image verified and added to DB |
| 1L-5011 | Cat Valve; official page publishes no functional description or structured specifications; existing DB retains model applications, but valve type/function remain unverified | Fallback image only; omitted |
| 1M-8747 | Cat Class C Duo-Cone seal; 96.38 mm assembled OD, 72.81 mm seal-ring ID, 32 mm axial width; broad track-loader, D5–D8 tractor, Challenger, paver, ripper and pipelayer fitment | Exact Cat image retained |
| 1M-9011 | Cat 224.90 mm ID toric sealing ring; 12.7 mm (0.5 in) cross-section; NBR 60; -40 to 212 °F; compatible with petroleum and alpha-olefin lubricants, ethylene glycol, silicone oils/greases and water-based coolants; not compatible with brake fluids, high ozone, ketones, phosphate esters or UV exposure | Exact Cat image retained |

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/184-6305
- https://parts.cat.com/en/catcorp/product/184-6306
- https://parts.cat.com/en/catcorp/product/185-3630
- https://parts.cat.com/en/catcorp/product/186-2002
- https://parts.cat.com/en/catcorp/product/187-3298
- https://parts.cat.com/en/catcorp/product/189-3032
- https://parts.cat.com/en/catcorp/product/193-1468
- https://parts.cat.com/en/catcorp/product/1L-5011
- https://parts.cat.com/en/catcorp/product/1M-8747
- https://parts.cat.com/en/catcorp/product/1M-9011

Database checkpoint: all ten rows queried and verified; 193-1468 image updated and re-queried. Exact official images retained for nine products; fallback-only 1L-5011 image omitted. Overall reviewed progress: 24/500 batches, 240/5,000 products.


## Batch 25/500 — SKUs 241–250 (1P-1120 through 1W-6316)

All ten official Cat Parts Store product pages were opened and reviewed; all ten existing Supabase rows were queried. The official compatibility lists and available specifications were checked against the catalog. One exact 960×960 official image was visually verified and added for 1W-1052; the update was re-queried successfully.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 1P-1120 | Cat Turbocharger Cartridge Seal Ring; cartridge seal ring supports turbocharger airflow/efficiency; 4.5 in length × 0.1 in height; extensive official generator, truck-engine, skidder, excavator, tractor/scraper, loader, industrial, marine and track-type tractor fitment | Existing exact Cat image retained |
| 1R-0749 | Cat Secondary Fuel Filter / Advanced High Efficiency Fuel Filter; official page confirms compatible generator, truck-engine, wheel-tractor-scraper, special excavator-based solution and power-pack applications; public page did not expose structured dimensions in the accessible content | Existing Cat image retained; page thumbnails are low-resolution |
| 1R-0762 | Cat Advanced-Efficiency Engine Fuel Filter; 3.681 in diameter × 10.504 in length; out-to-in flow, spin-on, mixed metal/nonmetal and carbon-steel construction; Advanced High Efficiency; broad underground truck, generator, grader, tractor, excavator, compactor, paver, drill, loader and engine fitment | Existing exact Cat image retained |
| 1U-5516 | Cat 2 in Aluminum Oxide Surface Conditioning Disc, Type A-Coarse; gasket removal, deburring, cleaning and rust removal; R-style quarter-turn positive fastener; max 25,000 RPM, optimum 18,000 RPM. Cat description says 50.8 mm (2 in), while structured specification reports 1.0 in; discrepancy preserved explicitly | Exact 960×960 Cat disc image visually verified |
| 1U-5517 | Cat 3 in Aluminum Oxide Surface Conditioning Disc, Type A-Coarse; 76.2 mm diameter; R-style quarter-turn fastener; max 18,000 RPM, optimum 15,000 RPM | Exact 960×960 Cat disc image visually verified |
| 1W-1052 | Cat Turbocharger Group; matched and performance-tested for engine; 13.6 in length × 17.0 in height; compatible 3406C/3406/3406B gen-set engines, SR4 generator, 3406C generator set and 3406 industrial engine; 12-month warranty already recorded in catalog | Exact 960×960 turbocharger image visually verified and added to DB |
| 1W-2447 | Cat 118mm Long Oil Cooler Outlet Adapter; connects oil cooler to engine-oil lines; grey/cast iron; 28.5 in length × 1.5 in height × 3.78 in width; 13.49 lb; official broad marine, generator, power-module, truck, shovel, drill, petroleum, industrial and loader fitment | Existing exact Cat image retained; title's 118mm descriptor retained as Cat-published title despite the 28.5 in listed length |
| 1W-4674 | Cat Pump Group Kit; Cat publishes no description or structured specifications; official compatible applications include 3512/3516 generator-set and industrial engines, SR4, marine, petroleum and G-series gas engines | Cat page uses fallback image; no image assigned |
| 1W-6312 | Cat Fuel Injection Line No. 2; double-walled cylinder No. 2; high-pressure precision fuel delivery; 15.3 in length × 4.0 in height; compatible 3408B/3408C/3408 gen-set, machine, generator-set, marine and industrial applications | Existing exact Cat image retained |
| 1W-6316 | Cat Fuel Injection Line No. 6; double-walled cylinder No. 6; high-pressure precision fuel delivery; 22.3 in length × 3.0 in height; same official 3408B/3408C/3408 application families | Existing exact Cat image retained |

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/1P-1120
- https://parts.cat.com/en/catcorp/product/1R-0749
- https://parts.cat.com/en/catcorp/product/1R-0762
- https://parts.cat.com/en/catcorp/product/1U-5516
- https://parts.cat.com/en/catcorp/product/1U-5517
- https://parts.cat.com/en/catcorp/product/1W-1052
- https://parts.cat.com/en/catcorp/product/1W-2447
- https://parts.cat.com/en/catcorp/product/1W-4674
- https://parts.cat.com/en/catcorp/product/1W-6312
- https://parts.cat.com/en/catcorp/product/1W-6316

Database checkpoint: all ten rows queried; the 1W-1052 exact official image update was verified by a follow-up query. No fallback image was assigned to 1W-4674. Overall reviewed progress: 25/500 batches, 250/5,000 products.


## Batch 26/500 — SKUs 251–260 (1W-8922 through 20R-0582)

All ten official Cat Parts Store pages were opened and reviewed; all ten Supabase rows were queried. The official kit contents, specifications, and fitment were checked against existing records. The 202-4296 idler group record was expanded with all ten structured official dimensional/application fields and a more complete description; the update was verified by a follow-up query.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 1W-8922 | Cat Piston Ring Kit; official Parts Included lists 134-3761 (137 mm gauge-diameter piston ring) ×1, 2P-2817 (2.97 mm thick intermediate piston ring) ×1 and 7N-7078 (137.16 mm OD oil piston ring) ×1; page dimensions 5.9 × 5.9 in; broad 3400-series, marine, generator, dozer, scraper, loader and excavator fitment | Cat image depicts a ring component rather than clearly showing the complete kit; no image assigned |
| 200-5272 | Cat Fuel Transfer Pump Cap; 4.5 in length × 0.9 in height; compatible gen-set engines 3406C/3412/3512/3512B/3508B/3516/3516B/3508/3412C, PM3508/PM3516/PM3412/PM3512 and G3516 | Existing exact Cat image retained |
| 202-2175 | Cat Auxiliary Water Pump Install Kit; includes gaskets and seals to reinstall main water pump and attaching lines; Cat identifies kit contents category as gaskets/seals; compatible SPF343, 3512B/3508B/3516B/G3516B, SR4B/SR4BHV, PMG3516, marine, industrial, locomotive and petroleum applications | Official image was only available as a tiny thumbnail; no image assigned |
| 202-2783 | Cat Alternator Plate; Cat provides no descriptive function or structured specifications; official compatible list includes pumper, generator, AD55, truck-engine, power-module, off-highway truck, grader, skidder, tractor, paver, marine/industrial engine, mining excavator, petroleum package and loader families | Cat page uses fallback image; no image assigned |
| 202-4296 | Cat Standard-Application Idler Group; 189.8 mm rim width, 545 mm (21.457 in) conventional tread diameter, interchangeable, HDXL; 23.346 in center-flange diameter, 3.681 in center-flange width, 14.646 in shaft length, 1.985 in shaft protrusion, 7.472 in idler-rim width and 4.241 in shaft OD; D6R/D6T family | Existing exact Cat image retained |
| 20R-0268 | Cat Reman C15/C18 Variable Valve Actuator, 12V Cat Brake; official fitment 740/735, C15/C18 industrial and petroleum engines, 772/770 trucks, 834H wheel dozer, 24M grader and 988H loader; same-as-new 12-month Reman warranty | Existing exact Cat image retained |
| 20R-0271 | Cat Reman Variable Valve Actuator, C15/C18, 12V Cat Brake; official fitment specifically C15 truck engine and C18 industrial engine; Cat publishes no structured specifications; same-as-new 12-month Reman warranty | Existing image retained; official gallery only exposed 80px thumbnail |
| 20R-0272 | Cat Reman C15/C18 Variable Valve Actuator, 24V Brake; official fitment C15 truck engine and C18 industrial engine; no structured specifications published; same-as-new 12-month Reman warranty | Existing exact Cat image retained |
| 20R-0505 | Cat Reman G3500 Water Pump; 15.9 in length × 14.6 in height; material listed Plastic/Oil Fluid; official fitment includes G3520/G3516C/G3516E/G3516H, 3512E/3516E, 2016, 789G, 994K, 785G/793D/797/797B and related genset/marine/industrial families | Existing exact Cat image retained |
| 20R-0582 | Cat Reman 3500C HD Cylinder Pack, 14.7:1 compression ratio; Cat publishes no structured specifications; compatible 3516C/3516B/3512C/3512B generator-set, marine, industrial, truck, petroleum and locomotive applications | Existing exact Cat image retained |

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/1W-8922
- https://parts.cat.com/en/catcorp/product/200-5272
- https://parts.cat.com/en/catcorp/product/202-2175
- https://parts.cat.com/en/catcorp/product/202-2783
- https://parts.cat.com/en/catcorp/product/202-4296
- https://parts.cat.com/en/catcorp/product/20R-0268
- https://parts.cat.com/en/catcorp/product/20R-0271
- https://parts.cat.com/en/catcorp/product/20R-0272
- https://parts.cat.com/en/catcorp/product/20R-0505
- https://parts.cat.com/en/catcorp/product/20R-0582

Database checkpoint: all ten rows queried; 202-4296's complete official specifications and description were updated and re-queried. No fallback or unverified kit image was assigned. Overall reviewed progress: 26/500 batches, 260/5,000 products.


## Batch 27/500 — SKUs 261–270 (20R-0583 through 20R-1270)

All ten official Cat Parts Store pages were reviewed and all ten Supabase rows queried. Four records were corrected or completed from official fitment/specification data: 20R-0583, 20R-0615, 20R-0632 and 20R-1270. All four updates were verified with a follow-up query. No fallback or thumbnail-only image was added.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 20R-0583 | Cat Reman 3500 HD Monotherm Cylinder Pack, 14.7:1 compression ratio; preassembled pack; official fitment 3516C generator-set, 3512C/3516C marine auxiliary and marine, 3512B industrial, 3512C/3516C locomotive and 3512C petroleum engine; same-as-new 12-month warranty | No exact high-resolution asset confirmed; no image assigned |
| 20R-0615 | Cat Reman C9 Cylinder Pack, 15.5:1 compression ratio, 8.8L; official fitment C9 marine engine; same-as-new 12-month warranty | Existing exact Cat image retained |
| 20R-0632 | Cat Reman C18 Cylinder Pack, 14.5:1 compression ratio; preassembled liner/piston/rings/pin/retainers/connecting rod/seals; official fitment POWER SYS, C18, D550GC and D600 GC; Cat also lists 0.06 lb in its accessible specification field | Existing exact Cat image retained |
| 20R-0651 | Cat Reman Platinum Engine Overhaul Kit; product title says 3126B and 16.1:1, while Recommended Application says 3216B and Compatible Models lists 3126E truck engine; official horsepower range 210; discrepancy preserved rather than silently normalized | No high-resolution exact asset confirmed; no image assigned |
| 20R-0675 | Cat Reman C280 Fuel Injector; 23.6 in length × 9.3 in height; compatible 3608/3606/C280-16/3616 generator-set, C280-16/-12/-6/-8 marine, C280-12 petroleum and 3612 locomotive engines; same-as-new 12-month warranty | Existing Cat image retained at 384px; no higher-resolution exact asset confirmed |
| 20R-0744 | Cat Reman Gold C15 Engine Overhaul Kit, 18.0:1 compression ratio; includes Bronze Kit 606-0909 ×1 plus six 10R-9611 cylinder pack assemblies; 435–550 hp; official fitment C15 truck engine | Existing Cat image retained |
| 20R-0759 | Cat Reman Basic Fuel Injector, 3408/3412 HIA450 Prime; official Compatible Models lists Industrial Engine 3408E; no structured dimensions published | Existing Cat image retained at 384px |
| 20R-0925 | Cat Reman C13 drilled, fracture-split connecting rod; microalloy/alloy steel; official fitment POWER SYS, C13/XQ350/XQ375 generator set, 623H/621H/627H wheel tractors, 352F OEM solution, industrial C13, excavator 352/352F/349 variants, grader 404F-22, 349E L HVG/352FMHPU mobile hydraulic units and 980K/980K HLG loaders | Existing exact Cat image retained |
| 20R-1136 | Cat Reman C9 Tier 4 Valve Rocker Arm; 6.8 in length × 2.2 in height; broad official fitment including C9.3 generator/marine, C9.3B/C9.3 industrial, graders, loaders, D6/D7 tractors, articulated trucks, excavators and mobile hydraulic power units | Existing Cat image retained at 384px |
| 20R-1270 | Cat Reman 3500B EI800B electronic unit injector; official fitment 3512B/3508B/3516B gen-set engines, SR4B, 3516B GEN, PM3516/PM3512/PM3508, 3512 marine, marine auxiliary, industrial/petroleum/locomotive, 854G wheel dozer and 992G wheel loader; official material field: Grease (Lanolin, Silicone) Fluid | Existing Cat image retained at 384px |

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/20R-0583
- https://parts.cat.com/en/catcorp/product/20R-0615
- https://parts.cat.com/en/catcorp/product/20R-0632
- https://parts.cat.com/en/catcorp/product/20R-0651
- https://parts.cat.com/en/catcorp/product/20R-0675
- https://parts.cat.com/en/catcorp/product/20R-0744
- https://parts.cat.com/en/catcorp/product/20R-0759
- https://parts.cat.com/en/catcorp/product/20R-0925
- https://parts.cat.com/en/catcorp/product/20R-1136
- https://parts.cat.com/en/catcorp/product/20R-1270

Database checkpoint: all ten rows queried; the four official fitment/specification corrections were updated and re-queried successfully. Overall reviewed progress: 27/500 batches, 270/5,000 products.


## Batch 28/500 — SKUs 271–280 (20R-1275 through 20R-2284)

All ten official Cat Parts Store product pages were opened; all ten existing Supabase rows were queried. Three records were updated from the current official Cat source and re-queried: 20R-1275 received the official material field and dimensions; 20R-1516 received the complete official compatible-model list; 20R-2284 received its previously missing dimensions, material and official compatible-model list. The 20R-2284 public page confirms 14.8 in length × 3.0 in height and fitment spanning C27 generator-set, 621/627/637 wheel tractors, C15/C32 petroleum engines, TH48-E70/CX35-P800 transmissions, 825C/826C compactors, 824C/854K wheel dozers, 6040-series shovels, 980H/992K loaders, 735/770G/777 trucks, 657E scraper and 374D L excavator.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 20R-1275 | Cat Reman Electronic Fuel Injector; 14.8 in length × 3.0 in height; official material field Grease (Lanolin, Silicone) Fluid; marine engines 3508B/3516B/3512B/3508/3512, marine auxiliary 3512B, industrial 3508B/3512B/3516B and locomotive 3512B/3516B/3508B | Existing Cat image retained at 384px |
| 20R-1306 | Cat Reman MEUI-C 10mm Fuel Injector, Tier 4 Interim; 12.3 × 4.8 in; C15 industrial and petroleum engines | Existing Cat image retained at 384px |
| 20R-1367 | Cat C18 Reman Long Block, complete ACERT DI-T ATAAC industrial, MEUI, ADEM 4, Tier 3; official fitment 657G wheel tractor and C18 industrial engine; Cat says specifications are not yet published | No image assigned pending confirmation of exact high-resolution asset |
| 20R-1369 | Cat C-15 Reman Long Block, complete ACERT DI-T ATAAC industrial, MEUI, ADEM 4, Tier 3 (C/D/E tier); Cat explicitly says no compatible-model information is currently available | Existing Cat image retained |
| 20R-1516 | Cat Reman Engine Oil Pump; official fitment includes SR5, AD63, C32/C27, 777G, 844H/854K/844K, 24, 6015B/6020B/6030, 993K/990K/990H/992K, MD6250/MD6310, 773E/777E/775G/773D/775F/773G/773F and variants, TH48 | No exact high-resolution image confirmed; no image assigned |
| 20R-1626 | Cat Reman 3500-series Valve Lifter; official fitment covers pumper, 3508/3516C/3516B/3508B/3512B gen sets, PM3516/PM3512/PP3516/PM3508, petroleum, locomotive, 854G/992G/994D, D11N/D11R, marine, mining excavators, industrial engines, 785/797/793C/777/789C/777B/785C/777D/797B trucks and 776D/784C tractors | Existing exact Cat image retained |
| 20R-1828 | Cat Reman 3400-series Valve Lifter; extensive official fitment includes 3406/3408/3412 engines, D8/D9/D10 tractors, 24H/16H/16G graders, C30/C32/3408/3412 marine engines, AD40, 589/587R/583R pipelayers, 5110B mining excavator, 375-A/245 excavators, 623/627/631/637/651/657 wheel tractors, RM-250C/RM-350B/RM-350, 825/844/834/814/824, PR/PM cold planers, 836/826 landfill compactors and 988/990/980/992 loaders | Existing exact Cat image retained |
| 20R-1859 | Cat Reman C27/C32 Water Pump; 17.5 × 9.9 in; official fitment AD63, C27/C32 genset/locomotive/petroleum/industrial, 777G, 854K/844K, 24, 6015B/6030/6020B, 993K/990K/992K, D11T/D10T2/D11, MD6250/MD6310 and 775G/773G/777G truck variants | Existing Cat image retained at 384px |
| 20R-2009 | Cat Reman Double Piston Pump, variable displacement; 48.6 × 23.0 in; official compatible model Hydraulic Shovel 6060 | Existing exact 960px Cat image retained |
| 20R-2284 | Cat Reman Fuel Injector; 14.8 × 3.0 in; official compatible list includes C27 gen set, wheel tractors 621B/627E/637D/623B/627F/621E/631D/621F/623E/633D/623F, C15/C32 petroleum, TH48-E70/CX35-P800, 825C/826C compactors, 824C/854K wheel dozers, 6040/6020B/6030 shovels, 980H/992K loaders, 735/770G/777C/777B/777G trucks, 657E scraper and 374D L excavator | Existing exact Cat image retained |

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/20R-1275
- https://parts.cat.com/en/catcorp/product/20R-1306
- https://parts.cat.com/en/catcorp/product/20R-1367
- https://parts.cat.com/en/catcorp/product/20R-1369
- https://parts.cat.com/en/catcorp/product/20R-1516
- https://parts.cat.com/en/catcorp/product/20R-1626
- https://parts.cat.com/en/catcorp/product/20R-1828
- https://parts.cat.com/en/catcorp/product/20R-1859
- https://parts.cat.com/en/catcorp/product/20R-2009
- https://parts.cat.com/en/catcorp/product/20R-2284

Database checkpoint: all ten rows queried; updates to 20R-1275, 20R-1516 and 20R-2284 were verified. Overall Cat-list progress: 28/500 batches, 280/5,000 products.

## External catalog discovery — Off Road Equipment and Cat SIS (2026-11-24)

- Cat SIS 2.0 catalog scale: Fabick Cat, a Caterpillar dealer, describes SIS 2.0 as containing over 2 million service graphics, 1.5 million part numbers and 44,000 parts/service documents. This supports the approximate prior claim of a 1.6-million-scale Cat parts database, but the verified public figure is 1.5 million, not 1.6 million. SIS is a technical parts/service information system, not a public 1.5-million-item storefront; full desktop SIS has paid access, while basic parts lookup is described as free after linking a Cat account.
- Official reference: https://www.fabickcat.com/online-tools/sis/
- Cat SIS portal: https://sis2.cat.com/
- Off Road Equipment Parts (offroadeq.com) publishes a 500-row popular Cat surplus-parts list and a searchable full-inventory entry point. Its homepage advertises batch import of up to 1,000 SKUs; public search requires login to shop. The business describes thousands of genuine surplus OEM parts; its associated site advertises 100,000+ genuine surplus parts in-house plus a supplier network. It explicitly states it is not an authorized Caterpillar dealer and also sells aftermarket, used and rebuilt goods.
- Off Road public pages: https://offroadeq.com/parts ; https://offroadeq.com/search ; https://offroadeq.com/
- Useful overlap validation: the Off Road 500-popular list includes 1R0749, 1R0762, 1342679 and 1342680, which are already in the current Cat SKU list. This is an independent inventory/discovery source, not proof of Cat official fitment or current availability. Keep its unverified surplus/aftermarket items out of the genuine-Cat catalog until each number is checked against Cat SIS/Parts Store and the seller's condition/brand is confirmed.
- The 500-item Off Road popular list is a discovery queue; do not add all 500 as genuine Cat products without item-level validation.


## Batch 29/500 — SKUs 281–290 (20R-2447 through 20R-3321)

All ten official Cat Parts Store pages were opened; all ten Supabase rows were queried. Official compatibility was newly populated for 20R-2447 and 20R-3317 through 20R-3321, then verified by a follow-up query. Existing detailed kit data for 20R-2647 was checked against Cat's published 49.75 × 15.0 in dimensions and official model list.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 20R-2447 | Cat Reman 3400-series Valve Lifter; Cat publishes no structured dimensions; official compatible gen-set/gas-engine applications POWER SYS, G3412C, CG137-12/CG137-08, G3406, G3412, G3408C/G3408B/G3408 and XQG400 power module | No high-resolution image confirmed; no image assigned |
| 20R-2647 | Cat Remanufactured Cylinder Head Assembly Kit; 21 component lines; 49.75 in length × 15.0 in height; official compatibility includes XQP500/XQP550/SR4 generators, AD30/AD45/AD55, C15/C16/C18/3406E, R2900/R3000H LHD, 772/770/773GC trucks, 24M grader, 6015/6018/6030 shovels, D8/D9 tractors, MD6200 drill, 587T/583T/PL83/PL87 pipelayers, 374/385/390 excavators and several petroleum powertrain applications | Existing exact Cat image retained |
| 20R-2734 | Cat Reman Turbocharger; 15.6 × 17.0 in; official compatible model Marine Engine C18; Cat Reman 12-month warranty | Existing exact Cat image retained |
| 20R-2861 | Cat C9 Reman Short Block, 9.3L Tier 4; includes block, crankshaft, pistons and connecting rods; official compatible D6T XW/LGP/XL, D7E, 627H, 586C, 336E/568 FM excavator variants, 12M 2/160M 2/140M 2 graders, 336E mobile hydraulic power units and 966K/972K/966K XE loaders | Existing exact Cat image retained |
| 20R-3163 | Cat Reman Turbocharger; 15.1 × 15.9 in; official compatible gen-set engines 3408B/3408C/3408, marine engines 3408B/3408/3412 and gas engines G3408C/G3408/G3408B | Existing exact Cat image retained |
| 20R-3317 | Cat Reman Valve Rocker Arm; official fitment includes C15 truck engine, C32 power module/marine, 631K/637K/657 wheel tractors, R2900 LHD, 777G, MH3295, 24M, 6030-series shovel, D8/D9/D10/D11 tractor variants, MD6200 drill, PL83/PL87 pipelayers, 374F/390F excavators, C18/C27/C32 genset and petroleum applications, 740/740B ejector trucks, RM500B, 825K, 834/824/854/844 dozers, 836K/826K landfill compactors and 986/988/990/992 loaders | Existing exact Cat image retained |
| 20R-3318 | Cat Reman C15 Valve Rocker Arm; official compatible list includes XQP500/SR4, AD30, C15/C16/C18/3406E, PM3456/C32/C18, 631K/637K, R2900/R3000H, 773GC, 24M, 6015/6018, D8/D9/D10/D11, MD6200 and marine C15/C18/C32 applications | Existing image field was null; no new image assigned |
| 20R-3319 | Cat Reman Unit Injector Rocker Arm; official compatible SR5, C27/C32 genset/petroleum, 631K/637K, C15, 740/740B, 834H/834K/854K/844H/844K, 24M/24, 6015B/6040/6020B/6030, 993K/988/992/986/990 loaders and D10/D11 tractor variants | Existing exact Cat image retained |
| 20R-3320 | Cat Reman Valve Rocker Arm; official compatibility includes SR4, AD30, C15/C16/C18/3406E, PM3456, D8/D9, 583T/587T, 385C/5090B excavators, 623/621/651/657/627/631/637 wheel tractors and related applications | Existing exact Cat image retained |
| 20R-3321 | Cat Reman Valve Rocker Arm; Cat's official fitment list matches the published 20R-3320 model families in the accessible section, including SR4, AD30, C15/C16/C18/3406E, PM3456, D8/D9, 583T/587T, 385C/5090B and 623/621/651/657/627/631/637 wheel tractors | Existing exact Cat image retained |

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/20R-2447
- https://parts.cat.com/en/catcorp/product/20R-2647
- https://parts.cat.com/en/catcorp/product/20R-2734
- https://parts.cat.com/en/catcorp/product/20R-2861
- https://parts.cat.com/en/catcorp/product/20R-3163
- https://parts.cat.com/en/catcorp/product/20R-3317
- https://parts.cat.com/en/catcorp/product/20R-3318
- https://parts.cat.com/en/catcorp/product/20R-3319
- https://parts.cat.com/en/catcorp/product/20R-3320
- https://parts.cat.com/en/catcorp/product/20R-3321

Database checkpoint: all ten rows queried; fitment updates for 20R-2447 and 20R-3317–20R-3321 were re-queried successfully. Overall reviewed progress: 29/500 batches, 290/5,000 products.


## Batch 30/500 — SKUs 291–300 (20R-3322 through 20R-3623)

All ten official Cat Parts Store pages were opened and all ten Supabase rows queried. Official compatibility fields were completed/corrected for 20R-3323, 20R-3324, 20R-3440, 20R-3441, 20R-3442, 20R-3543, 20R-3545, 20R-3549 and 20R-3623; the updates were re-queried. 20R-3322's existing broad official fitment was reviewed and retained.

| SKU | Official identity / verified detail | Image treatment |
|---|---|---|
| 20R-3322 | Cat Reman Unit Injector Rocker Arm; official extensive fitment includes SR4/XQP500, AD30, 3406E/C15/C16/C18, PM3456, R2900/R3000H, 773GC, 24M, 6015/6018 shovels, D8/D9 tractors, MD6200, 583T/587T/PL83/PL87, 374F/390D/385C excavators, C18/C15/C9/3456/C27 generator/petroleum applications, 631/623/651/657/621/627/637 tractor-scrapers, RM500B/RM-500, 825, 834/824, 826/836 compactors, 986/980/988 loaders, Challenger MT/MTC series, 735/770G/772G and related truck applications | Existing exact Cat image retained |
| 20R-3323 | Cat Reman C15 Unit Injector Rocker Arm; official fitment D8T, POWER SYS, 651E/657E wheel tractors, C27 generator set/industrial engine, C15 truck engine, PM620/PM622/PM820/PM825/PM822 cold planers, 854K dozer, 826K compactor, 6015B/6030 T4/6030 shovel and 988K/993K loaders | No image assigned |
| 20R-3324 | Cat Reman Valve Rocker Arm; official Compatible Models explicitly lists Truck Engine C15 only | Existing exact Cat image retained |
| 20R-3440 | Cat 3508 Reman Bare Block; official fitment SR4B, 3508/G3508/3508B gen sets, PM3508, 3508C/3508B petroleum and locomotive engines, 854G, 992G, D11R/D11N, 5130/5130B mining excavators, 777-series trucks, G3508B/G3508J gas engines and 776D/776C tractors | Existing Cat image retained |
| 20R-3441 | Cat 3512 Reman Bare Block, service 12-cylinder; official fitment SPF343/SPF343C, SR4B, G3512E/3512/G3512/3512C/3512B, XQC1200/PM3512, MD6540C, 785/797/785C/777D/785D/797B/785B trucks, CAT WDS, G3512B and 784C tractor | Existing Cat image retained |
| 20R-3442 | Cat 3516 Reman Bare Block; official compatible Power Module 3516B/3516C and Gas Engine G3516B | Existing Cat image retained |
| 20R-3543 | Cat Reman D3500B Cylinder Head, shot-peened; official fitment includes 3508/3516B/3516C/3508B/3512C/3512B generator and power modules, 854G, 992G/994F/994D/994H loaders, D11N/D11R, 5230B/5130B mining excavators, 785/789/797/793/777/785C/777D/797B trucks and 776D/784C tractors | Existing exact Cat image retained |
| 20R-3545 | Cat Reman D3500C Cylinder Head, nitrided valve seats; official fitment includes 3508/3516C/3516B/3508B/3512C/3512B, PM3516/PM3512/XQC1200/XQC1600/PP3516/PM3508, TH48-E80/TH48-E70, MD6540C, D11N/D11R, 5230B/5130B, 785/789/797/793D/777/789C/789D/777C/777B/789B/785C/777D/785D/797B/785B and 776D/784C | Existing exact Cat image retained |
| 20R-3549 | Cat Reman G3500 Cylinder Head, 3-angle valve seat; 11.55 in width × 16.55 in length × 10.1 in height; 106.9 lb; official G3516B/G3516/G3512 gen-set, SR4B generator, PMG3516 and gas engines G3516B/G3508B/G3520B/G3508/G3516J/G3508J/G3512B/G3512/G3520J/G3512J | Existing exact Cat image retained |
| 20R-3623 | Cat Reman 3500-series Turbocharger; Cat publishes no structured dimensions; official fitment gen-set engines 3512/3516/3508, G3512 generator set, marine 3508/3516/3512, industrial 3512/3508 and G3512 gas engine | No exact high-resolution image confirmed; no image assigned |

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/20R-3322
- https://parts.cat.com/en/catcorp/product/20R-3323
- https://parts.cat.com/en/catcorp/product/20R-3324
- https://parts.cat.com/en/catcorp/product/20R-3440
- https://parts.cat.com/en/catcorp/product/20R-3441
- https://parts.cat.com/en/catcorp/product/20R-3442
- https://parts.cat.com/en/catcorp/product/20R-3543
- https://parts.cat.com/en/catcorp/product/20R-3545
- https://parts.cat.com/en/catcorp/product/20R-3549
- https://parts.cat.com/en/catcorp/product/20R-3623

Database checkpoint: all ten rows queried; nine official fitment field updates were re-queried successfully. Overall reviewed progress: 30/500 batches, 300/5,000 products.
