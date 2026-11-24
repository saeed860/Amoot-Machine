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

Database checkpoint: all 10 rows checked; 8 were enriched with verified public Cat details and 2 discontinued records (0R-7895, 0R-7904) deactivated. Five exact official product images linked (0R-7892, 0R-8210, 0R-8385, 0R-8787, 0R-9043, 0R-9200 = 6 image links); 0R-8200 image thumbnail was too small/ambiguous and 0R-8502 returned fallback only, so neither was assigned an image. 0R-7904 English page was inaccessible, but Cat's official Italian page confirmed retired status, recommended C32 and compatibility list. All Cat Reman core and warranty terms remain dealer-confirmation items. Model data remains catalog reference, not serial-number-confirmed fitment.


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
