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


## Batch 31/500 — SKUs 301–310 (20R-3666 through 20R-4292)

All ten Cat Parts Store product pages were opened and all ten Supabase rows were queried. Official model-compatibility data was checked against the page-level Compatible Models sections. Two database corrections were made and re-queried:
- 20R-4147: added official compatible model 3412E (Marine Engine). The Cat page also confirms dimensions 14.2 in length × 5.3 in height.
- 20R-4195: replaced the empty compatible-model array with the official model list: C18 GEN SE, C18 GENSET, C18, 657E, 631K, 651E, 657, 637K, 740, PM620, PM622, PM820, PM825, PM822, MH3295, 834K, 836K, 988K XE, 988K, D9T, POWER SYS, 745C, 745, 740C, MD6200, 772G, 772G OEM, 390F, 390F L, CX31-C18I, CX35-C18I. Cat page does not publish structured dimensions/specifications for this part.
- 20R-3666: official Cat page confirms kit component 582-7467 ×1 and a large fitment list across wheel tractors/scrapers, LHD, graders, loaders, track tractors, articulated trucks, pipelayers, industrial engines, excavators, petroleum packages and mobile hydraulic power units. Existing DB fitment was reviewed against this page.
- 20R-3915: official compatible models include D1500, 775G/775F/773G/773F/777G/777F, 854K/844K, 24, 990K/993K/992K/992.
- 20R-4263/4264: C175-16 common-rail fuel rail RH/LH. Official applications include C175-16 generator, truck 793F/795F AC/794 AC variants, off-highway 796 AC/798 AC; 4264 additionally lists marine and industrial engine applications.
- 20R-4266/4267: C175-20 common-rail fuel rail RH/LH; official fitment C175-20 generator set and 797F/797/797B trucks.
- 20R-4277: 3406C reman complete long block; Cat fitment D8R/D8R II, 621E/F, 623E/F/B, 627E/F, 825G, 824G/824G II, 826G/826G II, 980G/980G II.
- 20R-4292: G3306 auxiliary fresh-water pump; official fitment G3306 generator set, XQG135 power module, G3304/G3306B/G3306 gas engines and G3306B petroleum gen set.
- 20R-4147: Cat Reman basic injector for 3408/3412; Cat's actual Compatible Models section lists Marine Engine 3412E only. Kept engine family separately and added only the published compatible model.

Official Cat pages checked:
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

Database checkpoint: all ten rows queried; corrections for 20R-4147 and 20R-4195 were re-queried successfully. Overall reviewed progress: 31/500 batches, 310/5,000 products.

## Additional part-number discovery sources and source policy

The search strategy is now explicitly multi-source; sources below are for discovering candidate numbers and cross-references, not automatic proof of genuine Cat status or machine fitment.

1. Off Road Equipment — https://offroadeq.com/parts
   - Public page advertises 500 frequently searched Caterpillar part numbers and links to its full inventory search. It describes its inventory as a mix of genuine surplus OEM and aftermarket parts; its legal/about pages state it is not an authorized Caterpillar dealer. Use the public 500 list and individual item details as independent discovery leads only. Full inventory search is gated behind account/login.
   - Search page: https://offroadeq.com/search (supports batch import/search; access requires login).
2. Tractorparts.com Cat interchange database — https://www.tractorparts.com/interchanges.php?table=Cat_Part
   - Independent Cat part-number/interchange lookup. The site explicitly says its database is in a test phase and warns that entries can contain errors. Use as an unverified cross-reference lead, not fitment authority.
3. ConEquip parts books — https://www.conequip.com/parts-books
   - Independent parts-book/diagram assistance covering Caterpillar and other heavy-equipment makes; useful to discover OEM reference numbers from illustrated assemblies and equipment breakdowns.
4. Cat public Parts Reference Guides — https://www.cat.com/en_US/support/maintenance/parts-reference-guides.html
   - Model-family reference guides can seed candidate part numbers by equipment family.
5. Cat Parts Store cross-reference — https://parts.cat.com/en/catcorp/cat-parts-cross-reference
   - Official cross-reference for competitor filter numbers to Cat equivalents; use when building filter replacement/cross-reference records.
6. Cat SIS / Parts Manuals — https://sis2.cat.com/ and https://parts.cat.com/en/catcorp/parts-diagram
   - High-authority parts diagrams and serial-number-based lookup. Access to detailed SIS content may require account/dealer access.

Source-status rules:
- Preserve a source URL, retrieval date, source class and confidence for every discovered candidate.
- A part number found only on an independent reseller or interchange database remains `independent_candidate` / `needs_verification`.
- Verify genuine Cat identity against Cat Parts Store, Cat parts books/SIS or a Cat dealer source before marking `cat_verified`.
- Verify compatibility against exact model/serial-number configuration; do not infer compatibility from a broad engine-family mention.
- Keep aftermarket, surplus, used, rebuilt and Cat Reman conditions distinct. Never convert seller inventory into an assertion of new genuine Cat stock.
- Do not import seller prices as authoritative Cat pricing; record seller, condition, currency, date and source if later captured.


## Expanded independent-source discovery — additional 44 candidates

Beyond Off Road's public 500-popular-parts index, additional independent catalogs and technical documents were located and used to create a second segregated discovery queue:
- `data/cat-part-number-discovery-independent-suppliers.txt` — 44 rows from supplier catalogs, aftermarket references, bogie application charts and a scanned Cat 3116 parts manual.
- Source families include EMS Pumps, Costex alternators, Rivtron turbocharger cross-references, Jereh hydraulic-pump catalog, DMC/BDI undercarriage and bogie references, IPD cylinder-liner literature, and a scanned Numeralkod-hosted Cat 3116 parts manual.
- Examples of newly surfaced candidate numbers include 1038264, 1192924, 1164624, 1217385, 1125041, 1693345, 2035492, 2128622, 2128561, 7C7691, 0R6333 and multiple 1U-series pump cartridges.
- Some rows are cross-reference/supersession/kit/component numbers (e.g. 6E5280, 854923, 874738, 2W8625, 9T5976, 8J5407, 2P9239, 1131526, 6P7788, 1342679K, 1342680K, 7C5567). They must not be treated as independent standalone Cat SKUs without checking.
- Search results confirmed useful independent technical evidence: EMS lists pump applications and cross-references; Costex lists alternator part numbers with engine/machine application columns; DMC/BDI show bogie assembly/component numbers by D9 model; IPD documents 1979322 and its liner kit form; Rivtron cross-references 7C7691 with other turbo numbers. These sources do not establish Cat authorization or new genuine stock.
- Direct Cat Parts Store product URLs for the initial 12 candidates did not return readable records through the public page fetch, so those rows remain unverified. The next verification path is Cat Parts Store search, SIS/parts manuals or dealer confirmation; no candidates were promoted to the official SKU list.

Discovery queue totals created in this pass: 91 Off Road rows + 44 independent supplier/technical-reference rows = 135 entries. Three numbers overlap across the queues (1003259, 1005047, 1150637), so the combined set contains 132 unique candidate numbers, all segregated from the 787-item initial Cat source list and marked for verification.


## Batch 32/500 — SKUs 311–320 (20R-4306 through 20R-5379)

All ten Cat Parts Store pages were opened and all ten Supabase rows queried. Official compatibility was checked against the Cat page's Compatible Models section. Three DB fitment corrections were applied and re-queried:
- 20R-4505: Cat Reman C13 Tier 4 unit-injector rocker arm. Added the official list including XQ425/C13/XQ375, 621K OEM, 352F OEM, C13B, 730C2 EJ, R1700K, 18M3/16M3/14M3/404F-22, 982M/980M, POWER SYS, 730/735, 352F/349F/352 family and 352FMHPU.
- 20R-5075: Cat Reman CR350 common-rail fuel injector for C9. Added official fitment D6T/D7E, 725C/725/725C2, PL72, 627K/637K, 336F/340F family, PM312/PM313/PM310, 140M/150/12M/160M grader family, 336FMHPU, 973 and 966M/972M loaders.
- 20R-5379: Cat C9 Reman complete long block (4-valve, HEUI-B, ATAAC, Tier 3, HEP 10, ADEM 4). Cat page's Compatible Models section lists Industrial Engine C9; added `C9` to compatible_models.
Other records reviewed:
- 20R-4306: C9 cylinder pack, 17.0:1, 9.3L, Tier 4; Cat official compatible list reviewed across SR4B/C9.3, 627K/637K, PM312/313/310, graders, loaders, D6T/D7E, articulated trucks, marine/industrial C9.3, PL72, excavators, mobile hydraulic unit and 973 track loader. Existing DB fitment retained.
- 20R-4602: C175 Gen II crankshaft damper; official C175-16/C175-20, 793F/795F family and 798/794 AC/796 AC off-highway truck applications reviewed; DB retained.
- 20R-4700: Cat Reman crankshaft damper; CP-563C vibratory compactor and 120H ES grader; DB retained.
- 20R-5005: Cat Reman C18 turbocharger cartridge; POWER SYS, C18 generator set, marine C18 and C18 petroleum package; DB retained.
- 20R-5152: Cat Reman basic 10 mm fuel-injection pump; official extensive 3406/3408/3412, truck, scraper, tractor, marine, industrial, loader, dozer and excavator fitment reviewed; DB retained.
- 20R-5191: 3500-series auxiliary seawater pump; Cat fitment spans 3508/3512/3516 gen-set, marine, auxiliary marine, industrial and G3512/G3516 gas engines; DB retained.
- 20R-5199: C175-16 Reman UTN bare block; official C175-16 generator/marine/industrial/petroleum/locomotive and 793F/795F/798/794 AC/796 AC truck family fitment reviewed; DB retained.

Official Cat pages checked:
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

Database checkpoint: all ten rows queried; fitment corrections for 20R-4505, 20R-5075 and 20R-5379 were re-queried successfully. Overall reviewed progress: 32/500 batches, 320/5,000 products.


## Batch 33/500 — SKUs 321–330 (20R-5393 through 20R-6518)

All ten Cat Parts Store product pages were opened and all ten Supabase rows queried. Official Compatible Models sections were checked. One material DB correction was applied and re-queried:
- 20R-5681: Cat Reman UTN Valve Rocker Arm. DB previously had empty engine/compatible-model arrays. Added engine models C27/C32 and the Cat-published fitment list: SR5, AD63, C27/C32, 777G, 854K/844H/844K, 24, 6015B/6040 FS/6040/6020B/6030 T2/6030, 993K/992K/990K/990H, D10N/D10R/D10T2/D10T/D11/D11R/D11T, MD6310/MD6250, 775G/775F/773G/773F/777C/777B/777D/777G/777F/777E and TH48-E70/CX35-P800. Re-query confirmed the new values.
Other records reviewed:
- 20R-5393: Cat C175 Gen I crankshaft damper; official C175-20 generator set and 797F/797/797B trucks; DB matched.
- 20R-5420: G3520 basic crankshaft damper; official G3520 gen-set engine and G3520C/E/H generator sets; DB matched.
- 20R-5462: 24V 50MT starter solenoid kit; Cat page publishes a broad cross-family fitment list across generator, mining, truck, grader, track tractor, marine, excavator, loader, dozer and engine families; existing DB array reviewed and retained.
- 20R-5566: CR1100 common-rail fuel injector for C175; official C175-16/C175-20 generator sets, C175-16 marine/industrial/locomotive, 797/793F/795F truck families and 796 AC/798 AC off-highway trucks; DB matched.
- 20R-5616: 3500 HD cylinder pack, 15.3:1; official 3516B/3512B gen sets, 793D/793C/797/797B trucks, 3512B/3516B locomotive and 994F/994H loaders; DB matched.
- 20R-5629: 3512/3516 cylinder pack, 14.7:1; official marine 3516C/3512C and 962K loader; DB matched.
- 20R-5677: Cat PL542 electronic control/telematics assembly; official fitment spans compact/miniexcavators, excavators, drills, loaders, graders, tractors, pavers, trucks, marine, petroleum, generator and industrial/gas engine families; DB's broad list reviewed and retained.
- 20R-6263: 3400-series valve rocker arm; Cat page lists broad fitment including 3406/3408/3412 engines, D7–D10 tractors, 245/375 excavators, 621/627/631/637/657 wheel tractors, 825/826/836 compactors, 980/988/992 loaders, 769/773/775 trucks, marine, gen-set and gas engines; DB reviewed and retained.
- 20R-6518: G3600 A4 reman cylinder head; official marine C280-16/C280-6, industrial G3606B and gas engines G3608/G3612/G3606/G3616; DB matched.
- 20R-5462 Cat page does not publish structured specifications; no unsupported specs were added.

Official Cat pages checked:
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

Database checkpoint: all ten rows queried; 20R-5681 engine and compatible-model fields updated and re-queried successfully. Overall reviewed progress: 33/500 batches, 330/5,000 products.


## Batch 34/500 — SKUs 331–340 (20R-6618 through 20R-7555)

Ten source-list entries and Supabase rows were checked. Nine Cat Parts Store product pages were opened and inspected; the public page for 20R-7555 was inaccessible through the current fetch route, so its existing DB record was not changed. Three DB compatibility corrections were applied and re-queried:
- 20R-6618: D3500 Monotherm cylinder pack, 14.0:1. Cat publishes a real fitment list: 3516B GEN/3516B/3512B, PM3516, 854G, 994D/992G, D11R/D11N, 5230B/5130B, 785/789/793D/793C/789C/789D/777B/789B/785C/777D/785D/785B, and 776D/784C. Added to DB.
- 20R-6628: G3600 prechamber kit with Cat Reman check valve; Cat page's compatible models are industrial G3606B and gas engines G3608/G3612/G3606/G3616. Added to DB.
- 20R-7411: C15 Platinum engine overhaul kit, 18.0:1. Cat page's Compatible Models lists Truck Engine C15; added to DB.
Other records reviewed:
- 20R-6833: 24V Cat Brake variable valve actuator; official fitment covers 740/745/735 articulated trucks, 631K/637K/657 tractors/scrapers, C15/C18 industrial engines, 770/772G trucks/quarry trucks, 834H/834K dozers, 24M grader and 988/986 loaders; DB matched.
- 20R-7175: Tier 3 auxiliary seawater pump (3406E/C18); official POWER SYS, C18 gen-set/marine/petroleum package and C-15 petroleum engine; DB matched.
- 20R-7306: Cat Reman 24V UTN HID flood lamp; Cat page explicitly marks it Discontinued and says part is no longer available. DB is_active=false and availability_status=Discontinued; retained.
- 20R-7307: Cat Reman 24V UTN HID flood lamp; official fitment D10T2/D10T/D11T, IT62H, 613G, 793/795/797/773/789/785/777 truck families, CAT WDS, 345D/349D/320D/374D/390D excavators, dozers, graders, landfill compactors and loaders; DB fitment reviewed.
- 20R-7547: 3406B camshaft kit; Cat lists Truck Engine 3406C/3406B and Industrial Engine 3406B; DB matched.
- 20R-7549: 3406C camshaft kit; Cat lists Truck Engine 3406C; DB matched.
- 20R-7555: 3408 camshaft kit; Cat page fetch failed. DB remains at recommended application 3408 only; no fitment inferred.

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/20R-6618
- https://parts.cat.com/en/catcorp/product/20R-6628
- https://parts.cat.com/en/catcorp/product/20R-6833
- https://parts.cat.com/en/catcorp/product/20R-7175
- https://parts.cat.com/en/catcorp/product/20R-7306
- https://parts.cat.com/en/catcorp/product/20R-7307
- https://parts.cat.com/en/catcorp/product/20R-7411
- https://parts.cat.com/en/catcorp/product/20R-7547
- https://parts.cat.com/en/catcorp/product/20R-7549
- https://parts.cat.com/en/catcorp/product/20R-7555 (fetch inaccessible)

Database checkpoint: all ten rows queried; corrections for 20R-6618, 20R-6628 and 20R-7411 were re-queried successfully. Overall reviewed progress: 34/500 batches, 340/5,000 products.


## Batch 35/500 — SKUs 341–350 (20R-7560 through 20R-8390)

All ten Supabase rows were queried. Cat Parts Store pages were publicly readable for 20R-8060, 20R-8380 and 20R-8381; the remaining seven product URLs were inaccessible through the current page-fetch route, so no unsupported changes were made.
- 20R-8060: Cat Reman H1315B fuel injector, C9, 1.96 SF; Cat's Compatible Models section explicitly lists Truck Engine C9. Existing DB engine_models/compatible_models already contain C9; retained.
- 20R-8380: Cat Parts Store title CLUTCH-FAN, brand Cat. Page says no description, no structured specifications and explicitly no compatibility information. Existing empty technical fields and null image retained.
- 20R-8381: Cat Parts Store title CLUTCH-FAN, brand Cat. Page says no description, no structured specifications and explicitly no compatibility information. Existing empty technical fields and null image retained.
- 20R-7560: 3412 camshaft kit; Cat page inaccessible in this pass. Existing recommended application 3412 retained; no compatible model inferred.
- 20R-8352, 20R-8360, 20R-8364, 20R-8369, 20R-8373 and 20R-8390: fan-clutch records already have no Cat-published description/specification/fitment in DB. Individual Cat product pages could not be read during this pass; no speculative details added.

Pages checked:
- https://parts.cat.com/en/catcorp/product/20R-7560 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-8060 (readable; C9 truck engine confirmed)
- https://parts.cat.com/en/catcorp/product/20R-8352 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-8360 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-8364 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-8369 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-8373 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-8380 (readable; Cat says no compatibility information)
- https://parts.cat.com/en/catcorp/product/20R-8381 (readable; Cat says no compatibility information)
- https://parts.cat.com/en/catcorp/product/20R-8390 (inaccessible)

Database checkpoint: all ten rows queried; no DB changes required because accessible pages confirmed existing data or explicitly supplied no compatibility data. Overall reviewed progress: 35/500 batches, 350/5,000 products.


## Batch 36/500 — SKUs 351–360 (20R-8403 through 20R-9480)

All ten Supabase rows were queried. Cat Parts Store pages were read for nine entries; 20R-8403 remained inaccessible. Findings and DB updates:
- 20R-8403: source page inaccessible; DB has no technical claims; retained unchanged.
- 20R-8406: official Cat page identifies CLUTCH-FAN, Cat brand, Remanufactured/Non-Returnable/Kit/Replaced; page explicitly says no description, specifications or compatibility information. DB correctly remains empty for those fields.
- 20R-8418: official Cat page identifies CLUTCH-FAN and says it has no compatibility information; DB has no unsupported fitment.
- 20R-8517: Cat Reman valve rocker arm (additional lube supply). Official fitment is D10T, D1500, C32 MARINE, C27 locomotive and motor grader 24. Existing DB data reviewed; compatible_models contains the Cat model list and engine_models C32/C27.
- 20R-8812: Cat Reman auxiliary fresh-water pump. Cat page confirms extensive fitment across SR4B, 3500-series gen sets and power modules, 789D, 854G, 994/992G/994F/994D/994H, 5230B/5130/5130B, marine, industrial, gas-engine and 776D/776C/784C families. Existing DB fitment reviewed and retained.
- 20R-8981: 3600-series valve lifter. Cat page confirms G3606B industrial and G3608/G3612/G3606/G3616 gas-engine fitment and explicitly marks it discontinued/no longer available. DB already has these compatible models and is_active=false; retained.
- 20R-9045: Cat Reman counterclockwise gear pump. Cat page explicitly lists C280-6 marine engine, G3606B industrial engine, and G3608/G3612/G3616 gas engines. Added these five compatible-model values to DB and re-queried.
- 20R-9122: 3600-series standard-rotation water pump. Cat page says no compatibility information; DB correctly keeps compatible_models empty.
- 20R-9124: 3600-series standard-rotation water pump. Cat page says no compatibility information, but publishes material “Oil Fluid, Plastic Plastic”. Added this material to specifications and re-queried; no fitment inferred.
- 20R-9480: 3512E DGB Tier 4 Monotherm cylinder pack. Cat page confirms compatible Engine 3512E; DB already contains 3512E.

Additional discovery: Cat Parts Store pages expose related-parts / frequently-bought-together references. Created `data/cat-linked-parts-discovery.txt` with 16 linked candidate rows from 20R-8981, 20R-9045, 20R-9124 and 20R-9480. These are not assumed interchangeable or fitment-compatible; each needs its own product-page and serial-number verification. Fifteen of the listed numbers are new relative to the original 787-item list; one is already present there.

Official Cat sources checked:
- https://parts.cat.com/en/catcorp/product/20R-8403 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-8406
- https://parts.cat.com/en/catcorp/product/20R-8418
- https://parts.cat.com/en/catcorp/product/20R-8517
- https://parts.cat.com/en/catcorp/product/20R-8812
- https://parts.cat.com/en/catcorp/product/20R-8981
- https://parts.cat.com/en/catcorp/product/20R-9045
- https://parts.cat.com/en/catcorp/product/20R-9122
- https://parts.cat.com/en/catcorp/product/20R-9124
- https://parts.cat.com/en/catcorp/product/20R-9480

Database checkpoint: all ten rows queried; updates for 20R-9045 compatible_models and 20R-9124 material were re-queried successfully. Overall reviewed progress: 36/500 batches, 360/5,000 products.


## Batch 37/500 — SKUs 361–370 (20R-9564 through 211-2660)

All ten Supabase rows were queried. Eight Cat product pages were readable; 20R-9564 and 20R-9566 could not be fetched. Two compatibility corrections were applied and re-queried:
- 20R-9565: Cat Reman transfer gear; official compatible articulated trucks 725 and 725C2. Added both.
- 20R-9567: Cat Reman transfer gear; official compatible articulated truck 735B. Added.
Other records:
- 20R-9564 and 20R-9566: transfer gear records; official page fetch unavailable; no compatibility or technical data inferred.
- 20R-9654: Cat Reman C175 valve lifter; official fitment C175-16 engine, 795F XQ/795F AC trucks, 798 AC off-highway truck. Existing DB values match.
- 20R-9847: Cat Reman water pump; official D450GC/D500GC generator sets and C15 truck engine. Existing DB values match.
- 20R-9976: Cat Reman engine water pump; dimensions 8.22 in H × 10.27 in L × 8.43 in W; compatible articulated truck 730 and industrial engine C13. Existing DB values match.
- 210-1471: Cat fuel-pump priming tube assembly; 12.58 mm ID, 37-degree single-flared nuts both ends, carbon steel; fitment includes 3500-series gen sets, marine, marine auxiliary, industrial and petroleum engines. Existing DB fitment/specs reviewed and retained.
- 210-2535: Cat fuel-injection line tube assembly; 12.58 mm ID, 37-degree single-flared nuts, fitment across 3500-series generator, marine, marine auxiliary, industrial, locomotive, off-highway truck and petroleum engine applications. Existing DB reviewed and retained.
- 211-2660: Cat standard-efficiency cabin air filter; official dimensions height 1.398 in with seal / 1.004 in without, width 6.457 in, length 15.748 in; Urethane Panel, standard media; broad official fitment for 415F2 IL, 775G/773G/777G trucks, backhoe loaders and motor graders. Existing DB fitment/specs reviewed and retained.

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/20R-9564 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-9565
- https://parts.cat.com/en/catcorp/product/20R-9566 (inaccessible)
- https://parts.cat.com/en/catcorp/product/20R-9567
- https://parts.cat.com/en/catcorp/product/20R-9654
- https://parts.cat.com/en/catcorp/product/20R-9847
- https://parts.cat.com/en/catcorp/product/20R-9976
- https://parts.cat.com/en/catcorp/product/210-1471
- https://parts.cat.com/en/catcorp/product/210-2535
- https://parts.cat.com/en/catcorp/product/211-2660

Database checkpoint: all ten rows queried; 20R-9565 and 20R-9567 compatible_models corrections were re-queried successfully. Overall reviewed progress: 37/500 batches, 370/5,000 products.


## Batch 38/500 — SKUs 371–380 (211-3022 through 223-9250)

All ten Supabase rows were queried and all ten Cat product pages were readable. Four major DB updates plus supporting specification corrections were applied and re-queried:
- 211-3022 / 211-3023 / 211-3026: Cat fuel injector groups. Official page data confirms dimensions 14.8 in length × 3.0 in height and material “Grease (Lanolin, Silicone) Fluid”. Added the material to each specifications JSON; fitment already matched.
- 212-8174: Cat water pump group is explicitly discontinued and no longer available. Cat page shows 10R-9598 as the alternative Cat Reman auxiliary seawater pump. Set is_active=false and recorded availability_status=Discontinued and replacement_part_number=10R-9598.
- 216-7815: Cat turbocharger group. Official fitment is C-9 engine-machine, C-9 industrial engine, 637G/637D wheel scrapers, 330C L/330C LN excavators and 330C mobile hydraulic power unit. Updated compatible_models accordingly; 15.6 in length × 17.0 in height already present.
- 221-0129: Cat engine prelubrication pump. Official fitment includes gen-set engines 3612/3608/3606/3616, marine engines C280-16/3616/3618/3612/C280-12/C280-6/C280-8, and petroleum engine C280-12. Updated compatible_models to the full published list.
- 222-5152: Cat Main Water Pump Rebuild Kit. Expanded compatible_models from a small engine-only subset to Cat's published machine/application list across generator/power modules, 3500-series engine families, petroleum and locomotive engines, 994/980K loaders, mining excavators, trucks, marine, industrial, spray, excavator, tractor and petroleum-package applications. Captured the official 11-line kit BOM in specifications: 0S-1618 ×2, 166-4374 ×1, 212-8180 ×1, 212-8184 ×1, 271-4926 ×1, 3D-2824 ×1, 416-0603 ×1, 4N-5834 ×2, 7N-4758 ×1, 8C-5236 ×1, 9M-1974 ×2. Re-query confirms 11 component lines.
- 223-9250: Cat Basic Engine Cylinder Head with valve mechanism components. Expanded compatible_models from four engine names to the complete Cat page model list covering SR4/XQP500, AD55/AD30, C15/C16/C18/3406E, PM3456, R2900G, 773GC, 24M, D8/D9, marine, pipelayers, excavators/front shovels, generator sets, wheel tractors/scrapers, road reclaimers, compactors, loaders, dozers, articulated trucks, drills, industrial and petroleum applications. Existing 50.0 in length × 11.0 in height retained.
Other records:
- 211-3022: official Truck Engine fitment C-15/3406E; DB already matched.
- 211-3023: official Truck Engine fitment C-15/C-16/3406E; DB already matched.
- 211-3026: official Gen Set Engine 3456, Truck Engine C-18, Marine Engine 3406E; DB already matched.
- 221-0132: Cat page loaded only a partial product shell in this pass; existing C280-family record retained without inferred additional fitment.
- 223-8225: official Generator Set C18 and Marine Engine C18/3412E/3126; DB matched.

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/211-3022
- https://parts.cat.com/en/catcorp/product/211-3023
- https://parts.cat.com/en/catcorp/product/211-3026
- https://parts.cat.com/en/catcorp/product/212-8174
- https://parts.cat.com/en/catcorp/product/216-7815
- https://parts.cat.com/en/catcorp/product/221-0129
- https://parts.cat.com/en/catcorp/product/221-0132
- https://parts.cat.com/en/catcorp/product/222-5152
- https://parts.cat.com/en/catcorp/product/223-8225
- https://parts.cat.com/en/catcorp/product/223-9250

Database checkpoint: all ten rows queried; corrections for 212-8174, 216-7815, 221-0129, 222-5152 and 223-9250 plus injector-group material attributes were applied and re-queried. Overall reviewed progress: 38/500 batches, 380/5,000 products.


## Further Cat-origin discovery from BOM and cross-links

The 222-5152 official rebuild-kit page exposes an 11-line component BOM. Additional Cat pages also expose related/alternate parts and frequently-bought-together numbers. Appended 27 new entries to `data/cat-linked-parts-discovery.txt`, including BOM components 0S-1618, 166-4374, 212-8180, 212-8184, 271-4926, 3D-2824, 416-0603, 4N-5834, 7N-4758, 8C-5236 and 9M-1974; replacement/alternate 10R-9598 and 10R-0823; and related numbers such as 425-6526, 230-3728, 450-9233, 130-3212, 242-4100, 448-3228 and 210-1470. The BOM confirms kit membership; related panels are leads only and do not independently prove compatibility.

Recount after deduplication across all three discovery queues:
- Off Road queue: 91 rows.
- Independent supplier/technical-reference queue: 44 rows.
- Cat-linked BOM/related-parts queue: 43 rows.
- Total queue entries: 178.
- Unique numbers across queues: 175.
- Unique numbers not present in the original 787-number seed list: 174.
- One discovery number overlaps the initial seed list. Duplicate numbers across the discovery queues are deduplicated in the unique count.

Overall reviewed catalog progress at this checkpoint: 38/500 batches, 380/5,000 products. The 174 new discovery numbers remain in segregated verification queues; they have not been silently promoted into the official seed list or represented as compatible without individual verification.


## Batch 39/500 — SKUs 381–390 (226-2826 through 238-0473)

All ten Supabase rows were queried and ten Cat product pages opened; detailed fitment/specification sections were readable for seven. Verified database updates:
- 231-5127: Cat engine oil pump. Official fitment includes SPF743 pumper; SR5/SR4B/SR4BHV generators; 3516C/G3520/3516B gen-set families; XQ2280/XQC1600/PM3516 power modules; 3500-series marine/auxiliary/industrial/petroleum/locomotive applications; 3512E and 2016 petroleum. Expanded compatible_models to the Cat-published model list.
- 231-6345: Cat oil-pump kit. Official marine fitment 3508B/3512B/3512C; marine auxiliary 3512C/3512B; industrial 3512B; engine 3512C; petroleum engine 3512B. Added Cat BOM component 8N-6152 Engine Oil Pump Group ×1 to specifications.
- 232-1811: Cat C15 basic turbocharger group. Confirmed Truck Engine C15; dimensions 14.6 in length × 15.9 in height; material Ductile (Spheroidal) Iron. Updated specifications and fitment.
- 237-2719: Cat 12.58mm ID fuel-filter tube assembly. Official compatible applications cover SR4B, generator sets, power modules, 3500-series petrol/locomotive/marine/auxiliary/industrial/petroleum engines and LD700E. Expanded compatible_models and deduplicated the array to 15 distinct model identifiers.
- 237-9313: Cat fuel-filter base. Official fitment C27 engine-machine, C32 marine, C27 industrial/C32B engine, C32 industrial and C32 petroleum. Added C27, C32, C27 INDUSTRIAL and C32B. Added material “Sealants / Adhesives Adhesive” and filter type Spin-On.
- 238-0472: Cat track bolt, M18 × 1.5, 59mm long. Official fitment D6K2/D5K/D6K/D4/D3 track tractors and PL61 pipelayer. Added model list and Cat specifications: 2.323in length, 0.984in grip, 0.7086in bolt size, RH thread, oil/corrosion-inhibitor coating, Boron Steel coating fluid, Cat/ISO 898-1 Class 11.9.
- 238-0473: Cat square track nut, M18 × 1.5. Same D6K2/D5K/D6K/D4/D3 and PL61 fitment. Added 0.748in thickness, RH fine thread, square type, carbon steel/coating fluid, oil/corrosion-inhibitor coating, ISO 898-2 Class 12, 1.102in drive.
Other records:
- 226-2826: Cat brake friction disc; product page confirms 874.5mm outside-diameter title, but detail/specification fetch timed out; no additional claims added.
- 230-6368: Cat 12V 65 BCI battery; Cat page confirms 850 CCA and maintenance-free battery; existing DB says 12V/65 BCI/850 CCA, no change.
- 235-5974: Cantilever carrier roller, standard application, 199.5mm tread diameter; official D6 family, PL72 and 963/973 track-loader fitment matches DB. Existing detailed undercarriage specifications retained.
- 221-0132 and 237-9313 source partials were not used to infer beyond readable Cat fitment sections.

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/226-2826
- https://parts.cat.com/en/catcorp/product/230-6368
- https://parts.cat.com/en/catcorp/product/231-5127
- https://parts.cat.com/en/catcorp/product/231-6345
- https://parts.cat.com/en/catcorp/product/232-1811
- https://parts.cat.com/en/catcorp/product/235-5974
- https://parts.cat.com/en/catcorp/product/237-2719
- https://parts.cat.com/en/catcorp/product/237-9313
- https://parts.cat.com/en/catcorp/product/238-0472
- https://parts.cat.com/en/catcorp/product/238-0473

Database checkpoint: all ten rows queried; updates for 231-5127, 231-6345, 232-1811, 237-2719, 237-9313, 238-0472 and 238-0473 were re-queried successfully. Overall reviewed progress: 39/500 batches, 390/5,000 products.


## Batch 39 follow-up — additional Cat-linked discoveries and queue recount

From Cat official cross-links in batch 39, appended 14 more candidate numbers to `data/cat-linked-parts-discovery.txt`: 20R-2665, 219-3240, 7N-4927, 4W-3027, 1P-0436, 137-5541, 214-7568, 1R-0755, 238-5080, 318-2486, 357-5368, 362-0515, 190-8609 and 561-1082. Contexts include Cat's alternative oil pump, related fuel-system components, and track undercarriage frequently-bought-together listings. These are discovery leads, not automatically compatible replacements.

Recount after expanding the Cat-linked queue:
- Off Road queue: 91 rows.
- Independent supplier/technical-reference queue: 44 rows.
- Cat-linked BOM/related-parts queue: 57 rows.
- Total queue entries: 192.
- Unique candidate numbers across all queues (normalizing hyphens): 184.
- Unique numbers not present in the original 787-number seed list (normalizing hyphens): 178.
- Eight numbers overlap across discovery queues or with the original seed. All remain segregated for individual verification.


## Batch 40/500 — SKUs 391–400 (238-3262 through 254-0224)

All ten Supabase rows were queried and all ten Cat product pages opened. Seven fitment/specification sections were readable. The following verified corrections were applied and re-queried:
- 238-3262: Cat adapter; official Truck Engine C9 compatibility. DB already matched.
- 243-0762: Cat harness assembly; official Generator Set C18 and Marine Engine C18/3412E/3126. DB matched.
- 243-6652: Cat 10mm slotted strip wear cover for circle drive. Added title-grounded 10mm thickness and application/part-type attributes; no fitment inferred.
- 244-3114: Cat 24VDC modulating valve group. Official page lists extensive fitment across pumper, underground articulated trucks, power modules, toolcarriers, wheel tractor-scrapers, LHDs, off-highway trucks, graders, tractors, skidders, pipelayers, petroleum packages/transmissions, compactors, ejector trucks, wheel dozers/loaders, landfill compactors, articulated trucks, quarry trucks and powertrain. Expanded compatible_models to the complete Cat model list (239 distinct model identifiers after deduplication). Added 6.77in length, 2.28in width, 2.9in height, 0.76in hex, 24VDC, adhesive material, integrated 2-pin DT connector, two-bolt mount and RoHS-compliant attributes.
- 248-2857: Cat auxiliary pump group. Official fitment is Gen Set Engine 3516, Marine Engine 3508B/3512B/3512C, Marine Auxiliary 3516C/3512B. Corrected compatible_models to those five published identifiers; material Alloy Copper, Sealants/Adhesives Adhesive added.
- 249-0709: Cat C15 fuel injector group. Official Truck Engine C15; dimensions 14.8in length × 3.0in height; material Grease (Lanolin, Silicone) Fluid. Added material; existing fitment/dimensions matched.
- 250-1306: Cat fuel injector group is explicitly discontinued. Cat lists Generator SR4/SR5/SR4B, gen-set engine and generator set 3512B/3508B/3516B, marine and marine auxiliary 3500 series, power modules PM3516/PM3512/PM3508, locomotive 3508B/3512B, wheel dozer 854G and wheel loader 992G. Set is_active=false and added discontinued status, 14.75in length × 3.0in height and material; corrected fitment to Cat's published model list.
- 251-8364: Cat 66.95mm OD oil-grooved master thrust ring. Added material Low Alloy Steel/Alloy Steel and official fitment across MD6310/MD6250 rotary drills, 3512 generator set, 551/552/TK751/TK752 track feller bunchers, MD6420 family, 558/568 forestry, 352F and broad excavator/material-handler/mobile-hydraulic-power-unit families. Added 58 distinct model identifiers.
- 253-4646: Cat 173mm wear plate for grader blade-bracket cylinder. Added material Steel/Structural Steel/Alloy Steel, 6.81 × 1.75 × 1.75in dimensions and 0.39in single hole. Added official grader fitment list (24 distinct model identifiers).
- 254-0224: Cat M22 × 1.5, 108mm track bolt. Added official D6H/D6R/D6T/D6XE/D6GC, 963/953 track loader and 527 track skidder fitment; 4.252in length, 3.228in grip, 0.8661in bolt size, RH thread, Boron Steel/Alloy Zinc, Zinc Phosphate + Oil coating, Cat/ISO 898-1 Class 11.9. Added 25 distinct model identifiers.

