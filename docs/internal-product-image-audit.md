# ممیزی داخلی تصاویر محصولات آموت ماشین

تاریخ بررسی: 2026-11-24

## یافته‌های فنی

- تصاویر دسته‌بندی قدیمی در پوشه `assets/` عموماً بسیار کوچک‌اند: حدود 90×80 تا 115×82 پیکسل.
- تصاویر عمومی محصول قدیمی حدود 140×108 تا 170×108 پیکسل‌اند.
- بنابراین افت وضوح فقط از CSS نیست؛ فایل مبدأ نیز وضوح کافی برای کارت‌های بزرگ و نمایشگرهای امروزی ندارد.
- قاب‌بندی سایت اصلاح شده است: تصاویر با `object-fit: contain` نمایش داده می‌شوند تا برش نخورند.
- تصاویر عمومی دسته‌بندی/گروهی نباید به‌عنوان عکس اختصاصی یک شماره فنی معرفی شوند.

## عکس‌های با تطبیق شماره فنی تأییدشده

این نگاشت در `offroad-catalog.js` اعمال شده است. URLها فقط در داده داخلی کاتالوگ قرار دارند و در کارت مشخصات به‌صورت لینک منبع نمایش داده نمی‌شوند.

| پارت‌نامبر | تطبیق تصویر | منبع تصویر | توضیح |
|---|---|---|---|
| 1R-0749 | فیلتر سوخت Cat | https://s7d2.scene7.com/is/image/Caterpillar/CM20210408-bf715-02864?scl=1 | تصویر رسمی Caterpillar |
| 1R-1808 | فیلتر روغن موتور Cat | https://i.ebayimg.com/images/g/YqIAAOSwmjZlRPWz/s-l1200.jpg | عکس فروشنده؛ شماره فنی روی محصول قابل تشخیص است |
| 100-5047 | آلترناتور 24V/50A | https://wdpart.com/cdn/shop/products/2021-06-02163227.jpg?v=1622704795 | عکس فروشنده؛ صفحه Cat وضعیت این شماره را Discontinued نشان می‌دهد، این عکس تأیید موجودی نیست |
| 6I-1346 | پمپ روغن موتور | https://www.heavydutypros.com/images/products/detail/6I1346_2.jpg | عکس فروشنده؛ شماره فنی در عنوان صفحه منبع آمده است |
| 202-4304 | گروه آیدلر زیربندی | https://caterpillar.scene7.com/is/image/Caterpillar/CM20220428-22ce0-ede45 | تصویر رسمی Caterpillar |
| 179-5922 | توربوشارژر | https://www.hydraulicbreakerhammer.com/photo/pt204183860-turbocharger_1795922_for_excavator_cat_980c_980g_part_number_179_5922.jpg | عکس فروشنده با شماره فنی دقیق در عنوان صفحه |
| 223-9250 | مجموعه سرسیلندر | https://industriemarine.com/images/thumbs/008/0088680_45135_510.jpeg | عکس فروشنده با تطبیق شماره فنی در عنوان صفحه |
| 125-3537 | گروه آیدلر | https://caterpillar.scene7.com/is/image/Caterpillar/CM20220428-29938-02375?fmt=WebP&hei=960&iccembed=0&layer=COMP&op_sharpen=0&op_usm=1%2C1%2C6%2C0&printres=72&qlt=88%2C1&resmode=sharp2&wid=960 | تصویر رسمی Caterpillar |
| 226-7683 | آلترناتور 24V | https://advancedtruckparts.com/cdn/shop/files/10r-9095-cat-24-volts-alternator-advanced-truck-parts-48695_1200x1200.jpg?v=1755233460 | عکس فروشنده؛ شماره فنی روی بدنه قابل مشاهده است |

## سیاست ادامه کار

1. عکس فقط وقتی به SKU متصل می‌شود که شماره فنی/شرح قطعه با منبع تصویری قابل تطبیق باشد.
2. تصویر یک قطعه مشابه یا صرفاً هم‌گروه، عکس اختصاصی محصول تلقی نمی‌شود.
3. تصاویر عمومی موجود تا زمان یافتن تصویر دقیق، صرفاً نقش تصویر گروه قطعه را دارند.
4. تصویر فروشنده، وضعیت موجودی، اصالت کالا یا سازگاری فنی را اثبات نمی‌کند.
5. برای توسعه نگاشت تصاویر، ابتدا منابع رسمی Cat و سپس فروشندگان تخصصی با شماره فنی دقیق بررسی شوند.


## Homepage hero carousel image sources (2026-11-24)

The homepage hero keeps the existing local image `assets/hero-excavator.jpg` as slide 1. All three non-original hero slides are now stored locally under assets/; the homepage no longer requests these hero images from external hosts.

- Slide 2 — Iran Khazar jack-up drilling rig, Wikimedia Commons: https://commons.wikimedia.org/wiki/File:Jack-up-rig-in-the-caspian-sea.JPG — CC BY-SA 3.0 (and GFDL notice on file page); attribution to the source as documented there. Locally vendored as assets/hero-jackup-rig.jpg (resized Wikimedia file).
- Slide 3 — OSV Cape Cod, Wikimedia Commons: https://commons.wikimedia.org/wiki/File:OSV_Cape_Cod.jpg — CC0 1.0, author GuavaTrain. Locally vendored as assets/hero-supply-vessel.jpg (resized Wikimedia file).
- Slide 4 — Cat 3516 industrial diesel engine, official Caterpillar Scene7 media: https://www.cat.com/en_GB/products/new/power-systems/industrial/industrial-diesel-engines/18397893.html and https://s7d2.scene7.com/is/image/Caterpillar/C831222 — Replaced for local hosting with a Wikimedia Commons photograph of a Caterpillar 3516B XQ2000 power module, locally vendored as assets/hero-cat-3516b.jpg.

