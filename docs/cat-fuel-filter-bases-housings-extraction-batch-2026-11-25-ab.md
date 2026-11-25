# CAT fuel filters, bases, separators and housings — batch AB

Date: 2026-11-25

## Checkpoint AB — 50 distinct CAT part numbers

The following 50 distinct CAT part numbers were checked against Cat Parts Store product pages or official category listings and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [396-4596](https://parts.cat.com/en/catcorp/product/396-4596)
2. [611-2913](https://parts.cat.com/en/catcorp/product/611-2913)
3. [416-5211](https://parts.cat.com/en/catcorp/product/416-5211)
4. [445-4930](https://parts.cat.com/en/catcorp/product/445-4930)
5. [173-3511](https://parts.cat.com/en/catcorp/product/173-3511)
6. [421-5473](https://parts.cat.com/en/catcorp/product/421-5473)
7. [126-2075](https://parts.cat.com/en/catcorp/product/126-2075)
8. [509-5694](https://parts.cat.com/en/catcorp/product/509-5694)
9. [570-1623](https://parts.cat.com/en/catcorp/product/570-1623)
10. [525-6205](https://parts.cat.com/en/catcorp/product/525-6205)
11. [189-9187](https://parts.cat.com/en/catcorp/product/189-9187)
12. [427-0236](https://parts.cat.com/en/catcorp/product/427-0236)
13. [372-7360](https://parts.cat.com/en/catcorp/product/372-7360)
14. [318-8064](https://parts.cat.com/en/catcorp/product/318-8064)
15. [361-9555](https://parts.cat.com/en/catcorp/product/361-9555)
16. [237-9308](https://parts.cat.com/en/catcorp/product/237-9308)
17. [237-9309](https://parts.cat.com/en/catcorp/product/237-9309)
18. [629-5782](https://parts.cat.com/en/catcorp/product/629-5782)
19. [1W-3892](https://parts.cat.com/en/catcorp/product/1W-3892)
20. [149-2683](https://parts.cat.com/en/catcorp/product/149-2683)
21. [119-2978](https://parts.cat.com/en/catcorp/product/119-2978)
22. [483-1004](https://parts.cat.com/en/catcorp/product/483-1004)
23. [6I-4802](https://parts.cat.com/en/catcorp/product/6I-4802)
24. [149-2684](https://parts.cat.com/en/catcorp/product/149-2684)
25. [149-3516](https://parts.cat.com/en/catcorp/product/149-3516)
26. [236-5483](https://parts.cat.com/en/catcorp/product/236-5483)
27. [321-1326](https://parts.cat.com/en/catcorp/product/321-1326)
28. [344-9562](https://parts.cat.com/en/catcorp/product/344-9562)
29. [436-7074](https://parts.cat.com/en/catcorp/product/436-7074)
30. [521-6162](https://parts.cat.com/en/catcorp/product/521-6162)
31. [6N-6259](https://parts.cat.com/en/catcorp/product/6N-6259)
32. [658-6149](https://parts.cat.com/en/catcorp/product/658-6149)
33. [573-8559](https://parts.cat.com/en/catcorp/product/573-8559)
34. [479-4135](https://parts.cat.com/en/catcorp/product/479-4135)
35. [479-4137](https://parts.cat.com/en/catcorp/product/479-4137)
36. [523-4986](https://parts.cat.com/en/catcorp/product/523-4986)
37. [575-8439](https://parts.cat.com/en/catcorp/product/575-8439)
38. [589-3864](https://parts.cat.com/en/catcorp/product/589-3864)
39. [520-3012](https://parts.cat.com/en/catcorp/product/520-3012)
40. [421-5482](https://parts.cat.com/en/catcorp/product/421-5482)
41. [136-7032](https://parts.cat.com/en/catcorp/product/136-7032)
42. [523-4988](https://parts.cat.com/en/catcorp/product/523-4988)
43. [523-6601](https://parts.cat.com/en/catcorp/product/523-6601)
44. [354-8810](https://parts.cat.com/en/catcorp/product/354-8810)
45. [536-7859](https://parts.cat.com/en/catcorp/product/536-7859)
46. [434-5089](https://parts.cat.com/en/catcorp/product/434-5089)
47. [188-7027](https://parts.cat.com/en/catcorp/product/188-7027)
48. [333-9308](https://parts.cat.com/en/catcorp/product/333-9308)
49. [468-0971](https://parts.cat.com/en/catcorp/product/468-0971)
50. [541-8202](https://parts.cat.com/en/catcorp/product/541-8202)

## Coverage

- Engine lubrication and hydraulic/transmission filters
- Fuel filter elements and fuel/water separators
- Fuel filter bases, dual bases, housings and separator bowls
- Hydraulic filter housings and related filter components

## Marine and verification rules

- `6N-6259` is marked `BOTH` because Cat explicitly lists `MARINE ENGINE` compatible models including C18, C12, C15, C30, 3412, 3408B, 3406B, 3408C, 3406C and C9.
- Other products remain `UNVERIFIED` until model fitment is fully captured or are subject to serial/arrangement verification. A generic engine/generator fitment is not treated as marine.
- `521-6162` is marked discontinued by Cat; do not quote it as an available new part without dealer confirmation.
- Components such as bases, housings, bowls and priming pumps are recorded as system components, not falsely categorized as filter cartridges.
- No price or stock quantity was invented. New rows have null prices and stock 0; upserts preserve any existing commercial values.