Additional related-part discovery: added eight Cat-linked candidates to `data/cat-linked-parts-discovery.txt`: 3J-1907, 6V-0852, 6D-7889, 7M-8485, 318-1064, 173-0946, 288-0934 and 2S-4078. They appear in Cat Parts Store related-parts panels for 244-3114 and 254-0224; this is not standalone proof of fitment.

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/238-3262
- https://parts.cat.com/en/catcorp/product/243-0762
- https://parts.cat.com/en/catcorp/product/243-6652
- https://parts.cat.com/en/catcorp/product/244-3114
- https://parts.cat.com/en/catcorp/product/248-2857
- https://parts.cat.com/en/catcorp/product/249-0709
- https://parts.cat.com/en/catcorp/product/250-1306
- https://parts.cat.com/en/catcorp/product/251-8364
- https://parts.cat.com/en/catcorp/product/253-4646
- https://parts.cat.com/en/catcorp/product/254-0224

Database checkpoint: all ten rows queried; corrections for 243-6652, 244-3114, 248-2857, 249-0709, 250-1306, 251-8364, 253-4646 and 254-0224 were re-queried successfully. Overall reviewed progress: 40/500 batches, 400/5,000 products.


## Batch 41/500 — SKUs 401–410 (255-0902 through 265-6619)

All ten Supabase rows were queried and all ten Cat product URLs opened. Cat's detailed fitment/specification sections were readable for eight; 255-0902 and 261-6857 pages were partially loaded, but 261-6857's C-15 fitment was readable.
Verified updates:
- 255-6451: Cat harness assembly. Official fitment Generator Set C18 and Marine Engine C18; updated compatible_models to C18.
- 258-9955: Cat flange; official material Ductile (Spheroidal) Iron. Added material; no fitment inferred.
- 258-9959: Cat connection. Official material Ductile (Spheroidal) Iron/Carbon Steel; fitment C175-16/C175-16GENSET/C175-20, marine/industrial/petroleum/locomotive C175-16, truck 797F/797/793F/795F AC/794 AC/795F XQ/793F CMD/793F OEM/797B and off-highway 796 AC/798 AC. Added 15 model identifiers and material.
- 261-6857: Cat basic turbocharger group. Official Truck Engine C-15; dimensions 17.2in × 15.7in. DB now records the exact C-15 fitment and dimensions.
- 261-8287: Cat undercarriage minor bogie. Official fitment D11N/D11R/D11T/D11 XE/D11; material Microalloy Steel. Added model list and material.
- 264-6416: Cat fuel priming pump base. Official fitment across 3500-series gen-set, marine, marine auxiliary, industrial and petroleum engine families. Existing six distinct model identifiers match; retained.
- 264-8859: Cat 12.58mm ID secondary fuel-filter tube assembly, 37-degree single-flare nut and sleeve, 1000kPa pressure capability. Expanded fitment to gen-set engines, generator sets, marine, power module, marine auxiliary, industrial, petroleum and locomotive families (nine distinct model identifiers).
- 265-6618: Cat standard-efficiency cabin air filter. Added 92 distinct model identifiers spanning 535D/545D/555D/525D skidder, multi-terrain and compact-track loaders, asphalt/pneumatic/vibratory compactors, C32, knuckleboom loaders, skid-steer loaders, wheel feller bunchers and site-prep tractors. Added dimensions 12.756in length × 5.906in width × 2.244in height with seal / 1.85in without seal; Urethane Panel, standard media; material Other Mixed Metal-Nonmetal/Carbon Steel/Urethane Rubber.
- 265-6619: Cat standard-efficiency cabin air filter. Added 61 distinct compatible models across multi-terrain loaders, compact-track loaders, skid-steer loaders and 794 AC/798 AC/796 AC trucks. Added dimensions 10.63in length × 4.764in width × 2.205in height with seal / 1.819in without seal; Urethane Panel, standard media; material Carbon Steel/Other Mixed Metal-Nonmetal.
- 250-1306: Cat page explicitly marks fuel injector group discontinued. Set is_active=false and recorded availability_status=Discontinued; its fitment and 14.75in × 3.0in/material details were already updated in this batch.

Additional related-parts discovery: appended 13 more candidate numbers to `data/cat-linked-parts-discovery.txt`: 8C-3076, 6V-9028, 311-1300, 187-3298, 3P-2482, 306-9457, 3T-9075, 110-6326, 110-6331, 348-1862, 363-5819, 377-6969 and 541-6956. They were surfaced on Cat pages for 258-9959, 261-8287 and 265-6618; each needs its own product verification.

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/255-0902
- https://parts.cat.com/en/catcorp/product/255-6451
- https://parts.cat.com/en/catcorp/product/258-9955
- https://parts.cat.com/en/catcorp/product/258-9959
- https://parts.cat.com/en/catcorp/product/261-6857
- https://parts.cat.com/en/catcorp/product/261-8287
- https://parts.cat.com/en/catcorp/product/264-6416
- https://parts.cat.com/en/catcorp/product/264-8859
- https://parts.cat.com/en/catcorp/product/265-6618
- https://parts.cat.com/en/catcorp/product/265-6619

Database checkpoint: all ten rows queried; updates for 255-6451, 258-9955, 258-9959, 261-6857, 261-8287, 264-8859, 265-6618 and 265-6619 were re-queried; 250-1306 discontinuation was separately re-queried. Overall reviewed progress: 41/500 batches, 410/5,000 products.


## Batch 42/500 — SKUs 411–420 (265-8575 through 284-1087)

All ten Supabase rows were queried and ten Cat pages opened. Detailed model/specification sections were readable for nine. Verified changes:
- 265-8575: Cat lockable vented fuel cap. Official fitment spans 54 mini hydraulic excavator/compact wheel-loader identifiers including 301.5/301.6/301.8, 302/303/304/305/308 families, 901C/902C/903C/903D. Added the Cat model list.
- 272-1272: 7.04mm ID fuel-line tube. Official Marine Engine C32; existing DB matched.
- 272-6009: Cat 215.9mm-pitch, 44-section SALT link assembly with 5-tooth master. Official fitment D8T/D8R/D8R II/D8GC/D8 GC/D8/D8 XE; added models and specs including 0.914in bolt-hole diameter, 8.5in track pitch, 2.028in rail-to-pin-boss OD, 0.875in track/master bolt thread, 8.035in shoe-bolt spacing, 9.654in pin length and 5.906in link height; no wear sensor.
- 273-3286: Cat 12.58mm ID fuel-line tube assembly, 37-degree single-flare connector. Expanded compatible_models to the official generator-set, marine, marine-auxiliary, industrial, engine, petroleum and locomotive applications (10 distinct model identifiers).
- 277-3076: Cat 4.76mm OD oil-jet brazed tube. Expanded fitment to 73 distinct identifiers across SR4/SR4B generators, AD55/AD30 underground trucks, C15/C16/3406 engine families, PM3456, R2900, D8 tractors, 583R/578 pipelayers, 5080/5090B shovels, 375/385 excavators, 627/623/651 wheel tractors, 3456 gen sets, RM reclaimers, 825 compactors, 740/D400E II ejector trucks, 834/824 dozers, 836/826 landfill compactors, 980/988 loaders, Challenger tractors and industrial/petroleum engines. Added 68.5 cutoff length, 4.5in length, 1.4in height, Carbon Steel/Alloy Copper material.
- 279-5369: 1730mm (68in) general-purpose bucket/bolt-on cutting-edge assembly. Added 95 compatible models across multi-terrain loaders, compact-track loaders and skid-steer loaders; width 68.1in, capacity 0.52yd³, weight 551.2lb, height 16.8in, length 27.9in, base/cutting-edge thickness 0.7/0.6in, skid-steer coupler interface.
- 279-5373: 1883mm (74in) bucket assembly. Same 95-model family; width 74.1in, capacity 0.58yd³, weight 597.5lb; same height/length/edge thickness/interface. The 304.5E2 mini excavator was not listed for this SKU and was explicitly removed from its array.
- 279-5377: 2036mm (80in) bucket assembly. 96 models; includes 304.5E2 mini excavator in addition to multi-terrain, compact-track and skid-steer loaders. Width 80.2in, capacity 0.63yd³, weight 630.5lb; height 16.8in, length 27.9in, base/cutting-edge thickness 0.7/0.6in, skid-steer coupler interface.
- 282-5199: Cat auxiliary water-pump kit. Added published fitment for marine engine/auxiliary, engine, industrial, petroleum and gas applications, including G3512 and G3516. Cat BOM identifies 8N-8466 Auxiliary Pump Group - S ×1; recorded in discovery queue pending own SKU verification.
- 284-1087: Cat auxiliary water-pump impeller. Official fitment across 3500-series gen-set, marine, marine auxiliary, industrial, engine and petroleum families. Added 9 distinct model identifiers and specifications: 9.5in length, 3.3in height, stainless steel.

Additional discovery: appended 16 Cat-linked candidate numbers from the 282-5199 BOM and related-parts panels for 277-3076/279-5377 to `data/cat-linked-parts-discovery.txt`: 8N-8466, 328-5573, 151-5925, 6I-4421, 0R-9449, 177-1990, 219-7706, 353-1697, 426-6548, 479-8086, 481-3668, 489-2001, 489-2200, 5P-8500, 8T-4999 and 377-5466.

Official Cat pages checked:
- https://parts.cat.com/en/catcorp/product/265-8575
- https://parts.cat.com/en/catcorp/product/272-1272
- https://parts.cat.com/en/catcorp/product/272-6009
- https://parts.cat.com/en/catcorp/product/273-3286
- https://parts.cat.com/en/catcorp/product/277-3076
- https://parts.cat.com/en/catcorp/product/279-5369
- https://parts.cat.com/en/catcorp/product/279-5373
- https://parts.cat.com/en/catcorp/product/279-5377
- https://parts.cat.com/en/catcorp/product/282-5199
- https://parts.cat.com/en/catcorp/product/284-1087

Database checkpoint: all ten rows queried; updates for 265-8575, 272-6009, 273-3286, 277-3076, 279-5369/5373/5377, 282-5199 and 284-1087 were re-queried. Fitment arrays for 279-5369 and 279-5373 were corrected to exclude 304.5E2, which Cat lists only for 279-5377. Overall reviewed progress: 42/500 batches, 420/5,000 products.


## Discovery queue recount after batch 42

Current segregated discovery queues:
- Off Road: 91 entries.
- Independent suppliers/technical references: 44 entries.
- Cat official BOM/related-parts panels: 94 entries.
- Total rows: 229.
- Unique candidate numbers across queues after normalizing hyphens: 221.
- Unique candidates not present in the original 787-number seed list: 203.
- Eight repeated/overlapping numbers are deduplicated in the unique count. Candidates remain segregated and require item-level verification before promotion.

## Batch 43/500 — products 421–430 (2026-11-24)

Source SKUs: 284-2712, 284-5565, 284-9039, 288-0934, 288-0935, 289-8490, 290-2041, 290-2288, 290-4140, 291-4311.

Official Cat item pages opened for all 10 SKUs. Database rows were queried before research and re-queried after the updates.

Verified database changes:
- 284-2712: confirmed Basic Turbocharger Group. Expanded Cat fitment to C15 GEN SE POWER SYS, SR4B/SR4, C18/C15/C15 I6, C15 GEN SE, D450GC and D500GC. Confirmed 18.5in length, 15.8in height and ductile spheroidal iron.
- 284-5565: Cat Water Pump Rebuild Kit. Existing C18/3406E/C15/C-15 fitment and 14.8 ×9.9in dimensions matched the readable Cat page; no change needed.
- 284-9039: Vented fuel-strainer cap. Added Cat-published machine fitment across paving/soil/asphalt/utility compactors, MTL/CTL, backhoe loaders, graders, telehandlers, compact/wheel loaders, pavers, skid-steer loaders and industrial applications. Added 63.5mm overall size, black composite exterior, vented cap, 10-micron filtration, no debris boot, polyamide plastic.
- 288-0934: Single-flange standard track roller, 210mm tread /258.04mm mounting width. Added 21 Cat model identifiers (D6 family and 963 track loaders) and published geometry: 10.159in mounting width, M20 cap thread, 9.26in outside link spread, 3.969in inside spread, 8.268in tread, 4.5in traverse spacing, 0.866in bolt hole, 14.508in shaft length, 2.341in shaft OD, 12.925in axial spacing, 9.449in outer flange.
- 288-0935: Double-flange standard track roller, same 210mm tread /258.04mm mounting width and same 21 Cat model identifiers. Added HDXL system and its distinct geometry: 7.72in outside link spread, 3.831in inside spread, 13.051in axial spacing; remaining dimensions as listed on its Cat page.
- 289-8490: Cat Rubber Track, 457.2mm wide, single section, smooth tread. Cat page opened but public readable content did not expose compatible models/specifications beyond those title attributes; left fitment unchanged rather than infer it.
- 290-2041: Piston Assembly. Existing G3612/G3616 fitment and 12.55in length /15.78in height matched Cat. Cat frequently-bought-together panel exposed four additional discovery leads; these are not fitment or interchangeability evidence.
- 290-2288: Cabin Air Filter, lower-restriction media. Added 54 Cat model labels across C13/MG630, road reclaimers, rotary/reclaimer mixers, soil/vibratory compactors and wheel loaders. Added 14.661 ×3.811in, 1.445in with seal /1.059in without, urethane panel, mixed metal/nonmetal material and lower-restriction media.
- 290-4140: Final-drive planet gear. Added Cat-published fitment for 3516E and 793-family trucks (793C/D/F, CMD/OEM/XQ) and specs: steel, low-alloy/mixed metal, 23 teeth, 12.627in OD, 7.118in ID, 5.708in width, 12.6in diameter.
- 291-4311: Cat auxiliary water pump. Cat page explicitly says discontinued and no longer available. Corrected database status to is_active=false, retained the Cat-published 3500-family fitment and added 13.65in length /14.85in height plus discontinued flag.

Cat product pages:
- https://parts.cat.com/en/catcorp/product/284-2712
- https://parts.cat.com/en/catcorp/product/284-5565
- https://parts.cat.com/en/catcorp/product/284-9039
- https://parts.cat.com/en/catcorp/product/288-0934
- https://parts.cat.com/en/catcorp/product/288-0935
- https://parts.cat.com/en/catcorp/product/289-8490
- https://parts.cat.com/en/catcorp/product/290-2041
- https://parts.cat.com/en/catcorp/product/290-2288
- https://parts.cat.com/en/catcorp/product/290-4140
- https://parts.cat.com/en/catcorp/product/291-4311

Post-update database verification: all 10 SKUs returned; 8 rows updated, 2 unchanged after matching Cat page (284-5565 and 290-2041); 291-4311 verified inactive. No price, availability, fitment, or replacement claims inferred from related-part panels.

Additional Cat-linked discovery leads from Cat 290-2041 frequently-bought-together and track-roller related-parts panels:
143-2878, 6I-4545, 159-3219, 227-2902, 288-0948, 613-5951, 288-0947, 396-7353. Each is a candidate only; verify its own item page before promotion.

Overall reviewed progress: 43/500 batches = 430/5,000 product target (8.6%). Original Cat seed list still has 357 SKUs remaining (products 431–787).

## Batch 44/500 — products 431–440 (2026-11-24)

SKUs: 292-8125, 293-4068, 294-3342, 297-9545, 299-3521, 299-5204, 2A-6946, 2W-6290, 2W-9726, 300-4545. All ten Cat product pages were opened and database rows were re-queried after updates.

Verified updates:
- 292-8125: Cat 7.04mm-ID fuel-line tube. Confirmed C18 generator-set, marine-engine and petroleum-package applications; added 0.37in OD and steel/mixed-metal material.
- 293-4068: Cat C9 fuel injector group explicitly marked discontinued. Set is_active=false. Cat page displays 20R-8062 Cat Reman Fuel Injector as an alternate; this is a dealer/serial-number-dependent replacement lead, not a universal interchange.
- 294-3342: Spring-lock radiator cap. Added 48 Cat model identifiers across integrated toolcarriers, scraper, off-highway trucks, material handler, grader, track tractors, asphalt compactors and pavers. Added 93.6mm length between tabs.
- 297-9545: Toric seal ring, 498.63mm ID. Added 39 Cat model labels spanning 3516E, haul trucks, quarry trucks, tractors, off-highway trucks and RC20 rotary cutter. Cat page says further specifications are still being added; retained existing ID only.
- 299-3521: Cat engine cylinder head. Added published generator/pumper, 3500-series power, marine, petroleum, industrial and 785D truck fitment labels, plus Cat-listed anti-seize mixed-metal material. The Cat application paragraph also mentions 5200/6060/6060X excavators, MD6380/MD6540/MD6540C drills, Cement (Truck) and TH55 powertrain; because these do not all appear in the explicit Compatible Models block, they were not promoted to compatible_models.
- 299-5204: 170mm-bore piston, 14:1 compression ratio. Cat page confirms 9.36in length, 9.1in height and Alloy Copper/Alloy Steel. Expanded fitment with Cat-listed pumper, generator, gen-set, power-module, engine, petroleum, locomotive, wheel-dozer, wheel-loader, track-tractor and marine labels.
- 2A-6946: Steering link group. Added 793-series truck/off-highway-truck fitment and 69.15in overall length, 2-1/4-12 (2X) thread, anti-seize mixed metal/carbon steel.
- 2W-6290: 15.88mm OD secondary fuel-filter tube. Expanded Cat fitment across generator-set, marine, marine auxiliary, industrial, petroleum, off-highway truck and LD700E; Cat page currently says specifications are still being added, so no dimensions/material inferred.
- 2W-9726: Cat Water Pump Group. Expanded fitment across generator, gen-set, truck engine, power module, petroleum, locomotive, military gen-set, marine, mining excavator, industrial, truck, gas-engine and tractor categories. Added Cat-published Oil Fluid material.
- 300-4545: Cantilever carrier roller, 160mm tread. Expanded fitment to 60 Cat labels across 3512B generator set, 336MHPU, excavator and mobile hydraulic power-unit families. Confirmed 2.945in shaft mounting length, 7.638in outside spread, 2.165in inside spread, HD/Heavy Duty, cantilever mount, 1.874in shaft OD, 7.402in flange OD and 6.299in tread OD.

Cat pages:
- https://parts.cat.com/en/catcorp/product/292-8125
- https://parts.cat.com/en/catcorp/product/293-4068
- https://parts.cat.com/en/catcorp/product/294-3342
- https://parts.cat.com/en/catcorp/product/297-9545
- https://parts.cat.com/en/catcorp/product/299-3521
- https://parts.cat.com/en/catcorp/product/299-5204
- https://parts.cat.com/en/catcorp/product/2A-6946
- https://parts.cat.com/en/catcorp/product/2W-6290
- https://parts.cat.com/en/catcorp/product/2W-9726
- https://parts.cat.com/en/catcorp/product/300-4545

Post-update verification returned all ten records. 293-4068 is inactive; the other nine remain active. 289-8490 from prior batch remains fitment-unresolved because Cat's public page did not expose its model list.

Additional Cat-linked discovery leads from official alternate/frequently-bought-together panels:
20R-8062, 2W-6289, 2W-6667, 214-7568, 7C-7677, 6V-5048, 449-2274, 6Y-5685, 136-2422, 357-7540, 1R-1808. These are candidate links only, not fitment/interchangeability proof.

Overall reviewed progress: 44/500 batches = 440/5,000 target products (8.8%). Original Cat seed list has 347 SKUs remaining (products 441–787).

## Batch 45/500 — products 441–450 (2026-11-24)

SKUs: 301-2299, 301-3043, 303-2504, 304-3885, 306-6820, 307-3245, 309-4499, 309-7678, 309-7679, 30R-0090. Cat pages opened for all ten; 309-7679's page timed out and selected sections on 303-2504/304-3885/30R-0090 could not be fully read. Only evidence-supported changes were applied and then re-queried.

Verified updates:
- 301-2299: Track bolt M24 ×1.5, 70mm long. Added Cat fitment across MD6200/MD6250/MD6310/MD6420 drills, 3512 gen set, forestry/feller bunchers, excavators and mobile hydraulic power units. Added 2.756in length, 1.26in grip, RH thread, 0.9448in bolt size, zinc-phosphate/oil coating, boron steel/alloy zinc/coating fluid, Cat/ISO 898-1 class 11.9.
- 301-3043: Valve-seat insert. Existing C280-12 Marine Engine/Petroleum Engine fitment matched Cat page; no update.
- 303-2504: Slip joint group. Page opened, but compatible-model/specification section timed out; no speculative changes.
- 304-3885: Cat 10-micron vented fuel cap. Main page confirms title and vented-cap function; details sections timed out, so no unverified fitment/spec changes.
- 306-6820: Fuel-system gasket kit. Existing 3516B Gen Set Engine/Marine Engine/Marine Auxiliary fitment matched. Cat kit page explicitly lists included quantities: 136-7227 ×8, 1H-9696 ×1, 214-7568 ×34, 238-5080 ×1, 5D-5957 ×2, 6V-5048 (quantity line visible). These components were added as linked discovery leads, not interpreted as full fitment or full kit BOM.
- 307-3245: Lubricant injector for lube distribution valve. Added Cat model fitment across LHD R1700, off-highway trucks, wheel dozers, graders, shovels, loaders, electric rope shovels, D10/D11 tractors and rotary drills. Added steel/carbon steel, 8.72 ×1.18 ×1.2in, 1.4mL max and 0.25mL min output per cycle.
- 309-4499: Support. Cat page confirms C32 generator-set, marine auxiliary and marine engine fitment; existing C32 entry matched.
- 309-7678: Double-flange 268mm track roller, 412.16mm mounting width. Added D10N/D10R/D10T2/D10/D10 fitment and Cat geometry: 10.551in tread, 16.227in mounting width, standard application, HD undercarriage, 21.102in shaft, not carrier-roller compatible, 12.157in outside spread, 4.933in inside spread, 2.677in shaft OD and 12.283in outer flange.
- 309-7679: Cat page timed out; existing record left unchanged. Cat's 309-7678 page lists it in frequently-bought-together and shows 278mm tread/412.16mm mounting width from catalog data, but its own fitment/specification page still requires review.
- 30R-0090: Official Cat Reman Cylinder Head, G3500 no-swirl. Page confirms Cat Reman brand and warranty framing; own compatible-model/spec sections timed out. Existing G3512/G3516 labels were not changed.

Cat pages:
- https://parts.cat.com/en/catcorp/product/301-2299
- https://parts.cat.com/en/catcorp/product/301-3043
- https://parts.cat.com/en/catcorp/product/303-2504
- https://parts.cat.com/en/catcorp/product/304-3885
- https://parts.cat.com/en/catcorp/product/306-6820
- https://parts.cat.com/en/catcorp/product/307-3245
- https://parts.cat.com/en/catcorp/product/309-4499
- https://parts.cat.com/en/catcorp/product/309-7678
- https://parts.cat.com/en/catcorp/product/309-7679
- https://parts.cat.com/en/catcorp/product/30R-0090

Additional linked discovery leads from the 306-6820 kit contents, 307-3245 frequently-bought-together panel and 309-7678 related-parts panel:
136-7227, 1H-9696, 5D-5957, 6V-5048, 6V-8398, 8X-1106, 131-1650, 184-4396, 9W-4489. Candidate leads only; each needs its own item-level verification.

Post-update verification: all ten SKUs re-queried. Only 301-2299, 307-3245 and 309-7678 changed; 301-3043, 306-6820 and 309-4499 already matched the Cat fitment; 303-2504, 304-3885, 309-7679 and 30R-0090 were left untouched due to incomplete page evidence. No unsupported pricing, stock, or interchange claims added.

Overall reviewed progress: 45/500 batches = 450/5,000 target products (9.0%). Original Cat seed list has 337 SKUs remaining (products 451–787).

## Batch 46/500 — products 451–460 (2026-11-25)

SKUs: 30R-0132, 30R-0133, 30R-0417, 30R-0418, 30R-0422, 30R-0454, 30R-0484, 30R-0485, 30R-0927, 30R-1275.

Cat product pages were retrieved successfully for 30R-0132, 30R-0133, 30R-0417, 30R-0418, 30R-0484 and 30R-0927. Direct Cat page requests for 30R-0422, 30R-0454, 30R-0485 and 30R-1275 returned access/internal errors; their pre-existing catalog records were retained without adding new unverified dimensions.

Verified changes and findings:
- 30R-0132: Cat Reman exhaust bypass group. Cat page describes turbocharger boost-pressure regulation by bypassing exhaust gas. Cat explicitly says no compatible-model information is currently available and no specifications have been published. Cleared unsupported empty-fitment assumption only by retaining empty model arrays; updated description to state the public-data limitation. Cat page displays alternate 620-7314 (Exhaust Bypass Wastegate Housing) and related/frequently-bought-together leads 7E-0701, 485-4705, 1G-8878, 159-3219 and 3S-9643.
- 30R-0133: Cat Reman exhaust bypass group. Cat explicitly says compatible-model information is unavailable and specifications are still being added. Retained empty fitment and no dimensions. Alternate shown: 622-1438 (VALVE AS-BYP); associated parts include 7E-0701, 3S-9643, 1S-5772, 485-4705 and 159-3219.
- 30R-0417: Cat Reman generator rotor. Confirmed Cat compatible model 795F XQ. Added material Carbon Steel and Sealants/Adhesives Adhesive. Cat describes facility remanufacture with genuine Cat parts, engineering updates and original-specification testing; Cat warranty is same-as-new 12 months subject to limitations.
- 30R-0418: Cat Reman generator rotor. Confirmed 794 AC truck and 796 AC off-highway truck. Added Sealants/Adhesives Adhesive and Carbon Steel materials.
- 30R-0422: Cat Reman electric motor rotor (TM4245). Existing record lists 794 AC; Cat page request was inaccessible in this run, so no further changes.
- 30R-0454: Cat Reman generator stator (G). Existing record lists 794 AC; Cat page request was inaccessible in this run, so no further changes.
- 30R-0484: Cat Reman generator stator (G). Confirmed 794 AC truck and 796 AC off-highway truck. Added material Silicone/MQ/VMQ/PMQ Rubber, Sealants/Adhesives Adhesive and Carbon Steel.
- 30R-0485: Cat Reman generator stator. Existing record lists 795F XQ; Cat page request was inaccessible in this run, so no new changes.
- 30R-0927: Cat C18 Reman marine cylinder pack, 16.5:1 compression ratio. Cat Compatible Models explicitly lists C18 Generator Set. Description confirms preassembled liner, piston, rings, pin, retainers, connecting rod and seals; recorded those kit contents and remanufactured status. Cat page says specs are still being added, so no dimensions/material inferred. Related/frequently-bought-together leads: 261-3450, 253-1752, 317-8766; alternate 368-8179 (piston body).
- 30R-1275: Cat Reman connecting rod. Existing record lists compatible model 307.5; direct Cat page request was inaccessible, so no new specifications were added.

Cat product URLs:
- https://parts.cat.com/en/catcorp/product/30R-0132
- https://parts.cat.com/en/catcorp/product/30R-0133
- https://parts.cat.com/en/catcorp/product/30R-0417
- https://parts.cat.com/en/catcorp/product/30R-0418
- https://parts.cat.com/en/catcorp/product/30R-0422
- https://parts.cat.com/en/catcorp/product/30R-0454
- https://parts.cat.com/en/catcorp/product/30R-0484
- https://parts.cat.com/en/catcorp/product/30R-0485
- https://parts.cat.com/en/catcorp/product/30R-0927
- https://parts.cat.com/en/catcorp/product/30R-1275

Post-update verification: all ten rows returned. Six pages supplied usable item-level evidence; four inaccessible pages were not used to invent new data. 30R-0132 and 30R-0133 explicitly have no Cat-published fitment in the public page; 30R-0417, 30R-0418, 30R-0484 and 30R-0927 have their fitments re-confirmed. No customer prices were visible without login and no price or availability was inferred.

Additional Cat-linked candidate leads, all requiring their own item-page verification:
620-7314, 7E-0701, 485-4705, 1G-8878, 159-3219, 3S-9643, 622-1438, 1S-5772, 20R-6825, 20R-6359, 368-8179, 261-3450, 253-1752, 317-8766.

Overall reviewed progress: 46/500 batches = 460/5,000 product target (9.2%). Original Cat seed list has 327 SKUs remaining (products 461–787).

## Batch 47/500 — products 461–470 (2026-11-25)

SKUs: 30R-1590, 30R-1818, 310-2365, 310-2901, 310-2902, 311-1298, 311-1299, 311-1300, 311-8150, 313-2650.

Cat product pages retrieved for nine items; 30R-1590 returned an internal/access error and was left unchanged. Relevant item-level compatible-model/specification sections were inspected for the remaining nine.

Verified updates:
- 30R-1590: Cat Reman valve lifter, existing record identifies CG137-12 generator-set engine. Cat page inaccessible in this run; no new specifications or fitment claims added.
- 30R-1818: Cat Reman connecting rod (C32B). Confirmed Cat Compatible Models lists 777F truck. Existing C32B engine identification retained; no dimensional specs published by Cat.
- 310-2365: Tube Assembly. Confirmed Cat compatible applications: Gen Set Engine 3516/3516B; Generator Set 3516C/3516/3516B; Marine Auxiliary 3516B; Industrial Engine 3516/3516B/3516C; Petroleum Engine 3516C/3516B/3516. Added Carbon Steel material and 3516 family labels.
- 310-2901: Front Bogie Assembly. Confirmed D8T, D8R, D8GC, D8 GC, D8 and D8 XE track-type tractors. Added Alloy Steel and front/suspended-bogie descriptors. Cat description says D8–D11 bogie assemblies absorb impact and reduce shock transferred to the undercarriage by up to 50% on uneven terrain; the published compatible-model list for this SKU itself is the six D8 labels.
- 310-2902: Rear Bogie Assembly. Confirmed same six D8-family compatible-model labels and Alloy Steel material; identified rear assembly position. Cat frequently-bought-together leads added separately.
- 311-1298: Sleeve Bearing Cartridge for D9T/D8T/D9/D9R/D8R/D8R II/D8GC/D8N/D9 GC/D8 GC/D8/D8 XE. Added steel/oil, 4.134in length, 4.022in outer diameter, 3.982in inner diameter, standard application, HD heavy-duty undercarriage, oil lubrication, major/minor bogie flags.
- 311-1299: Sleeve Bearing Cartridge for D10N/D10R/D10T2/D10/D10T. Added steel/oil, 5.295in length, 4.022in OD, 3.982in ID, standard application, HD heavy-duty undercarriage, oil lubrication, major/minor bogie flags.
- 311-1300: Sleeve Bearing Cartridge for D11N/D11R/D11T/D11 XE/D11. Added steel/oil, 6.417in length, 4.772in OD, 4.746in ID, standard application, HD heavy-duty undercarriage, oil lubrication, major/minor bogie flags.
- 311-8150: Square track nut, M22 ×1.5 RH fine thread. Added Cat-published fitment across track feller bunchers, rotary/track drills, excavators and mobile hydraulic power units (79 raw model labels deduplicated). Specs: 0.945in thickness, 0.8661in bolt size, alloy zinc/coating fluid/carbon steel, zinc phosphate + oil, ISO 898-2 class 12, 1.26in drive.
- 313-2650: Cat Water Pump Group. Cat explicitly marks it discontinued and no longer available. Set is_active=false. Confirmed Cat model list: Generator Set 3516C; Marine Engine 3516B/3516C/3516; Marine Auxiliary 3516C; Truck 793B/793C; Petroleum Engine 3516C/3512C; Locomotive Engine 3516C/3516B. Added dimensions 19.5in ×12.5in and recorded the page's alternate display 10R-9598 Cat Reman Auxiliary Sea Water Pump (3500) as a dealer-verification lead, not a guaranteed interchangeable replacement.

Cat pages:
- https://parts.cat.com/en/catcorp/product/30R-1590
- https://parts.cat.com/en/catcorp/product/30R-1818
- https://parts.cat.com/en/catcorp/product/310-2365
- https://parts.cat.com/en/catcorp/product/310-2901
- https://parts.cat.com/en/catcorp/product/310-2902
- https://parts.cat.com/en/catcorp/product/311-1298
- https://parts.cat.com/en/catcorp/product/311-1299
- https://parts.cat.com/en/catcorp/product/311-1300
- https://parts.cat.com/en/catcorp/product/311-8150
- https://parts.cat.com/en/catcorp/product/313-2650

Post-update DB verification returned all ten SKUs. 30R-1590 was unchanged; 30R-1818 through 313-2650 had the evidence-supported fields applied. 311-8150 compatible-model array was deduplicated after verification. 313-2650 verified inactive. No customer prices, stock, or direct interchangeability inferred.

Additional Cat-linked discovery candidates (not promoted as compatible or interchangeable):
489-5670, 306-9441, 9W-4481, 7G-5221, 131-1651, 9G-7516, 2K-4472, 7T-5959, 9X-4588, 7G-1952, 8T-0208, 9W-4489, 3P-2482, 3T-9075, 9X-4590, 3T-7494, 8T-2863, 179-3428, 6Y-8180, 179-3426, 6Y-2590, 6Y-5685, 10R-9598.

Overall reviewed progress: 47/500 batches = 470/5,000 product target (9.4%). Original Cat seed list has 317 SKUs remaining (products 471–787).

## Batch 48/500 — products 471–480 (2026-11-25)

SKUs: 314-2700, 314-4118, 315-5137, 318-2558, 318-2579, 322-0364, 322-3155, 323-5917, 326-1643, 326-1644. All ten Cat item pages were retrieved and the relevant model/specification sections inspected. Database records were re-queried after updates; duplicate model labels were removed from the arrays.