The carousel fades between slides and retains its 5.5-second automatic rotation plus manual controls. External image delivery still depends on the source hosts; for fully self-hosted operation, obtain and commit the licensed image binaries with their attribution records.


## Local hero asset attribution (2026-11-24)

- `assets/hero-jackup-rig.jpg` — Iran Khazar jack-up rig, source: [Wikimedia Commons file page](https://commons.wikimedia.org/wiki/File:Jack-up-rig-in-the-caspian-sea.JPG), CC BY-SA 3.0; attribution/source as listed on the Commons page (www.dragonoil.com). Changes: resized for web delivery.
- `assets/hero-supply-vessel.jpg` — OSV Cape Cod, source: [Wikimedia Commons file page](https://commons.wikimedia.org/wiki/File:OSV_Cape_Cod.jpg), CC0 1.0, author GuavaTrain. Changes: resized for web delivery.
- `assets/hero-cat-3516b.jpg` — Caterpillar 3516B XQ2000 power module, source: [Wikimedia Commons file page](https://commons.wikimedia.org/wiki/File:Caterpillar_3516B_-_XQ2000_Power_Module.JPG), CC BY-SA 3.0, author StcudorPrewoP. Changes: resized for web delivery.

The original first-slide image remains local at `assets/hero-excavator.jpg`. Product-SKU photographs sourced from third-party sellers/manufacturer media remain separately documented above and are not included in this hero-image migration.


## Exact-SKU official Caterpillar image additions (2026-11-28)

The following five product image URLs were added to `verifiedPartImages` after fetching the matching official Cat Parts Store product pages. The page heading, part number, and product image were checked together; these are exact-SKU matches, not category placeholders.

| Part number | Cat product description | Official source page | Image asset |
|---|---|---|---|
| 193-0980 | 2 Section Basic Gear Pump | https://parts.cat.com/en/catcorp/product/193-0980 | https://caterpillar.scene7.com/is/image/Caterpillar/CM20210817-4cc68-3e267 |
| 558-2101 | Pinion-Circle Drive | https://parts.cat.com/en/catcorp/product/558-2101 | https://caterpillar.scene7.com/is/image/Caterpillar/CM20201019-c2af1-79b6c |
| 172-7767 | Water Pump used in Engine | https://parts.cat.com/en/catcorp/product/172-7767 | https://caterpillar.scene7.com/is/image/Caterpillar/C10533255 |
| 134-0467 | PUMP GP-INJ | https://parts.cat.com/en/catcorp/product/134-0467 | https://caterpillar.scene7.com/is/image/Caterpillar/CM20170508-76204-57647 |
| 7W-1713 | Oil Cooler Core | https://parts.cat.com/en/catcorp/product/7W-1713 | https://caterpillar.scene7.com/is/image/Caterpillar/CM20201123-2f512-06954 |

These official image URLs identify the part shown on the corresponding Cat product page. They do not establish local stock, sale condition, price, or fitment for a particular machine; equipment compatibility must still be checked by serial number and configuration. Review Caterpillar image-use terms before commercial redistribution.


## Additional exact-SKU product image mappings (2026-11-28, batch 2)

| Part number | Product match | Source page | Image source | Verification |
|---|---|---|---|---|
| 4P-2942 | Camshaft Kit | https://parts.cat.com/en/catcorp/product/4P-2942 | https://caterpillar.scene7.com/is/image/Caterpillar/CM20150701-29795-53038 | Official Cat product page title and image match the SKU |
| 8N-7005 | Fuel Valve Nozzle | https://parts.cat.com/en/catcorp/product/8N-7005 | https://caterpillar.scene7.com/is/image/Caterpillar/C10543220 | Official Cat product page title, description and image match the SKU |
| 9R-7710 | Frame Assembly | https://irondt.com/product/9r7710/ | https://pim.irondt.com:8443/ec/images/1/product/2d/32/176168-9r7710.webp | Specialist supplier page title and primary product image explicitly identify 9R7710 |

The Cat Parts Store pages for 9R-7710, 6G-5533 and 8J-6155 returned a generic fallback image while marking the parts discontinued; those fallback images were deliberately rejected. The 8J6155 source found at 777parts is a parts diagram, not a product photograph, and was not mapped. 6G5533 remains without a new image until a product-specific image can be verified. Image presence does not imply availability or fitment.


## Exact-SKU official Caterpillar image additions (2026-11-28, batch 3)

| Part number | Cat product description | Official Cat product page | Official image |
|---|---|---|---|
| 4W-5405 | Oil Cooler Core | https://parts.cat.com/en/catcorp/product/4W-5405 | https://caterpillar.scene7.com/is/image/Caterpillar/CM20201225-e9ee7-9d746 |
| 9G-9175 | 670mm OD Final Drive Carrier | https://parts.cat.com/en/catcorp/product/9G-9175 | https://caterpillar.scene7.com/is/image/Caterpillar/CM20200529-ad5b1-079ac |
| 352-0211 | Pump Group-Water | https://parts.cat.com/en/catcorp/product/352-0211 | https://caterpillar.scene7.com/is/image/Caterpillar/C10539024 |
| 360-8960 | Engine Fuel Filter Element | https://parts.cat.com/en/catcorp/product/360-8960 | https://caterpillar.scene7.com/is/image/Caterpillar/CM20180403-40211-08659 |

Each page returned HTTP 200 and its exact part-number heading plus the mapped image. These are official Cat-hosted image assets; image presence is not a stock, price, condition, or machine-fitment claim.
