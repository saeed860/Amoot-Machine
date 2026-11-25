# CAT filter valves, fuel bases and lubrication parts — batch AH

Date: 2026-11-25

## Checkpoint AH — 50 distinct CAT part numbers

The following 50 CAT part numbers were checked against official Cat Parts Store product/category pages and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [209-6632](https://parts.cat.com/en/catcorp/product/209-6632)
2. [9P-1508](https://parts.cat.com/en/catcorp/product/9P-1508)
3. [6N-6251](https://parts.cat.com/en/catcorp/product/6N-6251)
4. [2S-4015](https://parts.cat.com/en/catcorp/product/2S-4015)
5. [7C-1126](https://parts.cat.com/en/catcorp/product/7C-1126)
6. [284-7495](https://parts.cat.com/en/catcorp/product/284-7495)
7. [420-1796](https://parts.cat.com/en/catcorp/product/420-1796)
8. [471-8150](https://parts.cat.com/en/catcorp/product/471-8150)
9. [224-3405](https://parts.cat.com/en/catcorp/product/224-3405)
10. [610-5313](https://parts.cat.com/en/catcorp/product/610-5313)
11. [2W-9210](https://parts.cat.com/en/catcorp/product/2W-9210)
12. [533-7243](https://parts.cat.com/en/catcorp/product/533-7243)
13. [6L-4888](https://parts.cat.com/en/catcorp/product/6L-4888)
14. [6N-6252](https://parts.cat.com/en/catcorp/product/6N-6252)
15. [237-9310](https://parts.cat.com/en/catcorp/product/237-9310)
16. [238-6770](https://parts.cat.com/en/catcorp/product/238-6770)
17. [9S-4182](https://parts.cat.com/en/catcorp/product/9S-4182)
18. [105-2508](https://parts.cat.com/en/catcorp/product/105-2508)
19. [521-5873](https://parts.cat.com/en/catcorp/product/521-5873)
20. [435-6493](https://parts.cat.com/en/catcorp/product/435-6493)
21. [561-6538](https://parts.cat.com/en/catcorp/product/561-6538)
22. [562-0276](https://parts.cat.com/en/catcorp/product/562-0276)
23. [112-6521](https://parts.cat.com/en/catcorp/product/112-6521)
24. [162-7838](https://parts.cat.com/en/catcorp/product/162-7838)
25. [4W-5158](https://parts.cat.com/en/catcorp/product/4W-5158)
26. [141-5138](https://parts.cat.com/en/catcorp/product/141-5138)
27. [238-6780](https://parts.cat.com/en/catcorp/product/238-6780)
28. [437-8239](https://parts.cat.com/en/catcorp/product/437-8239)
29. [397-9988](https://parts.cat.com/en/catcorp/product/397-9988)
30. [628-6306](https://parts.cat.com/en/catcorp/product/628-6306)
31. [077-8813](https://parts.cat.com/en/catcorp/product/077-8813)
32. [180-6114](https://parts.cat.com/en/catcorp/product/180-6114)
33. [531-0813](https://parts.cat.com/en/catcorp/product/531-0813)
34. [530-7574](https://parts.cat.com/en/catcorp/product/530-7574)
35. [530-9508](https://parts.cat.com/en/catcorp/product/530-9508)
36. [562-0328](https://parts.cat.com/en/catcorp/product/562-0328)
37. [561-6539](https://parts.cat.com/en/catcorp/product/561-6539)
38. [396-1253](https://parts.cat.com/en/catcorp/product/396-1253)
39. [505-9440](https://parts.cat.com/en/catcorp/product/505-9440)
40. [395-1815](https://parts.cat.com/en/catcorp/product/395-1815)
41. [533-4163](https://parts.cat.com/en/catcorp/product/533-4163)
42. [115-8384](https://parts.cat.com/en/catcorp/product/115-8384)
43. [568-8293](https://parts.cat.com/en/catcorp/product/568-8293)
44. [138-6144](https://parts.cat.com/en/catcorp/product/138-6144)
45. [116-9924](https://parts.cat.com/en/catcorp/product/116-9924)
46. [610-0035](https://parts.cat.com/en/catcorp/product/610-0035)
47. [249-2340](https://parts.cat.com/en/catcorp/product/249-2340)
48. [525-7105](https://parts.cat.com/en/catcorp/product/525-7105)
49. [125-5835](https://parts.cat.com/en/catcorp/product/125-5835)
50. [465-6860](https://parts.cat.com/en/catcorp/product/465-6860)

## Coverage

- Fuel filter check, control, shutoff and bypass valves
- Hydraulic oil filter bypass valves and spools
- Fuel filter base supports, brackets and plugs
- Fuel priming and filter-related components
- Engine oil filter and lubrication elements
- Oil filler caps, tubes and flanges

## Marine application corrections

- `7C-1126` — MARINE ENGINE C280-16/C280-12/C280-6/C280-8/3616/3612 and MARINE AUXILIARY 3608
- `284-7495` — MARINE ENGINE C32B/C32 MARINE/C32/C9.3 and MARINE AUXILIARY C32B/C32
- `6N-6252` — MARINE ENGINE C18/C12/C15/C30/C32/3412/3408B/3406B/3408C/3406C/3406E/C18 MARINE/C9 and related models
- Existing `6N-6248` was corrected to `BOTH` based on its official MARINE ENGINE and MARINE AUXILIARY model lists.
- All marine fitments require exact serial and arrangement confirmation. Generic engine/generator fitment is not assumed marine.

## Data integrity

- Valves, plugs, priming pumps, filler caps and brackets are stored as filtration-system components, not as filter cartridges.
- No retail prices or stock quantities were invented. New records use null prices and stock 0; existing values are preserved.