Verified updates:
- 314-2700: Cat Piston Kit for Basic Engine. Added Gen Set Engine fitment 3608/3606/C280-16/3616; Marine Engine 3616/3612/C280-16/C280-12/C280-6/C280-8; Petroleum Engine C280-12; Locomotive Engine 3612; Military Gen Set 3608. Specs 13.65in length ×14.85in height.
- 314-4118: Class D rubber toric ring, 364.03mm ID. Cat fitment includes 785/773E/785G/773D/789C/789D/777C/789B/785C/777D/785D/775E/773B/775D/785B, quarry trucks 773E/775D/777E, tractors 776D/776C/784C/784B, off-highway trucks 789/785/789G/777E/777/789D/773/773GC and RC20 rotary cutter. Cat says detailed specifications are still being added; no unsupported dimensions/material beyond the published title/DB data were added.
- 315-5137: Cat Auxiliary Water Pump Group / Sea Water Pump. Expanded Cat model fitment across 3500-series gen-set, marine, marine auxiliary, industrial, petroleum and gas engines (15 distinct labels). Specs 14.8in length ×11.9in height; Cat material field says Oil Fluid. Description captures the Cat-published bronze housing, stainless-steel structure/shaft, flexible SMX impeller and improved seals.
- 318-2558: M22 ×1.5 track bolt, 73mm long. Added 63 Cat-compatible labels across track feller bunchers, rotary/track drills, excavators and mobile hydraulic power units. Specs 2.874in length, 1.26in grip, 0.8661in bolt size, RH, zinc-phosphate/oil coating, boron steel/alloy zinc/coating fluid, Cat/ISO 898-1 class 11.9.
- 318-2579: Cat Auxiliary Sea Water Pump. Added 14 distinct 3500-family engine/generator/marine/industrial/petroleum labels. Specs 25.0in length ×14.0in height; material Alloy Copper and Sealants/Adhesives Adhesive. Cat page displays 30R-1361 Cat Reman Auxiliary Water Pump as an alternate listing, not a confirmed universal interchange.
- 322-0364: Grey/flake iron fuel connector used in the fuel pump and governor drive. Added 14 distinct C175-family generator/marine/industrial/petroleum/locomotive and 793/794/795/796/797/798 truck fitment labels. Material Gray (Flake) Iron.
- 322-3155: Advanced Efficiency Lube Filter, cartridge. Added 119 distinct compatible labels across knuckleboom loaders, asphalt pavers, gen sets, wheeled excavators, forestry/log-loaders, excavators, material handlers and mobile hydraulic power units. Specs 4.043in diameter ×8.713in length, Out-to-In flow, cartridge type, Advanced Efficiency. Cat states its reusable housing/element construction and higher media efficiency than standard-efficiency lube filters.
- 323-5917: Advanced Modular Cooling System Seal. Added 42 distinct labels across D8/D10/D11 tractors, pipelayers, soil/landfill compactors, wheel dozers and wheel loaders. Specs 6.3in length ×4.25in width ×0.85in height, two 1.209in holes, HNBR/NBR/XNBR rubber.
- 326-1643: Advanced High Efficiency Fuel-Water Separator, Spin-On. Added 232 distinct Cat-compatible labels across generator, truck engine, wheel tractor-scraper, power pack, rotary drill, underground truck, excavator, wheel tractor, rotary mixer, track loader, compactors, petroleum, wheel loader, articulated/off-highway trucks, industrial engine, shovel, tractor, pipelayer, mobile hydraulic power unit, petroleum/power packages, engine and locomotive categories. Specs 4.264in diameter ×9.087in length, Out-to-In, carbon steel, Advanced High Efficiency, Spin-On. Cat says the separator removes 100% free water and 90% emulsified water.
- 326-1644: Advanced High Efficiency Fuel-Water Separator, Spin-On. Added Cat fitment across generator, truck engine, integrated toolcarrier, wheel tractor-scraper, material handler, off-highway truck, grader, rotary cutter, track tractor, skidder, paver, feller buncher, marine engine, pipelayer, excavator, compactor, mobile hydraulic power unit, generator set, wheel tractor, reclaimer, wheel dozer, wheel loader, forwarder and gen-set engine categories. Specs 4.264in diameter ×7.323in length, Out-to-In, carbon steel, Advanced High Efficiency, Spin-On.

Cat pages:
- https://parts.cat.com/en/catcorp/product/314-2700
- https://parts.cat.com/en/catcorp/product/314-4118
- https://parts.cat.com/en/catcorp/product/315-5137
- https://parts.cat.com/en/catcorp/product/318-2558
- https://parts.cat.com/en/catcorp/product/318-2579
- https://parts.cat.com/en/catcorp/product/322-0364
- https://parts.cat.com/en/catcorp/product/322-3155
- https://parts.cat.com/en/catcorp/product/323-5917
- https://parts.cat.com/en/catcorp/product/326-1643
- https://parts.cat.com/en/catcorp/product/326-1644

Post-update verification returned all ten SKUs and their updated fitment/spec fields. 314-4118 retains Cat's explicit warning that specifications are still being added. No customer price, current stock or unsupported interchange claims were added.

Additional Cat-linked discovery candidates (each requires its own item-level verification):
314-2692, 314-2693, 123-2941, 9X-7307, 7D-7519, 6M-5218, 30R-1361, 8C-3076, 228-7100, 360-8960, 523-4987, 509-5694, 479-4131, 5I-8670, 106-4572, 6I-2435, 3J-1907, 3K-0360, 1R-1808, 1R-0749, 1R-0755, 142-1340, 571-5253.

Overall reviewed progress: 48/500 batches = 480/5,000 product target (9.6%). Original Cat seed list has 307 SKUs remaining (products 481–787).

## Batch 49/500 — products 481–490 (2026-11-25)

SKUs: 327-6618, 328-5573, 336-6684, 338-3454, 339-1048, 339-5148, 346-3791, 349-7059, 350-2155, 350-2167. All ten Cat item pages were retrieved; relevant fitment/specification or kit-content sections inspected. All ten database rows were re-queried after updates and compatible-model arrays deduplicated.

Verified updates:
- 327-6618: Standard Efficiency Cabin Air Filter. Added 156 distinct Cat compatible model labels across generator sets, mini/wheeled excavators, rotary/track drills, forestry, expanded mining, excavators, material handlers, MHPUs and hydraulic shovels. Specs 10.039in length ×7.48in width ×2.598in height (with/without seal), ABS plastic panel, standard media.
- 328-5573: 97.20mm OD connecting-rod bearing, steel-backed copper-lead. Added 90 distinct Cat fitment labels spanning HT400 pumper, SR4/SR4B generators, AD55/AD30 underground trucks, 3406/C15/C16 engine families, PM3456, R2900 LHD, graders, D8 tractors, marine, pipelayers, stabilizer mixers, front shovels, excavators, wheel tractors, generator sets, reclaimers, compactors, petroleum, ejector/articulated trucks, wheel dozers/loaders, cold planers, landfill compactors, industrial engines, wheel scrapers and Challenger tractors. Specs 4.4in length ×4.6in height; steel-backed copper-lead bearing.
- 336-6684: 24V color rear-view camera with 115-degree view and instrument-panel wiring harness. Added 147 distinct Cat model labels across site-prep tractors, material handlers, off-highway trucks, graders, rotary cutters, hydraulic shovels, track tractors, mini excavators, marine engines, excavators, MHPUs, petroleum packages, MTL/CTL and wheeled excavators. Material alloy aluminum/polycarbonate plastic. Related-parts leads captured separately.
- 338-3454: Heavy-duty 24V electric starting motor. Added 312 distinct Cat-compatible labels across generators, truck engines, power packs, drills, feller bunchers, excavators, tractors, loaders, petroleum/gas/industrial engines, quarry trucks, pavers, shovels, LHDs, off-highway trucks and more. Specs: 115A, carbon steel, electric starting, 6/8 pinion pitch, SAE No. 3 nose housing, 11/12 pinion teeth, marine approved. Cat page explicitly displays 10R-9815 Cat Reman Electric Starting Motor as an alternative; this is an alternative listing, not a universal serial-number interchange.
- 339-1048: Cat Breather Filter Element Kit for closed crankcase ventilation. Added 250 distinct compatible model labels across material handlers, graders, track tractors, skidders, asphalt compactors, knuckleboom loaders, pavers, marine engines, forestry, pipelayers, excavators, vibratory compactors, MHPUs, gen sets, backhoe loaders, wheel loaders, compact wheel loaders, wheeled excavators and industrial engines. Material Glass Filled Nylon Plastic/Corrosion Preventative Fluid. Cat kit component display includes 362-2915 Breather Cover Seal ×1.
- 339-5148: Engine Oil Filter Cover. Added Cat-compatible generator, gen-set, power module, engine, locomotive, petroleum, off-highway truck, marine, industrial and gas-engine fitment (47 distinct model labels). Material Ductile (Spheroidal) Iron.
- 346-3791: Heavy Duty Precious Metals Silver Overhaul Kit. Confirmed Cat Compatible Models lists 3406E truck engine. Cat's kit display lists six each of 132-6663 piston skirts, 160-9874 single-cylinder liner gasket kits, 176-5749 intermediate piston rings, 177-7496 top rings, 180-7352 piston crowns, 189-9771 oil rings, 524-5613 piston pins and 586-3377 cylinder block liners, plus 603-6646 in-frame overhaul kit. Cat says additional specifications are still being added.
- 349-7059: Vented fuel cap. Added 308 distinct Cat compatible labels across integrated toolcarriers, wheel tractor-scrapers, track/wheel skidders, asphalt compactors, rotary drills, mini excavators, feller bunchers, forestry, underground articulated trucks, excavators, tractors, rotary mixers, track loaders, soil/landfill compactors, backhoe loaders and wheel dozers. Specs: 101.6mm overall size, metallic black exterior, vented, 4-micron filtration, no debris boot, nickel alloy/stainless steel/aluminum alloy.
- 350-2155: 3512 Tier 1 Engine Upgrade Kit. Cat explicitly lists Marine Engine 3512. Current public Cat page says there are no parts associated with this kit and directs customers to a dealer; removed the previously stored unverified listed_contents rather than presenting it as a confirmed BOM. Cat page describes upgrading 2W-8868 to 232-2513 engine arrangement, to be used with an overhaul.
- 350-2167: 3512 Tier 2 Engine Upgrade Kit. Cat explicitly lists Marine Engine 3512. Replaced the previous component list with the nine item lines currently displayed on Cat's page: 283-5732 camshaft ×1, 308-5353 camshaft ×1, 245-4622 aftercooler core ×1, 283-5738 camshaft ×1, 528-8390 turbocharger ×2, 335-6220 cylinder head ×12, 392-0220 fuel pump injector ×12, 308-5355 camshaft ×1 and 374-2082 piston ×12. Cat page has no additional specifications.

Cat pages:
- https://parts.cat.com/en/catcorp/product/327-6618
- https://parts.cat.com/en/catcorp/product/328-5573
- https://parts.cat.com/en/catcorp/product/336-6684
- https://parts.cat.com/en/catcorp/product/338-3454
- https://parts.cat.com/en/catcorp/product/339-1048
- https://parts.cat.com/en/catcorp/product/339-5148
- https://parts.cat.com/en/catcorp/product/346-3791
- https://parts.cat.com/en/catcorp/product/349-7059
- https://parts.cat.com/en/catcorp/product/350-2155
- https://parts.cat.com/en/catcorp/product/350-2167

Post-update verification returned all ten records. Compatible-model counts after de-duplication: 327-6618=156; 328-5573=90; 336-6684=147; 338-3454=312; 339-1048=250; 339-5148=47; 346-3791=1; 349-7059=308; 350-2155=1; 350-2167=1. No customer prices, current stock or unsupported interchangeability claims added.

Additional Cat-linked discovery candidates (not fitment or interchange proof):
363-9402, 360-8960, 5I-8670, 479-4131, 093-7521, 317-8766, 253-1752, 109-0078, 109-0072, 110-6326, 377-6969, 265-6619, 110-6331, 9Y-6089, 1R-1808, 214-7568, 3J-1907, 3K-0360, 10R-9815, 4W-6960, 5D-5957, 6V-3907, 8T-6762, 1R-0726, 362-2915, 132-6663, 160-9874, 176-5749, 177-7496, 180-7352, 189-9771, 524-5613, 586-3377, 603-6646, 283-5732, 308-5353, 245-4622, 283-5738, 528-8390, 335-6220, 392-0220, 308-5355, 374-2082.

Overall reviewed progress: 49/500 batches = 490/5,000 product target (9.8%). Original Cat seed list has 297 SKUs remaining (products 491–787).

## Batch 50/500 — products 491–500 (2026-11-25)

SKUs: 350-2168, 350-2178, 350-2537, 350-7735, 351-8204, 353-1697, 353-5058, 354-5833, 356-1448, 358-1398. All ten Cat product pages were retrieved and fitment/specification/kit sections inspected. All ten rows were re-queried after updates; model arrays were deduplicated and the empty fitment array for 350-2168 preserved as an empty array.

Verified updates:
- 350-2168: Cat 3512 Tier 1 to Tier 2 upgrade kit, converting 2W-8862 to 282-9664 for use with an overhaul. Cat explicitly states no compatible-model information is available and specifications are still being added. Updated its nine displayed kit components: 245-4622 aftercooler core ×1, 283-5732 camshaft ×1, 283-5738 camshaft ×1, 308-5353 camshaft ×1, 308-5355 camshaft ×1, 335-6220 cylinder head ×12, 374-2082 piston ×12, 392-0220 fuel pump injector ×12, 519-8019 turbocharger ×2. compatible_models and engine_models remain empty.
- 350-2178: Cat 3512B Tier 1 to Tier 2 upgrade kit. Confirmed Marine Engine 3512B fitment. Conversion from arrangement 180-9193 to 320-0276; Cat page says no kit parts currently associated and additional specs are not published.
- 350-2537: Cat Engine Water Pump for Industrial Engine C-9 only. Confirmed 12.1in length ×9.4in height. Cat page displays 20R-0260 Cat C9 Reman Water Pump as an alternative listing, not a guaranteed interchangeable replacement.
- 350-7735: Cat Fuel Cap Filter Kit, 4-micron filter cartridge to prevent water penetration. Added 341 distinct Cat model labels across integrated toolcarriers, scrapers, harvesters, skidders, mini excavators, drills, feller bunchers, forestry, excavators, wheel tractors, compact/track loaders, mixers, graders, tractors, wheel loaders, compactors, backhoe loaders, MHPUs, gen sets and related machine groups. Cat materials: polyamide plastic, carbon steel and acetal plastic. Current Cat page lists no associated kit parts; no BOM was inferred.
- 351-8204: Cat spherical Panhard-rod bushing for articulated/ejector trucks. Confirmed 735C/740 GC/735B/740/740C/745/735 OEM/740B/745C/735 fitment. Specs 4.13in OD, 7.68in overall length, two 0.98in holes, 5.98in center-to-center, M24 or 1in hardware; Cat explicitly says material is not specified.
- 353-1697: Cat 1220mm (48in) pallet forks, Class II, skid-steer coupler. Added 86 compatible labels across multi-terrain loaders, compact track loaders and skid-steer loaders. Specs: carriage 36.8in high ×45.8in wide, 211.6lb; tines 48 ×3.9 ×21.3in, 1.6in thick, 105.8lb; operating weight 429.9lb; overall length 58.3in. Additional related accessory listings are discovery candidates only.
- 353-5058: Cat cab air recirculation filter, lower-restriction urethane panel. Confirmed ten wheel-loader labels: 930/938K/938M/926/924K/926M/938/930K/924/930M. Specs 15.906in length ×6.409in width, 2.213in with seal /1.827in without, carbon steel/mixed metal-nonmetal.
- 354-5833: Cat oil-filter-housing drain kit, used to replace a failed housing drain. Added 203 distinct compatible labels across generator, material handler, grader, track tractors, knuckleboom loaders, feller bunchers, forestry, MHPU, pipelayers, excavators, generator sets, compactors, wheel dozers/loaders, planers, reclaimers, articulated trucks and wheeled excavators. Cat material: FKM rubber, PPA plastic and polyamide plastic. Cat page currently shows no kit parts associated; no kit BOM was inferred.
- 356-1448: Cat Heavy Duty Precious Metals Silver in-frame overhaul kit for C15 truck engine, 600–625 hp. Cat's current kit display lists 160-9874 liner gasket kit ×6, 237-0194 top ring ×6, 238-0294 oil ring ×6, 238-4737 intermediate ring ×6, 250-2940 pin retainer ×12, 356-9946 piston body ×6, 524-5565 piston pin ×6, 586-3377 cylinder liner ×6 and 606-0909 Bronze Overhaul Kit ×1. Description confirms Silver includes Bronze kit plus six pistons, liners, wrist pins, rings, retainers and rod-less unassembled cylinder pack; no core charge.
- 358-1398: Cat Suspension Link for 797F and 797B trucks. Specs port 1/8-27 PTF; Cat material field says Sealants/Adhesives Adhesive.

Cat pages:
- https://parts.cat.com/en/catcorp/product/350-2168
- https://parts.cat.com/en/catcorp/product/350-2178
- https://parts.cat.com/en/catcorp/product/350-2537
- https://parts.cat.com/en/catcorp/product/350-7735
- https://parts.cat.com/en/catcorp/product/351-8204
- https://parts.cat.com/en/catcorp/product/353-1697
- https://parts.cat.com/en/catcorp/product/353-5058
- https://parts.cat.com/en/catcorp/product/354-5833
- https://parts.cat.com/en/catcorp/product/356-1448
- https://parts.cat.com/en/catcorp/product/358-1398

Post-update verification returned all ten rows. Distinct fitment counts: 350-2168=0; 350-2178=1; 350-2537=1; 350-7735=341; 351-8204=10; 353-1697=86; 353-5058=10; 354-5833=203; 356-1448=1; 358-1398=2. No prices, stock or guaranteed interchangeability inferred.

Additional Cat-linked discovery candidates (not fitment/interchange proof):
20R-0260, 2M-4453, 4J-0525, 037-2448, 280-6794, 248-5513, 155-3537, 343-2873, 554-8864, 228-4947, 301-6948, 5P-8500, 8T-4999, 561-0644, 219-7706, 231-8601, 285-6110, 426-6548, 475-2760, 479-8086, 481-3668, 365-7606, 462-1171, 222-9020, 6I-4421, 247-6130, 0R-9449, 9Y-3368, 606-0909, 160-9874, 237-0194, 238-0294, 238-4737, 250-2940, 356-9946, 524-5565, 586-3377.

Overall reviewed progress: 50/500 batches = 500/5,000 product target (10.0%). Original Cat seed list has 287 SKUs remaining (products 501–787).

## Batch 51/500 — products 501–510 (2026-11-25)

SKUs: 360-8960, 362-3566, 362-5412, 363-9402, 364-5893, 364-8677, 364-8678, 364-9372, 365-4922, 365-7606. All ten Cat product pages were retrieved. Cat Compatible Models and Specifications sections were inspected; all ten records re-queried and model arrays deduplicated.

Verified updates:
- 360-8960: Cat Advanced High Efficiency Engine Fuel Filter Element, cartridge. Added 381 distinct Cat-compatible labels across pumper, generators, LHDs, material handlers, graders, asphalt compactors/pavers, track tractors, wheel skidders, knuckleboom loaders, marine engines, pipelayers, excavators, vibratory/soil/landfill compactors, MHPUs, gen sets, backhoe loaders, wheel/compact loaders, telehandlers, wheeled excavators, industrial loaders/engines, pneumatic compactors, forestry and related equipment. Specs 3.209in diameter ×6.102in length, Out-to-In, Advanced High Efficiency, Cartridge. Cat describes nylon center tube, molded end caps, acrylic beads and spiral roving for cleaner, more stable filtration.
- 362-3566: Rear bogie assembly for D10N/D10R/D10T2/D10/D10T. Added Alloy Steel material and rear position. Cat page's compatible-model list is exactly those five labels.
- 362-5412: Cat Fuel Filter Drain Kit. Added 375 distinct compatible labels across pumper, R1300G LHD, material handler, grader, asphalt compactor/paver, D-family tractors, wheel skidder, knuckleboom loader, pipelayer, package, forestry/log loader, excavators, vibratory/soil/landfill compactor, MHPU, gen set, wheel tractor/loader, telehandler, compact wheel loader, wheeled excavator, industrial loader/engine and wheel feller buncher. Cat says kit includes replacement drain, knob and seals; no detailed part-number BOM is currently shown. Materials FKM rubber and PPA plastic.
- 363-9402: Standard Efficiency Cabin Air Filter, polypropylene plastic panel. Added 84 distinct model labels across MD5150C rotary/track drill, special-solution machines, LD350 expanded mining, excavators, material handlers, MHPUs and hydraulic shovels. Specs 8.15in length ×7.402in width ×0.669in height, standard media, polypropylene plastic. Cat says standard-efficiency media is intended for normal operating conditions, not hazardous-material filtration.
- 364-5893: Fuel Hose Assembly. Confirmed Cat fitment SR5 generator and C32 generator set/marine auxiliary/marine engine. Material alloy copper, hose and carbon steel.
- 364-8677: Fuel Lines Hose, 10.92mm ID. Confirmed C32 marine auxiliary and marine engine fitment. Material carbon steel, alloy copper and hose.
- 364-8678: Fuel Filter Supply Tube. Confirmed C32 generator-set, marine auxiliary and marine engine fitment. Material Alloy Mixed: Metal.
- 364-9372: Fuel Filter Lines Hose Assembly. Confirmed C32 generator set/marine auxiliary/marine engine. Specs 0.5in hose ID, 18.74in overall length, Fuel and Oil High Temperature hose, Other Hose material.
- 365-4922: 538.62mm OD Duo Cone metal-to-metal facing seal. Added 18 Cat-compatible labels across 773/775/777/785/789 truck, quarry truck, tractor and off-highway truck families. Cat says detailed specifications are still being added; recorded only the published OD/title information and duo-cone type. Related-part candidates kept separate.
- 365-7606: Standard Efficiency Cabin Air Filter (Fresh Air), urethane panel. Confirmed ten wheel-loader labels: 930/938K/938M/926/924K/926M/938/930K/924/930M. Specs 13.638in length ×4.78in width, 2.213in with seal /1.827in without, carbon steel/mixed metal-nonmetal.

Cat pages:
- https://parts.cat.com/en/catcorp/product/360-8960
- https://parts.cat.com/en/catcorp/product/362-3566
- https://parts.cat.com/en/catcorp/product/362-5412
- https://parts.cat.com/en/catcorp/product/363-9402
- https://parts.cat.com/en/catcorp/product/364-5893
- https://parts.cat.com/en/catcorp/product/364-8677
- https://parts.cat.com/en/catcorp/product/364-8678
- https://parts.cat.com/en/catcorp/product/364-9372
- https://parts.cat.com/en/catcorp/product/365-4922
- https://parts.cat.com/en/catcorp/product/365-7606

Post-update verification returned all ten SKUs. Distinct compatible-model counts: 360-8960=381; 362-3566=5; 362-5412=375; 363-9402=84; 364-5893=2; 364-8677=1; 364-8678=1; 364-9372=1; 365-4922=18; 365-7606=10. Cat's public pages do not provide customer prices without login; no price/stock or interchangeability inferred.

Additional Cat-linked discovery candidates:
358-5259, 7T-5959, 327-6618, 5I-8670, 479-4131, 1R-1808, 1R-0749, 322-3155, 093-7521, 327-6618, 337-1943, 9X-7307, 123-2941, 7D-7519, 341-8543, 364-9371, 375-0296, 228-7090, 364-5898. All are related/commonly purchased leads, not proof of fitment or interchangeability.

Overall reviewed progress: 51/500 batches = 510/5,000 product target (10.2%). Original Cat seed list has 277 SKUs remaining (products 511–787).

## Batch 52/500 — products 511–520 (2026-11-25)

SKUs: 367-8137, 368-9037, 370-4617, 373-6968, 375-4809, 376-2724, 377-6969, 380-5938, 380-5940, 380-5946. All ten Cat product pages were retrieved; item-level specifications and fitment sections inspected. All ten database records re-queried after updates and model arrays deduplicated.

Verified updates:
- 367-8137: Cat Track Seal, 66.85mm (2.632in) OD, 1.25in ID, NBR/HNBR/XNBR rubber. Cat fitment: multi-terrain loaders 257B/247B/247/257. Cat says seals maintain lubrication and keep dirt/contaminants out of the pin-and-bushing cavity.
- 368-9037: Cat 10.92mm ID Fuel Hose Assembly. Confirmed C32 Generator Set, Marine Auxiliary and Marine Engine. Material alloy copper, carbon steel and hose.
- 370-4617: Cat 4-meter programming cable for ECU-to-computer/diagnostic-tool communications. Specs: 22 AWG, 1lb, polyurethane plastic. Cat public page does not provide compatible-model information; fitment remains empty.
- 373-6968: Cat 38mm hydraulic quick coupler, female end. Added 51 compatible model labels across MTL, CTL, skid-steer loaders, compact wheel loaders and wheel loaders. Material description plated steel; materials carbon steel and alloy zinc. Cat page also displays 373-6967 as a different 54mm coupler; not assumed interchangeable.
- 375-4809: Cat fluid-carrying tube assembly. Confirmed Marine Auxiliary 3512C/3516C; Marine Engine 3516C/3516E/3512C/3512E; Engine 3512E/3516C/3516E/3512C; Industrial Engine 3512E. Specs 0.98in OD; steel, mixed-metal alloy and carbon steel.
- 376-2724: Cat Engine Fuel Rail. Confirmed Engine-Machine CT13; Truck Engine CT11/CT13 SCR/CT13/CT15; On-Highway Truck CT680/CT681/CT660. Material steel/carbon steel; weight 8.1lb.
- 377-6969: Cat Standard Efficiency Engine Oil Filter, spin-on. Added 92 distinct fitment labels across MTL, CTL, asphalt pavers, mini excavators, skid-steer loaders, compact wheel loaders and wheel loaders. Specs 3.661in diameter ×3.661in length, Out-to-In, carbon steel, Standard Efficiency, Spin-On. Cat describes fiberglass spiral roving and acrylic beads that stabilize pleats and retain contaminants.
- 380-5938: Cat SALT Track Group, D10T2/D10/D10. 44 sections, 1-tooth master, single grouser, PPR, ES shoe, HD undercarriage, 610mm shoe width, 260.4mm pitch, 5.315in sprocket-side inside spread, 3.74in bushing ID, 1.125in track/master bolt thread, no RBT/ARM/clipping/wear sensor.
- 380-5940: Cat SALT Track Group, D10T2/D10/D10. 44 sections, 1-tooth master, single grouser, PPR, SES shoe, HD undercarriage, 610mm shoe width, 260.4mm pitch, 5.315in sprocket-side inside spread, 3.74in bushing ID, 1.125in track/master bolt thread, no RBT/ARM/clipping/wear sensor.
- 380-5946: Cat Link Assembly, D10T2/D10/D10. 1-tooth master, 44 sections, PPR, SALT, HD undercarriage, 260.4mm pitch. Specs: 4.921in sprocket inside spread, 5.551in roller inside spread, 2.264in rail-to-bushing OD, 3.15/7.48/9.843in shoe-bolt spacings, 3.74in bushing OD, 11.496in outside spread, 1.164in bolt-hole diameter, 2.362in rail-to-pin-boss OD, 1.125in track/master bolt thread, 11.974in pin length, 7.126in link height. Cat Compare Alternate Parts panel displays 458-7813 and 526-3004; these are candidate alternatives only, not guaranteed interchangeable.

Cat pages:
- https://parts.cat.com/en/catcorp/product/367-8137
- https://parts.cat.com/en/catcorp/product/368-9037
- https://parts.cat.com/en/catcorp/product/370-4617
- https://parts.cat.com/en/catcorp/product/373-6968
- https://parts.cat.com/en/catcorp/product/375-4809
- https://parts.cat.com/en/catcorp/product/376-2724
- https://parts.cat.com/en/catcorp/product/377-6969
- https://parts.cat.com/en/catcorp/product/380-5938
- https://parts.cat.com/en/catcorp/product/380-5940
- https://parts.cat.com/en/catcorp/product/380-5946

Post-update verification returned all ten rows. Distinct compatible-model counts: 367-8137=4; 368-9037=1; 370-4617=0; 373-6968=51; 375-4809=4; 376-2724=7; 377-6969=92; 380-5938=3; 380-5940=3; 380-5946=3. No prices, stock or unverified interchangeability inferred.

Additional Cat-linked discovery candidates:
7T-9754, 7T-9755, 215-4006, 212-6681, 3P-8681, 457-6114, 3J-1907, 538-5051, 5P-8500, 1R-1808, 373-6967, 6V-9746, 153-2994, 153-2995, 5K-9090, 131-4863, 8C-6875, 6V-8734, 196-9420, 376-2652, 376-2468, 513-4490, 110-6326, 363-5819, 110-6331, 541-6956, 265-6619, 433-6739, 309-7679, 309-7678, 306-9447, 9M-5894, 131-1650, 458-7813, 526-3004. These are related parts or Cat compare-alternate candidates and are not fitment/interchangeability proof.

Overall reviewed progress: 52/500 batches = 520/5,000 product target (10.4%). Original Cat seed list has 267 SKUs remaining (products 521–787).

## Batch 53/500 — products 521–530 (2026-11-25)

SKUs: 384-2960, 384-4562, 385-5991, 387-9865, 388-9664, 390-2615, 392-0200, 392-0204, 392-0205, 392-0206. Nine Cat product pages supplied usable item-level data; 387-9865 returned an access/internal error and its pre-existing record was retained unchanged. All ten DB rows were re-queried and model arrays deduplicated.

Verified updates:
- 384-2960: Cat SALT Track Group for D8T/D8R/D8R II/D8GC/D8 GC/D8. 5-tooth master, single grouser, 44 sections, PPR, ES shoe, HD undercarriage, 610mm (24.016in) shoe width, 215.9mm (8.5in) pitch, 3.654in sprocket-side inside spread, 3.117in bushing ID, 7/8in bolt size/thread, wear sensor present. Cat describes SALT sealing lubricant and excluding abrasives; PPR helps prevent pin end-play.
- 384-4562: Cat steering ball-stud bearing assembly. Added 28 distinct fitment labels across D10R off-highway truck, 770/772/773/775/777 truck and quarry families, and 776D/776C tractors. Specs 2.8in height ×2.8in width ×7.7in length. Cat says it includes sealed race, ball stud and strap and forms part of the steering system.
- 385-5991: Cat Fuel Rail Group. Confirmed Generator Set C7.1, Marine Engine C7.1 and Engine C7.1 MARIN. Cat explicitly says specifications are still being added; no dimensions or materials inferred.
- 387-9865: M10-1.25 ×24mm hex-head bolt. Cat page was inaccessible in this run; existing record retained (65 compatible labels and previously stored zinc-plated steel fastener dimensions/specifications) without new item-level verification.
- 388-9664: Cat 1200mm (47in) grading bucket for mini hydraulic excavators. Confirmed 305E/305.5E2 CR/305D CR/305E2 CR/305.5D/305.5E. Specs 47.2in width, 9.2ft³ capacity, 410.5lb weight, 0.8in base edge, 28.2in tip radius, pin-on interface. Cat page describes ditch cleaning, sloping, grading, trenching and finishing.
- 390-2615: Cat Fuel Injection Rail for fuel injection pump. Added 26 distinct labels across C3.4B/C32/C3.4 engine and generator sets, industrial loader, pneumatic/soil/vibratory compactor, excavator, backhoe loader, package and telehandler. Specs 3.63lb, carbon steel.
- 392-0200: Cat Fuel Injector Group. Corrected/expanded to nine distinct labels: 3512B/3508B/3516B, SR4B/SR4BHV, 3508/3512, LD700E and 3561B across gen-set, generator, marine, auxiliary, industrial, petroleum and off-highway-truck applications. Specs 14.8in ×3.0in. Cat Compare Alternate Parts shows 11R-0278 Cat Reman NWC and 20R-1264 Cat Reman Electronic Fuel Injector; these are alternatives to verify by serial number.
- 392-0204: Cat Fuel Injector Group. Corrected fitment to generator-set engines 3512/3508B/3516/3516B and marine engines 3508/3516/3512. Specs 14.8in ×3.0in. Cat Compare Alternate Parts displays 20R-1268 Reman Fuel Injector; not asserted as universal interchange.
- 392-0205: Cat Fuel Pump Injector. Expanded to five distinct labels: 3512C/3516B/3516C/3512B/3508C, across generator-set, marine, marine auxiliary, industrial, locomotive and petroleum categories. Specs 14.8in ×3.0in. Cat lists 11R-0681 Cat Reman NWC and 20R-1269 Cat Reman as alternate listings; serial-number confirmation required.
- 392-0206: Cat Injector Group. Expanded to 15 distinct labels including SR4/SR5/SR4B/SR4BHV, 3500B family, PM3516/PM3512/PM3508 power modules, marine/auxiliary, industrial, petroleum and locomotive engines, 854G wheel dozer and 992G wheel loader. Specs 14.8in ×3.0in. Cat lists 11R-0280 Cat Reman NWC and 20R-1270 Cat Reman alternatives; not assumed interchangeable.

Cat pages:
- https://parts.cat.com/en/catcorp/product/384-2960
- https://parts.cat.com/en/catcorp/product/384-4562
- https://parts.cat.com/en/catcorp/product/385-5991
- https://parts.cat.com/en/catcorp/product/387-9865
- https://parts.cat.com/en/catcorp/product/388-9664
- https://parts.cat.com/en/catcorp/product/390-2615
- https://parts.cat.com/en/catcorp/product/392-0200
- https://parts.cat.com/en/catcorp/product/392-0204
- https://parts.cat.com/en/catcorp/product/392-0205
- https://parts.cat.com/en/catcorp/product/392-0206

Post-update verification returned all ten records. Distinct fitment counts: 384-2960=6; 384-4562=28; 385-5991=2; 387-9865=65 (pre-existing, not newly verified); 388-9664=6; 390-2615=26; 392-0200=9; 392-0204=5; 392-0205=5; 392-0206=15. No price, stock or guaranteed interchangeability inferred.

Additional Cat-linked discovery candidates:
384-2962, 384-2964, 384-2968, 615-3646, 625-7306, 641-9533, 654-8598, 654-8599, 654-8600, 384-2954, 384-2978, 384-2982, 384-2984, 553-7145, 631-8965, 654-8595, 654-8602, 654-8603, 654-8606, 654-8611, 283-5593, 374-3608, 7D-5435, 336-9373, 3D-2824, 282-2785, 5P-8500, 390-3122, 387-9141, 550-8863, 311-3901, 11R-0278, 20R-1264, 248-5513, 132-6469, 1R-0756, 1R-0726, 20R-1268, 11R-0681, 20R-1269, 219-3240, 313-7770, 11R-0280, 20R-1270, 468-8825, 468-8824, 316-5980. These are Cat alternate, related or commonly purchased candidate links, not fitment/interchangeability proof.

Overall reviewed progress: 53/500 batches = 530/5,000 product target (10.6%). Original Cat seed list has 257 SKUs remaining (products 531–787).

## Batch 54/500 — products 531–540 (2026-11-25)

SKUs: 392-0213, 392-0214, 392-0216, 392-0217, 392-0219, 392-0220, 392-0221, 392-0222, 393-9936, 395-1044. All ten Cat item pages were retrieved; Cat Compatible Models and Specifications were inspected and all database rows re-queried. Injector fitment arrays were corrected to the exact model labels visible on Cat pages.

Verified updates:
- 392-0213: Cat Fuel Pump Injector. Added nine Cat labels: Engine 3516E; Truck 793D/793C/797/789C/797B; Locomotive Engine 3516B; Wheel Loader 994F/994H. Specs 14.8in ×3.0in. Cat Compare Alternate Parts lists 11R-0284 Cat Reman NWC and 20R-0850 Cat Reman Fuel Injector.
- 392-0214: Cat Injector Group. Corrected to six distinct engine labels 3508/3516/3512/3508B/3516B/3512B across Marine Engine, Marine Auxiliary, Industrial Engine and Locomotive Engine. Specs 14.8in ×3.0in.
- 392-0216: Cat Injector Group. Corrected to eight distinct labels SPF343C, SR5, C4.4, 3516C, 3512C, 3512B, TH48-E80 and TH48-E70 across pumper, generator, engine-machine, generator-set, marine, industrial, locomotive and petroleum categories. Specs 14.8in ×3.0in. Cat alternatives: 11R-0682 Cat Reman NWC and 20R-1277 Cat Reman.
- 392-0217: Cat Injector Group. Corrected to 11 distinct labels 3512B/3508B/3516B, SR4/SR5/SR4B/SR4BHV, PP3516, PM3508/PM3516/PM3512. Cat categories include gen-set engine, generator, generator set, power module, marine auxiliary, industrial, petroleum and petroleum gen set. Specs 14.8in ×3.0in. Cat alternatives: 11R-0286 Cat Reman NWC and 20R-1278 Cat Reman.
- 392-0219: Cat Fuel Pump Injector. Corrected to five labels SR4B/SR4/3512C/3508C/3516C across generator, generator set, marine auxiliary, industrial, petroleum engine and petroleum gen-set. Specs 14.8in ×3.0in. Cat alternatives: 11R-0665 Cat Reman NWC and 20R-1280 Cat Reman Electronic Fuel Injector.
- 392-0220: Cat Fuel Pump Injector. Corrected to 11 distinct labels SR5/SR4B/3516C/3516C GEN/3512C/3516/3512/3508C/3508B/3516B/3512B across generator, generator set, power module, marine engine and marine auxiliary. Specs 14.8in ×3.0in.
- 392-0221: Cat Fuel Injector Group. Corrected to 11 distinct labels 3516C/SR5/3516C GEN/3516C GEN SET/3516E/3512C/XQC1200/XQC1600/3512B/789D/789 across engine-machine, generator, generator set, power module, marine, industrial and truck categories. Specs 14.8in ×3.0in. Cat alternative: 20R-0863 Cat Reman Fuel Injector.
- 392-0222: Cat Injector Group. Corrected to seven distinct labels SR4B/3516C/3512C/3512/3512B/3508B/3508C across generator, generator set, marine, industrial, engine, petroleum and locomotive. Specs 14.8in ×3.0in. Cat alternatives: 11R-0667 Cat Reman NWC and 20R-1282 Reman Electronic Fuel Injector.
- 393-9936: Cat Cylinder Head Rail Tube, carries fuel from the fuel rail to cylinder-head injectors. Confirmed Truck Engine CT15 and On-Highway Truck CT660; material Carbon Steel.
- 395-1044: Cat SALT Track Group for D11T/D11 XE/D11. 1-tooth master, single grouser, 41 sections, PPR, ES shoe, HD undercarriage, 710mm (27.953in) shoe width, 317.5mm (12.5in) pitch, 5.748in sprocket-side inside spread, 4.331in bushing ID, 1.375in track bolt thread, M36 master bolt, no RBT/ARM/clipping/wear sensor. Cat says sleeve-bearing track reduces pin/bushing galling; the listed compare-alternate and related track-group variants are discovery candidates only.

