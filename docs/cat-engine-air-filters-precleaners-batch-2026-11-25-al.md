# CAT engine air filters and precleaners — batch AL

Date: 2026-11-25

## Checkpoint AL — 50 distinct CAT part numbers

The following 50 CAT part numbers were checked against official Cat Parts Store product/category pages and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [4L-9853](https://parts.cat.com/en/catcorp/product/4L-9853)
2. [380-8939](https://parts.cat.com/en/catcorp/product/380-8939)
3. [7W-9853](https://parts.cat.com/en/catcorp/product/7W-9853)
4. [6I-2566](https://parts.cat.com/en/catcorp/product/6I-2566)
5. [1N-4864](https://parts.cat.com/en/catcorp/product/1N-4864)
6. [244-0357](https://parts.cat.com/en/catcorp/product/244-0357)
7. [220-0453](https://parts.cat.com/en/catcorp/product/220-0453)
8. [1P-8482](https://parts.cat.com/en/catcorp/product/1P-8482)
9. [4N-0326](https://parts.cat.com/en/catcorp/product/4N-0326)
10. [259-2023](https://parts.cat.com/en/catcorp/product/259-2023)
11. [068-7744](https://parts.cat.com/en/catcorp/product/068-7744)
12. [164-6735](https://parts.cat.com/en/catcorp/product/164-6735)
13. [102-9387](https://parts.cat.com/en/catcorp/product/102-9387)
14. [422-2249](https://parts.cat.com/en/catcorp/product/422-2249)
15. [131-8903](https://parts.cat.com/en/catcorp/product/131-8903)
16. [102-3764](https://parts.cat.com/en/catcorp/product/102-3764)
17. [447-0761](https://parts.cat.com/en/catcorp/product/447-0761)
18. [130-4679](https://parts.cat.com/en/catcorp/product/130-4679)
19. [233-5185](https://parts.cat.com/en/catcorp/product/233-5185)
20. [9S-9972](https://parts.cat.com/en/catcorp/product/9S-9972)
21. [8T-6289](https://parts.cat.com/en/catcorp/product/8T-6289)
22. [7C-1062](https://parts.cat.com/en/catcorp/product/7C-1062)
23. [4L-9851](https://parts.cat.com/en/catcorp/product/4L-9851)
24. [6I-0274](https://parts.cat.com/en/catcorp/product/6I-0274)
25. [8N-2556](https://parts.cat.com/en/catcorp/product/8N-2556)
26. [8N-6309](https://parts.cat.com/en/catcorp/product/8N-6309)
27. [3S-9606](https://parts.cat.com/en/catcorp/product/3S-9606)
28. [4P-0711](https://parts.cat.com/en/catcorp/product/4P-0711)
29. [597-8987](https://parts.cat.com/en/catcorp/product/597-8987)
30. [360-2296](https://parts.cat.com/en/catcorp/product/360-2296)
31. [9Y-9431](https://parts.cat.com/en/catcorp/product/9Y-9431)
32. [9M-9439](https://parts.cat.com/en/catcorp/product/9M-9439)
33. [2S-6708](https://parts.cat.com/en/catcorp/product/2S-6708)
34. [8H-2023](https://parts.cat.com/en/catcorp/product/8H-2023)
35. [6I-2567](https://parts.cat.com/en/catcorp/product/6I-2567)
36. [9S-1274](https://parts.cat.com/en/catcorp/product/9S-1274)
37. [121-7746](https://parts.cat.com/en/catcorp/product/121-7746)
38. [2S-2493](https://parts.cat.com/en/catcorp/product/2S-2493)
39. [435-9304](https://parts.cat.com/en/catcorp/product/435-9304)
40. [560-1147](https://parts.cat.com/en/catcorp/product/560-1147)
41. [304-7802](https://parts.cat.com/en/catcorp/product/304-7802)
42. [505-3564](https://parts.cat.com/en/catcorp/product/505-3564)
43. [261-6101](https://parts.cat.com/en/catcorp/product/261-6101)
44. [496-9843](https://parts.cat.com/en/catcorp/product/496-9843)
45. [337-8154](https://parts.cat.com/en/catcorp/product/337-8154)
46. [249-5512](https://parts.cat.com/en/catcorp/product/249-5512)
47. [299-3205](https://parts.cat.com/en/catcorp/product/299-3205)
48. [488-3907](https://parts.cat.com/en/catcorp/product/488-3907)
49. [307-8645](https://parts.cat.com/en/catcorp/product/307-8645)
50. [465-1236](https://parts.cat.com/en/catcorp/product/465-1236)

## Coverage

- Engine-air primary and secondary filter elements
- Basic air-cleaner groups and elements
- Engine and cabin precleaner bowls, covers, bodies and dust collectors
- Precleaner seals, ducts and mounting hardware
- Air-box and cabin-air seals

## Marine application

- `164-6735` — MARINE AUXILIARY 3512B
- `360-2296` — MARINE ENGINE D330A
- `2S-6708` and `2S-2493` — MARINE ENGINE 3406B/3406/D343
- Existing `1M-7250` — corrected to BOTH based on MARINE ENGINE D330A.
- Existing `113-1578` — corrected to BOTH based on MARINE ENGINE and MARINE AUXILIARY 3516B.
- All marine assignments require serial/arrangement validation. Engine/generator fitment without a marine category is not treated as marine.

## Data integrity

- Primary and secondary elements, precleaners, dust bowls, covers, seals and ducts are classified separately.
- Unknown fitment remains `REFERENCE` / `UNVERIFIED`.
- No prices or stock were invented. New rows use null prices and stock 0; existing values are preserved.
