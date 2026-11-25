# CAT hydraulic, transmission and lubrication filter parts — batch AE

Date: 2026-11-25

## Checkpoint AE — 50 distinct CAT part numbers

The following 50 distinct part numbers were checked against official Cat Parts Store product/category pages and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [2P-4303](https://parts.cat.com/en/catcorp/product/2P-4303)
2. [392-5357](https://parts.cat.com/en/catcorp/product/392-5357)
3. [273-7072](https://parts.cat.com/en/catcorp/product/273-7072)
4. [242-8660](https://parts.cat.com/en/catcorp/product/242-8660)
5. [343-6210](https://parts.cat.com/en/catcorp/product/343-6210)
6. [210-6712](https://parts.cat.com/en/catcorp/product/210-6712)
7. [485-4600](https://parts.cat.com/en/catcorp/product/485-4600)
8. [477-4343](https://parts.cat.com/en/catcorp/product/477-4343)
9. [6E-5927](https://parts.cat.com/en/catcorp/product/6E-5927)
10. [231-9483](https://parts.cat.com/en/catcorp/product/231-9483)
11. [7G-0749](https://parts.cat.com/en/catcorp/product/7G-0749)
12. [147-5044](https://parts.cat.com/en/catcorp/product/147-5044)
13. [361-7480](https://parts.cat.com/en/catcorp/product/361-7480)
14. [8U-0723](https://parts.cat.com/en/catcorp/product/8U-0723)
15. [126-1817](https://parts.cat.com/en/catcorp/product/126-1817)
16. [304-7196](https://parts.cat.com/en/catcorp/product/304-7196)
17. [304-7195](https://parts.cat.com/en/catcorp/product/304-7195)
18. [481-6649](https://parts.cat.com/en/catcorp/product/481-6649)
19. [158-3491](https://parts.cat.com/en/catcorp/product/158-3491)
20. [360-0875](https://parts.cat.com/en/catcorp/product/360-0875)
21. [428-8648](https://parts.cat.com/en/catcorp/product/428-8648)
22. [4I-3948](https://parts.cat.com/en/catcorp/product/4I-3948)
23. [585-5910](https://parts.cat.com/en/catcorp/product/585-5910)
24. [211-1026](https://parts.cat.com/en/catcorp/product/211-1026)
25. [9U-6983](https://parts.cat.com/en/catcorp/product/9U-6983)
26. [077-5479](https://parts.cat.com/en/catcorp/product/077-5479)
27. [139-1539](https://parts.cat.com/en/catcorp/product/139-1539)
28. [9T-7656](https://parts.cat.com/en/catcorp/product/9T-7656)
29. [223-7810](https://parts.cat.com/en/catcorp/product/223-7810)
30. [225-4118](https://parts.cat.com/en/catcorp/product/225-4118)
31. [126-2081](https://parts.cat.com/en/catcorp/product/126-2081)
32. [342-1823](https://parts.cat.com/en/catcorp/product/342-1823)
33. [606-9947](https://parts.cat.com/en/catcorp/product/606-9947)
34. [209-6906](https://parts.cat.com/en/catcorp/product/209-6906)
35. [571-5253](https://parts.cat.com/en/catcorp/product/571-5253)
36. [624-1845](https://parts.cat.com/en/catcorp/product/624-1845)
37. [394-8678](https://parts.cat.com/en/catcorp/product/394-8678)
38. [286-1867](https://parts.cat.com/en/catcorp/product/286-1867)
39. [7W-9028](https://parts.cat.com/en/catcorp/product/7W-9028)
40. [300-1622](https://parts.cat.com/en/catcorp/product/300-1622)
41. [6N-7163](https://parts.cat.com/en/catcorp/product/6N-7163)
42. [189-0981](https://parts.cat.com/en/catcorp/product/189-0981)
43. [397-1179](https://parts.cat.com/en/catcorp/product/397-1179)
44. [211-2048](https://parts.cat.com/en/catcorp/product/211-2048)
45. [442-0101](https://parts.cat.com/en/catcorp/product/442-0101)
46. [667-3709](https://parts.cat.com/en/catcorp/product/667-3709)
47. [259-8357](https://parts.cat.com/en/catcorp/product/259-8357)
48. [121-5732](https://parts.cat.com/en/catcorp/product/121-5732)
49. [155-1690](https://parts.cat.com/en/catcorp/product/155-1690)
50. [646-6818](https://parts.cat.com/en/catcorp/product/646-6818)

## Coverage

- Hydraulic and transmission oil filters, UHE elements and filter assemblies
- Hydraulic tank and rear brake cooling filters
- Power steering reservoir filter
- Engine oil filter bases, heads, adapters and covers
- Transmission oil filter bases and filter elements
- Fuel tank washdown and secondary fuel filtration

## Marine application corrections

- `7W-9028` is marked `BOTH` because CAT explicitly lists MARINE ENGINE 3116, 3126B, C7 and 3126.
- Existing CAT records `104-7995` and `532-8902` were also corrected to `BOTH` after CAT's official fitment lists explicitly identified MARINE ENGINE models. The missing product-facing row for `104-7995` was added.
- Other records remain `UNVERIFIED` until full fitment is captured. Generic engine/generator references are not treated as marine.
- No retail prices or inventory quantities were invented. New records use null prices and stock 0; upserts preserve existing commercial values.