Cat pages:
- https://parts.cat.com/en/catcorp/product/392-0213
- https://parts.cat.com/en/catcorp/product/392-0214
- https://parts.cat.com/en/catcorp/product/392-0216
- https://parts.cat.com/en/catcorp/product/392-0217
- https://parts.cat.com/en/catcorp/product/392-0219
- https://parts.cat.com/en/catcorp/product/392-0220
- https://parts.cat.com/en/catcorp/product/392-0221
- https://parts.cat.com/en/catcorp/product/392-0222
- https://parts.cat.com/en/catcorp/product/393-9936
- https://parts.cat.com/en/catcorp/product/395-1044

Post-update verification returned all ten SKUs. Distinct fitment counts: 392-0213=9; 392-0214=6; 392-0216=8; 392-0217=11; 392-0219=5; 392-0220=11; 392-0221=11; 392-0222=7; 393-9936=2; 395-1044=3. No customer prices, stock or universal interchangeability inferred.

Additional Cat-linked discovery candidates:
275-2604, 245-4907, 132-6469, 245-4908, 3J-1907, 11R-0284, 20R-0850, 272-0760, 3S-9643, 7N-4927, 230-2520, 6V-1454, 11R-0682, 20R-1277, 248-5513, 214-7566, 2A-4429, 468-8824, 316-5980, 11R-0286, 20R-1278, 1R-0756, 1R-0726, 8N-6309, 5D-5957, 11R-0665, 20R-1280, 5H-6734, 468-8825, 197-7055, 20R-0863, 154-6389, 219-3240, 11R-0667, 20R-1282, 395-1050, 526-3867, 526-3868, 570-3234, 570-3236, 570-3242, 572-3289, 601-4080, 601-4081, 601-4083, 601-7902, 375-5922, 384-3012, 395-1046, 395-1048, 395-1052, 526-3870, 526-3871, 595-3220, 601-4085, 601-4089, 184-6306, 184-6305, 602-0406, 602-0405, 187-3298. These are Cat alternate/related/commonly purchased leads, not confirmed fitment or interchange.

Overall reviewed progress: 54/500 batches = 540/5,000 product target (10.8%). Original Cat seed list has 247 SKUs remaining (products 541–787).

## Batch 55/500 — products 541–550 (2026-11-25)

SKUs: 396-4129, 397-4971, 397-5051, 398-3011, 399-8470, 3B-8489, 3N-0759, 3S-2093, 3T-2160, 3T-3434. Nine Cat pages supplied usable item-level information; 399-8470 returned an access/internal error and its existing empty fitment/spec record was left untouched. All ten rows were re-queried and model arrays deduplicated.

Verified updates:
- 396-4129: Cat 29-liter compressed nitrogen accumulator for hydraulic, brake and suspension pressure storage. Added 14 distinct truck models (793/794/789/798 and MT4400D AC families), 75.8in length, 7.0in height, carbon steel. Cat Compare Alternate Parts displays 20R-8270 Cat Reman Accumulator; dealer/serial-number confirmation is required. Service warning retained: system pressure must be safely relieved before service.
- 397-4971: Cat Exhaust Manifold. Confirmed Cat Compatible Models include Generator Set 3516C, Marine Auxiliary 3512C/3516C, Marine Engine 3516C/3512C and Petroleum Engine 3516C. Specifications are still being added.
- 397-5051: Cat General Duty Throttle Control Rod. Cat explicitly marks it discontinued; corrected is_active=false. Added 31 distinct model labels across gen-set engines, SR4 WEG generator, engine-machine, marine, industrial, petroleum, gas engines and 3508 petroleum package. Material Alloy Zinc/Carbon Steel.
- 398-3011: Cat Diesel Exhaust Fluid tank filler cap. Added 280 distinct model labels across generators, scrapers, asphalt compactors, skidders, rotary drills, feller bunchers, forestry, excavators, MTL/CTL, wheel tractors, soil compactors, petroleum engines, wheel loaders, telehandlers, articulated trucks, graders, MHPUs, pipelayers, wheel dozers, compactors and related equipment. Specs 2.9in OD ×2.5in height, acetal plastic, blue, open-vented, hydrophobic membrane, 100-micron rating.
- 399-8470: Cat page inaccessible; existing record has no compatible models/specifications. No changes or inferred claims.
- 3B-8489: Cat 1/8-27 PTF hex-head special grease fitting adapter. Added 436 distinct Cat model labels across integrated toolcarriers, wheel harvesters, military gen sets, grapple-shovels, mini excavators, rotary drills, track feller bunchers, harvester heads, excavators and additional machine families. Specs 0.7in length ×0.4in height, plated steel, alloy mixed metal/steel/carbon steel/zinc.
- 3N-0759: Cat 184.95mm ID toric sealing ring, 12.7mm cross section, VMQ silicone rubber. Added 103 distinct fitment labels across gen sets, hydraulic controls, compactors, ejector trucks, wheel dozers/loaders, tractors, skidder, winches, articulated trucks, pipelayers, wheel feller bunchers and bulldozers. Cat material guidance specifically says silicone is suitable for air/engine-oil applications but should not be used with diesel fuel, coolant/urea, hydraulic oil, ATF or biodiesel.
- 3S-2093: Cat 202mm cable strap, Nylon 6/6/12 plastic. Added 521 distinct model labels across integrated toolcarriers, machine control, harvesters, power packs, military gen sets, utility vehicles, mini excavators, rotary drills, feller bunchers, harvester heads, excavators, compactors and many further categories.
- 3T-2160: Cat Board. Confirmed SR4 generator; 3408 engine-machine; 3406/3408/3408B/3408C/3406B/3412/3406C generator-set/marine/industrial engines; G3406 gas engine; PR-1000/PR-1000C cold planers. Material Glass Ceramic/Alloy Copper.
- 3T-3434: Cat 12.7mm (0.5in) OD spherical plug used in electric-motor drive-housing assemblies. Added 278 distinct model labels across generators, truck engines, skidders, rotary drills, feller bunchers, underground trucks, excavators, wheel tractors, petroleum/industrial engines, compactors, wheel dozers/loaders and articulated trucks. Cat page does not specify a material; none inferred.

Cat pages:
- https://parts.cat.com/en/catcorp/product/396-4129
- https://parts.cat.com/en/catcorp/product/397-4971
- https://parts.cat.com/en/catcorp/product/397-5051
- https://parts.cat.com/en/catcorp/product/398-3011
- https://parts.cat.com/en/catcorp/product/399-8470
- https://parts.cat.com/en/catcorp/product/3B-8489
- https://parts.cat.com/en/catcorp/product/3N-0759
- https://parts.cat.com/en/catcorp/product/3S-2093
- https://parts.cat.com/en/catcorp/product/3T-2160
- https://parts.cat.com/en/catcorp/product/3T-3434

Post-update verification returned all ten rows. Distinct compatible-model counts: 396-4129=14; 397-4971=2; 397-5051=31 (inactive); 398-3011=280; 399-8470=0 (unchanged); 3B-8489=436; 3N-0759=103; 3S-2093=521; 3T-2160=11; 3T-3434=278. No current stock/prices or unsupported replacement equivalence inferred.

Additional Cat-linked discovery candidates:
238-5084, 228-7093, 7M-8485, 214-7568, 228-7092, 20R-8270, 4J-6750, 3N-3787, 1K-6539, 5K-0605, 4N-4523, 387-5467, 451-2774, 391-5262, 378-3187, 418-2073, 3J-1907, 3K-0360, 6V-8398, 6V-8397, 3D-2824, 6F-6673, 8D-4771, 2R-0098, 9Y-6089, 8C-3089. These are Cat alternate/related/commonly purchased candidate leads only; each needs its own item-page verification.

Overall reviewed progress: 55/500 batches = 550/5,000 product target (11.0%). Original Cat seed list has 237 SKUs remaining (products 551–787).

## Batch 56/500 — products 551–560 (2026-11-25)

SKUs: 3T-5760, 416-0613, 416-4686, 420-9876, 420-9877, 422-7389, 422-7690, 422-7692, 422-7693, 423-3676. Nine Cat pages supplied usable item-level evidence; 422-7692 returned an access/internal error and its existing D9 fitment record was preserved without new claims. All ten rows were re-queried and model arrays deduplicated.

Verified updates:
- 3T-5760: Cat 12V 31 BCI heavy-duty maintenance-free accessible wet battery. Added 713 distinct Cat model labels across generator, integrated toolcarrier, skidder, compactor, excavator, wheel tractor, backhoe loader, wheel dozer, landfill compactor, telehandler, wheel loader, compact wheel loader, articulated truck, wheeled excavator, pneumatic/vibratory compactor, industrial/marine/gas engines, tractor, pipelayer, mining excavator, truck and agricultural equipment. Specs: 750 CCA, 165-minute reserve, 100Ah, 31/30h group, SAE posts, 13 ×6.8 ×9.5in, 55lb, polypropylene plastic case, calcium-lead alloy grid.
- 416-0613: Cat Water Pump with Impeller used in engine front housing. Added eight distinct labels: 3516C/3516C GEN, 3512C, 3516, 3516B, XQC1600, 793B, 793C. Cat categories include generator set, marine engine, power module, marine auxiliary, industrial engine, truck, petroleum engine and locomotive engine. Specs 20.8in ×13.4in; material field Oil Fluid. Cat Compare Alternate Parts displays 10R-9598 Cat Reman Auxiliary Sea Water Pump; this is an alternative listing, not guaranteed serial-number interchange.
- 416-4686: Cat Pump Group. Corrected to six distinct labels 3512B/3508C/3512PETROL/3508PETROL/3512/3508 across generator set, marine engine, marine auxiliary, engine, industrial engine and petroleum engine. Cat page explicitly says description and specifications are still being added; no dimensions/material inferred.
- 420-9876: Cat General Duty rubber track, 381mm wide, 100mm pitch, 42 sections/lugs, zig-zag tread. Confirmed six MTL models 257D/257D3/257B/247B/247B3/257B3. Specs 74.72in length, 15.24in height, 30.91in overall width, 165.35in circumference, 15in belt width, 188.43lb, reinforced rubber/fiber, black, Heavy Duty Bar, GD system. Cat describes it as a lower-initial-cost option for older/lower-use machines and less aggressive soft-ground applications.
- 420-9877: Cat General Duty rubber track, 457mm wide, 100mm pitch, 51 sections/lugs, zig-zag tread. Confirmed 11 MTL/CTL models 277D/287C/277C/297D2/297D2 XHP/287C2/277C2/297D/297D XHP/287D/297C. Specs 90in length, 19.69in height, 35.43in overall width, 200.79in circumference, 17.99in belt width, 292.99lb, reinforced rubber/fiber, black, Heavy Duty Bar, GD system.
- 422-7389: Cat External Engine Oil Pump Kit. Added 13 distinct compatible labels across 3512B gen-set engine, G3508/G3516/G3512 and 3500-family generator sets, power modules, marine/marine auxiliary, petroleum, locomotive and gas engines. Cat kit contains 11 displayed lines: 109-2332 ×2; 111-1349, 1H-9696, 238-5080, 238-5081, 259-4600, 298-6387, 3J-1907, 6V-3908, 6V-5101 and 7N-5057 ×1 each. Description says it supplies gaskets/seals for reinstalling an external oil pump.
- 422-7690: Cat undercarriage arrangement, camber-only right-hand configuration. Confirmed D9T/D9/D9R/D9 GC track-type tractors.
- 422-7692: Cat right-hand undercarriage arrangement. Cat page inaccessible in this run; existing D9T/D9/D9R/D9 GC fitment retained unchanged.
- 422-7693: Cat left-hand undercarriage track frame. Confirmed D9T/D9/D9R/D9 GC track-type tractors. Cat description explains track-frame support, traction and undercarriage load distribution; no dimensional specs published.
- 423-3676: Cat Lift Arm Quick Coupler. Added 28 distinct fitment labels across MTL, CTL, mini hydraulic excavators and skid-steer loaders. Specs 45.3in length ×8.8in width ×17.1in height, 176.41lb, medium gloss black, alloy steel.

Cat pages:
- https://parts.cat.com/en/catcorp/product/3T-5760
- https://parts.cat.com/en/catcorp/product/416-0613
- https://parts.cat.com/en/catcorp/product/416-4686
- https://parts.cat.com/en/catcorp/product/420-9876
- https://parts.cat.com/en/catcorp/product/420-9877
- https://parts.cat.com/en/catcorp/product/422-7389
- https://parts.cat.com/en/catcorp/product/422-7690
- https://parts.cat.com/en/catcorp/product/422-7692
- https://parts.cat.com/en/catcorp/product/422-7693
- https://parts.cat.com/en/catcorp/product/423-3676

Post-update verification returned all ten SKUs. Distinct fitment counts: 3T-5760=713; 416-0613=8; 416-4686=6; 420-9876=6; 420-9877=11; 422-7389=13; 422-7690=4; 422-7692=4 (pre-existing, not reverified); 422-7693=4; 423-3676=28. No prices or current stock inferred. Rubber-track descriptions explicitly retain Cat's General Duty use-case limitation.

Additional Cat-linked discovery candidates:
1R-1808, 3J-1907, 1R-0749, 326-1644, 3K-0360, 10R-9598, 5H-6734, 271-4926, 2H-3928, 6V-6809, 2M-9780, 109-2332, 111-1349, 1H-9696, 238-5080, 238-5081, 259-4600, 298-6387, 6V-3908, 6V-5101, 7N-5057, 3S-9643, 7N-4782, 1R-0726, 4W-3027, 033-6031, 345-6511, 142-9091, 5B-0651, 6K-4148, 388-7978. Candidate leads only; kit components/related parts do not automatically establish interchangeability.

Overall reviewed progress: 56/500 batches = 560/5,000 product target (11.2%). Original Cat seed list has 227 SKUs remaining (products 561–787).

## Batch 57/500 — products 561–570 (2026-11-25)

SKUs: 432-0153, 433-6739, 435-1295, 436-1092, 440-0216, 440-2667, 442-8972, 443-1047, 447-8618, 450-1408. All ten Cat item pages were retrieved and relevant fitment/spec/kit sections inspected. All records were re-queried; compatible-model arrays deduplicated.

Verified updates:
- 432-0153: Cat Basic Turbocharger Group. Confirmed Cat labels: Gen Set Engine POWER SYS; Generator XQP500; Generator Set C15/C15 GEN SE/C9; Industrial Engine C15. Material ductile spheroidal iron. Cat Compare Alternate Parts displays 30R-0355 Cat Reman Turbocharger; serial-number fit must be checked.
- 433-6739: Cat Track Segment for D10T2/D10. Specs 6 bolts, 5 teeth, 261mm pitch, tough steel/alloy steel, 20.827in tip radius, 20.659in pitch-circle radius, 1.949in bushing radius, heavy-duty undercarriage, relieved, 4.528in tooth width, 20.63in packing-offset radius, 16.535in bolt-circle radius, 10.276in pitch, 0.079in backlash, offset sprocket mounting, 40-degree pocket angle, 1in bolt thread, 15.197in inner radius.
- 435-1295: Cat Complete Engine Arrangement for 329D/329D L excavators, C7 engine, 115A brush-type alternator and PA90L starter. Cat explicitly marks part discontinued; set is_active=false. Cat displays 10R-4134 Cat C7 Reman Short Block and 20R-2528 Cat C7 Reman Engine as alternatives; neither asserted as universal replacement.
- 436-1092: Cat Engine Fuel Rail. Confirmed 34 Cat model labels across MTL 257D3/257D/277D/287D; CTL 259D/289D/279D/289D3/253/259D3/279D3; pavers AP355/AP300F/AP300/AP355F; mini excavators 308.5/308/309/308E2 variants/310; skid steers 242D3/246D3/246D/236D/262D3/236D3/242D/262D; compact wheel loaders 908M/906M/907M. Specs 3.24lb, carbon steel.
- 440-0216: Cat Foundational Level Engine Overhaul Kit / Land Drilling Bundled Repair Solution for 3512 engine overhaul. Cat fitment: generator SR4B/SR4BHV, generator set 3512B and petroleum engine 3512C. Cat reports 55 kit items; first 32 lines visible in the public page were recorded, 23 further lines did not load in this review. Visible components include camshaft bearings, O-rings, vent-line valve, pressure-regulator plunger, sleeve bearings, manifold gasket, rocker buttons, aftercooler install kit, filters, water-temperature regulators, oil-pump bypass valve, cylinder-head install kit, flywheel-housing gasket, oil-cooler/lines kit, block/oil-pan gasket kit, turbocharger-installation gasket kit and retaining rings.
- 440-2667: Cat 5/8-18 3A suspension-cylinder charging valve. Added 79 distinct Cat model labels across AD55B/AD60/AD63 underground trucks, 725/730/735/740/745 articulated/ejector trucks, D10R off-highway truck, 769/770/772/773/775/777/785/789/793/794/795/796/797/798 haul trucks, 776/784 tractors and RC20 rotary cutter. Specs steel/carbon steel, 1.86in overall length, 0.875in hex, 5/8-18 thread, 3000psi maximum working pressure, nitrogen medium, tethered cap and O-ring seal.
- 442-8972: Cat Heavy Duty Precious Metals Silver in-frame overhaul kit for C15 truck engine. Confirmed C15. Current Cat kit list has nine lines: 160-9874 liner gasket kit ×6; 250-2940 pin retainer ×12; 306-4014 oil piston ring ×6; 306-4016 intermediate ring ×6; 310-4188 top ring ×6; 325-9492 piston body ×6; 442-7439 Bronze Overhaul Kit ×1; 524-5565 piston pin ×6; 586-3377 cylinder block liner ×6. Cat says Silver adds pistons, liners, wrist pins, rings, retainers and a rod-less unassembled cylinder pack to the Bronze kit; no core charge. Corrected piston-ring count to 18 total.
- 443-1047: Cat Lubrication Pump for automatic lubrication systems. Confirmed six labels: 5110B mining excavator, LD350 expanded mining, 24M/24 graders and 6015B/6015 hydraulic shovels. Specs steel body/carbon steel, 4-bolt mounting, SAE #4 O-ring inlet, 1/4 NPTF service ports, 36.5in length ×12.6in width ×9.1in height.
- 447-8618: Cat Element Assembly. Confirmed 19 distinct model labels across generator-set, engine, petroleum engine, off-highway truck, petroleum gen-set, hydraulic shovel, marine/auxiliary, industrial engine, gas-engine and petroleum-package applications. Material Alloy Aluminum.
- 450-1408: Cat Top Piston Ring for 3512/3516/3520 industrial-engine families. Added nine Cat labels: POWER SYS, G3520, G3516C, G3516H, G3512H, G3516, G3520H, 3512E, 3516E. Specs 6.69in gage diameter, 6.29in ID, 0.15in width, steel/carbon steel.

Cat pages:
- https://parts.cat.com/en/catcorp/product/432-0153
- https://parts.cat.com/en/catcorp/product/433-6739
- https://parts.cat.com/en/catcorp/product/435-1295
- https://parts.cat.com/en/catcorp/product/436-1092
- https://parts.cat.com/en/catcorp/product/440-0216
- https://parts.cat.com/en/catcorp/product/440-2667
- https://parts.cat.com/en/catcorp/product/442-8972
- https://parts.cat.com/en/catcorp/product/443-1047
- https://parts.cat.com/en/catcorp/product/447-8618
- https://parts.cat.com/en/catcorp/product/450-1408

Post-update verification returned all ten SKUs. Distinct compatible-model counts: 432-0153=5; 433-6739=2; 435-1295=2 (inactive); 436-1092=34; 440-0216=4; 440-2667=79; 442-8972=1; 443-1047=6; 447-8618=19; 450-1408=9. No current stock/prices or guaranteed interchangeability inferred.

Additional Cat-linked discovery candidates:
30R-0355, 3K-0360, 9M-5894, 309-7679, 8D-4771, 10R-4134, 20R-2528, 436-1914, 436-1105, 436-1108, 436-1106, 436-1107, 033-6031, 101-1198, 109-7411, 111-4374, 114-5477, 116-1365, 122-8856, 127-5400, 136-7227, 153-9963, 154-6389, 175-6618, 1J-9671, 1R-0726, 1R-0756, 214-7568, 219-3240, 235-3546, 238-5080, 238-5081, 248-5513, 271-4926, 2W-1635, 2W-1969, 355-0776, 3S-9643, 423-9461, 426-0447, 435-3163, 457-6112, 4W-0530, 3J-1907, 3B-8489, 114-3361, 228-7089, 030-0167, 434-3378, 1R-1808, 1R-0755, 3J-7354, 348-8779, 230-2520, 423-4277, 223-6361, 7N-2046. Candidate BOM/related/alternate leads only; not proof of fitment or interchangeability.

Overall reviewed progress: 57/500 batches = 570/5,000 product target (11.4%). Original Cat seed list has 217 SKUs remaining (products 571–787).

## Batch 58/500 — products 571–580 (2026-11-25)

SKUs: 453-2315, 456-0027, 457-5312, 457-9635, 458-7790, 458-9582, 460-0310, 460-8213, 464-9911, 467-5333. All ten Cat item pages were retrieved; item-level model/spec/kit sections inspected. All ten rows were re-queried and compatible-model arrays deduplicated.

Verified updates:
- 453-2315: Cat Oil Cooler and Lines Gasket Kit, Marine Bundled Repair Solution for C18 overhaul. Cat fitment: Generator SR4, Gen Set Engine POWER SYS, Generator Set C18, Marine Engine C18. Recorded all 19 displayed kit components and quantities: 109-0077 ×2; 125-0434 ×1; 126-4935 ×1; 167-4407 ×1; 214-7566 ×2; 214-7568 ×4; 238-5084 ×6; 2P-3760 ×2; 2P-4305 ×4; 3D-2824 ×4; 3J-1907 ×2; 3J-7354 ×1; 3K-0360 ×1; 5K-9090 ×1; 6V-3908 ×3; 7M-8485 ×1; 8C-3445 ×1; 8C-5230 ×4; 8L-2786 ×1. Cat says specifications are still being added.
- 456-0027: Cat Fuel Injection Pump Line. Confirmed Pumper SPF743, Engine 3512E and Petroleum Engine 3512E. Material Carbon Steel. Cat parts diagram shows related lines 456-0025/456-0026/456-0024/456-0028 and 167-4407; these are candidates only.
- 457-5312: Cat Fuel Pump Injector. Confirmed Marine Engine 3516E/3512E, Engine 3512E/3516E, Industrial Engine 3512E and Locomotive Engine 3512E. Weight 6.76lb. Cat Reman alternatives 11R-1956 NWC and 30R-0250; Cat page also shows commonly purchased 1R-0756/1R-0726/3S-9643/7N-4927/245-4907.
- 457-9635: Cat Track Roller Group, 466mm OD/422mm hub width. Cat explicitly marks it discontinued; corrected is_active=false. Confirmed Shovel 6040 and Hydraulic Shovel 6060/6030/6040. Specs 5.472in width, 9.849in mounting-bolt traverse spacing, adhesive, HD undercarriage, carrier-roller compatible, 7.092in bushing/bore ID, 18.346in OD, 14.803in hub diameter, 24.472in axial spacing, 16.614in hub width. Dealer must confirm any replacement.
- 458-7790: Cat Track Group for D9T/D9/D9R/D9 GC. 5-tooth master, single grouser, 43 sections, PPR, SALT, ES shoe, 610mm shoe width, 240mm pitch, 4.528in sprocket inside spread, 9.449in pitch, GD undercarriage, 1in track/master bolt, GLT grease-track type, 3.346in bushing ID, no RBT/ARM/clipping/wear sensor.
- 458-9582: Cat standard-performance primer-yellow, 12oz (340g) aerosol can, yellow, Carbon Steel. No compatible-model list published.
- 460-0310: Cat Advanced High Efficiency Fuel Water Separator, spin-on. Added 30 distinct Cat model labels across D6K2/D6N tractors, C13 MARINE/MG630, C4.4, soil/vibratory compactors, backhoe loaders, compact wheel loaders and wheel loaders. Specs 4.252in diameter ×6.181in length, Corrosion Preventative Fluid, Advanced High Efficiency, Spin-On. Cat describes acrylic beads, spiral roving, nylon center tube and molded end caps.
- 460-8213: Cat Common Rail Fuel Injector for C9/C9.3. Added ten labels: SR4B, C9.3 generator set/marine engine, PL72 pipelayer, PM312/PM313/PM310 cold planers, 972M/972L/966L/966M wheel loaders. Material Fuel Fluid. Cat alternative: 20R-5077 Cat Reman Common Rail Fuel Injector (CR350/C9).
- 464-9911: Cat 619mm (24in) heavy-duty mini-excavator bucket, 130L (4.6ft³), 45mm (1.8in) pin-on interface. Confirmed 306/305 CR/305E2/305.5E2. Specs 24.4in width, 233.7lb, 0.8in base edge, 30.9in tip radius. Cat page describes use in abrasive mixed dirt, clay and rock.
- 467-5333: Cat Cylinder Head Installation Kit. Confirmed eight labels: Challenger MT865/MTC865; Truck Engine C-18; Industrial Engine C18/C15; Cold Planers PM620/PM622; Hydraulic Shovel 6018 FS. Cat explicitly says no parts are currently associated with this kit; no BOM inferred.

Cat pages:
- https://parts.cat.com/en/catcorp/product/453-2315
- https://parts.cat.com/en/catcorp/product/456-0027
- https://parts.cat.com/en/catcorp/product/457-5312
- https://parts.cat.com/en/catcorp/product/457-9635
- https://parts.cat.com/en/catcorp/product/458-7790
- https://parts.cat.com/en/catcorp/product/458-9582
- https://parts.cat.com/en/catcorp/product/460-0310
- https://parts.cat.com/en/catcorp/product/460-8213
- https://parts.cat.com/en/catcorp/product/464-9911
- https://parts.cat.com/en/catcorp/product/467-5333

Post-update verification returned all ten SKUs. Distinct fitment counts: 453-2315=3; 456-0027=2; 457-5312=2; 457-9635=3 (inactive); 458-7790=4; 458-9582=0; 460-0310=30; 460-8213=10; 464-9911=4; 467-5333=8. No customer prices or current stock inferred.

Additional Cat-linked discovery candidates:
109-0077, 125-0434, 126-4935, 167-4407, 214-7566, 214-7568, 238-5084, 2P-3760, 2P-4305, 3D-2824, 3J-1907, 3J-7354, 3K-0360, 5K-9090, 6V-3908, 7M-8485, 8C-3445, 8C-5230, 8L-2786, 248-5513, 144-6142, 261-3450, 456-0025, 456-0026, 456-0024, 456-0028, 167-4407, 11R-1956, 30R-0250, 1R-0756, 1R-0726, 3S-9643, 7N-4927, 245-4907, 4J-0527, 477-7938, 1P-3705, 590-0196, 3K-0360, 3J-1907, 6V-9746, 3D-2824, 1R-1804, 7W-2326, 528-0585, 346-6688, 471-7003, 20R-5077, 260-0113, 557-9567, 388-0546, 274-1639, 282-2785. These are kit components, alternatives or related items; none is automatically a fitment/interchange claim.

Overall reviewed progress: 58/500 batches = 580/5,000 product target (11.6%). Original Cat seed list has 207 SKUs remaining (products 581–787).

## Batch 59/500 — products 581–590 (2026-11-25) — blocked / pending verification

SKUs attempted: 468-6720, 469-1935, 469-1971, 469-1982, 469-1986, 469-1987, 469-1988, 469-1989, 469-1990, 469-1991.

- All ten Cat Parts Store item URLs returned access/internal errors in this review.
- A Supabase query confirmed that none of these ten part numbers currently has a row in public.part_catalog (also checked normalized part_number values). No placeholder rows were inserted and no fitment, price, availability, image or specification was invented.
- Public cross-reference search identified 469-1989 as a piston-pin alternate/reference associated with 180-7350 / 524-5565 in independent aftermarket listings. This is not proof of genuine Cat stock, Cat supersession or universal interchange; added only to the independent-supplier discovery queue.
- A scan of the Cat C18 Industrial Engine Parts Book (SEBP8111-71) shows 469-1990 under available engine repair kits. Added as a Cat-linked discovery candidate only; exact kit scope and applicability still need verification.
- Search result 469-1935 was an NSN cross-reference (warning light) and is not treated as Cat part evidence.

No database changes made. Batch 59 remains pending; verified progress remains 58/500 batches = 580/5,000 products (11.6%). Original Cat seed list has 197 SKUs after this attempted group, but these ten are not counted as completed research until item-level verification and catalog rows are established.

Cat item URLs attempted:
- https://parts.cat.com/en/catcorp/product/468-6720
- https://parts.cat.com/en/catcorp/product/469-1935
- https://parts.cat.com/en/catcorp/product/469-1971
- https://parts.cat.com/en/catcorp/product/469-1982
- https://parts.cat.com/en/catcorp/product/469-1986
- https://parts.cat.com/en/catcorp/product/469-1987
- https://parts.cat.com/en/catcorp/product/469-1988
- https://parts.cat.com/en/catcorp/product/469-1989
- https://parts.cat.com/en/catcorp/product/469-1990
- https://parts.cat.com/en/catcorp/product/469-1991

Independent source leads:
- https://www.highwayandheavyparts.com/product/1807350-caterpillar-c15-piston-pin-new-5245565/
- https://www.reliableaftermarketparts.com/products/1807350-pin-piston-fits-caterpillar-models
- https://www.scribd.com/document/430948533/C18-Industrial-Engine-sn-WJH-WRH-Part-book-pdf

## Batch 60/500 — products 591–600 (2026-11-25)

SKUs: 487-0039, 494-1279, 497-5606, 499-6727, 4K-7038, 4N-0733, 4N-0933, 4P-1384, 4W-1434, 4W-7019. All ten Cat product pages retrieved; item-level fitment/spec/kit sections inspected. All ten database records re-queried and compatible-model arrays deduplicated.

Verified updates:
- 487-0039: Cat Fuel Lines Hose Assembly for C32 marine engine fuel delivery. Confirmed C32 fitment; materials alloy copper, carbon steel and hose. No public dimensions supplied.
- 494-1279: Cat Engine Overhaul (Top End) Kit. Fitment labels: Gen Set Engine 3516; Generator Set 3512; Marine Engine 3516/3512; Industrial Engine 3508B/3512B; Locomotive Engine 3516/3512; Petroleum Engine 3512C. Recorded 32 visible components and quantities from the Cat kit display; Cat reports 37 total, with five further lines not loaded in this public-page session. Components include O-rings, gaskets, filters, regulators, bearings, springs and turbocharger/water-pump/oil-cooler installation kits.
- 497-5606: Cat 300.025mm ID engine cylinder block liner for Gas Engine G3612. Material Gray (Flake) Iron. Cat page explains liner function in piston running surface and heat transfer; no other dimensional specs published. Related product panel shows 290-2041 piston assembly, 6I-4545 O-ring, 143-2878 cylinder-head gasket and 227-2902 connecting-rod bearing; these are discovery leads only.
- 499-6727: Cat Driver Safety System (DSS), non-intrusive in-cab fatigue/distraction detection with audible and seat-vibration alerts and event notification to monitoring center. Added 129 distinct Cat model labels across underground articulated trucks, articulated/ejector trucks, wagons, CATSAFETY, industrial engines, haul/quarry/off-highway trucks and tractors. Material field Carbon Steel. Page shows a generic “Replaced” indicator but no replacement SKU in the visible content; kept active and did not infer supersession.
- 4K-7038: Cat Track Bolt, 41.28mm (1.625in) long, 9/16in (0.5625in) size, 18mm pitch. Added 60 distinct fitment labels across D1-D4/D3-D4 track tractors, compact track loaders, asphalt pavers, ripper, hydraulic control, track loaders, excavators, cold planers, bulldozers, winches and backhoes. Specs 0.843in grip, RH, zinc-phosphate/oil coating, boron steel/coating fluid/alloy zinc, Cat/ASTM F2882 170 Ksi.
- 4N-0733: Cat Oil Pump Group. Added 50 distinct Cat model labels spanning SR4 generator, 3400/3126 truck engines, R2900 LHD, 16G/16H graders, 3608 military gen-set/marine auxiliary, 3508/3412 marine engines, stabilizer mixer, 245 excavator, wheel tractors/scrapers, G3406 generator set, reclaimers, compactors, cold planer, wheel dozer/loader, landfill compactor, soil stabilizer, road reclaimer, articulated truck and industrial/gas engines. Specs 14.3in length ×7.0in height.
- 4N-0933: Cat Gasket. Added 296 distinct compatible-model labels across WEG/SR4B/SR500/XQP500 generators, 3400/C16/C15/C18 engine families, integrated toolcarriers, skidders, excavators, wheel tractors/scrapers, compactors, wheel loaders/dozers, articulated/underground trucks, marine/industrial/gas engines, track tractors/loaders, reclaimers, pavers, pipelayers, winches, graders, shovels, power modules and Challenger tractors. Cat materials: Rubber & Cork, Rubber & Fiber Gasket, Rubber Gasket. No dimensions published.
- 4P-1384: Cat Fuel Injection Pump. Confirmed 3406B/3406C engine fitment; no additional public specifications.
- 4W-1434: Cat Engine Turbocharger. Confirmed Generator Set 3408; Marine Engine 3408/3408B; Petroleum Engine 3408; Petroleum Generator Set 3408B; Truck Engine 3408B. Specs 14.9in length ×12.9in height, carbon steel.
- 4W-7019: Cat Fuel Injector Nozzle. Confirmed engine fitment 3408/3408B/3408C/3412/3412C. Specs 8.7in length ×1.5in height, Fuel Fluid material. Cat Available Cat Reman panel displays 0R-3536 Cat 3408 Reman Fuel Injector Nozzle; serial-number applicability required.

Cat pages:
- https://parts.cat.com/en/catcorp/product/487-0039
- https://parts.cat.com/en/catcorp/product/494-1279
- https://parts.cat.com/en/catcorp/product/497-5606
- https://parts.cat.com/en/catcorp/product/499-6727
- https://parts.cat.com/en/catcorp/product/4K-7038
- https://parts.cat.com/en/catcorp/product/4N-0733
- https://parts.cat.com/en/catcorp/product/4N-0933
- https://parts.cat.com/en/catcorp/product/4P-1384
- https://parts.cat.com/en/catcorp/product/4W-1434
- https://parts.cat.com/en/catcorp/product/4W-7019

Post-update verification returned all ten SKUs. Distinct compatible-model counts: 487-0039=1; 494-1279=5; 497-5606=1; 499-6727=129; 4K-7038=60; 4N-0733=50; 4N-0933=296; 4P-1384=2; 4W-1434=2; 4W-7019=5. No prices or current stock inferred.

