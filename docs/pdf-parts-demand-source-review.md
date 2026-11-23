# PDF parts-demand source review

Reviewed source: user-provided 9-page PDF, reviewed 2026-11-23.

## What the source contains

The document lists Caterpillar equipment models, part descriptions, part numbers and requested quantities. Equipment models visible in the source are: 966H, AP755, D6T, 140H, CS74, CB14, CB534D, PS300C, 428E, 324D and 330D.

Text extraction found 187 part-number occurrences and 97 unique number strings. Repeated appearances are expected because several machines share parts. The document also contains a few incomplete/OCR-ambiguous rows:
- 2446308 appears without a part name or quantity in the extracted table.
- 2959891 appears without a part name; its quantity is shown separately as 1.
- 3349973 (Motor) appears without a visible quantity.
These rows require manual/source confirmation before they are used as order quantities.

## Unique part-number strings extracted

081-2854, 081-2883, 081-2948, 081-2963, 081-2965, 081-2978, 081-4172, 081-4586, 081-5053,
120-0544, 120-6403, 120-6407, 120-6408, 123-0379, 128-9654, 197-4692, 197-4694, 197-4695,
220-9090, 220-9091, 228-9132, 246-5916, 271-9033, 271-9034, 271-9035, 306-4358, 366-4623, 436-6390,
815037, 1125575, 1129035, 1216008, 1258157, 1258810, 1361711, 1634145, 1781685, 2061679, 2071561,
2254625, 2289129, 2292626, 2309357, 2332622, 2339204, 2339205, 2350354, 2373786, 2384462, 2418634,
2422542, 2430388, 2440980, 2446308, 2478974, 2481368, 2481374, 2481386, 2481390, 2590774, 2600346,
2602193, 2606502, 2618553, 2703947, 2703948, 2704407, 2704408, 2747181, 2855730, 2880934, 2880936,
2900760, 2959888, 2959891, 2964301, 2970538, 2970539, 3074671, 3133829, 3159810, 3260502, 3330960,
3349973, 3500972, 3651283, 3769011, 3769017, 3790117, 3809470, 3863457, 3933604, 4728026, 4826619,
4872348, 5185133, 5185137.

## Initial official Cat Parts Store cross-checks

These checks demonstrate why the PDF is useful as a demand lead but must not be treated as an authoritative fitment catalog:

- [238-4462](https://parts.cat.com/en/catcorp/product/238-4462): Cat describes it as a hydraulic cylinder seal kit and its compatible-model list explicitly includes 140H. This agrees with the PDF's 140H demand listing.
- [376-9017](https://parts.cat.com/en/catcorp/product/376-9017): Cat describes it as a hydraulic cylinder seal kit; its compatible-model list includes 140H.
- [315-9810](https://parts.cat.com/en/catcorp/product/315-9810): Cat identifies it as a turbocharger; the compatible-model list includes CS74 and Generator Set 3512B. The PDF lists it against a CS74 machine.
- [228-9129](https://parts.cat.com/en/catcorp/product/228-9129): Cat identifies this as a fuel-pump primer/filter assembly, lists 428E among compatible backhoe loaders, and marks it discontinued. Any sales listing must show the discontinued status and replacement/dealer check.
- [228-9132](https://parts.cat.com/en/catcorp/product/228-9132): Cat identifies this as a fuel-pump fitting, not a complete fuel pump. The Persian annotation on the PDF's last page calls it a fuel pump, so the official Cat description must take precedence.

## Recommended handling in Amoot

1. Keep this source as a separate demand/reference dataset, not as verified Cat catalog data.
2. Normalize part-number formatting for lookup, but retain the exact source spelling as a separate field.
3. Preserve each machine-model association and quantity at line-item level; aggregate demand only as a derived view.
4. Do not publish chassis serial numbers from this PDF in the public catalog.
5. Populate official product name, images, status and compatible models only after checking each part's official Cat product page. Never infer fitment from a shared machine family or from this PDF alone.
6. Do not create sellable inventory, prices or product stock from the quantities in this document; they are requested quantities, not stock.

No records from this PDF have been inserted into the verified public Cat part catalog by this review.
