# CAT DPF, DEF and reman filtration — batch AD

Date: 2026-11-25

## Checkpoint AD — 50 distinct CAT part numbers

The following 50 part numbers were checked against official Cat Parts Store product/category pages and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [480-4025](https://parts.cat.com/en/catcorp/product/480-4025)
2. [585-2839](https://parts.cat.com/en/catcorp/product/585-2839)
3. [647-3506](https://parts.cat.com/en/catcorp/product/647-3506)
4. [649-1342](https://parts.cat.com/en/catcorp/product/649-1342)
5. [443-4037](https://parts.cat.com/en/catcorp/product/443-4037)
6. [180-7487](https://parts.cat.com/en/catcorp/product/180-7487)
7. [175-2837](https://parts.cat.com/en/catcorp/product/175-2837)
8. [378-7609](https://parts.cat.com/en/catcorp/product/378-7609)
9. [106-3969](https://parts.cat.com/en/catcorp/product/106-3969)
10. [282-5339](https://parts.cat.com/en/catcorp/product/282-5339)
11. [574-8209](https://parts.cat.com/en/catcorp/product/574-8209)
12. [495-1028](https://parts.cat.com/en/catcorp/product/495-1028)
13. [380-9160](https://parts.cat.com/en/catcorp/product/380-9160)
14. [572-3838](https://parts.cat.com/en/catcorp/product/572-3838)
15. [380-9151](https://parts.cat.com/en/catcorp/product/380-9151)
16. [395-0218](https://parts.cat.com/en/catcorp/product/395-0218)
17. [380-9159](https://parts.cat.com/en/catcorp/product/380-9159)
18. [584-8136](https://parts.cat.com/en/catcorp/product/584-8136)
19. [610-5870](https://parts.cat.com/en/catcorp/product/610-5870)
20. [380-9168](https://parts.cat.com/en/catcorp/product/380-9168)
21. [380-9158](https://parts.cat.com/en/catcorp/product/380-9158)
22. [380-9169](https://parts.cat.com/en/catcorp/product/380-9169)
23. [380-9165](https://parts.cat.com/en/catcorp/product/380-9165)
24. [381-3665](https://parts.cat.com/en/catcorp/product/381-3665)
25. [380-9148](https://parts.cat.com/en/catcorp/product/380-9148)
26. [442-0634](https://parts.cat.com/en/catcorp/product/442-0634)
27. [467-1404](https://parts.cat.com/en/catcorp/product/467-1404)
28. [463-9169](https://parts.cat.com/en/catcorp/product/463-9169)
29. [467-1400](https://parts.cat.com/en/catcorp/product/467-1400)
30. [424-9851](https://parts.cat.com/en/catcorp/product/424-9851)
31. [587-7199](https://parts.cat.com/en/catcorp/product/587-7199)
32. [647-3508](https://parts.cat.com/en/catcorp/product/647-3508)
33. [495-1507](https://parts.cat.com/en/catcorp/product/495-1507)
34. [437-3518](https://parts.cat.com/en/catcorp/product/437-3518)
35. [20R-8022](https://parts.cat.com/en/catcorp/product/20R-8022)
36. [11R-2108](https://parts.cat.com/en/catcorp/product/11R-2108)
37. [20R-8018](https://parts.cat.com/en/catcorp/product/20R-8018)
38. [20R-8031](https://parts.cat.com/en/catcorp/product/20R-8031)
39. [11R-2025](https://parts.cat.com/en/catcorp/product/11R-2025)
40. [20R-8032](https://parts.cat.com/en/catcorp/product/20R-8032)
41. [20R-8033](https://parts.cat.com/en/catcorp/product/20R-8033)
42. [20R-8035](https://parts.cat.com/en/catcorp/product/20R-8035)
43. [20R-8028](https://parts.cat.com/en/catcorp/product/20R-8028)
44. [20R-8034](https://parts.cat.com/en/catcorp/product/20R-8034)
45. [20R-3667](https://parts.cat.com/en/catcorp/product/20R-3667)
46. [20R-3529](https://parts.cat.com/en/catcorp/product/20R-3529)
47. [20R-3665](https://parts.cat.com/en/catcorp/product/20R-3665)
48. [20R-6079](https://parts.cat.com/en/catcorp/product/20R-6079)
49. [20R-3510](https://parts.cat.com/en/catcorp/product/20R-3510)
50. [20R-6080](https://parts.cat.com/en/catcorp/product/20R-6080)

## Coverage

- Diesel particulate filters (DPF), DPF groups and catalyst elements
- Diesel Exhaust Fluid (DEF) filters, filter bodies and bases
- Aftertreatment filter kits
- Cat Reman DPF kits (NWC and Upgrade-to-New)
- Additional cabin air filters

## Marine fitment

- `495-1028` is marked `BOTH` because CAT's compatible-model list explicitly includes `MARINE ENGINE` C32 MARINE/C32B and `MARINE AUXILIARY` C32B. Important caveat: the same product page labels it as a DEF filter while its descriptive text discusses standard-efficiency fuel filtration. This conflict is recorded in the database; confirm exact system and serial before ordering.
- Other DPF/DEF products remain `UNVERIFIED` unless CAT explicitly publishes a marine category. Generic engine or generator fitment is not treated as marine.
- Cat Reman numbers are cataloged separately as remanufactured DPF kits; they are not represented as new filter elements.
- No prices or stock quantities were invented. New records use null prices and stock 0; upserts preserve existing commercial values.