Additional Cat-linked discovery candidates:
033-6031, 136-7227, 1R-0726, 1R-0756, 1W-1251, 1W-1253, 214-7566, 214-7568, 230-1072, 238-5080, 238-5081, 248-5513, 272-0757, 304-7216, 3S-9643, 457-6719, 492-0914, 4F-7226, 4W-3027, 4W-3100, 5D-5957, 5P-4892, 6V-1454, 6V-3907, 6V-5048, 6V-5066, 6V-8001, 6V-9027, 7M-9909, 7N-4782, 7N-4927, 7N-6806, 290-2041, 6I-4545, 143-2878, 227-2902, 575-1591, 126-1767, 126-1768, 278-2355, 278-2356, 6S-3609, 190-7396, 6Y-0473, 0R-3536, 328-5574, 253-1752, 4N-7253, 317-8766. These are kit BOM/related/Reman candidates only, not guaranteed fitment or interchangeable replacements.

Overall reviewed progress: 60/500 batches = 600/5,000 product target (12.0%). Original Cat seed list has 187 SKUs remaining (products 601–787).

## Batch 61/500 — products 601–610 (2026-11-25)

SKUs: 4W-7637, 500-0957, 505-4113, 509-5694, 511-7975, 513-5975, 513-5980, 516-2634, 518-3210, 518-5338. Seven records received substantive item-level updates; 513-5975 and 518-3210 pages were inaccessible; 513-5980 page returned only a short title shell and no usable model/spec data. All ten rows were re-queried.

Verified updates:
- 4W-7637: Cat Turbocharger Group. Confirmed Gen Set Engine 3408B/3408C/3408; Marine Engine 3408B/3408; Engine G3408; Gas Engine G3408C/G3408/G3408B. Dimensions 15.1in ×15.9in. Cat Compare Alternate Parts lists 20R-3163 Cat Reman Turbocharger; verify serial-number applicability.
- 500-0957: Cat Standard Efficiency Cabin Air Filter for normal-duty filtration. Added 84 distinct Cat labels across track feller bunchers, forestry, wheeled excavators, MHPU/OEM units, excavators, material handlers, graders and wheel loaders. Specs 9.587in length, Polypropylene Plastic. Cat says standard-efficiency media prevents dirt/soot/sand entering cab and fits the current housing without modification.
- 505-4113: Cat Advansys 110 Penetration Plus excavator bucket tip. Added 26 distinct model labels across excavators and wheel loaders. Cast steel; 14.378in overall length, 3.543in front width, 5.488in rear width, 5.689in rear height. Cat states 25% more wear material than general-purpose tips, 10–15% more usable life, self-sharpening; intended for high-impact trenching/excavating/loading, compacted clay, cemented gravel and rock.
- 509-5694: Cat Ultra High Efficiency Secondary Fuel Filter Element, cartridge. Added 53 distinct labels across wheeled excavators, forestry, excavators, material handlers, MHPUs, graders and wheel loaders. Specs 3.484in diameter ×6.654in length, Out-to-In, Polyamide Plastic, Cartridge, Ultra High Efficiency. Cat related elements: 523-4987 and 322-3155; also lists primary/secondary air filters 479-8989/479-8991.
- 511-7975: Cat Common Rail Fuel Injection Pump for C9.3. Added 68 distinct model labels across SR4B generator, 627/637 wheel tractors and scrapers, 973 track loader, 2864C/586C site-prep tractors, PM312/PM313/PM310 cold planers, motor graders, 972/966 wheel loaders, D6T/D7E track-type tractors, 725 articulated trucks, PL72 pipelayer, excavators and MHPUs. Specs 11.65in overall length; height not specified; material Fuel Fluid and adhesive.
- 516-2634: Cat M24 ×1.5 track bolt, 80mm (3.15in) long. Added 28 distinct model labels across MD6250/MD6310/MD6420C/MD6420 drills, OEM POWER module, forestry products, excavators and MH3250/MH3260 material handlers. Specs 1.457in grip, RH, zinc-phosphate/oil coating, alloy zinc/coating fluid/boron steel, Cat/ISO 898-1 class 11.9. Cat page's thread-size numeric field is zero, so M24/1.5mm is retained from the product title only.
- 518-5338: Cat Rail Group - SEM. Cat page explicitly states no compatibility information is currently available. Added Carbon Steel material and kept fitment empty.
- 513-5975: Cat page inaccessible; no change.
- 513-5980: Cat Grade with 3D for Medium Dozers page returned only a title shell; no fitment/spec changes.
- 518-3210: Cat page inaccessible; no change.

Cat pages:
- https://parts.cat.com/en/catcorp/product/4W-7637
- https://parts.cat.com/en/catcorp/product/500-0957
- https://parts.cat.com/en/catcorp/product/505-4113
- https://parts.cat.com/en/catcorp/product/509-5694
- https://parts.cat.com/en/catcorp/product/511-7975
- https://parts.cat.com/en/catcorp/product/513-5975
- https://parts.cat.com/en/catcorp/product/513-5980
- https://parts.cat.com/en/catcorp/product/516-2634
- https://parts.cat.com/en/catcorp/product/518-3210
- https://parts.cat.com/en/catcorp/product/518-5338

Post-update verification returned all ten rows. Distinct fitment counts: 4W-7637=6; 500-0957=84; 505-4113=26; 509-5694=53; 511-7975=68; 513-5975=0 (unchanged); 513-5980=0 (unchanged); 516-2634=28; 518-3210=0 (unchanged); 518-5338=0 (Cat explicitly has no compatibility information). No prices/current stock inferred.

Additional Cat-linked discovery candidates:
20R-3163, 580-5439, 523-4987, 505-4010, 505-4012, 505-4110, 505-4114, 505-4115, 505-4116, 505-4160, 505-4161, 505-4162, 456-7043, 322-3155, 479-8989, 479-8991, 6V-8260, 214-7568, 214-7567, 238-5080, 251-7757, 257-3604, 609-0880, 250-3998. These are Cat Reman, related or frequently-bought-together leads only; not universal fitment/interchange claims.

Overall reviewed progress: 61/500 batches = 610/5,000 product target (12.2%). Original Cat seed list has 177 SKUs remaining (products 611–787).

## Batch 62/500 — products 611–620 (2026-11-25)

SKUs: 519-6373, 519-7297, 520-2924, 523-3387, 523-4987, 523-8663, 525-7148, 527-2809, 528-1699, 528-8101. Eight Cat item pages provided usable data; 519-6373 and 528-1699 returned access/internal errors and their existing rows were left unchanged. All ten DB rows were re-queried.

Verified updates:
- 519-6373: Cat Water Pump Shaft page inaccessible; no changes.
- 519-7297: Cat 212.5mm diameter gray-iron casting spacer plate for cylinder heads. Added 64 distinct Cat fitment labels across pumper, generators, off-highway trucks, rotary cutter, hydraulic shovel, D11 track tractors, rotary drills, 3500-family marine/auxiliary/generator/petroleum/industrial engines, mining excavators, wheel dozers/loaders, haul trucks and wheel tractors. Specs 0.72in height ×14.23in length ×10.24in width, 8.37in diameter, Gray Iron Casting/Gray (Flake) Iron.
- 520-2924: Cat Engine Oil Pump. Added 35 distinct fitment labels across SR5/SR4B generators, C32 power module, 24H grader, RC7 rotary cutter, 6040/6030 hydraulic shovels, MD6310/MD6250 rotary drills, C32/3412E marine engines, petroleum package, 639D/633E II/631/651/637/657 wheel tractors, C27/C32 generator-set and industrial engines. Cat says specifications are still being added; none inferred.
- 523-3387: Cat Sprocket Group for 320D2 FM excavator. Cat explicitly marks discontinued and no longer available; corrected is_active=false. Specs 18 bolts, 21 teeth, M20 bolt thread, plain steel, adhesive material field, HD undercarriage, 190mm (7.48in) pitch, symmetric mounting.
- 523-4987: Cat Ultra High Efficiency Element Separator cartridge. Added 57 distinct labels across wheeled excavators, forestry, OEM/MHPU units, excavators, material handlers and mobile hydraulic power units. Specs 4.043in diameter ×10.169in length, Out-to-In flow, Polyamide Plastic, Ultra High Efficiency, Cartridge. Related Cat filter components include 509-5694, 322-3155, 479-8989/479-8991, 500-0957 and 580-5439.
- 523-8663: Cat 170.025mm ID non-cuffed cylinder block liner. Added 85 distinct labels across pumper, generator, power modules, off-highway truck, D11 tractors, rotary drills, 3500-family marine/auxiliary/generator/petroleum/industrial/gas engines, mining excavators, wheel dozer/loaders, haul trucks, locomotive and wheel tractors. Cat says specifications are still being added; retained only published ID.
- 525-7148: Cat Fuel Tube Assembly. Confirmed Generator Set C32, Marine Auxiliary C32B, Marine Engine C32B/C32 MARINE/C32 and Engine C32 MARINE. Material Alloy Mixed: Metal and Carbon Steel.
- 527-2809: Cat Heavy Duty rubber track, 400mm (15.748in) wide, 72.5mm (2.854in) pitch, 76 sections, block tread, black, HD. Confirmed 11 mini-excavator models (305/305E/305.5E2 CR/306/305.5 CR/305 CR/304C CR/305C CR/305D CR/305E2 CR/305.5E) and 305.5 CR excavator. Cat says Heavy Duty tracks are for production/high-hour applications and can work on grass, pavement and stone.
- 528-1699: Cat SEM Cylinder Block page inaccessible; existing Carbon Steel material row and empty fitment retained unchanged.
- 528-8101: Cat Roller Guard Short Center. Added six excavator models 340/335/336/336 GC/345 GC/345. Specs Steel/Alloy Steel, center position, left and right track-frame sides, HD undercarriage.

Cat pages:
- https://parts.cat.com/en/catcorp/product/519-6373
- https://parts.cat.com/en/catcorp/product/519-7297
- https://parts.cat.com/en/catcorp/product/520-2924
- https://parts.cat.com/en/catcorp/product/523-3387
- https://parts.cat.com/en/catcorp/product/523-4987
- https://parts.cat.com/en/catcorp/product/523-8663
- https://parts.cat.com/en/catcorp/product/525-7148
- https://parts.cat.com/en/catcorp/product/527-2809
- https://parts.cat.com/en/catcorp/product/528-1699
- https://parts.cat.com/en/catcorp/product/528-8101

Post-update verification returned all ten rows. Distinct compatible-model counts: 519-6373=0 (unchanged); 519-7297=64; 520-2924=35; 523-3387=1 (inactive); 523-4987=57; 523-8663=85; 525-7148=3; 527-2809=11; 528-1699=0 (unchanged); 528-8101=6. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
033-6031, 132-6469, 3S-9643, 4W-3027, 214-7568, 232-3226, 248-5513, 253-1752, 1R-1808, 317-8766, 509-5694, 322-3155, 479-8989, 479-8991, 500-0957, 580-5439, 107-7330, 144-5695, 7N-4782, 127-5400, 377-6969, 415-2592, 1G-7206, 363-5819, 156-1200, 500-0483, 496-9841, 496-9842. Candidate links are related/commonly bought items only; they do not prove fitment or interchangeability.

Overall reviewed progress: 62/500 batches = 620/5,000 product target (12.4%). Original Cat seed list has 167 SKUs remaining (products 621–787).

## Batch 63/500 — products 621–630 (2026-11-25)

SKUs: 528-9753, 529-5780, 529-5790, 529-5791, 532-9206, 532-9208, 533-6299, 535-2508, 536-6756, 538-5051. All ten Cat pages retrieved; item-level compatible models and technical specifications inspected. All ten DB rows re-queried and model arrays deduplicated.

Verified updates:
- 528-9753: Cat Engine Turbocharger. Confirmed Marine Engine 3516B/3516C/3512B/3512C/3516 and Marine Auxiliary 3512C. Compressor wheel 151mm, turbine wheel 138mm. Cat material field: Anti-Sieze Compound Mixed: Metal and Ductile (Spheroidal) Iron. Cat Reman alternative 20R-8321; not assumed universal interchange.
- 529-5780: Cat PC305 cold planer for CTL 285XE/285/253/275/265/255/275XE, skid steers 250/270/260/270XE and PC305. Specs: 17.7in working width, 6.7in max cut, high-flow hydraulics, 73.1in width, 49.1in length, 36.6in height, 1869.5lb, 98–125L/min flow, 230–280bar pressure, 149rpm drum, 42 conical bits, 8° tilt, 29.5in side shift; optional 80/150/300mm drum widths.
- 529-5790: Cat PC306 cold planer without water tank. Same CTL/skid-steer families and PC306. Specs: 23.6in working width, 6.7in max cut, high-flow, 73.1in width, 49.1in length, 36.6in height, 2107.6lb, 98–125L/min flow, 230–280bar pressure, 149rpm, 54 conical bits, 8° tilt, 29.5in side shift; optional drum widths 80–600mm.
- 529-5791: Cat PC306 cold planer with water tank. Same CTL/skid-steer families and PC306. Specs: 23.6in working width, 6.7in max cut, 73.1in width, 56.4in length, 36.6in height, 2685.2lb, 42.3US-gal water tank, 98–125L/min flow, 230–280bar pressure, 149rpm, 54 conical bits, 8° tilt, 29.5in side shift; optional drum widths 80–600mm.
- 532-9206: Cat B6s hydraulic hammer for demolition/construction/road work. Fitment: CTL 285XE/285/253/275/265/255/275XE; mini excavator 306; B6 hammer class; skid steer 250/270/260/270XE/265; backhoe loaders 416/444/434/420; backhoe BH150/BH160. Specs 610.7lb with tool, 501.5ft·lbf energy, 2.7in tool shaft, 500–900bpm, min 1775psi, 40–70L/min flow, 12.4in width, 17.3in length, 53.9in height, 124dB, Large bracket.
- 532-9208: Cat B8s hydraulic hammer. Fitment: CTL 285XE/285/253/275/265/255/275XE; B8 hammer class; skid steer 250/270/260/270XE; backhoe loaders 426/416/444/434/424/440/430/420. Specs 758.4lb with tool, 848.2ft·lbf energy, 3in tool shaft, 400–800bpm, min 1704.1psi, 50–90L/min flow, 12.4in width, 17.3in length, 55.2in height, 129dB, Large bracket.
- 533-6299: Cat 500mm nominal-width regular-joint track shoe with bonded rubber pad. Fitment: excavators 315 GC/313 GC/313F L/313F LGC/315/313/315F LCR/311F LRR. Specs GD/HD, no ARM, 19.685in shoe width, 1.969in plate thickness, M16 track-bolt thread, 0.709in bolt hole, not clipped, steel/rubber. Cat description separately lists 490 ×130mm pad dimensions; these are preserved separately from the 500mm nominal shoe width.
- 535-2508: Cat fuel-tank breather assembly filter cap, complete-package service only, integral 10-micron filter, 3 3/8-12 UN thread, 22.4mm square drive. Fitment Shovel 6040 and Hydraulic Shovel 6060/6040. Specs 1.58in ID, 3.66in OD, 2.26in length, thermoplastic.
- 536-6756: Cat Diesel Exhaust Fluid Tank Filter Assembly. Added 53 distinct model labels across generator LC31XX, generator set XQP115, soil compactors CS/CP families, backhoe loaders 416/420/428/430/432/434/444, material handlers MH3022/MH3024, grader 120 GC, TH/TL telehandlers, compact wheel loaders 910/914/920 and D1/D2/D3/D4 track tractors. Material Plastic and Corrosion Preventative Fluid.
- 538-5051: Cat Communication Adapter Tool for diagnostic-port communications between equipment and diagnostic software. Weight 5.606lb, Polyurethane Plastic and Phenolic Plastic. Cat page does not publish compatible-model list; fitment remains empty.

Cat pages:
- https://parts.cat.com/en/catcorp/product/528-9753
- https://parts.cat.com/en/catcorp/product/529-5780
- https://parts.cat.com/en/catcorp/product/529-5790
- https://parts.cat.com/en/catcorp/product/529-5791
- https://parts.cat.com/en/catcorp/product/532-9206
- https://parts.cat.com/en/catcorp/product/532-9208
- https://parts.cat.com/en/catcorp/product/533-6299
- https://parts.cat.com/en/catcorp/product/535-2508
- https://parts.cat.com/en/catcorp/product/536-6756
- https://parts.cat.com/en/catcorp/product/538-5051

Post-update verification returned all ten rows. Distinct compatible-model counts: 528-9753=5; 529-5780=12; 529-5790=12; 529-5791=12; 532-9206=19; 532-9208=20; 533-6299=8; 535-2508=2; 536-6756=53; 538-5051=0. No customer prices or current stock inferred.

Additional Cat-linked discovery candidates:
20R-8321, 426-6548, 489-2200, 9W-0852, 9W-0844, 246-2641, 5P-8500, 357-7477, 533-6298, 586-3118, 589-5985, 378-3187, 540-5119, 471-7003, 461-9110, 507-1011. These are Cat Reman, related or diagram-linked leads only; not universal fitment/interchange claims.

Overall reviewed progress: 63/500 batches = 630/5,000 product target (12.6%). Original Cat seed list has 157 SKUs remaining (products 631–787).

## Batch 64/500 — products 631–640 (2026-11-25)

SKUs: 539-0117, 539-0118, 541-6956, 542-0222, 542-4530, 542-8380, 546-6109, 552-5534, 553-3686, 557-7650. All ten Cat pages supplied usable item-level data. All ten rows re-queried and compatible-model arrays deduplicated.

Verified updates:
- 539-0117: Cat NOx Emissions Sensor Group (Engine Out). Added 381 distinct Cat model labels across generators, wheel tractors/scrapers, asphalt/vibratory/soil compactors, rotary drills, forestry, excavators, MTL/CTL, track loaders/tractors, wheel loaders/dozers, backhoes, telehandlers, articulated/underground/haul trucks, material handlers, graders, pavers, pipelayers, reclaimers, marine/industrial/gas engines and power modules. Specs 10.8–32V, 6-pin connector, 42.988 ×2.559 ×1.587in, polyester/thermoplastic. Measures exhaust NOx/O2 for aftertreatment feedback over SAE J1939; self-diagnosis and RoHS. Cat Reman alternate 11R-1773.
- 539-0118: Cat NOx Emissions Sensor Group (Tailpipe Out). Added 386 distinct labels across the same broad machine families, including DPF/SCR retrofit and additional C32/C32 MARINE/C32B/C175-20/3512E/3516E models. Same 10.8–32V, 6-pin, 42.988 ×2.559 ×1.587in, polyester/thermoplastic specs. Cat Reman alternate 11R-1774.
- 541-6956: Cat Engine Fuel Filter, spin-on, Out-to-In flow, 3.713in diameter ×7.327in length. Added 54 distinct model labels across MTL/CTL, asphalt pavers, mini excavators, skid steers, compact wheel loaders and wheel loaders. Materials polyester/PPA/thermoplastic. Important correction: Cat's Specifications section says **Ultra High Efficiency**, not Standard Efficiency; prior database description was corrected and the page-title wording is kept separate from the specification.
- 542-0222: Cat M20 ×1.5 track bolt, 63mm (2.48in) long. Added 23 distinct labels: D6H/D6R/D6T/D6GC families, 963K/963/953 track loaders, 323D3 excavator and 527 track skidder. Specs 1.339in grip, RH, oil/corrosion-inhibitor coating, boron steel/coating fluid, Cat/ISO 898-1 class 11.9. Cat numeric thread-size field is zero; M20 ×1.5 is retained from the product title.
- 542-4530: Cat Link Assembly GLT4, press-fit master, 51 sections, PPR2, SALT, 260.35mm pitch. Fitment 390F/390F L/395/MH3295/3101 excavators. Specs 4.787in sprocket-side inside spread, 5.087in roller-side inside spread, 1.512in rail-to-bushing OD, 10.567in outside spread, 3.473in bushing OD, 1.22in bolt-hole diameter, GLT4 grease track, M30 track/master bolts, 12.165in pin length, 6.126in link height, no RBT/wear sensor.
- 542-8380: Cat cantilever carrier roller group, 190mm tread, standard application. Fitment MD6380 rotary drill; MD6640/MD6540 rotary/track drills; 390F/390F L/395/MH3295/374/374F/374F L/3101 excavators. Specs 5.276in shaft mounting length, 10.433in outside spread, 3.386in inside spread, HD undercarriage, 3.068in shaft OD, 8.819in flange OD, 7.48in tread OD.
- 546-6109: Cat 7/8-9 prechamber check valve for gas engines G3608/G3612/G3616. Specs 2.76in overall length, 0.28lb; Cat does not specify material. Cat Reman alternatives 11R-2284 NWC and 20R-3466; serial-number confirmation required.
- 552-5534: Cat Fuel Transfer Pump, transfers fuel under pressure from tank to injection pump. Added 22 distinct model labels across MTL 257D/277D/287D/297D2; CTL 259D/249D/239D/289D/279D/299D2; pavers AP300F/AP355F; skid steers 242D/232D/262D/226D/246D/236D/272D2. Specs 10–16VDC, 2-pin DT, 90mm/3.54in wire, 6.6 ×3.2 ×2.4in, carbon steel; compatible with diesel, B20 biodiesel, gasoline and kerosene.
- 553-3686: Cat Water Hose Assembly. Added ten distinct model labels across 3508/3516B/3512/3512C/3512B/3508C/3508B/3516C/3512PETROL/3516 in generator-set, marine, marine auxiliary, industrial and petroleum applications. Page shows a generic Replaced indicator but no replacement SKU in visible content; kept active pending verified supersession.
- 557-7650: Cat Engine Oil Pump. Added 31 distinct labels across SR500/SR5 generators, C32B/C32 and DE/XQP generator sets, C32B locomotive/industrial, 854 wheel dozers, 777 haul/quarry trucks, 6040/6020 shovels, 993/990/992 wheel loaders, DE1100 gen set, MD6310 drill, C32 marine, 777G/777F trucks and M325C excavator. Page shows generic Replaced indicator but no replacement SKU; kept active pending verified supersession.

Cat pages:
- https://parts.cat.com/en/catcorp/product/539-0117
- https://parts.cat.com/en/catcorp/product/539-0118
- https://parts.cat.com/en/catcorp/product/541-6956
- https://parts.cat.com/en/catcorp/product/542-0222
- https://parts.cat.com/en/catcorp/product/542-4530
- https://parts.cat.com/en/catcorp/product/542-8380
- https://parts.cat.com/en/catcorp/product/546-6109
- https://parts.cat.com/en/catcorp/product/552-5534
- https://parts.cat.com/en/catcorp/product/553-3686
- https://parts.cat.com/en/catcorp/product/557-7650

Post-update verification returned all ten rows. Distinct compatible-model counts: 539-0117=381; 539-0118=386; 541-6956=54; 542-0222=23; 542-4530=5; 542-8380=11; 546-6109=3; 552-5534=22; 553-3686=10; 557-7650=31. No customer prices/current stock inferred. Generic Replaced badges without a specific replacement number did not trigger deactivation.

Additional Cat-linked discovery candidates:
11R-1773, 11R-1774, 565-2488, 418-2073, 485-9752, 460-9257, 377-6969, 110-6326, 110-6331, 265-6619, 265-6618, 235-5974, 288-0934, 173-0946, 288-0935, 490-6505, 616-0732, 246-0504, 294-3060, 297-0129, 297-0130, 508-0581, 514-4892, 527-9168, 596-0073, 596-0081, 596-0095, 567-7867, 596-3519, 596-3514, 529-7106, 1R-1808, 3J-1907, 366-3380, 1P-3705, 6V-9746, 11R-2284, 20R-3466, 228-4947, 7E-1630, 485-4705, 159-3219, 5P-7815, 363-5819, 416-5884. These are Cat Reman, related or frequently-bought-together candidates only; not universal fitment/interchange claims.

Overall reviewed progress: 64/500 batches = 640/5,000 product target (12.8%). Original Cat seed list has 147 SKUs remaining (products 641–787).

## Batch 65/500 — products 641–650 (2026-11-25)

SKUs: 561-1061, 561-1069, 561-5499, 562-0434, 562-8118, 563-8470, 566-2975, 567-4125, 569-2542, 569-8036. All ten Cat product pages retrieved; fitment/spec/kit sections inspected. All ten DB rows re-queried and fitment arrays deduplicated.

Verified updates:
- 561-1061: Cat 45-joint SystemOne track link assembly, clamp master, press fit, SALT, 202.81mm (7.985in) pitch. Added 11 D6 tractor models: D6R III/D6T/D6T XL/D6R LGP/D6R II/D6T XW/D6T LGP/D6T LGPPAT/D6XE/D6/D6T XW PAT. Specs 3.539in sprocket-side spread, 4.256in roller-side spread, 1.638in rail-to-bushing OD, 7.508in outside spread, 2.864in bushing OD, 45 sections, M22 bolts, 8.469in pin, 5.276in link height, no RBT/wear sensor.
- 561-1069: Cat 46-joint track link assembly, clamp master, press fit, SALT, 190mm (7.48in) pitch. Added D6N LGP/D6N/D5/D6N XL. Specs 3.189in sprocket-side spread, 3.717in roller-side spread, 1.496in rail-to-bushing OD, 6.717in outside spread, 2.559in bushing OD, 46 sections, M20 bolts, 7.488in pin, 4.783in link height, no RBT/wear sensor.
- 561-5499: Cat 450mm-wide rubber skid-steer bar track, 86mm pitch, 56 sections, 17.717in belt width, 3.386in pitch, rubber/rubber-fiber, HD. Fitment 289D/279D/279C2/279D3/289C2/289D3.
- 562-0434: Cat Fuel Rail (RAIL-FUEL). Added exact Cat fitment Utility Vehicle CUV102D/CUV105D and Alloy Aluminum material. Cat page says description/specifications are still being added; no engine fitment inferred.
- 562-8118: Cat 240S roller chain, 27 links, ANSI 240, 3in pitch, 165in overall length, 1.86in roller width. Fitment motor graders 24M/24; used in tandem drive to transmit power between axles/wheels.
- 563-8470: Cat Track Group for D11T: 1-tooth master, single grouser, 41 sections, PPR, SALT, ES shoe, 810mm/31.89in shoe width, 317.5mm/12.5in pitch. HDXL, 4.646in sprocket-side inside spread, 4.488in bushing ID, 1-3/8in track bolt, M36 master bolt, wear sensor present, no RBT/ARM/clipping. Cat explicitly says no parts currently associated with the kit; separate related track segments/O-rings are discovery candidates only.
- 566-2975: Cat Heavy Duty 300mm-wide rubber track, 52.5mm pitch, 90 sections, black, block tread, rubber/rubber-fiber, HD. Fitment mini excavators 303.5CR/304SR/302.7CR/303CR. Cat related track 575-8723 has 82 sections; not assumed interchangeable.
- 567-4125: Cat Grade with 3D for Small Dozers, factory-integrated grade control system using automated blade movements to improve grading efficiency, accuracy and productivity. Cat public page provides no compatible-model list or item-level specifications; fitment remains empty.
- 569-2542: Cat Track Group for D10T2: 1-tooth master, single grouser, press-fit, PPR, SALT, SES, 44 sections, 610mm/24in shoe width, 261mm/10.25in pitch. HDXL, 5.315in sprocket-side spread, 3.899in bushing ID, 1-1/8in track/master bolt, no RBT/ARM/clipping/wear sensor. Cat page states no parts currently associated with the kit.
- 569-8036: Cat Lube Filter Element Kit (Engine Oil). Recorded exact kit contents: 505-3864 Element Assembly-Lube ×1 and 6V-8002 88.49mm ID O-ring ×1. Material Corrosion Preventative Fluid. Added 74 distinct Cat model labels across CTL, generator sets, C3.6 engines, soil/vibratory compactors, backhoe loaders, telehandlers, compact/wheel loaders, D1/D2/D3 tractors, asphalt compactors/pavers, mini excavators, skid steers, wheeled excavators and industrial engines.

Cat pages:
- https://parts.cat.com/en/catcorp/product/561-1061
- https://parts.cat.com/en/catcorp/product/561-1069
- https://parts.cat.com/en/catcorp/product/561-5499
- https://parts.cat.com/en/catcorp/product/562-0434
- https://parts.cat.com/en/catcorp/product/562-8118
- https://parts.cat.com/en/catcorp/product/563-8470
- https://parts.cat.com/en/catcorp/product/566-2975
- https://parts.cat.com/en/catcorp/product/567-4125
- https://parts.cat.com/en/catcorp/product/569-2542
- https://parts.cat.com/en/catcorp/product/569-8036

Post-update verification returned all ten rows. Distinct fitment counts: 561-1061=11; 561-1069=4; 561-5499=6; 562-0434=2; 562-8118=2; 563-8470=1; 566-2975=4; 567-4125=0; 569-2542=1; 569-8036=74. No customer prices/current stock inferred.

Additional Cat-linked discovery candidates:
561-1056, 561-1058, 561-1059, 561-1062, 653-5187, 653-5188, 653-5190, 653-5193, 653-5195, 234-9672, 351-0957, 351-0958, 235-2511, 351-0961, 561-1068, 575-8723, 304-1916, 602-0405, 602-0406, 3K-0360, 3J-1907, 505-3864, 6V-8002, 523-6602, 528-0585, 540-5119, 360-8960, 346-6688. These are related track assemblies/parts, kit contents or commonly purchased items; not universal fitment/interchange claims.

Overall reviewed progress: 65/500 batches = 650/5,000 product target (13.0%). Original Cat seed list has 137 SKUs remaining (products 651–787).

## Batch 66/500 — products 651–660 (2026-11-25)

SKUs: 571-1452, 571-5253, 572-2683, 572-2684, 572-5881, 574-0991, 575-2083, 578-1844, 580-5439, 585-9997. All ten Cat pages retrieved; compatible-model/specification/kit sections reviewed. All ten DB rows re-queried and fitment arrays deduplicated.

Verified updates:
- 571-1452: Cat Hard Rock crawler track shoe for Electric Rope Shovel 7495. Specs 508mm/20in pitch, 2000.25mm/78.75in pad width, with bushings, alloy steel, 10.62in roller width, 5.31in drive-lug height, 10in roller path, 1.25in track-bolt thread, 4.445in pin diameter, single roller path, self-seeking sprocket engagement, bolt-and-nut retention.
- 571-5253: Cat Advanced High Efficiency transmission filter cartridge. Added 163 distinct Cat model labels across pumper, power modules, scrapers, off-highway trucks, graders, track tractors, pipelayers, excavators, generators, MHPUs, wheel tractors/dozers/loaders, compactors, petroleum transmissions, ejector/articulated trucks, landfill compactors, industrial engines, quarry trucks and powertrains. Specs 4.74in diameter ×10.689in length, Out-to-In, Polyamide Plastic, Advanced High Efficiency, Cartridge.
- 572-2683: Cat HDXL Track Seal and Bushing Kit. Exact kit contents: 106-1618 Track Bushing ×46 and 250-3988 Track Seal ×92. Cat explicitly says compatible-model information is not currently available; fitment remains empty.
- 572-2684: Cat HDXL Track Seal and Bushing Kit. Exact kit contents: 207-0544 Track Seal ×92 and 8E-7222 Track Bushing ×46. Cat explicitly says compatible-model information is not currently available; fitment remains empty.
- 572-5881: Cat 12V fuel priming pump with solenoid valve for Marine Engine C18. Cat specifications list adhesive material and Spin-On filter type.
- 574-0991: Cat High Pressure Control Fuel Pump / fuel transfer pump. Fitment Pumper SPF743, Engine 3512E, Petroleum Engine 3512E/2016. Specs 579 ×200 ×451mm (22.81 ×7.87 ×17.74in), cast iron/ductile spheroidal iron/carbon steel. Existing source fields also list 12–24V and 11.4L/min rated flow.
- 575-2083: Cat GB124 with Wings Smart Grader Blade. Fitment CTL 253/275/265/255/275XE; skid steer 250/260; blade GB124. Specs 96in blade width, 102.6in overall width, 105.8in fully angled, 50–86L/min, 180–230bar, standard flow with 14-pin, 88.4in length, 104.4in height with masts, 41.2in height, 2292.8lb, 15° tilt, 30° max blade angle, 205° wing rotation. Cat lists wings-open working width 99.3in and wings-closed 102.6in; retained as published despite the unusual relation.
- 578-1844: Cat Lower Restriction Cabin Air Filter, metal panel, 17in length ×10in width, 2.197in height without seal/2.354in with seal, mixed metal/nonmetal and carbon steel, lower-restriction media. Added 53 distinct labels across road reclaimers, rotary/reclaimer mixers, 815/825 compactors, 814/824/834 wheel dozers, 816/826/836 landfill compactors and wheel-loader families.
- 580-5439: Cat Standard Cabin Air Filter, plastic ABS panel, 14.921in length ×9.488in width, 2.933in height with/without seal, Standard media. Added 62 distinct model labels across M313/M314/M315/M316/M317/M318/M319/M320/M322/M323/MH3026/MH3040 wheeled excavators, OEM MHPU336, excavators and material handlers MH3022/MH3024/MH3032/MH3050/MH3250/MH3260.
- 585-9997: Cat 273.5mm Air Prescreener for CTL 285XE/285/275/265/255/275XE and skid steers 250/270/260/270XE/265. Cat says detailed specifications are still being added; retained only length and model fitment.

Cat pages:
- https://parts.cat.com/en/catcorp/product/571-1452
- https://parts.cat.com/en/catcorp/product/571-5253
- https://parts.cat.com/en/catcorp/product/572-2683
- https://parts.cat.com/en/catcorp/product/572-2684
- https://parts.cat.com/en/catcorp/product/572-5881
- https://parts.cat.com/en/catcorp/product/574-0991
- https://parts.cat.com/en/catcorp/product/575-2083
- https://parts.cat.com/en/catcorp/product/578-1844
- https://parts.cat.com/en/catcorp/product/580-5439
- https://parts.cat.com/en/catcorp/product/585-9997

Post-update verification returned all ten rows. Distinct compatible-model counts: 571-1452=1; 571-5253=163; 572-2683=0; 572-2684=0; 572-5881=1; 574-0991=3; 575-2083=8; 578-1844=53; 580-5439=62; 585-9997=10. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
106-1618, 250-3988, 207-0544, 8E-7222, 1R-1808, 3J-1907, 1R-0756, 5P-7815, 6V-9746, 2H-3928, 5H-6734, 6V-6809, 1R-0749, 585-9997, 505-4113, 505-4160, 505-4161, 505-4162, 265-6618, 265-6619, 500-0957, 110-6326, 110-6331, 528-0585, 523-4987, 509-5694. Kit components and related filters are candidate leads only; they do not prove interchangeability.

Overall reviewed progress: 66/500 batches = 660/5,000 product target (13.2%). Original Cat seed list has 127 SKUs remaining (products 661–787).

## Batch 67/500 — products 661–670 (2026-11-25)

SKUs: 590-0195, 590-0196, 590-0198, 590-2533, 590-7889, 591-2381, 591-2382, 592-5827, 592-5829, 592-5830. All ten Cat pages retrieved; item-level fitment/spec sections inspected. All ten DB rows re-queried.

