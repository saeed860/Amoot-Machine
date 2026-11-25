# CAT air cleaner elements and filter mounting components — batch AK

Date: 2026-11-25

## Checkpoint AK — 50 distinct CAT part numbers

The following 50 CAT part numbers were checked against official Cat Parts Store product/category pages and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [229-2604](https://parts.cat.com/en/catcorp/product/229-2604)
2. [587-0730](https://parts.cat.com/en/catcorp/product/587-0730)
3. [631-4750](https://parts.cat.com/en/catcorp/product/631-4750)
4. [631-5022](https://parts.cat.com/en/catcorp/product/631-5022)
5. [631-5023](https://parts.cat.com/en/catcorp/product/631-5023)
6. [631-5024](https://parts.cat.com/en/catcorp/product/631-5024)
7. [363-6323](https://parts.cat.com/en/catcorp/product/363-6323)
8. [386-2601](https://parts.cat.com/en/catcorp/product/386-2601)
9. [621-3973](https://parts.cat.com/en/catcorp/product/621-3973)
10. [621-3974](https://parts.cat.com/en/catcorp/product/621-3974)
11. [249-7780](https://parts.cat.com/en/catcorp/product/249-7780)
12. [265-8632](https://parts.cat.com/en/catcorp/product/265-8632)
13. [591-6844](https://parts.cat.com/en/catcorp/product/591-6844)
14. [173-3517](https://parts.cat.com/en/catcorp/product/173-3517)
15. [598-7666](https://parts.cat.com/en/catcorp/product/598-7666)
16. [2F-3835](https://parts.cat.com/en/catcorp/product/2F-3835)
17. [2T-1394](https://parts.cat.com/en/catcorp/product/2T-1394)
18. [248-2947](https://parts.cat.com/en/catcorp/product/248-2947)
19. [248-2946](https://parts.cat.com/en/catcorp/product/248-2946)
20. [298-2658](https://parts.cat.com/en/catcorp/product/298-2658)
21. [298-2659](https://parts.cat.com/en/catcorp/product/298-2659)
22. [362-0107](https://parts.cat.com/en/catcorp/product/362-0107)
23. [362-0108](https://parts.cat.com/en/catcorp/product/362-0108)
24. [164-6404](https://parts.cat.com/en/catcorp/product/164-6404)
25. [164-6405](https://parts.cat.com/en/catcorp/product/164-6405)
26. [375-4302](https://parts.cat.com/en/catcorp/product/375-4302)
27. [123-2368](https://parts.cat.com/en/catcorp/product/123-2368)
28. [346-6694](https://parts.cat.com/en/catcorp/product/346-6694)
29. [572-8286](https://parts.cat.com/en/catcorp/product/572-8286)
30. [375-4301](https://parts.cat.com/en/catcorp/product/375-4301)
31. [6I-2507](https://parts.cat.com/en/catcorp/product/6I-2507)
32. [357-5142](https://parts.cat.com/en/catcorp/product/357-5142)
33. [617-1840](https://parts.cat.com/en/catcorp/product/617-1840)
34. [9Y-7663](https://parts.cat.com/en/catcorp/product/9Y-7663)
35. [2W-4246](https://parts.cat.com/en/catcorp/product/2W-4246)
36. [269-7041](https://parts.cat.com/en/catcorp/product/269-7041)
37. [361-3532](https://parts.cat.com/en/catcorp/product/361-3532)
38. [281-1968](https://parts.cat.com/en/catcorp/product/281-1968)
39. [386-2100](https://parts.cat.com/en/catcorp/product/386-2100)
40. [393-1756](https://parts.cat.com/en/catcorp/product/393-1756)
41. [287-1529](https://parts.cat.com/en/catcorp/product/287-1529)
42. [210-8400](https://parts.cat.com/en/catcorp/product/210-8400)
43. [6I-2570](https://parts.cat.com/en/catcorp/product/6I-2570)
44. [180-3112](https://parts.cat.com/en/catcorp/product/180-3112)
45. [248-8889](https://parts.cat.com/en/catcorp/product/248-8889)
46. [234-1981](https://parts.cat.com/en/catcorp/product/234-1981)
47. [470-8495](https://parts.cat.com/en/catcorp/product/470-8495)
48. [522-3015](https://parts.cat.com/en/catcorp/product/522-3015)
49. [331-8108](https://parts.cat.com/en/catcorp/product/331-8108)
50. [159-6102](https://parts.cat.com/en/catcorp/product/159-6102)

## Coverage

- Primary and secondary engine air-cleaner elements
- Standard-efficiency, UHE and secondary air-cleaner assemblies
- Cabin-air filter mounting plates, rods, retainers and covers
- Hydraulic, drivetrain and centrifugal-oil-filter mounting parts
- Filter gaskets, seals and related fittings
- Fuel water-separator element `159-6102`

## Marine application

- `2F-3835` is marked `MARINE` because CAT explicitly identifies MARINE ENGINE fitment.
- `470-8495` is marked `BOTH` because CAT explicitly lists MARINE ENGINE C32 in addition to other applications.
- Generic C32 engine or generator-set fitment without a MARINE ENGINE category is not treated as marine.

## Data integrity

- Air cleaner elements, housings, covers, mounting plates, rods, retainers and seals are distinguished by their actual function.
- Records with incomplete product titles or fitment remain `REFERENCE` / `UNVERIFIED` pending exact diagram and serial validation.
- No prices or stock were invented. New rows use null prices and stock 0; existing values are preserved.
