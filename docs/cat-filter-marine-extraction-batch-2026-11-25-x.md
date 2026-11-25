# CAT filter, separator and marine-system extraction — 2026-11-25 (X)

## Checkpoint

This checkpoint includes 51 newly inserted catalog rows across the X1/X2/X3 sub-batches (the 50-row checkpoint was reached; one additional oil-tube row was committed immediately after the boundary). Every row was sourced from an official Cat Parts Store product page and upserted into `public.part_catalog` and `public.products`.

## Extracted part numbers

1. [6E-6407](https://parts.cat.com/en/catcorp/product/6E-6407)
2. [280-3444](https://parts.cat.com/en/catcorp/product/280-3444)
3. [611-0847](https://parts.cat.com/en/catcorp/product/611-0847)
4. [266-7792](https://parts.cat.com/en/catcorp/product/266-7792)
5. [465-6860](https://parts.cat.com/en/catcorp/product/465-6860)
6. [196-7614](https://parts.cat.com/en/catcorp/product/196-7614)
7. [441-4348](https://parts.cat.com/en/catcorp/product/441-4348)
8. [138-6144](https://parts.cat.com/en/catcorp/product/138-6144)
9. [327-5548](https://parts.cat.com/en/catcorp/product/327-5548)
10. [108-1095](https://parts.cat.com/en/catcorp/product/108-1095)
11. [337-4102](https://parts.cat.com/en/catcorp/product/337-4102)
12. [129-0372](https://parts.cat.com/en/catcorp/product/129-0372)
13. [249-2340](https://parts.cat.com/en/catcorp/product/249-2340)
14. [116-9924](https://parts.cat.com/en/catcorp/product/116-9924)
15. [192-0717](https://parts.cat.com/en/catcorp/product/192-0717)
16. [272-4864](https://parts.cat.com/en/catcorp/product/272-4864)
17. [157-5240](https://parts.cat.com/en/catcorp/product/157-5240)
18. [432-4248](https://parts.cat.com/en/catcorp/product/432-4248)
19. [316-9954](https://parts.cat.com/en/catcorp/product/316-9954)
20. [185-3159](https://parts.cat.com/en/catcorp/product/185-3159)
21. [205-3043](https://parts.cat.com/en/catcorp/product/205-3043)
22. [113-1578](https://parts.cat.com/en/catcorp/product/113-1578)
23. [133-5673](https://parts.cat.com/en/catcorp/product/133-5673)
24. [129-0375](https://parts.cat.com/en/catcorp/product/129-0375)
25. [326-1644](https://parts.cat.com/en/catcorp/product/326-1644)
26. [128-1113](https://parts.cat.com/en/catcorp/product/128-1113)
27. [196-7648](https://parts.cat.com/en/catcorp/product/196-7648)
28. [193-5136](https://parts.cat.com/en/catcorp/product/193-5136)
29. [136-7353](https://parts.cat.com/en/catcorp/product/136-7353)
30. [7W-5040](https://parts.cat.com/en/catcorp/product/7W-5040)
31. [118-2849](https://parts.cat.com/en/catcorp/product/118-2849)
32. [196-8518](https://parts.cat.com/en/catcorp/product/196-8518)
33. [559-6059](https://parts.cat.com/en/catcorp/product/559-6059)
34. [389-0433](https://parts.cat.com/en/catcorp/product/389-0433)
35. [377-1129](https://parts.cat.com/en/catcorp/product/377-1129)
36. [452-1777](https://parts.cat.com/en/catcorp/product/452-1777)
37. [448-0563](https://parts.cat.com/en/catcorp/product/448-0563)
38. [180-8468](https://parts.cat.com/en/catcorp/product/180-8468)
39. [389-0434](https://parts.cat.com/en/catcorp/product/389-0434)
40. [7W-2275](https://parts.cat.com/en/catcorp/product/7W-2275)
41. [458-0125](https://parts.cat.com/en/catcorp/product/458-0125)
42. [1R-0713](https://parts.cat.com/en/catcorp/product/1R-0713)
43. [1R-0714](https://parts.cat.com/en/catcorp/product/1R-0714)
44. [507-4243](https://parts.cat.com/en/catcorp/product/507-4243)
45. [2W-4273](https://parts.cat.com/en/catcorp/product/2W-4273)
46. [370-2176](https://parts.cat.com/en/catcorp/product/370-2176)
47. [192-2157](https://parts.cat.com/en/catcorp/product/192-2157)
48. [432-4249](https://parts.cat.com/en/catcorp/product/432-4249)
49. [441-4342](https://parts.cat.com/en/catcorp/product/441-4342)
50. [192-2158](https://parts.cat.com/en/catcorp/product/192-2158)
51. [179-2503](https://parts.cat.com/en/catcorp/product/179-2503)

## Notable marine records

- Fuel and water separation: 129-0372, 432-4248, 316-9954 (discontinued), 185-3159, 377-1129, 370-2176, 432-4249, 441-4342.
- Fuel filtration: 559-6059, 389-0433.
- Engine oil filtration: 465-6860, 441-4348, 138-6144, 249-2340, 116-9924, 1R-0713, 1R-0714, 389-0434.
- Air filtration: 452-1777, 448-0563, 7W-2275, 458-0125, 196-7648, 193-5136, 136-7353, 7W-5040, 118-2849, 196-8518, 113-1578, 128-1113.
- Oil system tubes: 192-2157, 192-2158, 179-2503. These are tubes, not filter elements; they are cataloged separately as oil-system components.

## Data quality / controls

- Marine and BOTH labels are assigned only where the official CAT page explicitly lists MARINE ENGINE, MARINE AUXILIARY or MARINE POWERTRAIN. Generic ENGINE / GENERATOR labels alone were not treated as marine.
- Records with no captured fitment are marked `REFERENCE` / `UNVERIFIED`; they are not represented as order-confirmed.
- The discontinued part 316-9954 is clearly marked discontinued; replacement part must be confirmed before offering it for sale.
- The ambiguous part 180-8468 is retained as a reference record because the page did not identify its filter subtype.
- No price or stock was invented. New products use `price_usd=NULL`, `price_irr=NULL`, `stock=0`; upserts preserve previously stored values.
- Model fitment still requires serial-number and arrangement validation before ordering.