Verified updates:
- 590-0195: Cat Standard Performance Topcoat - Cat Yellow. Protective/corrosion-resistant topcoat for equipment exterior/interior, high coverage and fade resistance. Cat weight 1.014lb; no volume or fitment published.
- 590-0196: Cat Standard Performance Topcoat - Cat Yellow. Cat weight 1.014lb; no volume or fitment published.
- 590-0198: Cat Yellow Paint, 3.8L container, 10lb. Standard-performance topcoat, high-gloss, anti-corrosion and chip/peel-resistant finish. Cat page lists 590-0196 and 458-9572 as related paint items.
- 590-2533: Cat Dual Slack Adjuster for rear off-highway truck brakes. Added 15 distinct truck/off-highway-truck model labels: 793D/797F/793F/795F AC/794 AC/MT4400D AC/795F XQ/793F CMD/789D/793F OEM/793F XQ/793/789/798/796 AC. Specs 257.3mL/side max displacement, 9.7 ×6.9 ×4.8in, steel/oil-fluid/carbon steel, Cat Yellow, two 0.56in holes, 60–84psi check-valve cracking, 1100psi max pressure, 41–96psi sensing-piston cracking, -20 to 230°F seal temperature, SAE -12 STOR inlet.
- 590-7889: Cat Fluid Sampling Pump in case. Cat explicitly states no compatible-model information is currently available. Weight 0.728lb, Aluminum/Alloy Aluminum. Related sampling accessories: 177-9343 probe/cap group, 162-8873 probe holder, 1U-7648 tube cutter, 1U-8757 plastic tube and 5P-8500 machine key.
- 591-2381: Cat Reman Diesel Exhaust Filter / DEF tank filter assembly. Added 69 model labels across wheel skidders, track tractors, asphalt pavers, pipelayers, engines, industrial engines, soil compactors, wheel dozers, motor graders, landfill compactors and wheel loaders. Paper, Tank (Sock), 87mm ID ×119mm OD ×283.1mm overall length; reman product category.
- 591-2382: Cat Diesel Exhaust Filter / DEF tank filter assembly. Added 32 model labels across AD45 underground truck, articulated trucks 725/730/735, C15/C7.1 engines, C9.3B/C13/C15/C9.3/C7.1/C18 industrial engines, R1700/R2900 LHD, 323F excavators, 150/160 graders and 980/986/982/988/987 wheel loaders. Paper, Tank (Sock), 87mm ID ×119mm OD ×384mm overall length. Media attributes: beta-100 multi-pass efficiency max 40 microns, 1.65–2.16mm thickness, 406g/m² basis weight, 93°C max operating temperature, 163–170°C melting point, DEF-compatible, RoHS-compliant polypropylene needle felt, heat-set/glazed one side.
- 592-5827: Cat Heavy Duty Block rubber track, 400mm ×86mm ×53 sections, 15.748in belt width, 3.386in pitch, black, rubber/fiber rubber, HD. Fitment CTL 259D/259B3/259D3.
- 592-5829: Cat Heavy Duty Block rubber track, 400mm ×86mm ×60 sections, 15.748in belt width, 3.386in pitch, black, rubber/fiber rubber, HD. Fitment CTL 299D3 XE/299D/299C/289C/279C/279C2/289C2/299D3/299D2/299D XHP/299D2 XHP.
- 592-5830: Cat Heavy Duty Block rubber track, 450mm ×86mm ×60 sections, 17.717in belt width, 3.386in pitch, black, rubber/fiber rubber, HD. Same 11 CTL model labels as 592-5829. Cat says Heavy Duty block tracks are for high-impact/high-abrasion production-style applications.

Cat pages:
- https://parts.cat.com/en/catcorp/product/590-0195
- https://parts.cat.com/en/catcorp/product/590-0196
- https://parts.cat.com/en/catcorp/product/590-0198
- https://parts.cat.com/en/catcorp/product/590-2533
- https://parts.cat.com/en/catcorp/product/590-7889
- https://parts.cat.com/en/catcorp/product/591-2381
- https://parts.cat.com/en/catcorp/product/591-2382
- https://parts.cat.com/en/catcorp/product/592-5827
- https://parts.cat.com/en/catcorp/product/592-5829
- https://parts.cat.com/en/catcorp/product/592-5830

Post-update verification returned all ten rows. Distinct fitment counts: 590-0195=0; 590-0196=0; 590-0198=0; 590-2533=15; 590-7889=0; 591-2381=69; 591-2382=32; 592-5827=3; 592-5829=11; 592-5830=11. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
479-5395, 479-5398, 458-9582, 458-9585, 3K-0360, 5P-8500, 3J-1907, 238-8648, 214-7568, 238-5082, 238-5081, 228-7092, 177-9343, 162-8873, 1U-7648, 1U-8757, 110-6326, 110-6331, 377-6969, 265-6619, 265-6618, 304-1916. These are paint, sampling accessories, seals or commonly bought track/filter items only; no fitment/interchange claims inferred.

Overall reviewed progress: 67/500 batches = 670/5,000 product target (13.4%). Original Cat seed list has 117 SKUs remaining (products 671–787).

## Batch 68/500 — products 671–680 (2026-11-25)

SKUs: 593-1012, 593-2027, 595-3692, 595-3920, 596-1051, 597-6033, 598-0498, 598-5827, 599-7781, 5L-6954. All ten Cat pages retrieved; item-level fitment/spec/kit sections inspected. All ten DB rows re-queried and fitment arrays deduplicated.

Verified updates:
- 593-1012: Cat Heavy Duty Block rubber track, 450mm ×86mm ×56 sections, 17.717in belt width, 3.386in pitch, black, rubber/fiber rubber, HD. Fitment CTL 289D/279D/279C2/279D3/289C2/289D3.
- 593-2027: Cat Cylinder Liner for Gas Engine G3606. Heat-treated high-grade Gray (Flake) Iron; uniform cross-hatch bore finish for ring seating/oil distribution and roll-burnished flange radius for crack resistance. Cat page publishes no additional dimensions.
- 595-3692: Cat Engine Cylinder Piston. Cat explicitly states compatibility information is currently unavailable and specifications are still being added; fitment/spec fields remain empty.
- 595-3920: Cat 12.7mm (0.5in) ID fuel hose assembly with 7/8in 90° elbow JIC 37° flare and 7/8in straight JIC 37° flare couplings. Overall length 10.079in; high-temperature fuel/oil hose; material Other Hose, adhesive tape/labels and carbon steel. Added eight distinct model labels across generator set, marine, marine auxiliary, industrial, engine and petroleum applications.
- 596-1051: Cat Engine Fuel Supply Valve. Cat explicitly marks discontinued; set is_active=false. Fitment engine 3512E/3516E/3512B and trucks 793D/785C. Material Carbon Steel.
- 597-6033: Cat Advansys 130 Penetration Plus bucket tip. Added 35 distinct labels: generator set 3512 and excavator 336D2/349 GC/340/349E L/336E LNH/349F L/349/330 GC/349F LXE/349D L/336 GC/345/336D2 XE/336E/349D2 L/349D2/330/352/350/336D2 GC/340D L/352F-VG/336D2 L/336D2 L XE/336/333/355/349D/340D2 L/336F L/336E L/349E/349F/345 GC. Specs 51.43lb, 15.63in length, 4.118in front width, 7.717in rear width, 6.236in rear height, Standard wear, Advansys 130, Penetration Plus.
- 598-0498: Cat Cartridge-Sleeve Bearing for Wheel Loader 992K. Alloy Steel, 60.08in length. Factory-assembled sealed/oiled pin-and-bearing cartridge for linkage/work-tool rotation.
- 598-5827: Cat Single Cylinder Head Install Kit / Single Cylinder Head Gasket Kit for Gas Engines G3508/G3512/G3516. Recorded all 24 components and quantities. Includes turbo gaskets but not fuel injector seals; Cat advises ordering a single fuel-injector seal kit separately.
- 599-7781: Cat 3516 Engine Overhaul Major Kit, Foundational Level, for Gas Engine G3516B. Cat reports 116 components; first 32 visible lines recorded, 84 additional lines not loaded in public-page session. Kit contains gaskets and seals for complete major overhaul plus replacement items such as thermostats and gear bushings.
- 5L-6954: Cat Elbow fitting. Added 36 distinct model labels across Gen Set Engine, SR4 generator, generator sets, marine/marine auxiliary, industrial, engine, petroleum, locomotive and gas-engine applications including legacy D379/D398/D399 and 3500/G3516/G3520 families. Material Carbon Steel.

Cat pages:
- https://parts.cat.com/en/catcorp/product/593-1012
- https://parts.cat.com/en/catcorp/product/593-2027
- https://parts.cat.com/en/catcorp/product/595-3692
- https://parts.cat.com/en/catcorp/product/595-3920
- https://parts.cat.com/en/catcorp/product/596-1051
- https://parts.cat.com/en/catcorp/product/597-6033
- https://parts.cat.com/en/catcorp/product/598-0498
- https://parts.cat.com/en/catcorp/product/598-5827
- https://parts.cat.com/en/catcorp/product/599-7781
- https://parts.cat.com/en/catcorp/product/5L-6954

Post-update verification returned all ten rows. Distinct fitment counts: 593-1012=6; 593-2027=1; 595-3692=0; 595-3920=8; 596-1051=5 (inactive); 597-6033=35; 598-0498=1; 598-5827=3; 599-7781=1; 5L-6954=36. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
119-9443, 125-1372, 133-1774, 135-2651, 144-5692, 153-8455, 179-2960, 198-6067, 272-0757, 272-0758, 2J-0157, 2W-0752, 3J-7354, 420-0652, 420-0653, 591-7736, 5P-0840, 5P-6718, 5P-7204, 6V-5101, 6V-9769, 7E-3772, 7E-4127, 7N-5089, 033-6031, 105-8901, 109-2332, 109-3203, 111-1349, 111-3820, 116-1365, 121-4345, 121-5736, 122-8856, 136-7227, 153-1810, 166-2903, 180-8424, 1R-0726, 204-9598, 214-7568, 216-7485, 227-4147, 228-7097, 230-1072, 237-7623, 238-5082, 238-6646, 247-7133, 250-2343, 259-4598, 259-4600, 593-2028, 566-5491, 566-5490, 566-5489, 598-0497, 316-6138, 274-5696, 1P-3704, 1P-3705, 304-1916, 110-6326, 110-6331, 377-6969, 265-6619. Kit components and related products are discovery leads only, not universal fitment/interchange claims.

Overall reviewed progress: 68/500 batches = 680/5,000 product target (13.6%). Original Cat seed list has 107 SKUs remaining (products 681–787).

## Batch 69/500 — products 681–690 (2026-11-25)

SKUs: 5N-2618, 5N-9021, 5N-9022, 5P-5422, 5P-7665, 5T-5045, 600-3535, 601-8313, 602-0406, 603-1668. Nine pages provided usable item-level evidence; 601-8313 returned an access/internal error and was left unchanged. All ten DB rows were re-queried.

Verified updates:
- 5N-2618: Cat Auxiliary Sea Water Pump Impeller. Added 27 distinct labels across generator-set engines 3508/D379B/3412/3408/3512, SR4 generator, 3400/3500 marine and marine auxiliary engines, industrial engines D379/D398/D399 and petroleum engines 3512/3512B. Specs 7.5in length ×2.2in height, Alloy Copper.
- 5N-9021: Cat 32-Vane Auxiliary Sea Water Pump Bronze Impeller. Added 12 distinct labels across SR4 generator, 3512/3516 gen-set engines, 3516B/3508B/3512B generator sets and 3500-family marine/marine auxiliary/industrial/petroleum engines. Specs 11.5in length ×3.4in height, Alloy Copper, 32 vanes.
- 5N-9022: Cat Auxiliary Sea Water Pump Port Plate. Added the same 12 Cat model labels as 5N-9021. Material Nickel Aluminum Bronze, Bronze, Alloy Aluminum and Alloy Copper. Cat describes the port plate as directing seawater into the auxiliary pump for marine-engine cooling.
- 5P-5422: Cat Hex Head Track Bolt, 1in thread size, 14mm pitch, 92.48mm (3.641in) long. Added 24 distinct labels across D10 track tractors, articulated/ejector trucks, ripper, bulldozers and winches. Specs 2.46in grip, RH, Carbon Steel, Cat/ASTM F2882 170 Ksi. Cat's numeric thread-size field is malformed (0.039); 1in/14mm comes from product title.
- 5P-7665: Cat Hex Head Track Bolt, 0.750in thread size, 16mm pitch, 63.5mm (2.5in) long. Added 37 distinct labels across D7/D8 tractors, generator set 3508B, ripper, pipelayers, water-fording tractor, bulldozers and winches. Specs 1.563in grip, RH, Carbon Steel/Alloy Zinc, Cat/ASTM F2882 170 Ksi. Cat's numeric thread-size field is malformed (0.03); 0.750in/16mm comes from product title.
- 5T-5045: Cat Lubrication Injector. Added 76 distinct model labels across underground articulated trucks, wheel tractors/scrapers, mining excavators, haul/quarry/off-highway trucks, LHD machines, tractors, graders, wheel loaders and electric rope shovels. Specs 7.06in length ×2in height ×2in width, 1.18in OD, 1/8-27 NPT fitting, Steel/Carbon Steel/Alloy Mixed Metal.
- 600-3535: Cat Basic Water Pump for certain C15/C18 engines. Added 41 distinct model labels across SR4B/XQP550 generators, C18/C15 gen sets, wheel tractors/scrapers, TR43-C18L power module, 825 compactors, R2900 XE LHD, articulated/ejector trucks, 824 wheel dozers, 826 landfill compactors, D8/D9 tractors, MD6200 drill, PL83/PL87 pipelayers, C15/C18 industrial/petroleum engines and CX35/CX31 petroleum packages. Cat compares alternate 20R-9849 Cat Reman Water Pump; confirm serial-number applicability.
- 601-8313: Cat product page inaccessible; no changes.
- 602-0406: Cat D11R/D11T/D11 track sprocket segment. Specs eight bolts, six teeth, 12.5in pitch, 23.166in pitch-circle diameter, 23.425in tip radius, 2.264in bushing radius, 5.118in tooth width, 18.268in bolt circle, 0.079in backlash, 40° pocket angle, 1-1/8in bolt thread, offset heavy-duty segment, Alloy/Tough Steel.
- 603-1668: Cat Basic Water Pump for certain C15/C18 engines. Added 49 distinct labels across SR4/SR4B generators, AD45 underground truck, C15/C18 gen sets, 631K/637K wheel tractors, C15 truck/petroleum/industrial engines, RM500B mixer/reclaimer, BS3GII track loader, 740/740B trucks, 773GC off-highway truck, D9/D9T tractors, 385C family excavators, TH48-E80 petroleum package and mobile hydraulic power units. Cat compares alternate 20R-9847 Cat Reman Water Pump; confirm serial-number applicability.

Cat pages:
- https://parts.cat.com/en/catcorp/product/5N-2618
- https://parts.cat.com/en/catcorp/product/5N-9021
- https://parts.cat.com/en/catcorp/product/5N-9022
- https://parts.cat.com/en/catcorp/product/5P-5422
- https://parts.cat.com/en/catcorp/product/5P-7665
- https://parts.cat.com/en/catcorp/product/5T-5045
- https://parts.cat.com/en/catcorp/product/600-3535
- https://parts.cat.com/en/catcorp/product/601-8313
- https://parts.cat.com/en/catcorp/product/602-0406
- https://parts.cat.com/en/catcorp/product/603-1668

Post-update verification returned all ten rows. Distinct fitment counts: 5N-2618=27; 5N-9021=12; 5N-9022=12; 5P-5422=24; 5P-7665=37; 5T-5045=76; 600-3535=41; 601-8313=0 (unchanged); 602-0406=3; 603-1668=49. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
5N-6055, 5N-2902, 3N-8463, 3N-8462, 4M-6107, 5N-9006, 5N-9013, 5N-9017, 3K-0360, 2R-0098, 2S-4078, 8D-4771, 3J-1907, 5P-8500, 1P-3705, 6V-9746, 20R-9849, 20R-9847, 602-0405. These are pump components, seals, bolt-associated items and Cat Reman alternatives only; no universal interchange claims inferred.

Overall reviewed progress: 69/500 batches = 690/5,000 product target (13.8%). Original Cat seed list has 97 SKUs remaining (products 691–787).

## Batch 70/500 — products 691–700 (2026-11-25)

SKUs: 603-3385, 603-7963, 603-8538, 604-2039, 604-2388, 605-7481, 607-4800, 607-4803, 607-4804, 607-4805. Cat pages opened for all ten; two Grade 3D product pages returned only short title shells, while eight pages provided usable item-level details. All ten DB rows re-queried and fitment arrays deduplicated.

Verified updates:
- 603-3385: Cat Grade with 3D for Excavators. Page returned only a short title shell; no model list/specification details added. Existing product description retained.
- 603-7963: Cat Basic Auxiliary Sea Water Pump for marine/industrial engine cooling. Added 16 distinct model labels across generator-set engines 3508/3512/3516, SR4 generator, 3400/3500 marine and marine auxiliary engines, industrial D379/D398/D399 engines, petroleum 3512/3512B and gas G3512/G3516. Material Acrylic Adhesive and Oil Fluid.
- 603-8538: Cat Carrier Roller Group. Existing database fitment/specification record rechecked against Cat page; 12 distinct compatible-model labels and published roller geometry already matched, so no unnecessary overwrite.
- 604-2039: Cat Grade with 3D for Mini Excavators. Page returned only a short title shell; no model list/specification details added. Existing product description retained.
- 604-2388: Cat Water Pump Pipe for coolant transfer between radiator and engine block. Added 48 distinct labels across LC20XX/LC51XX/LC31XX generators, IT14G integrated toolcarriers, MH3032 material handler, graders, D3/D4/D5/D6 track tractors, wheel skidders, CB compactors, AP pavers and PL61 pipelayer. Weight 0.07lb; Alloy Zinc, Plastic/Polyamide, Corrosion Preventative Fluid and Carbon Steel; corrosion-resistant black pipe.
- 605-7481: Cat Engine Cooling Water Pump. Added 42 distinct labels across AD55/AD30/AD45B underground trucks; C-18/C-15/C-16/C16/C18 truck engines; R3000H/R2900G/R2900 LHD; 24M grader; 6018/6015/6015 FS shovels; D8/D8T/D8R tractors; C18/C15/3406E marine engines; PL83/PL87/583T/587T pipelayers; CX31-C15I/CX35-P800 petroleum packages; TH43-C18 MHPU; 633E II/627G/623G/631D/651B/631E/631G/637G/657E/637D/657B/637E/633D/657G/621G wheel tractors; C18/3508B generator sets. Cat states specifications are still being added.
- 607-4800: Cat Heavy Duty Bar-tread rubber track, 400mm ×86mm ×49 sections, 15.748in belt width, 3.386in pitch, black, rubber/fiber rubber, HD. Fitment CTL 249D/239D/249D3/239D3.
- 607-4803: Cat Heavy Duty Block-tread rubber track, 320mm ×86mm ×53 sections, 12.598in belt width, 3.386in pitch, black, rubber/fiber rubber, HD. Fitment CTL 259D/259B3/259D3.
- 607-4804: Cat Heavy Duty Bar-tread rubber track, 400mm ×86mm ×53 sections, 15.748in belt width, 3.386in pitch, black, rubber/fiber rubber, HD. Fitment CTL 259D/259B3/259D3.
- 607-4805: Cat Heavy Duty Bar-tread rubber track, 450mm ×86mm ×60 sections, 17.717in belt width, 3.386in pitch, black, rubber/fiber rubber, HD. Fitment CTL 299D3 XE/299D/299C/289C/279C/299D2/299D XHP/299D2 XHP.

Cat pages:
- https://parts.cat.com/en/catcorp/product/603-3385
- https://parts.cat.com/en/catcorp/product/603-7963
- https://parts.cat.com/en/catcorp/product/603-8538
- https://parts.cat.com/en/catcorp/product/604-2039
- https://parts.cat.com/en/catcorp/product/604-2388
- https://parts.cat.com/en/catcorp/product/605-7481
- https://parts.cat.com/en/catcorp/product/607-4800
- https://parts.cat.com/en/catcorp/product/607-4803
- https://parts.cat.com/en/catcorp/product/607-4804
- https://parts.cat.com/en/catcorp/product/607-4805

Post-update verification returned all ten rows. Distinct compatible-model counts: 603-3385=0 (unchanged); 603-7963=16; 603-8538=12 (existing verified); 604-2039=0 (unchanged); 604-2388=48; 605-7481=42; 607-4800=4; 607-4803=3; 607-4804=3; 607-4805=8. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
5N-6055, 5N-2902, 3N-8463, 3N-8462, 4M-6107, 1R-1808, 3J-1907, 366-3380, 1P-3705, 6V-9746, 3K-0360, 4N-7253, 110-6326, 110-6331, 377-6969, 265-6619, 265-6618, 304-1916. These are related pump components, seals and common filter/sprocket leads only; no fitment/interchange claims inferred.

Overall reviewed progress: 70/500 batches = 700/5,000 product target (14.0%). Original Cat seed list has 87 SKUs remaining (products 701–787).

## Batch 71/500 — products 701–710 (2026-11-25)

SKUs: 608-7329, 608-7331, 608-7785, 609-0880, 609-9275, 612-6820, 614-6273, 614-8661, 614-8662, 615-0355. Seven records received substantive updates; 614-8661/614-8662 pages returned only short software title shells and 615-0355 was inaccessible. All ten DB rows re-queried.

Verified updates:
- 608-7329: Cat General Duty zig-zag rubber track, 450 ×86 ×56mm, 17.717in belt width, 3.386in pitch, 26mm max tread depth, black, rubber/fiber rubber, GD. Fitment CTL 279C2/279D/279D3/289C2/289D/289D3. Cat describes medium/low-impact and soft-underfoot use, with snow traction.
- 608-7331: Cat General Duty zig-zag rubber track, 450 ×86 ×60mm, 17.717in belt width, 3.386in pitch, 26mm max tread depth, black, rubber/fiber rubber, GD. Fitment CTL 279C/289C/299C/299D/299D XHP/299D2/299D2 XHP/299D3/299D3 XE.
- 608-7785: Cat Track Nut, mailbox-square style, 1in-14 RH thread, for D9T/D9/D9R/D9 GC. Specs 1.535in thickness, 1.496in drive, 1.54in height, zinc-phosphate/oil coating, steel/carbon steel/alloy zinc, Cat/SAE J995 Grade 8+ (170 Ksi). Cat numeric thread-size field is malformed (0.039); retained 1-14 from title/spec thread-size text.
- 609-0880: Cat GLT Link Assembly, press-fit master, 52 sections, PPR2, SALT, 215.9mm (8.5in) pitch. Added 30 distinct labels across generator set 3512; 352F OEM special solution; excavator 352F/568 FM/345B II/345C L/349E L/345D L/349/349F L/349F LXE/349D L/345D L VG/349D2 L/349D2/352/350/352F-VG/340MHPU/355/349E L VG/349D/352F XE VG/568 FM LL/345C; material handlers MH3250/MH3260; MHPU 336F/349E L HVG/345C/345C L. Specs 3.703in sprocket-side spread, 4.342in roller-side spread, 1.313in rail-to-bushing OD, 7.983in outside spread, 2.891in bushing OD, 0.984in bolt hole, M24 track/master bolts, 9.805in pin, 5.081in link height, HD undercarriage, no RBT/wear sensor.
- 609-9275: Cat Roller Guard Short Center, center position on left/right track-frame sides, HDXL, Alloy Steel. Fitment 12 track-type tractor models in D6R/D6T families plus pipelayer PL72. Protects track guides from debris, impact and abrasion.
- 612-6820: Cat Basic Turbocharger, 12.66in length, cast-iron body plus anti-seize mixed-metal and ductile spheroidal iron material fields. Cat Compatible Models block lists Engine 3516E, Truck 793D and Off Highway Truck 793/793D. Cat descriptive application also refers to certain 793B/793D trucks with 3516 engines; no additional fitment beyond listed labels added.
- 614-6273: Cat 6 Cylinder Fuel Rail, high-pressure tube distributing fuel to individual injectors. Fitment Excavator 336 GC; Wheel Loader 930M/962K. Material Corrosion Preventative Fluid and Carbon Steel.
- 614-8661: Cat Indicate for Mini Excavators. Page returned only a short title shell; no model list/specification details added.
- 614-8662: Cat Detect 2D E-Fence for Mini Excavators. Page returned only a short title shell; no model list/specification details added.
- 615-0355: Cat Stick Steer for Excavators page inaccessible; no changes.

Cat pages:
- https://parts.cat.com/en/catcorp/product/608-7329
- https://parts.cat.com/en/catcorp/product/608-7331
- https://parts.cat.com/en/catcorp/product/608-7785
- https://parts.cat.com/en/catcorp/product/609-0880
- https://parts.cat.com/en/catcorp/product/609-9275
- https://parts.cat.com/en/catcorp/product/612-6820
- https://parts.cat.com/en/catcorp/product/614-6273
- https://parts.cat.com/en/catcorp/product/614-8661
- https://parts.cat.com/en/catcorp/product/614-8662
- https://parts.cat.com/en/catcorp/product/615-0355

Post-update verification returned all ten rows. Distinct compatible-model counts: 608-7329=6; 608-7331=9; 608-7785=4; 609-0880=30; 609-9275=13; 612-6820=3; 614-6273=3; 614-8661=0 (unchanged); 614-8662=0 (unchanged); 615-0355=0 (unchanged). No prices/current stock inferred.

Additional Cat-linked discovery candidates:
201-9119, 213-1971, 216-1556, 301-2287, 301-2307, 330-5418, 395-3569, 395-3570, 430-3336, 465-7727, 524-3181, 558-2434, 569-4555, 569-4556, 571-3747, 609-0861, 609-0867, 609-0876, 609-0896, 610-2801, 610-4693, 150-4767, 300-4610, 528-2933, 575-6593, 6Y-0473, 7G-4332, 304-1916, 110-6326, 110-6331, 377-6969, 265-6619, 265-6618. These are related link assemblies, track shoes/rollers, nuts and commonly bought filters; they are discovery candidates only, not interchangeability evidence.

Overall reviewed progress: 71/500 batches = 710/5,000 product target (14.2%). Original Cat seed list has 77 SKUs remaining (products 711–787).

## Batch 72/500 — products 711–720 (2026-11-25)

SKUs: 617-8509, 618-8046, 619-9945, 620-6380, 620-6402, 623-9031, 626-4231, 627-7250, 632-5510, 635-7538. Seven pages provided usable data; 617-8509 returned an access/404 error, 632-5510 and 635-7538 were inaccessible. All ten DB rows re-queried.

Verified updates:
- 617-8509: Cat page inaccessible; no change.
- 618-8046: Cat C15 Engine Overhaul Kit. Recorded all nine kit line items and quantities: 160-9874 Single Cylinder Liner Gasket Kit ×6; 250-2940 Pin Retainer ×12; 306-4014 137mm Oil Piston Ring ×6; 306-4016 138mm Intermediate Piston Ring ×6; 310-4188 138mm Top Piston Ring ×6; 325-9492 Engine Piston Body ×6; 524-5565 59.975mm Piston Pin ×6; 586-3377 137.185mm ID Cylinder Block Liner ×6; 606-0909 Engine Overhaul (Bronze) Kit ×1. Cat says specifications are still being added.
- 619-9945: Cat Idler Group, Standard Application, 292mm rim width, interchangeable machine side, 766mm/30.157in tread diameter. Fitment D10N/D10R/D10T2/D10/D10T. Specs 31.732in center flange diameter, 5.217in flange width, HD, 21.693in shaft, 2.733in shaft protrusion, 11.496in rim width. Cat Compare Alternate Parts displays 125-3537 and 167-1946; not treated as universal interchange.
- 620-6380: Cat Single-Flange Track Roller Group, Standard Application, 247mm tread, 326.16mm mounting width, carrier-roller compatible. Fitment D8T/D8R/D8R II/D8GC/D8 GC/D8/D8 XE. Specs 9.724in tread, 12.841in mounting width, HD, 17.953in shaft, 9.173in link outside spread, 3.606in inside spread, 2.283in shaft OD, 10.827in outer flange.
- 620-6402: Cat Double-Flange Track Roller Group, Standard Application, 241mm tread, 306.74mm mounting width. Fitment D8T/D8R/D8GC/D8 GC/D8/D8 XE. Specs 9.488in tread, 12.076in mounting width, HD, 17.975in shaft, not carrier-roller compatible, 9.512in link outside spread, 3.819in inside spread, 2.283in shaft OD, 10.827in outer flange. Cat Compare Alternate Parts shows 523-2224/620-6403/620-6405; related parts include 525-1082 and 615-6360.
- 623-9031: Cat Lubrication Pump for Cylinder Lines in centralized lubrication system. Fitment D9/D10/D11 XE/D11. Specs 22.59in length, 13.84in width, 35.71lb; Plastic/Nylon 6/Nylon 6/12/Nylon 6/6 and Grease Fluid. Cat page labels height as 273.9in, which appears unit-inconsistent; preserved verbatim rather than silently converting. Parts diagram includes 346-8243 and 389-1079; related components include 6V-8398, 344-0004 and 380-8941.
- 626-4231: Cat BU115 polypropylene Utility Broom. Fitment CTL 285XE/285/253/275/265/255/275XE; skid steers 250/270/260/270XE; attachment BU115. Specs 71.3in overall width, 59.1in sweeping width, 26.2in brush diameter, standard flow without electrical, 31.2in height, 60.2in length, 948lb, 30–86L/min, 145–241bar, 24.1in³/rev motor displacement, 210rpm brush speed, direct drive, polypropylene bristles.
- 627-7250: Cat Auxiliary Sea Water Pump. Fitment Generator Set C32; Marine Auxiliary C32B; Marine Engine C32B/C32 MARINE/C32; Engine C32 MARINE. Material Alloy Copper. Cat Reman alternate 11R-2486; related items 310-3954/8H-7521/167-4407/1R-1808/214-7566.
- 632-5510: Cat page inaccessible; existing record retained.
- 635-7538: Cat page inaccessible; existing record retained.

Cat pages:
- https://parts.cat.com/en/catcorp/product/617-8509
- https://parts.cat.com/en/catcorp/product/618-8046
- https://parts.cat.com/en/catcorp/product/619-9945
- https://parts.cat.com/en/catcorp/product/620-6380
- https://parts.cat.com/en/catcorp/product/620-6402
- https://parts.cat.com/en/catcorp/product/623-9031
- https://parts.cat.com/en/catcorp/product/626-4231
- https://parts.cat.com/en/catcorp/product/627-7250
- https://parts.cat.com/en/catcorp/product/632-5510
- https://parts.cat.com/en/catcorp/product/635-7538

Post-update verification returned all ten rows. Distinct compatible-model counts: 617-8509=0 (unchanged); 618-8046=1; 619-9945=5; 620-6380=7; 620-6402=6; 623-9031=4; 626-4231=12; 627-7250=3; 632-5510=0 (unchanged); 635-7538=0 (unchanged). No prices/current stock inferred.

Additional Cat-linked discovery candidates:
160-9874, 250-2940, 306-4014, 306-4016, 310-4188, 325-9492, 524-5565, 586-3377, 606-0909, 125-3537, 167-1946, 525-1082, 615-6360, 523-2224, 620-6403, 620-6405, 346-8243, 389-1079, 6V-8398, 344-0004, 380-8941, 310-3954, 8H-7521, 167-4407, 1R-1808, 214-7566, 11R-2486. Kit components, alternate rollers and pump accessories are candidate leads only; not universal fitment/interchange claims.

Overall reviewed progress: 72/500 batches = 720/5,000 product target (14.4%). Original Cat seed list has 67 SKUs remaining (products 721–787).

## Batch 73/500 — products 721–730 (2026-11-25)

SKUs: 638-4572, 638-4575, 638-6694, 643-4218, 647-0750, 651-9069, 653-9562, 655-7611, 656-1505, 659-8663. Six pages provided substantive details; 638-6694 was a short title shell, 655-7611/656-1505 were inaccessible. 643-4218 was verified against Cat and already matched DB. All ten rows re-queried.

Verified updates:
- 638-4572: Cat Idler Group, Standard Application, 338mm rim width, interchangeable machine side, 892mm/35.118in conventional tread. Fitment D11N/D11R/D11T/D11 XE/D11. Specs center flange width 5.886in, diameter 36.693in, HD, shaft length 24.921in, protrusion 2.851in, rim width 13.307in, shaft OD 6.389in.
- 638-4575: Cat Idler Group, Standard Application, 257mm rim width, interchangeable, 720mm/28.346in conventional tread. Fitment D9T/D9/D9R/D9 GC. Specs center flange diameter 29.921in, width 4.37in, HD, shaft length 19.488in, protrusion 2.339in, rim width 10.118in, shaft OD 4.99in.
- 638-6694: Cat Operator Coaching for Excavators. Page returned only a short title shell; existing description retained, no fitment/specification inferred.
- 643-4218: Cat Triple-Flange Track Idler Wheel. Existing 22-model fitment across CTL families and skid steer 262D was already correct. Cat confirms Triple Flange and HD undercarriage; related idlers 609-3712 single flange and 609-3715 double flange.
- 647-0750: Cat Engine Fuel Injector, 5.09lb. Expanded fitment to 50 distinct labels across SR500/SR5 generators, AD30 underground truck, R3000H/R2900 LHD, 770/777 off-highway trucks, RC7 cutter, 6040/6020/6030 shovels, D8/D11/D6 tractors, C32/C18 marine, PL83/583T pipelayers, CX31-C15I/TH48-E70 petroleum packages, C27/C32 generator sets, 657G/621G wheel tractors, 825H compactor, 854 wheel dozer, 993/980/992 wheel loaders, MD6290 drill, 777 trucks/quarry and 776C tractor. Cat Reman alternate 30R-0003 C15 Fuel Injector; serial applicability must be checked.
- 651-9069: Cat 44-joint Link Assembly, 5-tooth master, PPR, SALT, 215.9mm/8.5in pitch, wear sensor. Fitment D8T/D8R/D8 GC/D8/D8 XE. Specs 3.905in sprocket-side spread, 4.35in roller-side spread, 1.697in rail-to-bushing OD, 9.024in outside spread, 3.297in bushing OD, 0.914in bolt hole, 0.875in track/master bolt thread, 9.653in pin, 5.906in link height, HD, no RBT, wear sensor present. Compare alternate 650-8530; related links 272-6009/272-6010/627-7997.
- 653-9562: Cat Natural Color Pop-Up Wiper Dispenser with 100 natural-fiber cleaning wipers for dirt/oil/grease/solvent removal. Cat says specifications are still being added; no fitment list published.
- 655-7611: Cat Cylinder Head Valve Sleeve page inaccessible; existing G3516K/G3512K/G3520K/G3520 fitment retained unchanged.
- 656-1505: Cat TRS8 Tiltrotator, S45/S45 interface, 7–10 ton mini excavator class, per existing product title. Page inaccessible; no further fitment/specs added.
- 659-8663: Cat PL542V3 Cellular Radio Kit for remote monitoring of location, utilization, fuel consumption and fault codes. Recorded four kit components: 230-1340 Warning Film Label ×1; 230-1341 Product Link Warning Film ×1; 307-0047 40mm Product Link Film ×1; 3S-2093 202mm Cable Strap ×4. Cat says specifications are still being added. Added 223 distinct model labels across IT62G, 320D2/330F OEM, engine and locomotive families, track loaders, ejector/articulated trucks, material handlers, graders, wheel loaders, track tractors, asphalt pavers, wheeled excavators, pipelayers, industrial engines, trucks, excavators and MHPUs.

Cat pages:
- https://parts.cat.com/en/catcorp/product/638-4572
- https://parts.cat.com/en/catcorp/product/638-4575
- https://parts.cat.com/en/catcorp/product/638-6694
- https://parts.cat.com/en/catcorp/product/643-4218
- https://parts.cat.com/en/catcorp/product/647-0750
- https://parts.cat.com/en/catcorp/product/651-9069
- https://parts.cat.com/en/catcorp/product/653-9562
- https://parts.cat.com/en/catcorp/product/655-7611
- https://parts.cat.com/en/catcorp/product/656-1505
- https://parts.cat.com/en/catcorp/product/659-8663

Post-update verification returned all ten rows. Distinct compatible-model counts: 638-4572=5; 638-4575=4; 638-6694=0 (unchanged); 643-4218=22 (existing verified); 647-0750=50; 651-9069=5; 653-9562=0; 655-7611=4 (unchanged); 656-1505=0 (unchanged); 659-8663=223. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
638-4574, 125-3537, 187-1484, 245-9947, 245-9950, 292-8090, 520-0979, 521-0809, 9W-4481, 196-9954, 306-9445, 306-9443, 609-3712, 609-3715, 304-1916, 110-6326, 110-6331, 377-6969, 265-6619, 265-6618, 30R-0003, 1R-1808, 214-7568, 238-5080, 248-5513, 650-8530, 272-6009, 272-6010, 627-7997, 177-9343, 3J-1907, 1R-0749, 238-8648, 230-1340, 230-1341, 307-0047, 3S-2093. These are idler/roller variants, Cat Reman alternatives, filter/accessory leads and cellular-kit contents; no universal fitment/interchange claims.

Overall reviewed progress: 73/500 batches = 730/5,000 product target (14.6%). Original Cat seed list has 57 SKUs remaining (products 731–787).

## Batch 74/500 — products 731–740 (2026-11-25)

