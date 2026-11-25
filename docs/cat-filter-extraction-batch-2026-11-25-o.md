# CAT filter extraction — 2026-11-25 (O)

## Official CAT Parts Store records

- **384-5327 — Water Spray Filter:** 100-mesh cartridge strainer for the water-spray system; 1-1/4 NPTF (2X), polypropylene housing, 10.65 in length × 6.614 in width. CAT lists Cold Planer models PM310, PM312, PM313, PM620, PM622, PM820, PM822 and PM825. Stored as LAND / NEEDS_SERIAL_CHECK; exact serial/arrangement validation remains required.
  - Official source: https://parts.cat.com/en/catcorp/product/384-5327
  - CAT image: https://caterpillar.scene7.com/is/image/Caterpillar/CM20230111-8ca0d-be67f

- **421-6535 — Engine Air Filter:** Standard-efficiency primary round filter; 5.906 × 5.906 × 13.622 in; 1.46 lb. CAT does not publish compatible models on the page. Stored as REFERENCE / UNVERIFIED; no fitment claim.
  - Official source: https://parts.cat.com/en/catcorp/product/421-6535
  - CAT image: https://caterpillar.scene7.com/is/image/Caterpillar/CM20180403-39298-07318

- **536-3957 — Filter Element (SEM):** CAT lists carbon steel material but does not publish dimensions or compatible models. It appears in the Lube System Filters category. Stored as REFERENCE / UNVERIFIED; do not infer fitment or exact filter application from the category alone.
  - Official source: https://parts.cat.com/en/catcorp/product/536-3957
  - CAT image: https://caterpillar.scene7.com/is/image/Caterpillar/CM20241121-fbead-f8c6f

## Database

Added/upserted all three in `public.part_catalog` and `public.products`. Prices remain NULL and stock remains zero; unknown compatibility was not invented. The public category hierarchy places all three under the parent **فیلترها**, with 384-5327 separated into **فیلتر سیستم آب‌پاش**.

## Source notes

CAT pages for 421-6535 and 536-3957 do not provide model compatibility. 384-5327 does provide a Cold Planer model list; final machine fit still requires serial-number confirmation.
