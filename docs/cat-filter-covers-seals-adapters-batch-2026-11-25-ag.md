# CAT filter covers, seals, adapters and housings — batch AG

Date: 2026-11-25

## Checkpoint AG — 50 distinct CAT part numbers

The following 50 part numbers were checked against official Cat Parts Store product/category listings and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [9Y-6859](https://parts.cat.com/en/catcorp/product/9Y-6859)
2. [8J-5994](https://parts.cat.com/en/catcorp/product/8J-5994)
3. [325-9697](https://parts.cat.com/en/catcorp/product/325-9697)
4. [169-8676](https://parts.cat.com/en/catcorp/product/169-8676)
5. [161-4515](https://parts.cat.com/en/catcorp/product/161-4515)
6. [8H-1459](https://parts.cat.com/en/catcorp/product/8H-1459)
7. [193-0930](https://parts.cat.com/en/catcorp/product/193-0930)
8. [9T-4872](https://parts.cat.com/en/catcorp/product/9T-4872)
9. [7C-4422](https://parts.cat.com/en/catcorp/product/7C-4422)
10. [436-1763](https://parts.cat.com/en/catcorp/product/436-1763)
11. [194-7986](https://parts.cat.com/en/catcorp/product/194-7986)
12. [532-3904](https://parts.cat.com/en/catcorp/product/532-3904)
13. [592-0612](https://parts.cat.com/en/catcorp/product/592-0612)
14. [185-2793](https://parts.cat.com/en/catcorp/product/185-2793)
15. [186-3705](https://parts.cat.com/en/catcorp/product/186-3705)
16. [287-7261](https://parts.cat.com/en/catcorp/product/287-7261)
17. [257-9878](https://parts.cat.com/en/catcorp/product/257-9878)
18. [7C-3432](https://parts.cat.com/en/catcorp/product/7C-3432)
19. [625-4246](https://parts.cat.com/en/catcorp/product/625-4246)
20. [357-4600](https://parts.cat.com/en/catcorp/product/357-4600)
21. [3G-2665](https://parts.cat.com/en/catcorp/product/3G-2665)
22. [225-7944](https://parts.cat.com/en/catcorp/product/225-7944)
23. [8T-7876](https://parts.cat.com/en/catcorp/product/8T-7876)
24. [199-9267](https://parts.cat.com/en/catcorp/product/199-9267)
25. [6V-3908](https://parts.cat.com/en/catcorp/product/6V-3908)
26. [660-0357](https://parts.cat.com/en/catcorp/product/660-0357)
27. [637-6213](https://parts.cat.com/en/catcorp/product/637-6213)
28. [7C-2891](https://parts.cat.com/en/catcorp/product/7C-2891)
29. [292-8185](https://parts.cat.com/en/catcorp/product/292-8185)
30. [7C-7488](https://parts.cat.com/en/catcorp/product/7C-7488)
31. [611-6227](https://parts.cat.com/en/catcorp/product/611-6227)
32. [293-2875](https://parts.cat.com/en/catcorp/product/293-2875)
33. [549-2188](https://parts.cat.com/en/catcorp/product/549-2188)
34. [516-6017](https://parts.cat.com/en/catcorp/product/516-6017)
35. [395-1774](https://parts.cat.com/en/catcorp/product/395-1774)
36. [380-9411](https://parts.cat.com/en/catcorp/product/380-9411)
37. [155-5160](https://parts.cat.com/en/catcorp/product/155-5160)
38. [4N-2211](https://parts.cat.com/en/catcorp/product/4N-2211)
39. [609-0730](https://parts.cat.com/en/catcorp/product/609-0730)
40. [186-4192](https://parts.cat.com/en/catcorp/product/186-4192)
41. [522-2847](https://parts.cat.com/en/catcorp/product/522-2847)
42. [522-2840](https://parts.cat.com/en/catcorp/product/522-2840)
43. [376-2681](https://parts.cat.com/en/catcorp/product/376-2681)
44. [622-3215](https://parts.cat.com/en/catcorp/product/622-3215)
45. [118-9145](https://parts.cat.com/en/catcorp/product/118-9145)
46. [387-9873](https://parts.cat.com/en/catcorp/product/387-9873)
47. [440-6508](https://parts.cat.com/en/catcorp/product/440-6508)
48. [072-9601](https://parts.cat.com/en/catcorp/product/072-9601)
49. [297-7920](https://parts.cat.com/en/catcorp/product/297-7920)
50. [9X-2329](https://parts.cat.com/en/catcorp/product/9X-2329)

## Coverage

- Engine oil and transmission filter covers
- Hydraulic filter covers and housings
- Filter-head gaskets, O-rings and seal kits
- Oil filter adapters, elbows, tees, reducers and connectors
- Retainers, studs and other filter mounting hardware

## Marine application corrections

- `8H-1459` — MARINE ENGINE D333A/D333B/D330A/D330B/D342C/D342
- `292-8185` — MARINE ENGINE C18
- `293-2875` — MARINE ENGINE C32 MARINE/C32/C9.3
- Existing `6N-7422` was corrected to `BOTH` after CAT's official compatible-model list explicitly identified MARINE ENGINE C18, 3412C, C12, 3412E, 3412D, C30, C32 and C9; its product-facing row was added.
- These remain subject to exact serial and arrangement confirmation. Other rows are not assumed marine from generic engine/generator fitment.

## Data handling

- Covers, adapters, seals, gaskets and O-rings are categorized as filter-system components, not filter cartridges.
- No prices or stock were invented. New rows use null prices and stock 0; existing commercial values are preserved.