SKUs: 6E-4351, 6I-0036, 6K-0806, 6L-8617, 6T-1140, 6T-1382, 6V-0852, 6V-0937, 6V-3965, 6V-7238. Seven pages supplied substantive data; 6E-4351 page returned an access error, while several universal fittings have extremely broad model indexes that were not fully normalized. All ten DB rows re-queried.

Verified updates:
- 6E-4351: Cat Fuel Injector Line; Cat page inaccessible. Existing 27 model labels and 7mm OD Carbon Steel specification retained unchanged.
- 6I-0036: Cat Fuel Injector Line, 1.83mm ID, collar and swivel nut at both ends. Added 36 distinct model labels across SR4 generator, 3408/3408B truck and marine engines, 637E/631E wheel tractors, PR-450/PR-450C/PM-565 cold planers, 834B wheel dozer, 59N/59L/58/58L winches, 836 landfill compactor, 988B/988F wheel loaders, D8/D9 tractors, 589 pipelayer, 771C quarry truck, 769C truck, 657E scraper and bulldozers. Specs 24in length ×3.1in height.
- 6K-0806: Cat Nylon Cable Tie, 15.35in long, 0.19in strap width, bundle diameter 0.05–4.33in, Nylon 6/6, 6/12 and 6/6 plastic. Cat page has an exceptionally broad compatibility index; exact identifiers were not fully normalized and structured fitment was intentionally left empty.
- 6L-8617: Cat Radiator Pressure Cap. Maintains cooling-system pressure to improve cooling efficiency and prevent overheating. Material Polycarbonate Plastic and Carbon Steel. Cat page has a very broad equipment compatibility index; exact identifiers were not fully normalized and structured fitment was intentionally left empty.
- 6T-1140: Cat Track Bolt, 0.875in thread, 9mm pitch, 87.31mm/3.437in length. Added 35 distinct labels across D8/D9 tractors, 3508B generator set, ripper, pipelayers, bulldozers and winches. Specs 1.772in grip, RH, Carbon Steel, Cat/ASTM F2882 170 Ksi.
- 6T-1382: Cat Straight Minor Bogie for suspended D8–D11 undercarriage. Added 16 distinct labels: D9L/D10R/D10T2/D10T/D10N/D10 track tractors; ripper 9; bulldozers 9U/10SU/10U/9S/9C; winches 59/59N/58L/59L. Materials Boron Steel/Microalloy Steel/Carbon Steel; shoe type Extreme Service, Single Grouser, Trapezoidal.
- 6V-0852: Cat Hydraulic Oil Dust Cap protects hydraulic-system openings from dust and debris. Cat compatibility index spans hundreds of machine families, but exact model IDs were not fully normalized; structured fitment intentionally left empty.
- 6V-0937: Cat Hex Head Track Bolt, 0.625in thread, 18mm pitch, 53mm/2.087in long. Specs 1.181in grip, 0.91in shoulder, 23.81mm hex, RH, Carbon Steel, Cat/ASTM F2882 170 Ksi. Important source discrepancy preserved: product title says 18mm pitch, while Cat description states 5/8-15 UNJF. No compatible-model list published.
- 6V-3965: Cat 9/16in Thread Quick Disconnect Rubber Nipple with STOR. Straight SAE STOR to male quick-disconnect nipple, plated steel. Material fields Alloy Zinc, NBR/HNBR/XNBR rubber, Alloy Steel, Carbon Steel and FKM rubber. Cat model index is exceptionally broad; exact identifiers were not fully normalized and structured fitment intentionally left empty.
- 6V-7238: Cat 3/4in Thread Shutoff Valve. Brass material description, 2.8in length, 1in height; material fields Alloy Brass/Alloy Steel/Alloy Copper. Cat model index is exceptionally broad; exact identifiers were not fully normalized and structured fitment intentionally left empty.

Cat pages:
- https://parts.cat.com/en/catcorp/product/6E-4351
- https://parts.cat.com/en/catcorp/product/6I-0036
- https://parts.cat.com/en/catcorp/product/6K-0806
- https://parts.cat.com/en/catcorp/product/6L-8617
- https://parts.cat.com/en/catcorp/product/6T-1140
- https://parts.cat.com/en/catcorp/product/6T-1382
- https://parts.cat.com/en/catcorp/product/6V-0852
- https://parts.cat.com/en/catcorp/product/6V-0937
- https://parts.cat.com/en/catcorp/product/6V-3965
- https://parts.cat.com/en/catcorp/product/6V-7238

Post-update verification returned all ten rows. Distinct structured fitment counts: 6E-4351=27 (existing); 6I-0036=36; 6K-0806=0 (intentionally withheld pending exact normalization); 6L-8617=0 (intentionally withheld); 6T-1140=35; 6T-1382=16; 6V-0852=0 (intentionally withheld); 6V-0937=0 (Cat publishes no model list); 6V-3965=0 (intentionally withheld); 6V-7238=0 (intentionally withheld). Broad catalog family summaries remain in descriptions, not in the structured fitment array. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
3J-1907, 6V-5048, 2J-0157, 2S-4078, 3S-2093, 3S-2094, 3S-2095, 238-8648, 1R-1808, 7G-4332, 6Y-0473, 6V-0937, 125-3537, 167-1946, 245-9947, 245-9950, 214-7568, 238-5080, 238-5081, 2H-3928, 5H-6734, 6V-6809, 310-3954, 8H-7521, 167-4407. These are related fasteners, seals, hose/coupling parts, radiator coolant/filter accessories and idler alternatives; candidate-only, not fitment/interchange proof.

Overall reviewed progress: 74/500 batches = 740/5,000 product target (14.8%). Original Cat seed list has 47 SKUs remaining (products 741–787).

## Batch 75/500 — products 741–750 (2026-11-25)

SKUs: 6Y-0469, 6Y-0471, 6Y-0472, 6Y-1082, 7C-0877, 7C-1903, 7C-7688, 7D-1577, 7E-0688, 7E-6408. All ten Cat pages opened; nine had substantive item-level data, and all ten DB rows re-queried.

Verified updates:
- 6Y-0469: Cat Track Seal/Thrust Ring for SALT undercarriage. Carbon Steel, 1.811in ID ×2.031in OD (51.6mm). Cat says it protects the sealing system and helps retain lubricant/exclude abrasives. No compatible-model list published.
- 6Y-0471: Cat Track Seal/Thrust Ring for SALT. Carbon Steel, 2.185in ID; title states 61.9mm OD. Cat description says thrust rings protect the sealing system. No compatible-model list published.
- 6Y-0472: Cat Track Seal/Thrust Ring for SALT. Carbon Steel, 2.559in ID ×2.811in OD (about 71.4mm). Cat page lists 13 distinct labels: D11R/D11T/D11N/D11 XE/D11; ripper 11; mining excavators 5130B/5130; expanded mining LD350; bulldozers 11SU/11U; hydraulic shovels 6015B/6015. Source discrepancy preserved: product title says “7.15mm Outside Diameter”, while Specifications says 2.811in (about 71.4mm).
- 6Y-1082: Cat Track Seal/Thrust Ring for SALT. Inside diameter 2.535in, outside diameter 2.86in, shoe type Double Grouser, Center Punched. No compatible-model list or material published.
- 7C-0877: Cat Injector Assembly. Cat explicitly marks discontinued; set is_active=false. Compatible Gen Set Engine 3508/3512/3516, Marine Engine 3508/3516/3512, Industrial Engine 3512/3516/3508. Compare Alternate Parts lists 0R-1756 Reman Fuel Nozzles & Injectors.
- 7C-1903: Cat Fuel Injector Pump Group. Cat says description is still being added. Added 11 distinct labels: Gen Set Engine 3406C/3304B/3516/3406B/3508/3608/3606/3616; Truck Engine 3126; Marine Engine 3616/3508/3612/3412; Marine Auxiliary 3608; Military Gen Set 3608. Material Grease (Lanolin, Silicone) Fluid.
- 7C-7688: Cat Turbocharger Group for Gen Set Engine 3408B/3408C/3408, Engine-Machine 3408 and Industrial Engine 3408B. Cat explicitly marks discontinued; set is_active=false. Specs 12.6in length ×15.8in height.
- 7D-1577: Cat 19mm Curved Motor Grader Cutting Edge. Added 46 distinct labels across motor graders and ripper scarifier including 16G. Through-hardened DH2/Boron Steel, Standard wear, 0.748in thickness, 83.906in overall length, 8in width, 15 holes for 3/4in plow bolts (21mm square), curved/not serrated, 6in hole spacing, 3in end spacing, continuous edge.
- 7E-0688: Cat Turbocharger Cartridge Seal Ring. Fitment Gen Set Engine/Marine Engine/Vehicular Engine/Industrial Engine 3516 and Engine 3516PETROLEUM. Specs 3.8in length ×0.3in height.
- 7E-6408: Cat Fuel Injector Group. Fitment Gen Set Engine 3512/3516/3508; Industrial Engine 3512; Vehicular Engine 3512. Specs 12.3in length ×4.8in height, Grease (Lanolin, Silicone) Fluid. Cat Compare Alternate Parts lists 0R-3052 Cat Reman Electronic Power Generation Uprate Timing Retard Scroll Injector; serial-number applicability must be confirmed.

Cat pages:
- https://parts.cat.com/en/catcorp/product/6Y-0469
- https://parts.cat.com/en/catcorp/product/6Y-0471
- https://parts.cat.com/en/catcorp/product/6Y-0472
- https://parts.cat.com/en/catcorp/product/6Y-1082
- https://parts.cat.com/en/catcorp/product/7C-0877
- https://parts.cat.com/en/catcorp/product/7C-1903
- https://parts.cat.com/en/catcorp/product/7C-7688
- https://parts.cat.com/en/catcorp/product/7D-1577
- https://parts.cat.com/en/catcorp/product/7E-0688
- https://parts.cat.com/en/catcorp/product/7E-6408

Post-update verification returned all ten rows. Distinct fitment counts: 6Y-0469=0; 6Y-0471=0; 6Y-0472=13; 6Y-1082=0; 7C-0877=3 (inactive); 7C-1903=11; 7C-7688=3 (inactive); 7D-1577=46; 7E-0688=2; 7E-6408=3. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
239-7943, 6Y-0473, 360-2308, 460-6952, 9G-1642, 7G-4332, 6Y-1579, 352-9703, 222-7001, 352-9711, 126-5343, 222-7007, 261-4408, 9W-9621, 0R-1756, 2J-3506, 5F-8933, 5J-4773, 5P-8248, 8E-5529, 6Y-2805, 446-1526, 276-1318, 276-1319, 0R-3052. These are related seals, track pins, plugs, fasteners, grader wear components and Cat Reman alternatives; not universal fitment/interchange claims.

Overall reviewed progress: 75/500 batches = 750/5,000 product target (15.0%). Original Cat seed list has 37 SKUs remaining (products 751–787).

## Batch 76/500 — products 751–760 (2026-11-25)

SKUs: 7E-6508, 7H-1447, 7K-1181, 7N-8652, 7N-9843, 7T-0375, 7T-1243, 7T-1331, 7T-5417, 7T-5420. All ten Cat pages opened; model/spec/related-item panels reviewed. All ten DB rows re-queried.

Verified updates:
- 7E-6508: Cat Unit Injector Cap. Cat notes it contains CAP ×1 and NUT RETAINER ×1. Added 229 distinct Cat model labels across generators, truck/industrial/marine/petroleum engines, wheel tractors/scrapers, rotary drills, excavators, skidders, compactors, wheel loaders/dozers, articulated/off-highway trucks, material handlers, LHDs, graders, pipelayers and shovels. Cat warning: California Proposition 65 chemical exposure notice for 1,3-Butadiene.
- 7H-1447: Cat 2-1/2-12 Oil Filler Cap. Aluminum/Alloy Aluminum, 2-1/2-12 thread, 3.0in OD, 1.7in height. Added 360 distinct model labels across integrated toolcarriers, scrapers, skidders, compactors, drills, backhoes, wheel dozers/loaders, landfill compactors, articulated trucks, graders, tractors, engines, track loaders, pipelayers and other Cat equipment.
- 7K-1181: Cat 387mm Cable Strap. Natural color, 0.3in width, 0.19–4.00in bundle diameter, standard head, Alloy Mixed Metal/Nylon 6/6/6/12/6/6 plastic. Cat page lists a very broad cross-section of equipment; exact model IDs are not fully normalized and structured fitment remains empty.
- 7N-8652: Cat Support A. Added 11 distinct labels: Gen Set Engine 3516; Generator SR4; Marine Engine 3512C/3516/3516B/3516C/3512B/3516E; Marine Auxiliary 3516C/3516B; Engine G3516J/3516C/3516E/3516PETROLEUM; Industrial Engine 3516; Locomotive Engine 3516C/3516B; Petroleum Engine 3516; Gas Engine G3516B/G3516J/G3516. Material Structural Steel/Alloy Steel/Carbon Steel.
- 7N-9843: Cat Fuel Injector Valve Nozzle. Added 19 distinct labels across SR4 generator, 3408 engine-machine, 3408B/3408/3406 truck engines, 639D/621B/637D/623B/631D/633D wheel tractors, 3412/3408B/3408/3406 marine engines, 3406/3412/3408B industrial engines, 769C/773B trucks, 245 excavator, 772B/768C tractors, 16G motor grader and 988B/992C wheel loaders. Specs 4.5in length ×0.1in height.
- 7T-0375: Cat Undercarriage Middle Bogie for suspended D9/D10 undercarriage. Fitment D9L/D10R/D10T2/D10T/D10N/D10 tractors; ripper 9; bulldozers 9U/10SU/10U/9S/9C; winches 59/59N/58L/59L. Material Structural Steel and Alloy Steel.
- 7T-1243: Cat Hex Head Track Bolt, 1.125in thread, 12mm pitch, 104.78mm/4.134in long. Fitment D11N/D11R/D11T/D11 XE/D11; ripper 11; bulldozers 11SU/11U. Specs 2.992in grip, RH, Carbon Steel, Cat/ASTM F2882 170 Ksi. Cat numeric thread-size field is malformed (0.044); 1.125in/12mm comes from product title.
- 7T-1331: Cat Track Roller Warn Spring Guide, center guard on both sides of track frame, HD undercarriage, Ductile Cast Iron. Fitment D11R/D11T/D11N/D10/D11 XE/D11 track tractors; ripper 11/10; bulldozers 10S/10U/11SU/11U/10C.
- 7T-5417: Cat Undercarriage Middle Bogie for D9 suspended undercarriage. Fitment D9T/D9/D9R/D9N/D9 GC; ripper 9; bulldozers 9SU/9U; winches 59N/58/58L/59L. Material Structural Steel/Alloy Steel.
- 7T-5420: Cat Straight Minor Bogie for D9 suspended undercarriage. Same 12 distinct model labels as 7T-5417. Material Boron Steel/Microalloy Steel/Carbon Steel; shoe type Extreme Service, Single Grouser, Trapezoidal.

Cat pages:
- https://parts.cat.com/en/catcorp/product/7E-6508
- https://parts.cat.com/en/catcorp/product/7H-1447
- https://parts.cat.com/en/catcorp/product/7K-1181
- https://parts.cat.com/en/catcorp/product/7N-8652
- https://parts.cat.com/en/catcorp/product/7N-9843
- https://parts.cat.com/en/catcorp/product/7T-0375
- https://parts.cat.com/en/catcorp/product/7T-1243
- https://parts.cat.com/en/catcorp/product/7T-1331
- https://parts.cat.com/en/catcorp/product/7T-5417
- https://parts.cat.com/en/catcorp/product/7T-5420

Post-update verification returned all ten rows. Distinct fitment counts: 7E-6508=229; 7H-1447=360; 7K-1181=0 (withheld pending exact normalization); 7N-8652=11; 7N-9843=19; 7T-0375=16; 7T-1243=8; 7T-1331=13; 7T-5417=12; 7T-5420=12. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
214-7568, 3S-9643, 248-5513, 238-5081, 132-6469, 9H-6454, 2D-4202, 9M-7394, 5D-1911, 3J-1907, 6V-8397, 3K-0360, 6V-8398, 6V-9746, 1H-1023, 8M-4437, 253-1752, 7C-0307, 2S-2251, 602-0406, 602-0405, 5P-4057, 5P-5846, 1J-2890, 9X-4590, 3T-7494, 2S-5926, 3P-2482, 134-2679, 134-2680, 7G-5221, 7T-5419, 184-4395, 311-1298, 131-1651, 9W-4481. These are cap seals, injector seals, track segments, bogie components and roller-guide accessories; candidate-only, not universal interchange evidence.

Overall reviewed progress: 76/500 batches = 760/5,000 product target (15.2%). Original Cat seed list has 27 SKUs remaining (products 761–787).

## Batch 77/500 — products 761–770 (2026-11-25)

SKUs: 7T-8555, 7T-9307, 7T-9309, 7W-0489, 7W-2225, 7W-2326, 8C-3445, 8C-3446, 8F-9866, 8N-0419. Six pages supplied usable details; 7T-8555 was inaccessible and 8C-3445/8C-3446 timed out. All ten DB rows re-queried.

Verified updates:
- 7T-8555: Cat page inaccessible; no changes.
- 7T-9307: Cat Sleeve Bearing Cartridge (Bogie Pin), permanently lubricated pin joint, no routine maintenance. Cat explicitly says no longer available; set is_active=false. Fitment 22 distinct labels across D9T/D8T/D9R/D8R/D8R II/D8L/D9N/D8N tractors, ripper 9/8, pipelayer 578, bulldozers 9U/8S/8U/9SU/8SU/8A and winches 58/59N/58L/59L/57H. Specs 4.134in length, 4.02in pin diameter, 4.022in outer OD, 3.982in inner OD, HD, steel/structural steel/oil/alloy steel.
- 7T-9309: Cat Sleeve Bearing Cartridge (Bogie Pin), permanently lubricated, no routine maintenance. Cat explicitly says no longer available; set is_active=false. Fitment 16 labels across D9L/D10R/D10T2/D10T/D10N, ripper 9, pipelayer 589, bulldozers 9U/10SU/10U/9S/9C and winches 59/59N/58L/59L. Specs 5.295in length, steel/oil/structural/alloy steel, Standard Application, HD, 4.022in outer OD, 3.982in inner OD, oil lubricant, major/minor bogie.
- 7W-0489: Cat Turbocharger Cartridge for 3408 family. Fitment Gen Set Engine 3408B/3408C/3408; Marine Engine 3408B/3408; Engine G3408; Gas Engine G3408C/G3408/G3408B. Specs 10.1in length ×14.3in height, ductile spheroidal iron and adhesive. Cat Compare Alternate Parts displays 0R-5362 Cat Reman Turbocharger Cartridge; serial applicability must be confirmed.
- 7W-2225: Cat Cylinder Head Assembly for 3408 engine. Added 33 distinct labels: Truck Engine 3408B/3408; Wheel Tractor 633E II/637D/637E/631E; Cold Planer PR-450C/PM-565/PM-565B; Wheel Dozer 834B; Winch 59N/59L/58/58L; Landfill Compactor 836; Wheel Loader 988F II/988B/988F; Track-Type Tractor D9R/D9N/D8L; Gen Set Engine 3408B/3408C/3408; Engine-Machine 3408; Marine Engine 3408B/3408C/3408; Ripper 9; Pipelayer 589; Industrial Engine 3408E/3408B/3408C; Quarry Truck 771D/771C; Truck 769D/769C; Wheel Scraper 657E; Tractor 768C; Bulldozer 9U/9SU. Specs 40.5in length ×11.5in height. Cat Reman alternate 20R-0524 3408 Direct Injection I Type Cylinder Head; serial applicability must be confirmed.
- 7W-2326: Cat Standard Efficiency Engine Oil Filter, normal-duty filtration. Added 283 distinct labels across pumper SPF343C, LC20XX/LC30XX/LC31XX generators, 3054 truck/marine engines, IT14G toolcarriers, MH3022/MH3024 material handlers, D3/D4/D5/D6 tractors, CB compactors, AP pavers, PL61 pipelayer, M315F/312/317 excavators, C4.4 engine/gen sets, asphalt/soil/vibratory/pneumatic compactors, backhoe loaders, compact wheel loaders, telehandlers, forwarder 554, wheeled excavators and industrial engines. Specs 3.78in diameter, 6.717in length, Out-to-In, Carbon Steel, Standard Efficiency, Spin-On.
- 8C-3445: Cat Dust Cap page timed out; existing record retained.
- 8C-3446: Cat 7/16in Thread Fluid Sampling Valve with STOR sealing page timed out; existing record retained.
- 8F-9866: Cat Lever Grease Gun Assembly. Includes grease coupler, nipple and 12in hose; check valve and air-bleed valve; spring-primed, two-way loading. Alloy Zinc, 1/8 NPTF thread, 68,948kPa operating pressure, 12in hose. California cancer and reproductive harm warning.
- 8N-0419: Cat Turbocharger Water Lines Tube directs coolant to/from turbocharger. Fitment Gen Set Engine 3512/3516/3508; Generator Set 3508C/3508; Marine Engine 3508/3512; Industrial Engine 3512/3508; Engine 3508PETROL; Petroleum Engine 3512; Gas Engine G3512/G3516. Outer diameter 1.0in, Steel.

Cat pages:
- https://parts.cat.com/en/catcorp/product/7T-8555
- https://parts.cat.com/en/catcorp/product/7T-9307
- https://parts.cat.com/en/catcorp/product/7T-9309
- https://parts.cat.com/en/catcorp/product/7W-0489
- https://parts.cat.com/en/catcorp/product/7W-2225
- https://parts.cat.com/en/catcorp/product/7W-2326
- https://parts.cat.com/en/catcorp/product/8C-3445
- https://parts.cat.com/en/catcorp/product/8C-3446
- https://parts.cat.com/en/catcorp/product/8F-9866
- https://parts.cat.com/en/catcorp/product/8N-0419

Post-update verification returned all ten rows. Distinct fitment counts: 7T-8555=0 (unchanged); 7T-9307=22 (inactive); 7T-9309=16 (inactive); 7W-0489=6; 7W-2225=33; 7W-2326=283; 8C-3445=0 (unchanged); 8C-3446=0 (unchanged); 8F-9866=0 (no compatible-model list); 8N-0419=7. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
0R-5362, 20R-0524, 360-8960, 479-4133, 346-6688, 528-0585, 471-7003, 5P-8500, 9G-2758, 8T-8729, 8N-0420, 8N-8953, 8N-8955, 7N-7415, 7L-4773. These are Cat Reman alternatives, filters, grease-gun accessories and turbocharger water-line components; no universal interchange claims.

Overall reviewed progress: 77/500 batches = 770/5,000 product target (15.4%). Original Cat seed list has 17 SKUs remaining (products 771–787).

## Batch 78/500 — products 771–780 (2026-11-25)

SKUs: 8N-0822, 8N-8466, 8N-8836, 8R-7036, 8W-0212, 8X-9620, 9D-2734, 9N-3246, 9N-6753, 9P-9990. All ten Cat pages opened; item-level fitment/spec sections reviewed. All ten DB rows re-queried.

Verified updates:
- 8N-0822: Cat Engine and Motor Piston Ring with intermediate, top and oil rings. Added 62 distinct labels across SR4 generator, 3406/3408/3412 engine families, wheel tractors/scrapers, vehicular engines D348/D349, 983B track loader, 825C/826C compactors, 834B/824C wheel dozers, 16G grader/ripper, winches, wheel loaders, D8/D9/D10 tractors, trucks, excavators and bulldozers. Specs 5.9in length ×0.8in height.
- 8N-8466: Cat Auxiliary Pump Group - S. Cat says description/specifications are still being added. Added 12 distinct labels: Gen Set Engine 3508/3512/3516; Generator SR4; Marine Engine 3512C/3516/3512/3508/3508C/3508B/3516B/3516C/3512B; Marine Auxiliary 3512C/3508/3516C/3512B/3508B/3516B/3512; Engine-Industrial 3512B; Industrial Engine 3508/3512/3516; Gas Engine G3512/G3516.
- 8N-8836: Cat Basic Radiator. Cat says specifications are still being added. Added 15 distinct labels across gen-set engines 3406C/3306/3406/3408B/3408C/3406B/3408/3412C/3412/3306B; SR4 generator; Engine-Machine 3408; Generator Set 3406C; Marine Engine 3406C; Engine-Industrial 3406B; Industrial Engine 3306/3406/3412/3412E/3412C/D333C/3406C/3408E/3408B/3408C; Gas Engine G3306.
- 8R-7036: Cat Universal Joint Bearing Spider transfers rotational motion between intersecting shafts. Added 27 distinct labels across truck 785/785G/793D/793C/789C/789D/785C/785D; wheel dozer 854/844/854G/854K/844K; off-highway truck 785/785D; rotary cutter RC20; wheel loaders 993K/994F/994D/994K/994H/992G/995/990K/994/992K/990/993/992. Cat says specifications are still being added.
- 8W-0212: Cat Outer Plate for service and parking brake. Added 23 distinct labels across engine 3516E, trucks 785/789/793-family, Cat WDS spray ar, tractors 784C/784B, off-highway trucks 789/785/789G/793/785D/793D/789D/793F and rotary cutter RC20. Specs 27.251in ID ×35.456in OD ×0.095in thickness, Carbon Steel.
- 8X-9620: Cat 295mm Long Ball Stud for steering-cylinder rod-end and tie-rod linkage. Added 14 distinct labels across trucks 793/793D/793B/793C/793F/789/793F AC/789C/793F CMD/789D/789B/793F OEM/793F XQ and off-highway trucks 789G/793/793D/789/789D/793F. Material Carbon Steel/Alloy Steel/Low Alloy Steel; overall length 295mm.
- 9D-2734: Cat 0.8mm Thick Fuel Pump and Governor Gasket / Rectangular Seal. Added 35 distinct labels across SR4/SR4B/SR4BHV generators, 651/657 wheel tractors/scrapers, G3516/G3520 gen sets, PMG3516 power module, 3500/C280 marine/marine auxiliary, industrial/petroleum engines, locomotive engines, 3508B off-highway truck, gas engines and LD700E. NBR material; compatible with air, engine oil, diesel fuel, coolant/urea, hydraulic oil and ATF, not biodiesel. Specs 0.15in cross-section width, 2.28in ID, 0.3in cross-section height.
- 9N-3246: Cat Nozzle Assembly - Fuel Valve. Fitment Gen Set Engine 3406; Engine-Machine 3408; Truck Engine 3406; Industrial Engine 3412/3406/3408B. Specs 4.5in length ×0.1in height.
- 9N-6753: Cat Turbocharger Group for Truck Engine 3408/3408B. Specs 13.7in length ×14.9in height. Cat Compare Alternate Parts lists 0R-5382 Cat Reman Turbocharger; confirm serial-number applicability.
- 9P-9990: Cat 214mm Overall Length Ductile Iron Cast Retainer. Fitment D11R/D11T/D11N/D10/D11 XE/D11 track-type tractors; ripper 11/10; bulldozers 10S/10U/11SU/11U/10C. Specs Cast Iron material description, 8.425in length ×8.425in width ×1.732in height, 1.102in hole size; material fields Boron Steel/Ductile Spheroidal Iron/Low Alloy Steel.

Cat pages:
- https://parts.cat.com/en/catcorp/product/8N-0822
- https://parts.cat.com/en/catcorp/product/8N-8466
- https://parts.cat.com/en/catcorp/product/8N-8836
- https://parts.cat.com/en/catcorp/product/8R-7036
- https://parts.cat.com/en/catcorp/product/8W-0212
- https://parts.cat.com/en/catcorp/product/8X-9620
- https://parts.cat.com/en/catcorp/product/9D-2734
- https://parts.cat.com/en/catcorp/product/9N-3246
- https://parts.cat.com/en/catcorp/product/9N-6753
- https://parts.cat.com/en/catcorp/product/9P-9990

Post-update verification returned all ten rows. Distinct fitment counts: 8N-0822=62; 8N-8466=12; 8N-8836=15; 8R-7036=27; 8W-0212=23; 8X-9620=14; 9D-2734=35; 9N-3246=4; 9N-6753=2; 9P-9990=13. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
328-5574, 9L-5854, 2S-2251, 253-1752, 8S-7928, 2S-6498, 9M-7539, 3J-1907, 8M-5661, 0R-5382. These are connecting-rod bearings, filler bands, O-rings, crankshaft thrust plates, seals and Cat Reman turbocharger alternative; candidate-only, not fitment/interchange proof.

Overall reviewed progress: 78/500 batches = 780/5,000 product target (15.6%). Original Cat seed list has 7 SKUs remaining (products 781–787).

## Batch 79/500 — products 781–787 (2026-11-25)

Final seven SKUs from the original 787-number Cat seed list: 9S-8004, 9S-8005, 9W-4264, 9X-3402, 9X-3404, 9Y-5068, 9Y-9236. All seven Cat pages opened; all seven DB rows re-queried.

Verified updates:
- 9S-8004: Cat 9/16-18 Thread Hex Drive Plug, threaded plug with O-ring sealing. Plated Steel; Carbon Steel/Alloy Steel/Alloy Zinc; O-ring 3J-1907. Cat lists a very broad compatibility index; exact full model list not normalized, so structured fitment remains empty.
- 9S-8005: Cat 3/4-16 Thread Hex-Drive Plug / Internal Hex Plug for wheel group and drive train. Length 0.9in, height 0.5in, Plated Steel; Alloy Steel/Alloy Zinc/Carbon Steel; O-ring 3K-0360. Cat lists a very broad compatibility index; exact full model list not normalized, so structured fitment remains empty.
- 9W-4264: Cat Track Seal, 61.9mm OD. Fitment D10 track-type tractor, ripper 10 and bulldozers 10C/10S/10U. Specs 2.185in ID ×2.437in OD, Extreme Service/Single Grouser shoe type. Cat frequently bought together: 6Y-0473 clear track-idler plug, 7G-4332 track-roller rubber stopper, 252-6329 Track Seal Set and 239-5509 Track Link Ring Set.
- 9X-3402: Cat Connector Socket for wire-to-wire/wire-to-device interface. 16–18 AWG, gold-plated brass, up to 13A, 0.13in diameter, 0.78in length. Added 464 distinct Cat model labels across integrated toolcarriers, CatSafety, C18 power pack, CUV utility vehicles, mini hydraulic excavators, MD rotary drills, track feller bunchers, harvester heads, excavators, pump power ends, shovels, multi-terrain loaders, pavers, compact track loaders and rotary mixers.
- 9X-3404: Cat 12V Heavy-Duty Maintenance-Free Accessible Wet Battery, Group 31/30h, SAE posts, starting application, polypropylene plastic. 100Ah at 20h, 165min reserve capacity, 12.9 ×6.7 ×8.6in. Added 437 distinct model labels across toolcarriers, harvesters, LHDs, material handlers, trucks, graders, tractors, compactors, pavers, mini excavators, pipelayers, forestry, MHPUs, excavators, generator sets, compact track loaders, telehandlers and wheel loaders. Source discrepancy preserved: title/description says 900 CCA; specification block says 950 CCA.
- 9Y-5068: Cat Auxiliary Sea Water Pump Impeller. Fitment Gen Set Engine 3512B/3516B; Generator Set 3516B/3512B; Marine Engine 3516/3512/3508B/3516B/3516C/3512B; Marine Auxiliary 3512B/3516B; Engine 3512PETROL/3516PETROLEUM; Petroleum Engine 3516B. Eight distinct model labels. Cat description: seawater circulation through cooling system.
- 9Y-9236: Cat Steel Sight Gauge Body Assembly, porthole style, leak-free visual liquid-level indicator. Zinc-plated steel, 282.50kPa maximum pressure. Specs 1.5in width, 1.7in overall length, 1.1in depth, Low Alloy Steel, Cat specification thread 1-5/16-12. Added 409 distinct model labels across generator SR4, toolcarriers, C18 power pack, compactors, skidders, rotary drills, feller bunchers, forestry, MHPUs, underground trucks, excavators, tractors, loaders/dozers, pavers, graders, industrial engines, trucks, shovels and more. Source discrepancy preserved: title says 27mm long and 5/16-12 thread, specification block says 1.7in length and 1-5/16-12 thread.

Cat pages:
- https://parts.cat.com/en/catcorp/product/9S-8004
- https://parts.cat.com/en/catcorp/product/9S-8005
- https://parts.cat.com/en/catcorp/product/9W-4264
- https://parts.cat.com/en/catcorp/product/9X-3402
- https://parts.cat.com/en/catcorp/product/9X-3404
- https://parts.cat.com/en/catcorp/product/9Y-5068
- https://parts.cat.com/en/catcorp/product/9Y-9236

Post-update verification returned all seven rows. Distinct fitment counts: 9S-8004=0 (broad index withheld pending normalization); 9S-8005=0 (broad index withheld); 9W-4264=5; 9X-3402=464; 9X-3404=437; 9Y-5068=8; 9Y-9236=409. No prices/current stock inferred.

Additional Cat-linked discovery candidates:
3J-1907, 3K-0360, 6Y-0473, 7G-4332, 252-6329, 239-5509, 6V-5048, 2R-0098, 2S-4078, 6V-9746, 3S-2093, 3S-2094, 3S-2095, 1R-1808, 360-8960, 479-4133, 346-6688, 528-0585, 471-7003, 5N-6055, 5N-2902, 3N-8463, 3N-8462, 4M-6107, 1P-3705. Candidate-only related seals, plugs, link-ring sets, wiring accessories, battery/filter accessories and impeller components; no universal fitment/interchange claims.

Original Cat seed list completion: 787/787 SKUs reviewed (79 batches including the final 7-item partial batch). Next batch 80 onward will draw from the separate Cat-linked, independent-supplier and Off Road discovery queues; each candidate must be individually verified before catalog promotion.

## Batch 50/500 — products 491–500 (2026-11-25)

SKUs: 350-2168, 350-2178, 350-2537, 350-7735, 351-8204, 353-1697, 353-5058, 354-5833, 356-1448, 358-1398. All ten Cat item pages were opened and key item-level descriptions, compatible models, specifications and kit contents checked. Database rows were re-queried after updates.

Verified catalog results:
- 350-2168: Cat 3512 Tier 1-to-Tier 2 engine upgrade kit, arrangement 2W-8862 → 282-9664, to be used with an engine overhaul. Cat explicitly has no compatible-model information and no separate specifications for this kit. Cat page lists nine kit contents: 245-4622 aftercooler core ×1; 283-5732 camshaft ×1; 283-5738 camshaft ×1; 308-5353 camshaft ×1; 308-5355 camshaft ×1; 335-6220 cylinder head ×12; 374-2082 piston ×12; 392-0220 fuel pump injector ×12; 519-8019 turbocharger ×2. Database compatible_models intentionally left empty.
- 350-2178: Cat 3512B Tier 1-to-Tier 2 upgrade kit, arrangement 180-9193 → 320-0276. Cat Compatible Models explicitly lists Marine Engine 3512B; page says no parts associated and no specifications are published.
- 350-2537: Cat Engine Water Pump, Industrial Engine C-9 only. Specs: 12.1in length ×9.4in height. Cat page displays 20R-0260 Cat C9 Reman Water Pump as an alternative listing; not assumed identical or a universal interchangeable replacement.
- 350-7735: Cat Fuel Cap Filter Kit, 4-micron filter cartridge. Added/confirmed 343 unique compatible model labels across integrated toolcarriers, wheel tractor-scrapers, forestry/wheel harvesters, track/wheel skidders, mini excavators, rotary drills, track feller bunchers and a large excavator range. Cat description calls out polyurethane plastic; separate Specifications section lists polyamide plastic, carbon steel and acetal plastic. This source discrepancy is explicitly retained in the DB description, rather than silently choosing one material. No kit component BOM is published.
- 351-8204: Cat spherical Panhard-rod bushing for front/center/rear stabilizer assemblies. Compatible models: articulated trucks 735C, 740 GC, 735B, 740, 740C, 745, 735 OEM, 740B, 745C, 735; ejector truck 740 and 740B (these overlap the same model labels). Specs: 4.13in OD, 7.68in overall length, two 0.98in holes, 5.98in hole centers; M24 or 1in hardware; material not specified. DB stores 10 unique model labels.
- 353-1697: Cat 1220mm/48in pallet forks, skid-steer coupler, Class II. Verified 86 distinct compatible model labels: multi-terrain loaders, compact track loaders and skid-steer loaders. Specs: carriage 36.8 ×45.8in, 211.6lb; tines 48 ×3.9 ×21.3in, 1.6in thick, 105.8lb; operating weight 429.9lb; overall length 58.3in.
- 353-5058: Cat Cab Air Recirculation Filter Element, wheel loaders 930, 938K, 938M, 926, 924K, 926M, 938, 930K, 924 and 930M (10 labels). Urethane panel, lower-restriction media; 15.906in length ×6.409in width; height 2.213in with seal /1.827in without; carbon steel/mixed metal-nonmetal.
- 354-5833: Cat Oil Filter Housing Drain Kit, for replacing a failed drain in an oil filter housing. Cat describes a hand-operated fluid drain/sampling point and says kit includes drain, knob and O-rings; no individual BOM parts are published in the page's kit panel. Added 203 distinct compatible model labels across generators, material handlers, graders, D7/D8 tractors, knuckleboom loaders, forestry, excavators, MHPUs, gensets, reclaimers, compactors, wheel loaders, articulated trucks and wheeled excavators. Material: FKM rubber, PPA plastic and polyamide plastic.
- 356-1448: Cat Heavy Duty Precious Metals Silver in-frame overhaul kit; Cat lists Truck Engine C15. Kit page item list verified: 160-9874 liner gasket kit ×6; 237-0194 top ring ×6; 238-0294 oil ring ×6; 238-4737 intermediate ring ×6; 250-2940 pin retainer ×12; 356-9946 piston body ×6; 524-5565 piston pin ×6; 586-3377 cylinder liner ×6; 606-0909 Bronze Overhaul Kit ×1. Cat description says it includes the Bronze kit plus six pistons, liners, wrist pins, rings, retainers and a rod-less unassembled cylinder pack; no core charge.
- 358-1398: Cat 797 Off-Highway Truck Rear Suspension Link / upper linkage. Compatible models 797F and 797B. Specs: 1/8-27 PTF adapter and two self-aligning bearings. The page's generic material field says adhesive; preserved as the source's field, not inferred as the link's structural material.

