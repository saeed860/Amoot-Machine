# CAT filters, breathers and oil-system parts — batch Z

Date: 2026-11-25

## Checkpoint Z — 50 distinct CAT part numbers

The following 50 distinct part numbers were verified against Cat Parts Store product pages or category listings and inserted/upserted into Supabase `public.part_catalog` and `public.products`.

1. [577-1436](https://parts.cat.com/en/catcorp/product/577-1436)
2. [577-1435](https://parts.cat.com/en/catcorp/product/577-1435)
3. [6I-2505](https://parts.cat.com/en/catcorp/product/6I-2505)
4. [419-9162](https://parts.cat.com/en/catcorp/product/419-9162)
5. [222-9020](https://parts.cat.com/en/catcorp/product/222-9020)
6. [419-9172](https://parts.cat.com/en/catcorp/product/419-9172)
7. [577-1437](https://parts.cat.com/en/catcorp/product/577-1437)
8. [496-9841](https://parts.cat.com/en/catcorp/product/496-9841)
9. [496-9845](https://parts.cat.com/en/catcorp/product/496-9845)
10. [258-2829](https://parts.cat.com/en/catcorp/product/258-2829)
11. [131-1812](https://parts.cat.com/en/catcorp/product/131-1812)
12. [9N-6519](https://parts.cat.com/en/catcorp/product/9N-6519)
13. [243-6350](https://parts.cat.com/en/catcorp/product/243-6350)
14. [7C-1571](https://parts.cat.com/en/catcorp/product/7C-1571)
15. [500-0480](https://parts.cat.com/en/catcorp/product/500-0480)
16. [436-7077](https://parts.cat.com/en/catcorp/product/436-7077)
17. [326-1641](https://parts.cat.com/en/catcorp/product/326-1641)
18. [326-1644](https://parts.cat.com/en/catcorp/product/326-1644)
19. [107-0266](https://parts.cat.com/en/catcorp/product/107-0266)
20. [175-2841](https://parts.cat.com/en/catcorp/product/175-2841)
21. [496-9846](https://parts.cat.com/en/catcorp/product/496-9846)
22. [496-9844](https://parts.cat.com/en/catcorp/product/496-9844)
23. [538-6396](https://parts.cat.com/en/catcorp/product/538-6396)
24. [234-0138](https://parts.cat.com/en/catcorp/product/234-0138)
25. [201-5023](https://parts.cat.com/en/catcorp/product/201-5023)
26. [209-8217](https://parts.cat.com/en/catcorp/product/209-8217)
27. [293-1183](https://parts.cat.com/en/catcorp/product/293-1183)
28. [112-7448](https://parts.cat.com/en/catcorp/product/112-7448)
29. [266-7765](https://parts.cat.com/en/catcorp/product/266-7765)
30. [293-1184](https://parts.cat.com/en/catcorp/product/293-1184)
31. [529-0121](https://parts.cat.com/en/catcorp/product/529-0121)
32. [321-5967](https://parts.cat.com/en/catcorp/product/321-5967)
33. [494-6431](https://parts.cat.com/en/catcorp/product/494-6431)
34. [4H-2978](https://parts.cat.com/en/catcorp/product/4H-2978)
35. [347-7407](https://parts.cat.com/en/catcorp/product/347-7407)
36. [525-9475](https://parts.cat.com/en/catcorp/product/525-9475)
37. [5I-7950](https://parts.cat.com/en/catcorp/product/5I-7950)
38. [389-1079](https://parts.cat.com/en/catcorp/product/389-1079)
39. [183-3873](https://parts.cat.com/en/catcorp/product/183-3873)
40. [157-7911](https://parts.cat.com/en/catcorp/product/157-7911)
41. [356-7423](https://parts.cat.com/en/catcorp/product/356-7423)
42. [388-3276](https://parts.cat.com/en/catcorp/product/388-3276)
43. [466-1627](https://parts.cat.com/en/catcorp/product/466-1627)
44. [282-9105](https://parts.cat.com/en/catcorp/product/282-9105)
45. [126-0577](https://parts.cat.com/en/catcorp/product/126-0577)
46. [207-9729](https://parts.cat.com/en/catcorp/product/207-9729)
47. [130-4634](https://parts.cat.com/en/catcorp/product/130-4634)
48. [235-4948](https://parts.cat.com/en/catcorp/product/235-4948)
49. [459-7105](https://parts.cat.com/en/catcorp/product/459-7105)
50. [364-1312](https://parts.cat.com/en/catcorp/product/364-1312)

## Families covered

- Engine air filters: primary and secondary Standard/UHE elements
- Cabin air filters: standard, high-efficiency and lower-restriction panels
- Fuel filtration: fuel filters and water separators
- Hydraulic/transmission filtration: hydraulic elements and drain filters
- Oil system components: suction screens, centrifugal filter rotor liner, center tube and filter housing
- Breathers: hydraulic tank, crankcase, engine and swing-drive breathers

## Marine application rules

`BOTH` is used only where Cat explicitly lists a `MARINE ENGINE` or `MARINE AUXILIARY` category. In this checkpoint that includes 9N-6519, 243-6350, 7C-1571, 388-3276, 282-9105 and 126-0577; 326-1644 was corrected to `BOTH` after the official compatible-model list confirmed MARINE ENGINE 3406B. Other products that mention a model name containing the word “marine” only under another equipment category were not treated as marine fitment.

## Verification and commercial data

- Model lists are provisional until checked against the exact machine serial number and arrangement.
- Items without complete fitment remain `REFERENCE` / `UNVERIFIED`; this checkpoint includes 209-8217 with incomplete fitment data.
- No retail price or stock quantity was invented. New rows were inserted with null prices and stock 0; upserts preserve any existing prices and stock.
- Breathers and component parts are categorized separately from filter elements to avoid presenting every related component as a filter cartridge.

## Source notes

Primary source: Cat Parts Store product and category pages. Official product URLs are preserved in the database records. Where a product page does not expose complete fitment or dimensional data, only the published fields were captured.
