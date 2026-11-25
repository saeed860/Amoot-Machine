# CAT cabin and engine air filtration — batch AJ

Date: 2026-11-25

## Checkpoint AJ — 50 distinct CAT part numbers

The following 50 CAT part numbers were checked against official Cat Parts Store product/category pages and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [2G-0403](https://parts.cat.com/en/catcorp/product/2G-0403)
2. [7T-1890](https://parts.cat.com/en/catcorp/product/7T-1890)
3. [175-2832](https://parts.cat.com/en/catcorp/product/175-2832)
4. [175-2839](https://parts.cat.com/en/catcorp/product/175-2839)
5. [119-3355](https://parts.cat.com/en/catcorp/product/119-3355)
6. [233-8359](https://parts.cat.com/en/catcorp/product/233-8359)
7. [268-6704](https://parts.cat.com/en/catcorp/product/268-6704)
8. [111-8738](https://parts.cat.com/en/catcorp/product/111-8738)
9. [268-6705](https://parts.cat.com/en/catcorp/product/268-6705)
10. [245-7823](https://parts.cat.com/en/catcorp/product/245-7823)
11. [175-2835](https://parts.cat.com/en/catcorp/product/175-2835)
12. [175-2833](https://parts.cat.com/en/catcorp/product/175-2833)
13. [319-7944](https://parts.cat.com/en/catcorp/product/319-7944)
14. [307-4442](https://parts.cat.com/en/catcorp/product/307-4442)
15. [318-7190](https://parts.cat.com/en/catcorp/product/318-7190)
16. [472-1149](https://parts.cat.com/en/catcorp/product/472-1149)
17. [122-5873](https://parts.cat.com/en/catcorp/product/122-5873)
18. [308-0857](https://parts.cat.com/en/catcorp/product/308-0857)
19. [389-3067](https://parts.cat.com/en/catcorp/product/389-3067)
20. [586-0030](https://parts.cat.com/en/catcorp/product/586-0030)
21. [139-3204](https://parts.cat.com/en/catcorp/product/139-3204)
22. [545-8339](https://parts.cat.com/en/catcorp/product/545-8339)
23. [614-2091](https://parts.cat.com/en/catcorp/product/614-2091)
24. [206-1809](https://parts.cat.com/en/catcorp/product/206-1809)
25. [443-4035](https://parts.cat.com/en/catcorp/product/443-4035)
26. [7K-2722](https://parts.cat.com/en/catcorp/product/7K-2722)
27. [398-8371](https://parts.cat.com/en/catcorp/product/398-8371)
28. [338-5470](https://parts.cat.com/en/catcorp/product/338-5470)
29. [3E-0411](https://parts.cat.com/en/catcorp/product/3E-0411)
30. [119-6215](https://parts.cat.com/en/catcorp/product/119-6215)
31. [3E-0410](https://parts.cat.com/en/catcorp/product/3E-0410)
32. [104-9481](https://parts.cat.com/en/catcorp/product/104-9481)
33. [486-9593](https://parts.cat.com/en/catcorp/product/486-9593)
34. [6I-2585](https://parts.cat.com/en/catcorp/product/6I-2585)
35. [151-7735](https://parts.cat.com/en/catcorp/product/151-7735)
36. [526-3125](https://parts.cat.com/en/catcorp/product/526-3125)
37. [457-4090](https://parts.cat.com/en/catcorp/product/457-4090)
38. [586-5323](https://parts.cat.com/en/catcorp/product/586-5323)
39. [397-8538](https://parts.cat.com/en/catcorp/product/397-8538)
40. [356-6003](https://parts.cat.com/en/catcorp/product/356-6003)
41. [533-3118](https://parts.cat.com/en/catcorp/product/533-3118)
42. [134-8726](https://parts.cat.com/en/catcorp/product/134-8726)
43. [444-9669](https://parts.cat.com/en/catcorp/product/444-9669)
44. [149-7880](https://parts.cat.com/en/catcorp/product/149-7880)
45. [3N-2896](https://parts.cat.com/en/catcorp/product/3N-2896)
46. [8E-8366](https://parts.cat.com/en/catcorp/product/8E-8366)
47. [291-9146](https://parts.cat.com/en/catcorp/product/291-9146)
48. [336-5577](https://parts.cat.com/en/catcorp/product/336-5577)
49. [7T-7358](https://parts.cat.com/en/catcorp/product/7T-7358)
50. [286-5674](https://parts.cat.com/en/catcorp/product/286-5674)

## Coverage

- Standard, high-efficiency, activated-carbon and lower-restriction cabin air filters
- Engine primary and secondary air cleaner elements
- Air cleaner groups and element covers
- Cabin filter mounting plates, retainers, rods and air-duct gaskets
- Primary fuel filter `149-7880`

## Marine application

- `457-4090` — MARINE ENGINE 3516E and 3512E.
- `586-5323` — MARINE ENGINE C32 MARINE/C32.
- These records are marked `BOTH` only because CAT explicitly identifies MARINE ENGINE fitment. Generator-set listings alone are not treated as marine.

## Data integrity

- Filter media and efficiency classes are kept distinct (standard, high efficiency, activated carbon, lower restriction and UHE).
- Mounting plates, rods, retainers and gaskets are recorded as filter-system components rather than filter elements.
- Unknown fitment remains `UNVERIFIED`; known land equipment models are marked `LAND` and still require serial/arrangement validation.
- No prices or stock were invented. New rows use null prices and stock 0; existing values are preserved.