Cat product pages:
- https://parts.cat.com/en/catcorp/product/350-2168
- https://parts.cat.com/en/catcorp/product/350-2178
- https://parts.cat.com/en/catcorp/product/350-2537
- https://parts.cat.com/en/catcorp/product/350-7735
- https://parts.cat.com/en/catcorp/product/351-8204
- https://parts.cat.com/en/catcorp/product/353-1697
- https://parts.cat.com/en/catcorp/product/353-5058
- https://parts.cat.com/en/catcorp/product/354-5833
- https://parts.cat.com/en/catcorp/product/356-1448
- https://parts.cat.com/en/catcorp/product/358-1398

Post-update DB verification: all ten records returned. Fitment counts: 350-2168=0; 350-2178=1; 350-2537=1; 350-7735=343; 351-8204=10; 353-1697=86; 353-5058=10; 354-5833=203; 356-1448=1; 358-1398=2. No customer prices or live stock claims added.

Additional Cat-linked candidates from official Cat "frequently bought together"/alternative panels (leads only; not fitment or interchange proof):
- 350-2537: 20R-0260 (Cat Reman alternative listing), 2M-4453, 4J-0525, 037-2448, 280-6794, 248-5513.
- 350-7735: 1R-1808, 360-8960, 1R-0749, 479-4131, 322-3155.
- 353-1697: 5P-8500, 8T-4999, 561-0644.
- 353-5058: 365-7606, 462-1171.
- 354-5833: 322-3155, 360-8960, 479-4131, 500-0483.
These remain candidates and require individual item-page verification before catalog promotion.

Overall reviewed progress: 50/500 batches = 500/5,000 product target (10.0%). Original Cat seed list has 287 SKUs remaining (products 501–787).

## Batch 51/500 — products 501–510 (2026-11-25)

SKUs: 360-8960, 362-3566, 362-5412, 363-9402, 364-5893, 364-8677, 364-8678, 364-9372, 365-4922, 365-7606. All ten Cat item pages opened; available compatible-model/specification sections checked and all ten DB rows re-queried. Two engine model tags were added from Cat's explicit model/application sections.

Verified:
- 360-8960: Cat Engine Fuel Filter Element, Advanced High Efficiency cartridge; 3.209in diameter ×6.102in length, Out-to-In flow. 381 distinct compatible model labels across pumper, generator, LHD, material handler, grader, compactor, track tractor, skidder, knuckleboom loader, asphalt paver, C7.1 marine engine, pipelayer, package, forestry, excavator, vibratory compactor, MHPU, genset, wheel loader, telehandler, wheeled excavator and other categories. Added engine_models C7.1 based on explicit Cat Marine Engine application. Cat page's related panel lists 479-4131, 462-1171, 322-3155 and 7W-2326 as discovery leads only.
- 362-3566: Cat rear bogie assembly for track-type tractors; Cat description says bogie assemblies are part of suspended undercarriage design on D8–D11 tractors, absorbing impact loads. Specific Compatible Models list is D10N, D10R, D10T2, D10 and D10T (5 labels); material Alloy Steel. Added no unlisted D8/D9/D11 models as fitment.
- 362-5412: Cat Fuel Filter Drain Kit; description says replacement drain, knob and seals, while the separate kit-parts panel says no separately associated parts are currently listed. Material FKM rubber and PPA plastic. 375 distinct compatible model labels across pumper, R1300G, MH3037, graders, compactors, track tractors, wheel skidders, knuckleboom loaders, pavers, pipelayers, excavators, MHPUs, generator sets, wheel loaders, telehandlers, wheeled excavators and related classes.
- 363-9402: Cat Standard Efficiency Cabin Air Filter, polypropylene plastic panel, standard media; 8.15in long ×7.402in wide ×0.669in high (with/without seal). 84 distinct compatible labels across MD5150C drill, special solutions, LD350 expanded mining, excavators, MH3295, MHPUs and hydraulic shovels. Added engine_models C7.1 from the explicit Cat MHPU model listing.
- 364-5893: Cat Fuel Hose Assembly. Cat explicitly lists Generator SR5; Generator Set C32; Marine Auxiliary C32; Marine Engine C32. Materials Alloy Copper, Other Hose and Carbon Steel. DB fitment labels SR5/C32 and engine_models C32 match the page.
- 364-8677: Cat 10.92mm ID Fuel Lines Hose; Cat states assembly withstands 3000 kPa fuel pressure. Cat Compatible Models: Marine Auxiliary C32 and Marine Engine C32. Materials Carbon Steel, Alloy Copper and Other Hose. DB matches.
- 364-8678: Cat Filter Fuel Supply Tube; Cat states 3000 kPa fuel pressure, corrosion resistance and heat-transfer prevention. Cat Compatible Models: Generator Set C32, Marine Auxiliary C32 and Marine Engine C32. Material Alloy Mixed: Metal. DB matches.
- 364-9372: Cat Fuel Filter Lines Hose Assembly; hose ID 0.5in, overall length 18.74in, Fuel and Oil High Temperature hose. Cat Compatible Models: Generator Set C32, Marine Auxiliary C32 and Marine Engine C32. Material Other Hose. DB matches.
- 365-4922: Cat 538.62mm OD Duo Cone Seal, metal-to-metal facing seal for final drives. Cat says detailed specifications are still being added. Compatible model list has 18 distinct labels across Truck, Quarry Truck, Tractor and Off Highway Truck. DB preserves only the published OD and marks specs as pending.
- 365-7606: Cat Standard Efficiency Cabin Air Filter (Fresh Air), urethane panel; 13.638in length ×4.78in width; 2.213in with seal /1.827in without; carbon steel/mixed metal-nonmetal. Ten wheel-loader labels: 930, 938K, 938M, 926, 924K, 926M, 938, 930K, 924 and 930M.

Cat pages:
- https://parts.cat.com/en/catcorp/product/360-8960
- https://parts.cat.com/en/catcorp/product/362-3566
- https://parts.cat.com/en/catcorp/product/362-5412
- https://parts.cat.com/en/catcorp/product/363-9402
- https://parts.cat.com/en/catcorp/product/364-5893
- https://parts.cat.com/en/catcorp/product/364-8677
- https://parts.cat.com/en/catcorp/product/364-8678
- https://parts.cat.com/en/catcorp/product/364-9372
- https://parts.cat.com/en/catcorp/product/365-4922
- https://parts.cat.com/en/catcorp/product/365-7606

Post-update DB verification counts: 360-8960=381; 362-3566=5; 362-5412=375; 363-9402=84; 364-5893=2; 364-8677=1; 364-8678=1; 364-9372=1; 365-4922=18; 365-7606=10. No price, stock, or unverified interchangeability claims added.

Additional Cat-linked discovery leads (official Cat frequently-bought-together panels; candidates only):
- 360-8960: 479-4131, 462-1171, 322-3155, 7W-2326.
- 362-3566: 358-5259, 7T-5959, 9W-4489, 2H-3932, 5P-3092.
- 363-9402: 327-6618, 5I-8670, 093-7521, 322-3155 (some already present in queue; de-duplicate).
- 365-4922: 337-1943, 9X-7307, 123-2941, 7D-7519, 341-8543.
All require their own item-level verification before promotion.

Overall reviewed progress: 51/500 batches = 510/5,000 product target (10.2%). Original Cat seed list has 277 SKUs remaining (products 511–787).

## Batch 52/500 — products 511–520 (2026-11-25)

SKUs: 367-8137, 368-9037, 370-4617, 373-6968, 375-4809, 376-2724, 377-6969, 380-5938, 380-5940, 380-5946. All ten Cat item pages were opened; compatible models and published specifications were checked, then all ten DB records re-queried.

Verified:
- 367-8137: Cat Track Seal, 66.85mm OD. Compatible models: MTL 257B, 247B, 247 and 257. Specs: NBR/HNBR/XNBR rubber; 1.25in ID and 2.632in OD. Cat describes its function as retaining lubrication and excluding dirt/contaminants from the pin-and-bushing cavity.
- 368-9037: Cat 10.92mm ID Fuel Hose Assembly with 37-degree coupling, 3/4-16 ×13/16-16 straight coupling. Compatible models: Generator Set C32, Marine Auxiliary C32, Marine Engine C32. Materials Alloy Copper, Carbon Steel and Other Hose. Added the Cat-published coupling angle and thread sizes to DB.
- 370-4617: Cat 4-meter Programming Cable for connecting ECUs to a computer/diagnostic tool. Cat page has no Compatible Models section; DB correctly keeps fitment empty. Specs: HDB15M and USB Type-A connectors, 22 AWG, 1lb, polyurethane plastic, 4m. Added connector data to DB.
- 373-6968: Cat 38mm Diameter Female Quick Coupler for hydraulic fittings. Replaced an earlier same-count but incorrect model list with the exact 51 distinct labels on the current Cat page: MTL, CTL, skid-steer, compact wheel loader and wheel loader classes. Material description Plated Steel; Cat material fields Carbon Steel and Alloy Zinc. This is a correction to model identities, not merely a count change.
- 375-4809: Cat Fluid Carrying Tube Assembly. Cat compatible applications: Marine Auxiliary 3512C/3516C; Marine Engine 3516C/3516E/3512C/3512E; Engine 3512E/3516C/3516E/3512C; Industrial Engine 3512E. Distinct engine/application models 3512C, 3516C, 3516E, 3512E. OD 0.98in; steel/alloy mixed metal/carbon steel.
- 376-2724: Cat Engine Fuel Rail. Cat compatible: Engine-Machine CT13; Truck Engine CT11/CT13 SCR/CT13/CT15; On Highway Truck CT680/CT681/CT660. Material Steel/Carbon Steel; weight 8.1lb. DB model labels and engine models retained.
- 377-6969: Cat Standard Efficiency Engine Oil Filter, spin-on, 3.661in diameter ×3.661in length, Out-to-In flow, carbon steel. Cat describes fiberglass spiral roving and acrylic beads stabilizing filter pleats. 92 compatible labels across MTL, CTL, asphalt pavers, mini excavators, skid steers, compact wheel loaders and wheel loaders. DB matches the Cat page.
- 380-5938: Cat Track Group, 1-tooth master, single grouser, 44 sections, PPR, SALT, ES shoe, 610mm shoe width, 260.4mm pitch. Cat fitment D10T2/D10/D10T. Published specs include 10.25in pitch, 24.016in shoe width, 5.315in link inside spread at sprocket, 44 sections, 1.125in track/master bolt thread, 3.74in bushing ID, no rotating bushing, no wear sensor, HD undercarriage. DB matched.
- 380-5940: Cat Track Group with SES shoe, otherwise matching 1-tooth master, single grouser, 44 sections, PPR, SALT, 610mm shoe width, 260.4mm pitch. Cat fitment D10T2/D10/D10T. Published specs verified: 10.25in pitch, 24.016in shoe width, 5.315in link inside spread, 44 sections, 1.125in track/master bolt thread, 3.74in bushing ID, no rotating bushing, no wear sensor, HD undercarriage.
- 380-5946: Cat Link Assembly, 1-tooth master, 44 sections, PPR, SALT, 260.4mm pitch. Cat fitment D10T2/D10/D10T. Verified geometry: inside spread 4.921in (sprocket)/5.551in (roller), rail-to-bushing OD 2.264in, bushing OD 3.74in, outside spread 11.496in, bolt-hole diameter 1.164in, pin length 11.974in, link height 7.126in, shoe-bolt spacing A/B/C 3.15/7.48/9.843in, rail-to-pin-boss OD 2.362in, 1.125in track/master bolt thread, no wear sensor. DB matched.

Cat pages:
- https://parts.cat.com/en/catcorp/product/367-8137
- https://parts.cat.com/en/catcorp/product/368-9037
- https://parts.cat.com/en/catcorp/product/370-4617
- https://parts.cat.com/en/catcorp/product/373-6968
- https://parts.cat.com/en/catcorp/product/375-4809
- https://parts.cat.com/en/catcorp/product/376-2724
- https://parts.cat.com/en/catcorp/product/377-6969
- https://parts.cat.com/en/catcorp/product/380-5938
- https://parts.cat.com/en/catcorp/product/380-5940
- https://parts.cat.com/en/catcorp/product/380-5946

Post-update DB verification counts: 367-8137=4; 368-9037=1; 370-4617=0; 373-6968=51; 375-4809=4; 376-2724=7; 377-6969=92; 380-5938=3; 380-5940=3; 380-5946=3. No customer prices, stock claims or unsupported fitment added.

Additional Cat-linked leads from official Cat frequently-bought-together / alternate-part panels (candidates only):
- 367-8137: 7T-9754, 7T-9755, 215-4006, 212-6681.
- 373-6968: 373-6967, 6V-9746, 153-2994, 153-2995.
- 376-2724: 376-2652, 376-2468, 513-4490.
- 380-5938: 398-5246, 485-9784, 522-0077, 535-8874, 546-2429, 546-2430.
- 380-5946: 458-7813, 526-3004.
Candidates are not fitment/interchange evidence and must be individually verified before catalog promotion.

Overall reviewed progress: 52/500 batches = 520/5,000 product target (10.4%). Original Cat seed list has 267 SKUs remaining (products 521–787).

## Batch 53/500 — products 521–530 (2026-11-25)

SKUs: 384-2960, 384-4562, 385-5991, 387-9865, 388-9664, 390-2615, 392-0200, 392-0204, 392-0205, 392-0206. All ten product records were queried; Cat official product pages or Cat-hosted localized product pages were checked. The English 387-9865 route was inaccessible, so the official Cat Romanian/Turkish listings and Cat category result were used for item-level verification. All ten rows were re-queried after updates.

Verified:
- 384-2960: Cat Track Group, 5-tooth master, single grouser, 44 sections, PPR, SALT, ES shoe, 610mm width, 215.9mm pitch. Cat fitment D8T/D8R/D8R II/D8GC/D8 GC/D8 (6 labels). Specs verified: 8.5in pitch, 24.016in shoe width, 3.654in link inside spread at sprocket, 3.117in bushing ID, 44 sections, 0.875in bolt size/thread, PPR, HD, SALT, ES, single grouser, wear sensor yes, no rotating bushing.
- 384-4562: Cat steering ball-stud Bearing Assembly, includes sealed race, ball stud and strap; overall 2.8in high ×2.8in wide ×7.7in long. Cat fitment spans Off-Highway Truck D10R; truck, quarry-truck, tractor and off-highway truck classes. Added four model labels that were missing from DB (775B, 775, 777, 773) and de-duplicated. Final DB count 31 unique compatible model labels.
- 385-5991: Cat Fuel Rail Group. Cat Compatible Models explicitly lists Generator Set C7.1, Marine Engine C7.1 and Engine C7.1 MARIN. Cat states specifications are still being added; no material or dimensions inferred. DB retains two unique labels (C7.1, C7.1 MARIN) and engine model C7.1.
- 387-9865: Cat M10-1.25 ×24mm Hex Head Bolt. Official Cat localized page and Cat category listing verified the fastener page. Cat model list was replaced with the current exact 65 unique labels across MTL, compact wheel loaders, skid steers, CTLs, mini excavators, asphalt pavers and wheel loaders. Published specs: material field Not specified/Steel, coating Not specified, bolt type Banjo Bolt with Hex Head, bolt length 1in, head height 0.27in, grip length 0.43in, drive 0.55in. This corrected prior unsupported zinc-plate and carbon-steel specificity.
- 388-9664: Cat 1200mm/47in grading bucket for mini hydraulic excavators; Cat fitment 305E, 305.5E2 CR, 305D CR, 305E2 CR, 305.5D and 305.5E (6 labels). Specs: width 47.2in, capacity 9.2ft³, weight 410.5lb, base edge 0.8in, tip radius 28.2in, Pin On interface.
- 390-2615: Cat Fuel Injection Rail for Fuel Injection Pump. Cat compatible list spans Gen Set Engine C3.4B; Engine-Machine C32/C3.4B; Generator Set C3.4; Industrial Loader 415F2 IL; Pneumatic Compactor CW-14; Package 3.4B IOPU; Soil Compactor CP5/CS5; Compactor CD8/CB8/CB7/CD10; Excavator 313F GC/313F LGC/311F LRR/312F GC; Backhoe Loader 427F2/415F2; Vibratory Compactor CB-54B/CB-44B/CB46B/CD-54B/CD-44B; Telehandler TL943C/TH417C/TH407C. 26 distinct model labels. Material Carbon Steel; weight 3.63lb. DB model/engine arrays matched.
- 392-0200: Cat Fuel Injector Group; length 14.8in ×height 3.0in. Cat compatible applications include Gen Set Engine 3512B/3508B/3516B; Generator SR4B/SR4BHV; Generator Set 3508/3516B/3512B; Marine Engine 3512/3508B/3516B/3512B; Marine Auxiliary 3512B/3508B/3516B; Engine-Industrial LD700E/3516B/3561B; Industrial Engine 3508B/3512B; Petroleum Engine 3516B/3508B/3512B; Off-Highway Truck 3508B. 9 unique model labels. Cat Reman alternative listings 11R-0278 NWC and 20R-1264 Electronic Fuel Injector recorded as separate alternatives, not fitment/interchange guarantees.
- 392-0204: Cat Fuel Injector Group; 14.8in ×3.0in. Cat Compatible Models: Gen Set Engine 3512/3508B/3516/3516B and Marine Engine 3508/3516/3512 (5 unique labels). Cat Compare Alternate Parts lists 20R-1268 Remanufactured Fuel Injector; kept as an alternate listing, not a universal interchange.
- 392-0205: Cat Fuel Pump Injector; 14.8in ×3.0in. Cat Compatible Models: Generator Set 3512C; Marine Engine 3516B/3516C/3512B/3512C; Marine Auxiliary 3512C/3516C; Industrial Engine 3512C; Locomotive Engine 3512C/3508C; Petroleum Engine and Petroleum Gen Set 3512C (5 unique labels). Cat alternative listings 11R-0681 NWC and 20R-1269 Cat Reman recorded separately.
- 392-0206: Cat Injector Group; 14.8in ×3.0in. Cat fitment covers Generator SR4/SR5/SR4B/SR4BHV; Gen Set Engine 3512B/3508B/3516B; Generator Set SR5/3516B GEN/3516B/3508B/3512B; Power Module 3516B/PM3516/PM3512/PM3508; Marine Engine 3512/3508/3508B/3516B/3512B; Marine Auxiliary 3512B/3508B/3516B; Industrial Engine 3512B/3516B; Petroleum Engine 3516B/3512B; Locomotive Engine 3508B/3512B; Wheel Dozer 854G; Petroleum Gen Set 3512B; Wheel Loader 992G (15 unique labels). Cat Reman alternatives 11R-0280 NWC and 20R-1270 Cat Reman recorded separately.

Cat product pages:
- https://parts.cat.com/en/catcorp/product/384-2960
- https://parts.cat.com/en/catcorp/product/384-4562
- https://parts.cat.com/en/catcorp/product/385-5991
- https://parts.cat.com/ro/catcorp/product/387-9865 (localized Cat official page; English URL unavailable during check)
- https://parts.cat.com/en/catcorp/product/388-9664
- https://parts.cat.com/en/catcorp/product/390-2615
- https://parts.cat.com/en/catcorp/product/392-0200
- https://parts.cat.com/en/catcorp/product/392-0204
- https://parts.cat.com/en/catcorp/product/392-0205
- https://parts.cat.com/en/catcorp/product/392-0206

Post-update DB verification counts: 384-2960=6; 384-4562=31; 385-5991=2; 387-9865=65; 388-9664=6; 390-2615=26; 392-0200=9; 392-0204=5; 392-0205=5; 392-0206=15. No customer prices, current stock, or unverified interchange claims added.

Additional Cat-linked discovery candidates from official Cat comparison/frequently-bought-together and reman alternate panels (candidate leads only):
- 384-2960 alternate track groups: 384-2962, 384-2964, 384-2968, 615-3646, 625-7306, 641-9533.
- 384-4562: 283-5593, 374-3608, 7D-5435, 336-9373, 3D-2824.
- 387-9865: 388-7456, 389-5353, 387-9870, 388-7458, 388-7461.
- 388-9664: 282-2785, 5P-8500.
- 390-2615: 390-3122, 387-9141, 550-8863, 311-3901.
- 392-0200 Cat Reman alternatives: 11R-0278, 20R-1264.
- 392-0204 Cat Reman alternative: 20R-1268.
- 392-0205 Cat Reman alternatives: 11R-0681, 20R-1269.
- 392-0206 Cat Reman alternatives: 11R-0280, 20R-1270.
All remain unverified discovery candidates or alternate-condition references; they do not prove fitment/interchangeability.

Overall reviewed progress: 53/500 batches = 530/5,000 product target (10.6%). Original Cat seed list has 257 SKUs remaining (products 531–787).

## Batch 54/500 — products 531–540 (2026-11-25)

SKUs: 392-0213, 392-0214, 392-0216, 392-0217, 392-0219, 392-0220, 392-0221, 392-0222, 393-9936, 395-1044. All ten Cat item pages opened and compatible models/specifications plus Cat Reman alternative panels checked. Database records re-queried; two missing Cat Reman alternate arrays added.

Verified:
- 392-0213: Cat Fuel Pump Injector, 14.8in ×3.0in. Cat fitment: Engine 3516E; Truck 793D/793C/797/789C/797B; Locomotive Engine 3516B; Wheel Loader 994F/994H (9 unique labels). Cat Reman alternatives 11R-0284 NWC and 20R-0850 Cat Reman; DB already reflected these separately.
- 392-0214: Cat Injector Group, 14.8in ×3.0in. Cat fitment: Marine Engine 3508/3516/3512/3508B/3516B/3512B; Marine Auxiliary 3512B; Industrial Engine 3508B/3512B/3516B; Locomotive Engine 3516B/3508B/3512B (6 unique labels). Added Cat Reman alternative references 11R-0285 NWC and 20R-1275 Electronic Fuel Injector to DB.
- 392-0216: Cat Injector Group, 14.8in ×3.0in. Cat fitment: Pumper SPF343C; Generator SR5; Engine-Machine C4.4; Generator Set 3516C; Marine Engine 3516C/3512C; Engine-Industrial 3512B; Locomotive Engine 3516C; Petroleum Transmission TH48-E80; Petroleum Engine 3512C; Petroleum Package TH48-E70 (8 unique labels). Cat Reman alternatives 11R-0682 NWC and 20R-1277 Cat Reman verified; DB already contained them.
- 392-0217: Cat Injector Group, 14.8in ×3.0in. Cat fitment: Gen Set Engine 3512B/3508B/3516B; Generator SR4/SR5/SR4B/SR4BHV; Generator Set SR5/3516B/3508B/3512B; Power Module PP3516/PM3508/PM3516/PM3512; Marine Auxiliary 3512B/3508B/3516B; Industrial Engine 3512B/3516B; Petroleum Engine 3508B; Petroleum Gen Set 3512B (11 unique labels). Cat Reman alternatives 11R-0286 NWC and 20R-1278 Cat Reman verified; DB already contained them.
- 392-0219: Cat Fuel Pump Injector, 14.8in ×3.0in. Cat fitment: Generator SR4B/SR4; Generator Set 3512C; Marine Auxiliary 3512C; Industrial Engine 3512C; Petroleum Engine 3508C/3516C/3512C; Petroleum Gen Set 3512C (5 unique labels). Cat Reman alternatives 11R-0665 NWC and 20R-1280 Electronic Fuel Injector verified; DB already contained them.
- 392-0220: Cat Fuel Pump Injector, 14.8in ×3.0in. Cat fitment: Generator SR5/SR4B; Generator Set 3516C/3516C GEN/3512C; Power Module 3516C; Marine Engine 3512C/3516/3512/3508C/3508B/3516B/3516C/3512B; Marine Auxiliary 3512C/3512B/3508C (11 unique labels). Added Cat Reman alternatives 11R-0666 NWC and 20R-1281 Electronic Fuel Injector to DB.
- 392-0221: Cat Fuel Injector Group, 14.8in ×3.0in. Cat fitment: Engine-Machine 3516C; Generator SR5; Generator Set SR5/3516C/3516C GEN/3516C GEN SET/3516E/3512C; Power Module XQC1200/XQC1600; Marine Engine 3512C/3516C; Marine Auxiliary 3512C/3516C/3512B; Industrial Engine 3516C; Truck 789D; Off-Highway Truck 789/789D (11 unique labels). Cat Reman alternative 20R-0863 confirmed.
- 392-0222: Cat Injector Group, 14.8in ×3.0in. Cat fitment: Generator SR4B; Generator Set 3516C/3512C; Marine Engine 3512C/3512/3512B; Industrial Engine 3508B/3512C/3516C; Engine 3512C; Petroleum Engine 3508C/3516C/3512C; Locomotive Engine 3512C (7 unique labels). Cat Reman alternatives 11R-0667 NWC and 20R-1282 Electronic Fuel Injector verified.
- 393-9936: Cat Cylinder Head Rail Tube carries pressurized fuel from the fuel rail to injectors in the cylinder head. Cat fitment: Truck Engine CT15 and On-Highway Truck CT660. Material Carbon Steel.
- 395-1044: Cat Track Group, 1-tooth master, single grouser, 41 sections, PPR, SALT, ES shoe, 710mm width, 317.5mm pitch. Cat fitment D11T/D11 XE/D11. Specs verified: 5.748in link inside spread at sprocket, 12.5in pitch, 27.953in shoe width, 41 sections, 1.375in track bolt thread, M36 master bolt, 4.331in bushing ID, no RBT/ARM/clipping/wear sensor, HD, SALT, PPR, ES, single grouser. DB matched.

Cat pages:
- https://parts.cat.com/en/catcorp/product/392-0213
- https://parts.cat.com/en/catcorp/product/392-0214
- https://parts.cat.com/en/catcorp/product/392-0216
- https://parts.cat.com/en/catcorp/product/392-0217
- https://parts.cat.com/en/catcorp/product/392-0219
- https://parts.cat.com/en/catcorp/product/392-0220
- https://parts.cat.com/en/catcorp/product/392-0221
- https://parts.cat.com/en/catcorp/product/392-0222
- https://parts.cat.com/en/catcorp/product/393-9936
- https://parts.cat.com/en/catcorp/product/395-1044

Post-update DB verification counts: 392-0213=9; 392-0214=6; 392-0216=8; 392-0217=11; 392-0219=5; 392-0220=11; 392-0221=11; 392-0222=7; 393-9936=2; 395-1044=3. No customer prices, stock claims, or unsupported interchange assertions added.

Additional Cat-linked discovery candidates from Cat Reman alternate, frequently-bought-together and alternate-track panels (not fitment proof):
- 392-0213: 275-2604, 245-4907, 132-6469, 245-4908, 3J-1907.
- 392-0214: 248-5513, 3S-9643, 214-7568, 6J-2680, 1H-9696; Cat Reman 11R-0285, 20R-1275.
- 392-0220: 1R-0726, 1R-0756, 3S-9643, 7N-4927, 4W-3027; Cat Reman 11R-0666, 20R-1281.
- 392-0221: 5H-6734, 214-7566, 468-8825, 197-7055, 3S-9643; Cat Reman 20R-0863.
- 392-0222: 248-5513, 219-3240, 154-6389, 468-8824, 316-5980; Cat Reman 11R-0667, 20R-1282.
- 395-1044: alternate track groups 395-1050, 526-3867, 526-3868, 570-3234; frequently bought together 184-6306, 184-6305, 602-0406, 602-0405, 187-3298.
Each candidate requires its own item-page check; Cat Reman is kept separate by condition and is not assumed to be an interchangeable new part.

Overall reviewed progress: 54/500 batches = 540/5,000 product target (10.8%). Original Cat seed list has 247 SKUs remaining (products 541–787).

## Batch 55/500 — products 541–550 (2026-11-25)

SKUs: 396-4129, 397-4971, 397-5051, 398-3011, 399-8470, 3B-8489, 3N-0759, 3S-2093, 3T-2160, 3T-3434. Nine Cat product pages yielded readable item details; 399-8470 could not be opened in the public Cat storefront during this run, so its existing record was left untouched. All ten DB rows were re-queried after updates.

Verified:
- 396-4129: Cat 29-liter compressed nitrogen gas accumulator for storing hydraulic-system pressure and supporting temporary high-pressure demand; Cat also notes possible brake/suspension use. Specs: length 75.8in, height 7.0in, Carbon Steel. Cat fitment Truck and Off-Highway Truck models: 793D, 793F, 794 AC, MT4400D AC, 793F AC, 793F CMD, 789D, 793F OEM, 793F XQ, 789G, 793, 789, 798, 796 AC and 798 AC (15 distinct labels after de-duplication). Added the missing 798 AC. Cat Compare Alternate Parts shows 20R-8270 Cat Reman Accumulator; DB already records it separately. Cat explicitly warns to relieve accumulator pressure with dealer-approved procedure before service.
- 397-4971: Cat Exhaust Manifold. Cat Compatible Models: Generator Set 3516C; Marine Auxiliary 3512C/3516C; Marine Engine 3516C/3512C; Petroleum Engine 3516C (2 unique model labels). Cat says specifications are still being added; no dimensions/material inferred.
- 397-5051: Cat General Duty Throttle Control Rod. Cat page explicitly marks it discontinued and says it is no longer available; DB remains inactive. Cat compatible list includes generator-set, generator, engine-machine, marine, industrial, petroleum, gas-engine and petroleum-package applications. The 31 distinct compatible labels and 28 engine-model labels were checked; material Alloy Zinc and Carbon Steel. No orderable stock or replacement equivalence claimed.
- 398-3011: Cat open-vented Diesel Exhaust Fluid tank filler cap with hydrophobic membrane. Specs: 100-micron, blue Acetal Plastic, 2.9in OD ×2.5in height. 280 distinct Cat compatible labels span generators, scrapers, asphalt compactors, skidders, drills, forestry, excavators, MTL/CTL, wheel tractors, soil compactors, petroleum engines, wheel loaders, telehandlers, articulated trucks, graders, MHPUs, pipelayers and other applications. DB matches published attributes and fitment.
- 399-8470: Cat item page not accessible in this run. DB has no compatible-model or specification claims; record left unchanged pending source verification.
- 3B-8489: Cat 1/8-27 PTF Hex Head Special Grease Fitting Adapter. Grease fitting used for feeding lubricant into bearings/mating parts. Specs: 0.7in length, 0.4in height, material description Plated Steel; Cat material field Alloy Mixed Metal/Alloy Steel/Carbon Steel/Alloy Zinc. 436 distinct Cat compatible labels across toolcarriers, harvesters, military gensets, grapple-shovels, mini excavators, drills, feller bunchers, excavators, MHPUs, generators, trucks, compactors and wheel loaders. DB matches.
- 3N-0759: Cat 185mm ID Toric Sealing Ring, 184.95mm ID, 12.7mm (0.5in) cross section. Material VMQ silicone rubber. Cat's material guidance explicitly says suitable for air and engine oil but not diesel fuel, coolant/urea, hydraulic oil, ATF or biodiesel; this warning remains in DB. 103 distinct Cat compatible labels across generators, hydraulic controls, compactors, trucks, dozers, loaders, tractors, skidders, pipelayers, forestry and related machines.
- 3S-2093: Cat 202mm cable strap, Nylon 6/6/12 plastic. 521 distinct compatible labels across toolcarriers, machine control, harvesters, power packs, military gensets, utility vehicles, mini excavators, drills, feller bunchers, harvester heads, excavators, MHPUs, generators, trucks and compactors. DB material/length and fitment retained.
- 3T-2160: Cat Board. Cat compatible applications: Generator Set Engine 3406/3408B/3408C/3406B/3408; Engine-Machine 3408; Generator SR4; Marine Engine 3408/3406/3408B/3406B; Engine-Industrial 3406B; Industrial Engine 3412/3406/3406C/3408B; Gas Engine G3406; Cold Planer PR-1000C/PR-1000. 11 distinct labels. Material Glass Ceramic and Alloy Copper. DB matches.
- 3T-3434: Cat 12.7mm (0.50in) OD spherical plug for drive-housing assemblies of electric motor groups. Cat fitment list contains 278 distinct labels across generators, truck engines, skidders, drills, feller bunchers, excavators, wheel tractors, mixers, track loaders, petroleum/industrial/gas engines, compactors, wheel dozers/loaders, articulated and underground trucks, power modules, LHDs, graders, shovels, tractors and other classes. DB retains 0.5in OD and matching model list.

Cat pages:
- https://parts.cat.com/en/catcorp/product/396-4129
- https://parts.cat.com/en/catcorp/product/397-4971
- https://parts.cat.com/en/catcorp/product/397-5051
- https://parts.cat.com/en/catcorp/product/398-3011
- https://parts.cat.com/en/catcorp/product/399-8470 (inaccessible during this check)
- https://parts.cat.com/en/catcorp/product/3B-8489
- https://parts.cat.com/en/catcorp/product/3N-0759
- https://parts.cat.com/en/catcorp/product/3S-2093
- https://parts.cat.com/en/catcorp/product/3T-2160
- https://parts.cat.com/en/catcorp/product/3T-3434

Post-update DB verification counts: 396-4129=15; 397-4971=2; 397-5051=31 (inactive); 398-3011=280; 399-8470=0 (not independently verified); 3B-8489=436; 3N-0759=103; 3S-2093=521; 3T-2160=11; 3T-3434=278. No unsupported price, availability, or interchange claims added.

Additional Cat-linked discovery leads from official Cat frequently-bought-together panels (candidate leads only):
- 398-3011: 387-5467, 451-2774, 391-5262, 378-3187, 418-2073.
- 3B-8489: 3J-1907, 3K-0360, 6V-8398, 6V-8397, 3D-2824.
- 3N-0759: 6F-6673, 8D-4771, 3K-0360, 2R-0098, 3J-1907.
- 3S-2093: 3J-1907, 214-7568, 3K-0360, 6V-8397, 3D-2824.
- 3T-3434: 9Y-6089, 8C-3089, 3J-1907, 3K-0360, 214-7568.
All are discovery leads only and require item-level verification before catalog promotion.

Overall reviewed progress: 55/500 batches = 550/5,000 product target (11.0%). Original Cat seed list has 237 SKUs remaining (products 551–787).
