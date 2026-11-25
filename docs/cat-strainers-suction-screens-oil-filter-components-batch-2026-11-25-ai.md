# CAT strainers, suction screens and lubrication components — batch AI

Date: 2026-11-25

## Checkpoint AI — 50 distinct CAT part numbers

The following 50 CAT part numbers were checked against official Cat Parts Store product/category pages and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [528-7808](https://parts.cat.com/en/catcorp/product/528-7808)
2. [565-1161](https://parts.cat.com/en/catcorp/product/565-1161)
3. [652-8996](https://parts.cat.com/en/catcorp/product/652-8996)
4. [545-5375](https://parts.cat.com/en/catcorp/product/545-5375)
5. [536-7860](https://parts.cat.com/en/catcorp/product/536-7860)
6. [9H-2769](https://parts.cat.com/en/catcorp/product/9H-2769)
7. [337-6251](https://parts.cat.com/en/catcorp/product/337-6251)
8. [7S-2747](https://parts.cat.com/en/catcorp/product/7S-2747)
9. [395-1775](https://parts.cat.com/en/catcorp/product/395-1775)
10. [322-4984](https://parts.cat.com/en/catcorp/product/322-4984)
11. [422-2344](https://parts.cat.com/en/catcorp/product/422-2344)
12. [139-6118](https://parts.cat.com/en/catcorp/product/139-6118)
13. [3P-0348](https://parts.cat.com/en/catcorp/product/3P-0348)
14. [1R-1808](https://parts.cat.com/en/catcorp/product/1R-1808)
15. [4N-0913](https://parts.cat.com/en/catcorp/product/4N-0913)
16. [113-5304](https://parts.cat.com/en/catcorp/product/113-5304)
17. [6N-1050](https://parts.cat.com/en/catcorp/product/6N-1050)
18. [5P-8068](https://parts.cat.com/en/catcorp/product/5P-8068)
19. [8M-4986](https://parts.cat.com/en/catcorp/product/8M-4986)
20. [8M-4987](https://parts.cat.com/en/catcorp/product/8M-4987)
21. [8M-8157](https://parts.cat.com/en/catcorp/product/8M-8157)
22. [8M-4443](https://parts.cat.com/en/catcorp/product/8M-4443)
23. [1T-1247](https://parts.cat.com/en/catcorp/product/1T-1247)
24. [383-0531](https://parts.cat.com/en/catcorp/product/383-0531)
25. [564-7672](https://parts.cat.com/en/catcorp/product/564-7672)
26. [264-6257](https://parts.cat.com/en/catcorp/product/264-6257)
27. [567-4704](https://parts.cat.com/en/catcorp/product/567-4704)
28. [299-0378](https://parts.cat.com/en/catcorp/product/299-0378)
29. [387-9861](https://parts.cat.com/en/catcorp/product/387-9861)
30. [8P-3795](https://parts.cat.com/en/catcorp/product/8P-3795)
31. [609-2972](https://parts.cat.com/en/catcorp/product/609-2972)
32. [7S-2753](https://parts.cat.com/en/catcorp/product/7S-2753)
33. [5M-6604](https://parts.cat.com/en/catcorp/product/5M-6604)
34. [251-7580](https://parts.cat.com/en/catcorp/product/251-7580)
35. [325-0402](https://parts.cat.com/en/catcorp/product/325-0402)
36. [325-0635](https://parts.cat.com/en/catcorp/product/325-0635)
37. [393-2878](https://parts.cat.com/en/catcorp/product/393-2878)
38. [430-8499](https://parts.cat.com/en/catcorp/product/430-8499)
39. [388-7436](https://parts.cat.com/en/catcorp/product/388-7436)
40. [389-5163](https://parts.cat.com/en/catcorp/product/389-5163)
41. [8H-3498](https://parts.cat.com/en/catcorp/product/8H-3498)
42. [393-1101](https://parts.cat.com/en/catcorp/product/393-1101)
43. [382-2542](https://parts.cat.com/en/catcorp/product/382-2542)
44. [357-5031](https://parts.cat.com/en/catcorp/product/357-5031)
45. [120-8839](https://parts.cat.com/en/catcorp/product/120-8839)
46. [373-1765](https://parts.cat.com/en/catcorp/product/373-1765)
47. [373-1766](https://parts.cat.com/en/catcorp/product/373-1766)
48. [568-1558](https://parts.cat.com/en/catcorp/product/568-1558)
49. [231-6182](https://parts.cat.com/en/catcorp/product/231-6182)
50. [180-3730](https://parts.cat.com/en/catcorp/product/180-3730)

## Coverage

- Fuel tank strainers, fuel bowls and fuel filter groups
- Engine oil strainers and oil pump suction screens
- Hydraulic return filters and oil strainer cartridges
- Air filter elements and SEM filters
- Filter retainers, gaskets, O-rings, support lines and fittings
- Water-filter fittings and water spray filtration components

## Marine fitment

- `139-6118` — MARINE ENGINE C30/C32/C32 MARINE/3412E and MARINE AUXILIARY C32.
- `1R-1808` — MARINE ENGINE and MARINE AUXILIARY models explicitly listed by CAT, including C32 MARINE, C18 MARINE, C12 MARINE, C30, C32, C32B and associated engine families.
- Both remain subject to exact serial/arrangement confirmation. Generic engine/generator fitment is not treated as marine.

## Data integrity

- Strainers, screens, filter bowls, retainers, gaskets, O-rings, plugs and oil-line supports are classified as their actual component type.
- `337-6251` is a Fuel Filter Group with a spin-on fuel/water separator and is classified as LAND based on the published wheeled-excavator fitment.
- `383-0531` is an Engine Oil Filter Strainer (not a fuel tank strainer).
- `299-0378` is a Fuel Strainer; CAT does not publish compatible models on the page.
- No prices or stock were invented. New rows use null prices and stock 0; existing values are preserved.
