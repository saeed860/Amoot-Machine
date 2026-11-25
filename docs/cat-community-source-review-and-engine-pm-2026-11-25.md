# بررسی منابع تکمیلی کاتالوگ Cat و استخراج موتور — 2026-11-25

## نتیجه بررسی منابع معرفی‌شده

### MHH AUTO
- موضوع «CAT SIS 01.2018 FREE FOR ALL» پیدا شد.
- صفحه انجمن وجود یک فایل RAR ضمیمه را نشان می‌دهد، اما رمز از طریق پیام خصوصی ارائه می‌شود.
- این منبع فعلاً فقط سرنخ برای کشف مدل‌ها/شناخت ساختار SIS است؛ هیچ فایل SIS دانلود یا بازنشر نشده و هیچ شماره‌قطعه‌ای از آن وارد Master نشده است.
- موضوعات SIS 2019 و نسخه‌های قدیمی نیز وجود دارند، اما اعتبار و مجوز توزیع فایل‌ها از خود صفحه اثبات نمی‌شود.
- منابع: https://mhhauto.com/Thread-CAT-SIS-01-2018-FREE-FOR-ALL-MHHAUTO و https://mhhauto.com/Thread-CAT-SIS-2019-works-slowly

### HeavyEquipmentForums
- جستجوی هدفمند برای 287B و لینک کاتالوگ، نتیجه‌ای که بتواند شماره‌قطعه و سریال‌بندی را مستقلاً تأیید کند به دست نداد.
- تا زمان یافتن تاپیک دقیق، هیچ داده‌ای از این انجمن وارد Master نشود.

### ACMOC
- Library Index رسمی ACMOC تعداد 1,742 سند را نشان می‌دهد و شامل چندین Parts Catalog برای D4 و ماشین‌آلات قدیمی است.
- فهرست قابل مشاهده است، اما متن صفحه تصریح می‌کند دسترسی کامل به اسناد با عضویت ACMOC فراهم می‌شود.
- برای پروژه آموت به‌عنوان منبع بالقوه مدل‌های قدیمی ثبت شد؛ هنوز هیچ شماره‌قطعه‌ای از فایل‌های پشت عضویت استخراج نشده است.
- منابع: https://acmoc.org/library-index و https://acmoc.org/

### TrackLoaderParts — Caterpillar 287B
- صفحه اختصاصی 287B و مسیرهای Parts Diagrams، Rubber Tracks، Undercarriage، Attachments، Filters، Lubricants و Free Manuals موجود است.
- صفحه دیاگرام عمومی، ساختار دسته‌بندی را نشان می‌دهد اما در استخراج متنی بررسی‌شده شماره‌قطعات/جداول قطعه قابل خواندن نبود.
- بنابراین فقط به‌عنوان منبع راهنمای دسته‌بندی و سرنخ کاتالوگ ثبت شد؛ هیچ پارت‌نامبری از آن به‌عنوان Cat OEM تأیید نشده است.
- منابع: https://www.trackloaderparts.com/online-parts/caterpillar-parts/mtl/caterpillar-287-series/caterpillar-287b.html و https://www.trackloaderparts.com/caterpillar-287b-parts-diagrams1.html

### CR Components — سرنخ‌های aftermarket برای 287B
- یک صفحه فروشنده برای CAT 287B، SKU فروشنده CR704244 را به‌عنوان جایگزین کیت Cat 268-1928 معرفی می‌کند و موتورهای درایو 220-8142 و 280-7864 را ذکر می‌کند.
- همان صفحه SKU فروشنده CR705165 را جایگزین شماره Cat 190-6534 معرفی می‌کند.
- این دو ردیف باید فقط در بخش aftermarket/cross-reference نگهداری شوند؛ SKUهای CR شماره OEM نیستند و فیتمنت/سریال باید با کاتالوگ رسمی Cat کنترل شود.
- فایل سرنخ‌های ثبت‌شده: `data/cat-287b-aftermarket-cross-reference-leads-2026-11-25.csv` (4 رکورد، همگی با انتساب aftermarket و بدون ورود به Master OEM)\n- منبع: https://crcomponents.com/track-loader-parts/cat/287b/

## داده رسمی موتور / PM kit
- Cat Parts Store صفحه 606-1786 را با عنوان «C15 - 500 Hours PM Kit» منتشر کرده و محتویات آن را فهرست می‌کند: 1R-0762 (Engine Fuel Filter)، 1R-1808 (Engine Oil Filter)، 423-8525 (Water Separator and Fuel Filter).
- ناسازگاری مهم: پنل Compatible Models در همان صفحه «GENERATOR SET / XQP300 C9 GEN SET C9» را نشان می‌دهد، درحالی‌که عنوان کیت C15 است.
- به همین دلیل رکوردها در CSV با وضعیت REVIEW_REQUIRED_MODEL_CONFLICT یا OFFICIAL_COMPONENT_LISTED_PARENT_FITMENT_CONFLICT ذخیره شده‌اند. این اطلاعات نباید به‌عنوان فیتمنت قطعی C15 نمایش داده شود.
- 423-8525 به فهرست مرکزی Cat OEM اضافه شد چون خود صفحه رسمی Cat آن را به‌عنوان جزء کیت فهرست کرده است؛ اما تناقض مدل همچنان باز است.
- منبع: https://parts.cat.com/en/catcorp/product/606-1786

## کنترل Master و فایل ورودی
- Master: data/cat-official-part-numbers.txt
- فایل ورودی جدید: data/cat-master-mirror-2026-11-25.txt
- تعداد مورد انتظار: 1,541 شماره یکتا در Master؛ فایل mirror باید با Master برابر باشد.
- CSV تکمیلی: data/cat-engine-pm-kit-source-verification-2026-11-25.csv
- این فایل‌ها فقط آماده‌سازی داده هستند؛ هیچ ادعایی مبنی بر آپلود داده در حساب Offroad Equipment وجود ندارد.

## استخراج رسمی موتور — دور تکمیلی 2026-11-25
چهار شماره جدید با صفحه محصول رسمی Cat تأیید شدند و به Master اضافه شدند:
- 20R-0638 — Cat Reman Platinum Engine Overhaul Kit (C7)، کاربرد پیشنهادی و مدل Truck Engine C7؛ صفحه رسمی نسبت تراکم 16.5:1 را نیز ذکر می‌کند.
- 276-3104 — Fuel Filter Wiring Harness؛ مدل‌های C13 و C11/C13 در صفحه رسمی آمده‌اند.
- 322-2733 — External Sensors Engine Harness؛ مدل Industrial Engine C7 در فهرست سازگاری است.
- 557-7633 — Injector Group؛ مدل‌های Engine/Industrial Engine/Petroleum Engine C9 در فهرست سازگاری است.
- جزئیات و وضعیت بررسی در `data/cat-engine-parts-official-verification-2026-11-25.csv` ثبت شده است. شماره سریال/Arrangement همچنان برای fitment نهایی الزامی است.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/20R-0638 ، https://parts.cat.com/en/catcorp/product/276-3104 ، https://parts.cat.com/en/catcorp/product/322-2733 ، https://parts.cat.com/en/catcorp/product/557-7633

## استخراج رسمی تکمیلی موتور — دور دوم 2026-11-25
پنج شماره دیگر از صفحات رسمی Cat بررسی و ثبت شدند:
- 188-9429 — دسته‌سیم سنسور سرعت 18AWG؛ کاربرد C18 در Marine Engine و Petroleum Package.
- 359-7434 — مجموعه انژکتور؛ کاربردهای C15 و C18.
- 20R-1304 — انژکتور Reman رسمی Cat و جایگزین معرفی‌شده برای 359-7434؛ رکورد مستقل از قطعه نو.
- 4N-0827 — آداپتور فیلتر روغن؛ کاربرد C15 در Marine Engine.
- 483-0979 — دیفیوزر خروجی توربوشارژر؛ کاربردهای Industrial Engine C13/C15/C9.3/C18.
- جزئیات و محدودیت fitment در `data/cat-engine-parts-official-verification-2026-11-25.csv` ثبت شد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/188-9429 ، https://parts.cat.com/en/catcorp/product/359-7434 ، https://parts.cat.com/en/catcorp/product/20R-1304 ، https://parts.cat.com/en/catcorp/product/4N-0827 ، https://parts.cat.com/en/catcorp/product/483-0979

## قواعد حفظ کیفیت داده
1. شماره‌های فروشنده و aftermarket وارد Master OEM نشوند.
2. Kit number با قطعات داخل کیت یکی تلقی نشود.
3. مدل مندرج در عنوان محصول، به‌تنهایی فیتمنت نیست؛ Compatible Models و serial number مقدم‌اند.
4. منبع انجمنی بدون شماره‌قطعه قابل بررسی، صرفاً Lead است.
5. برای هر فیتمنت قطعی، سریال کامل/پیشوند سریال و پیکربندی دستگاه نگهداری شود.


## استخراج رسمی جدید — دور تکمیلی ۲۵ نوامبر ۲۰۲۶

در دور تکمیلی، ۱۵ شماره یکتای دیگر از صفحات رسمی Cat Parts Store یا فهرست اجزای یک کیت رسمی شناسایی شد. این مجموعه شامل دسته‌سیم‌های 584-8549، 443-3059، 388-0352 و 464-0710؛ انژکتورهای Reman و نو خانواده C7 شامل 20R-8067، 20R-5081، 557-7627، 387-9428 و 387-9426؛ کیت PM شماره 610-3583 و چهار جزء درج‌شده در آن (130-4678، 360-8960، 462-1171، 439-5037)؛ و آداپتور فیلتر روغن 292-8185 است.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/584-8549
- https://parts.cat.com/en/catcorp/product/443-3059
- https://parts.cat.com/en/catcorp/product/388-0352
- https://parts.cat.com/en/catcorp/product/464-0710
- https://parts.cat.com/en/catcorp/product/20R-8067
- https://parts.cat.com/en/catcorp/product/20R-5081
- https://parts.cat.com/en/catcorp/product/557-7627
- https://parts.cat.com/en/catcorp/product/387-9428
- https://parts.cat.com/en/catcorp/product/387-9426
- https://parts.cat.com/en/catcorp/product/610-3583
- https://parts.cat.com/en/catcorp/product/292-8185

ملاحظة تدقيقية: 130-4678 و360-8960 و462-1171 و439-5037 در این دور از فهرست رسمی اقلام داخل کیت 610-3583 تأیید شده‌اند؛ برای این چهار مورد، صفحه کیت منبع اثبات عضویت در کیت است و نباید فیتمنت مستقل فراتر از C7.1 Generator Set از آن استنباط شود. برای 443-3059 و 292-8185 نیز هویت/شرح قطعه تأیید شده، اما مدل سازگار در داده بازیابی‌شده کافی نیست؛ فیتمنت آنها باز می‌ماند.

## اصلاح یکپارچگی Master و Mirror

بازبینی ۲۵ نوامبر نشان داد فایل Master دارای ۱٬۷۴۶ شماره یکتا بوده، در حالی که Mirror قدیمی فقط ۱٬۵۴۶ شماره داشته و ۲۰۰ شماره از Master را جا انداخته بود. Mirror در این commit به نسخه کامل Master همسان‌سازی شد. از ۱۵ شماره بررسی‌شده، ۱۲ شماره جدید و یکتا به Master افزوده شد؛ سه شماره از قبل موجود بودند. شمارش جدید ۱٬۷۵۸ شماره یکتا است.


## استخراج قطعات ماشین‌آلات — گریدر، لودر و 287B (25 Nov 2026)

در این دور، 24 شماره از صفحات رسمی Cat Parts Store شناسایی شد؛ پس از حذف تکراری‌ها، 24 شماره جدید به Master افزوده شد. داده‌ها در فایل مستقل `data/cat-machine-parts-official-verification-2026-11-25.csv` ثبت شده‌اند.

### خانواده‌های پوشش‌داده‌شده
- گریدرها: 4Z-8785، 140-6790، 346-3285، 232-2146، 9W-2330، 5D-9561.
- لودرهای چرخ‌دار: 7T-5964، 109-9212، 7T-5962، 132-1089، 138-0676، 8E-5793، 138-6545، 511-4935.
- لودرهای زنجیری: 1U-0600، 4T-6697، 140-6866، 4T-8085، 4T-8084، 308-4325.
- مدل 287B: 289-3787 (لوله انتقال سیال)، 218-6822 (کیت آب‌بند سیلندر tilt)، 289-3779 (لوله‌های سیلندر lift)، 164-9989 (برچسب شناسایی مدل).

### منابع رسمی منتخب
- https://parts.cat.com/en/catcorp/product/4Z-8785
- https://parts.cat.com/en/catcorp/product/140-6790
- https://parts.cat.com/en/catcorp/product/346-3285
- https://parts.cat.com/en/catcorp/232-2146
- https://parts.cat.com/en/catcorp/product/9W-2330
- https://parts.cat.com/en/catcorp/product/7T-5964
- https://parts.cat.com/en/catcorp/product/109-9212
- https://parts.cat.com/en/catcorp/product/1U-0600
- https://parts.cat.com/en/catcorp/product/4T-6697
- https://parts.cat.com/en/catcorp/product/289-3787
- https://parts.cat.com/en/catcorp/product/218-6822
- https://parts.cat.com/en/catcorp/product/289-3779
- https://parts.cat.com/en/catcorp/product/164-9989

نکته: صفحات Cat مدل‌های سازگار را فهرست می‌کنند، اما Cat نیز هشدار می‌دهد تغییر پیکربندی دستگاه ممکن است سازگاری را تغییر دهد. بنابراین سریال/ترتیب ساخت، شماره گروه قطعه، موقعیت (LH/RH/Center)، ابعاد و الگوی پیچ باید پیش از سفارش کنترل شوند. شماره‌های بالا OEM هستند؛ هیچ شماره aftermarket در Master ادغام نشده است.


## تکمیل رسمی 287B و اصلاح شمارنده — 25 Nov 2026

در بررسی صفحات رسمی Cat Parts Store، 9 شماره جدید با نمایش صریح 287B در بخش Compatible Models تأیید و به Master اضافه شد. شماره 289-3787 از قبل در Master وجود داشت و دوباره شمرده نشد.

| Part Number | شرح رسمی | مدل‌های سازگار نمایش‌داده‌شده |
|---|---|---|
| 289-3765 | Hydraulic Lift Cylinder Tube Assembly | 287B، 252B3، 268B، 262B، 252B |
| 289-3763 | Lift Cylinder Lines Tube | 287B، 252B3، 268B، 262B، 252B |
| 233-5698 | Fluid Carrying Tube Assembly | 287B، 252B3، 268B، 262B، 252B |
| 238-7722 | Plate | 287B، 287 |
| 199-2129 | Cap | 277B، 267B، 287B و مدل‌های دیگر |
| 257-7386 | 287 Series Skid Steer Loader Rear Axle | 287B |
| 233-5479 | Camshaft | 277B، 267B، 287C، 277C، 287B، 297C و مدل‌های دیگر |
| 230-3733 | 355.6mm Outer Diameter Idler Wheel | 277B، 267B، 287B، 267، 277، 287 |
| 239-9257 | Warning Film | 277B، 267B، 287C، 277C، 287B، 257B، 247B، 297C |

فایل بررسی: `data/cat-287b-official-parts-verification-2026-11-25.csv`

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/289-3765
- https://parts.cat.com/en/catcorp/product/289-3763
- https://parts.cat.com/en/catcorp/product/233-5698
- https://parts.cat.com/en/catcorp/product/238-7722
- https://parts.cat.com/en/catcorp/product/199-2129
- https://parts.cat.com/en/catcorp/product/257-7386
- https://parts.cat.com/en/catcorp/product/233-5479
- https://parts.cat.com/en/catcorp/product/230-3733
- https://parts.cat.com/en/catcorp/product/239-9257

### شمارش نهایی فعلی
Master پس از این دور 2,106 شماره یکتا دارد. فایل Mirror نیز پس از همسان‌سازی مجدد دقیقاً 2,106 شماره یکتا دارد و اختلاف مجموعه‌ای آن‌ها صفر است. شمارنده توضیحی workflow دستی نیز از 2,044 به 2,097 و سپس 2,106 به‌روز شد. این عدد تعداد شماره‌های فهرست است، نه تعداد قطعات دارای فیتمنت کامل یا موجودی قابل سفارش.


### دور دوم تکمیلی 287B — هشت شماره دیگر

در جستجوی صفحات رسمی Cat، هشت شماره دیگر با سازگاری صریح 287B پیدا شد و در CSV بررسی ثبت شد:
- 239-5010 — Service Kit-MSS؛ صفحه کیت قطعات همراه را نمایش نمی‌دهد.
- 233-5633 — Film؛ شرح قطعه در صفحه کامل نشده است.
- 158-6694 — پنل نشانگر و هشدار سمت چپ اپراتور.
- 142-9328 — کلید راکری چراغ کار جلو، دارای LED و شش ترمینال.
- 294-5520 — Stay.
- 289-3766 — Lift Cylinder Lines Tube Assembly، شامل اتصال ORFS.
- 371-2760 — Hydraulic Cylinder Seal Kit؛ صفحه Cat هفت جزء آب‌بندی را در کیت فهرست می‌کند.
- 230-3687 — مجموعه کامل سیلندر هیدرولیک؛ **Discontinued** و نباید به‌عنوان کالای قابل سفارش فعلی نمایش داده شود.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/239-5010
- https://parts.cat.com/en/catcorp/product/233-5633
- https://parts.cat.com/en/catcorp/product/158-6694
- https://parts.cat.com/en/catcorp/product/142-9328
- https://parts.cat.com/en/catcorp/product/294-5520
- https://parts.cat.com/en/catcorp/product/289-3766
- https://parts.cat.com/en/catcorp/product/371-2760
- https://parts.cat.com/en/catcorp/product/230-3687

فایل کامل بررسی این دو دور: `data/cat-287b-official-parts-verification-2026-11-25.csv`. مجموعاً 17 شماره در این دو دور به Master اضافه شد (9 + 8). تعداد فعلی Master و Mirror هر دو 2,114 شماره یکتا و دقیقاً همسان است. در این تعداد، وضعیت توقف تولید یا تکمیل‌نبودن شرح بعضی اقلام حفظ شده و به معنی موجودی یا سفارش‌پذیری نیست.


## دور سوم استخراج رسمی 287B — هیدرولیک و کنترل اپراتور

در این مرحله 10 شماره جدید از صفحات رسمی Cat Parts Store که 287B را صریحاً در Compatible Models فهرست کرده‌اند، ثبت شد:
- 267-3766 — Hydraulic Cylinder Seal Kit؛ کاربرد کیت وابسته به شماره گروه سیلندر است.
- 225-9521 — مجموعه کامل سیلندر هیدرولیک.
- 177-1958 — Hydraulic Cylinder Seal Kit؛ صفحه فعلاً اقلام داخل کیت را نمایش نمی‌دهد.
- 286-3591 — Hydraulic Cylinder Seal Kit؛ اقلام داخل کیت در صفحه نمایش داده نشده‌اند.
- 382-6243 — Hydraulic Cylinder Seal Kit؛ سازگاری با 287B و 297C درج شده است.
- 218-6824 — Hydraulic Cylinder Seal Kit؛ سازگاری با 287B، 287C، 277C و 297C درج شده است.
- 158-3770 — Lever Kit برای Pilot Valve؛ شامل lever، pin و nut.
- 154-5018 — مجموعه کامل سیلندر هیدرولیک؛ **Discontinued** و فقط برای استعلام جایگزین نزد نمایندگی.
- 278-1970 — Hydraulic Cylinder Seal Kit؛ کاربرد وابسته به گروه سیلندر.
- 313-6251 — Hydraulic Pilot Control Valve Joint Kit؛ صفحه Cat یک قلم 313-6656 Plate Assembly با تعداد 3 را در محتویات نشان می‌دهد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/267-3766
- https://parts.cat.com/en/catcorp/product/225-9521
- https://parts.cat.com/en/catcorp/product/177-1958
- https://parts.cat.com/en/catcorp/product/286-3591
- https://parts.cat.com/en/catcorp/product/382-6243
- https://parts.cat.com/en/catcorp/product/218-6824
- https://parts.cat.com/en/catcorp/product/158-3770
- https://parts.cat.com/en/catcorp/product/154-5018
- https://parts.cat.com/en/catcorp/product/278-1970
- https://parts.cat.com/en/catcorp/product/313-6251

فایل بررسی به 27 ردیف داده رسید: `data/cat-287b-official-parts-verification-2026-11-25.csv`. شمارنده Master و Mirror در زمان ثبت این دور، هر دو 2,209 شماره یکتا و دقیقاً همسان بودند. دو مورد 230-3687 و 154-5018 در داده حفظ شده‌اند، اما به‌علت Discontinued بودن نباید موجودی قابل سفارش تلقی شوند. برای Seal Kitها شماره گروه سیلندر، موقعیت و شماره سریال دستگاه باید قبل از پیشنهاد قطعه بررسی شود.


## دور چهارم — قطعات مشترک 287B و 297C

شش شماره دیگر از صفحات رسمی Cat Parts Store تأیید شد و به فهرست OEM افزوده شد:
- 253-6949 — Hydraulic Cylinder Seal Kit؛ Compatible Models شامل 287B و 297C است.
- 371-2737 — Hydraulic Cylinder Seal Kit - Standard Size؛ شامل 287B و 297C.
- 219-5431 — Hydraulic Cylinder Seal Kit؛ شامل 287B و 297C.
- 647-3710 — Cylinder Seal Kit؛ Cat تصریح می‌کند فقط به‌صورت بسته کامل عرضه می‌شود.
- 215-3273 — Cartridge Assembly؛ شامل 287B در Compatible Models.
- 279-5437 — Bucket Assembly؛ شامل 287B و 297C.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/253-6949
- https://parts.cat.com/en/catcorp/product/371-2737
- https://parts.cat.com/en/catcorp/product/219-5431
- https://parts.cat.com/en/catcorp/product/647-3710
- https://parts.cat.com/en/catcorp/product/215-3273
- https://parts.cat.com/en/catcorp/product/279-5437

برای تمام Seal Kitها باید شماره گروه سیلندر و شماره سریال دستگاه پیش از سفارش کنترل شود. داده این دور در همان CSV بررسی 287B نگهداری شد؛ تعداد ردیف‌های CSV اکنون 33 است. Master و Mirror هر دو 2,215 شماره یکتا دارند و پس از همسان‌سازی، مجموعه شماره‌ها دقیقاً برابر است. شمارنده Workflow دستی نیز 2,215 است.


## دور پنجم — پمپ‌ها و زیربندی 287B/297C (25 Nov 2026)

در صفحات رسمی Cat Parts Store، 12 شماره جدید با نمایش صریح مدل 287B یا 297C در Compatible Models تأیید و به Master افزوده شد:

| Part Number | شرح | مدل صریح در صفحه Cat |
|---|---|---|
| 117-7251 | 35mm Internal Diameter Roller Bearing | 267;277B;287;267B;277;287B |
| 204-1457 | Drive Pump Speed-Sensing Valve | 247;267;277B;267B;287B;257B;247B;257;277 |
| 238-7709 | Undercarriage Frame Bracket | 287B;287 |
| 258-3465 | 21cc Gear Pump | 297C;299C;272C |
| 258-3521 | Hydraulic Gear Pump | 297C;299C;272C |
| 258-3877 | 31.75mm Inner Diameter Hydrostatic Pump Hose | 297C;299C;272C |
| 258-3894 | Hydraulic Pump Lines Hose | 297C;299C;272C |
| 258-7686 | Tie Rod Kit | 277B;287B;297C;plus additional models |
| 283-9476 | 25.4mm Inner Diameter Hydraulic Pump Hose | 287B;248B;268B |
| 348-5974 | Piston Pump Control Valve | 277C2;287C;277C;297C;287C2;additional models |
| 598-8111 | 14 Teeth Piston Pump Drive Shaft | 277B;267B;287B;257B;247B;247B3;257B3;additional models |
| 6E-0725 | Piston Pump Rotating Roller | 277B;267B;257B;247B;267;257;287;277;247;247B3;287B;additional models |

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/117-7251
- https://parts.cat.com/en/catcorp/product/204-1457
- https://parts.cat.com/en/catcorp/product/238-7709
- https://parts.cat.com/en/catcorp/product/258-3465
- https://parts.cat.com/en/catcorp/product/258-3521
- https://parts.cat.com/en/catcorp/product/258-3877
- https://parts.cat.com/en/catcorp/258-3894
- https://parts.cat.com/en/catcorp/product/258-7686
- https://parts.cat.com/en/catcorp/product/283-9476
- https://parts.cat.com/en/catcorp/product/348-5974
- https://parts.cat.com/en/catcorp/product/598-8111
- https://parts.cat.com/en/catcorp/product/6E-0725

نکات فیتمنت: شش شماره 117-7251، 204-1457، 238-7709، 283-9476، 598-8111 و 6E-0725 مدل 287B را صریحاً نشان می‌دهند؛ شماره‌های 258-3465، 258-3521، 258-3877، 258-3894 و 348-5974 در این بازیابی برای 297C تأیید شدند و نباید به 287B تعمیم داده شوند. 258-7686 برای 277B/287B/297C فهرست شده اما صفحه فعلاً محتویات کیت را نشان نمی‌دهد. شماره گروه/آرایش پمپ، مسیر شیلنگ، اتصالات، محل نصب و سریال دستگاه باید پیش از سفارش کنترل شود.

پس از افزودن این 12 شماره، Master دارای 2,256 شماره یکتا است. Mirror با محتوای Master دقیقاً همسان‌سازی شد. فایل CSV بررسی 287B/297C اکنون 45 ردیف داده دارد. این شمارش، تعداد شماره‌های فهرست است و به‌معنای موجودی یا سفارش‌پذیری نیست.


## دور ششم — خنک‌کاری و هیدرولیک 287B/297C (25 Nov 2026)

شش شماره جدید از صفحات رسمی Cat Parts Store با Compatible Models صریح تأیید و به Master اضافه شد:
- 122-6871 — Hose-Hydraulic؛ مدل‌های 277B، 267B و 287B.
- 233-5997 — Hydraulic Tank Hose؛ مدل‌های 277B، 267B و 287B.
- 234-4801 — Engine Oil Cooler Cover؛ مدل‌های 287B و 297C هر دو درج شده‌اند.
- 258-2552 — 9 Blade Aftercooler Fan؛ مدل 297C.
- 278-8720 — Motor Group-Fan؛ مدل 297C.
- 280-7864 — Radial Piston Motor؛ مدل‌های 277B، 267B و 287B.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/122-6871
- https://parts.cat.com/en/catcorp/product/233-5997
- https://parts.cat.com/en/catcorp/product/234-4801
- https://parts.cat.com/en/catcorp/product/258-2552
- https://parts.cat.com/en/catcorp/product/278-8720
- https://parts.cat.com/en/catcorp/product/280-7864

036-1865 نیز در همان جست‌وجو به‌عنوان Radiator Cap برای 287B و 297C تأیید شد، اما از قبل در Master وجود داشت و دوباره اضافه نشد. 305-9256 نیز در نتایج کیت زیربندی 287B با 12 قلم قطعه ظاهر شد؛ این شماره هم از قبل در Master ثبت شده است. وضعیت Discontinued اجزای کیت، از جمله 261-6296، باید جداگانه حفظ شود.

پس از این دور Master و Mirror هر دو 2,262 شماره یکتا دارند؛ شش شماره جدید در CSV بررسی ثبت شدند. شماره‌ها فیتمنت‌های صریح صفحه Cat را منعکس می‌کنند و جایگزین بررسی سریال، آرایش، اتصالات و محل نصب نیستند.


## دور هفتم — خنک‌کاری، فیلتر و شیلنگ‌های 287B/297C (25 Nov 2026)

12 شماره دیگر از صفحات رسمی Cat Parts Store با مدل‌های صریح در Compatible Models تأیید شد:
- 587-4391 — Pump Group-Water؛ 287B و 297C.
- 226-0291 — Radiator and Fan Lock؛ 287B و 297C.
- 234-4802 — Engine Oil Cooler Cover؛ 287B و 297C.
- 234-4803 — Engine Oil Cooler Element؛ 287B و 297C.
- 252-0412 — Medium Pressure Hydraulic Hose Assembly؛ 287B.
- 361-4660 — Oil Cooler؛ 297C (نه 287B).
- 1R-0734 — Advanced Efficiency Engine Oil Filter؛ 287B و 297C.
- 235-4960 — Thermostat؛ 287B و 297C.
- 103-9747 — Water Pump Side Cover؛ 287B و 297C.
- 229-8796 — Radiator Blower Fan Adapter؛ 287B و 297C.
- 336-9856 — Engine Oil Cooler Gasket؛ 287B و 297C.
- 234-4798 — M8x1.25 Engine Oil Cooler Cover Stud؛ 287B و 297C.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/587-4391
- https://parts.cat.com/en/catcorp/product/226-0291
- https://parts.cat.com/en/catcorp/product/234-4802
- https://parts.cat.com/en/catcorp/product/234-4803
- https://parts.cat.com/en/catcorp/product/252-0412
- https://parts.cat.com/en/catcorp/product/361-4660
- https://parts.cat.com/en/catcorp/product/1R-0734
- https://parts.cat.com/en/catcorp/product/235-4960
- https://parts.cat.com/en/catcorp/product/103-9747
- https://parts.cat.com/en/catcorp/product/229-8796
- https://parts.cat.com/en/catcorp/product/336-9856
- https://parts.cat.com/en/catcorp/product/234-4798

فیتمنت 361-4660 فقط برای 297C از این جست‌وجو تأیید شد؛ آن را به 287B تعمیم ندهید. برای شیلنگ 252-0412 قطر داخلی 0.375 اینچ و طول کلی 26.85 اینچ در صفحه Cat درج شده است؛ اتصالات و مسیر واقعی باید با دستگاه کنترل شود. سایر اقلام نیز به تأیید شماره سریال، پیکربندی موتور/خنک‌کننده و نسخه قطعه نیاز دارند.

Master پس از این دور 2,274 شماره یکتا دارد و Mirror با آن همسان شد. CSV بررسی اکنون 63 ردیف داده دارد. این فهرست اثبات موجودی یا سفارش‌پذیری نیست.


## همسان‌سازی شمارنده — 25 Nov 2026

در بازبینی نهایی، Master به‌صورت هم‌زمان توسط commit دیگری نیز توسعه یافته بود و شمارش آن به 2,315 شماره یکتا رسیده بود. Mirror در این مرحله دوباره مستقیماً از محتوای Master همسان شد و شمارنده Workflow نیز به همین عدد تغییر کرد. این یادداشت صرفاً شمارش جاری فایل را ثبت می‌کند و ادعایی درباره منشأ 41 شماره اضافه‌شده خارج از batchهای مستند این گزارش ندارد.


## دور هشتم — شیلنگ‌های فشارقوی، فیلتر و خنک‌کاری (25 Nov 2026)

هفت شماره جدید از صفحات رسمی Cat Parts Store با فهرست صریح Compatible Models ثبت شد:
- 159-4536 — شیلنگ فشارقوی 0.375in؛ 287B و 297C.
- 177-1912 — شیلنگ فشارقوی 0.375in؛ 287B و 297C.
- 231-0124 — شیلنگ فشارقوی 0.625in؛ 287B و 297C.
- 234-4826 — Engine Oil Filter Union؛ 287B و 297C.
- 258-3851 — شیلنگ فشارقوی 0.75in؛ فقط 297C در فهرست بازیابی‌شده.
- 258-3662 — شیلنگ Water Separator/Fuel Filter؛ فقط 297C در فهرست بازیابی‌شده.
- 361-9869 — شیلنگ خنک‌کننده؛ فقط 297C در فهرست بازیابی‌شده.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/159-4536
- https://parts.cat.com/en/catcorp/product/177-1912
- https://parts.cat.com/en/catcorp/product/231-0124
- https://parts.cat.com/en/catcorp/product/234-4826
- https://parts.cat.com/en/catcorp/product/258-3851
- https://parts.cat.com/en/catcorp/product/258-3662
- https://parts.cat.com/en/catcorp/product/361-9869

ابعاد ثبت‌شده در صفحات Cat: 159-4536 قطر داخلی 0.375in و طول 32.52in؛ 177-1912 قطر داخلی 0.375in و طول 54.724in؛ 231-0124 قطر داخلی 0.625in و طول 79.528in؛ 258-3851 قطر داخلی 0.75in و طول 72.638in. پیش از سفارش، طول واقعی، نوع سرشیلنگ، فشار کاری و مسیر نصب کنترل شود. شماره‌های 258-3851، 258-3662 و 361-9869 به 287B تعمیم داده نمی‌شوند.

در لحظه ثبت این دور، Master دارای 2,368 شماره یکتا است. Mirror، CSV و Workflow باید با شمارنده جاری کنترل شوند؛ تعداد Master ممکن است با تغییرات هم‌زمان تغییر کند.


## دور نهم — زیربندی، سوخت و مدار هیدرولیک (25 Nov 2026)

هفت شماره دیگر از صفحات رسمی Cat Parts Store ثبت شد:
- 261-6150 — Sprocket؛ 287B و 287؛ 12 دندانه و Track Pitch برابر 3.937in.
- 218-5838 — Hydraulic Control Lines Tube Assembly؛ مدل 287B.
- 361-9555 — Fuel Water Separator؛ 297C در فهرست مدل‌ها.
- 233-9856 — Fuel Water Separator؛ 287B و 297C.
- 349-5327 — Electric Priming Fuel Filter؛ 297C در فهرست مدل‌ها.
- 200-2371 — Seal Kit؛ 287B و 297C در فهرست مدل‌ها؛ بدون تأیید گروه/کاربرد خاص سفارش داده نشود.
- 590-8957 — M18x1.5 Metric Flat Face Port Internal Hex Plug؛ 297C در فهرست مدل‌ها.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/261-6150
- https://parts.cat.com/en/catcorp/product/218-5838
- https://parts.cat.com/en/catcorp/product/361-9555
- https://parts.cat.com/en/catcorp/product/233-9856
- https://parts.cat.com/en/catcorp/product/349-5327
- https://parts.cat.com/en/catcorp/product/200-2371
- https://parts.cat.com/en/catcorp/product/590-8957

261-6296 در صفحه رسمی Cat به‌عنوان Track Roller برای 287B دیده شد اما وضعیت آن صریحاً Discontinued است؛ بنابراین دوباره به‌عنوان قطعه جدید یا قابل سفارش وارد Master نشد. 258-2405 نیز پمپ هیدرولیک با وضعیت Discontinued است و به همین دلیل ثبت جدید نشد. اقلام 297C-only نباید به 287B تعمیم داده شوند. برای قطعات زیربندی، گام زنجیر، نوع UC system، آرایش و شماره سریال کنترل شود.

در زمان ثبت، Master دارای 2,413 شماره یکتا است. این عدد ممکن است به‌دلیل به‌روزرسانی‌های هم‌زمان تغییر کند؛ Mirror و Workflow باید دقیقاً از Master جاری همسان شوند.


## دور دهم — کنترل هیدرواستاتیک، کشش زنجیر و سوخت (25 Nov 2026)

10 شماره جدید با فیتمنت صریح در صفحات رسمی Cat Parts Store ثبت شد:
- 233-5598 — Hydrostatic Control Drive Tube Assembly؛ 287B.
- 8I-5078 — Hydraulic Control Valve O-Ring Seal؛ 287B.
- 231-7299 — Hydraulic Control Valve Spool؛ 287B و 297C.
- 204-1472 — Hydraulic Control Valve Cap Seal O-Ring؛ 287B و 297C.
- 252-0327 — Track Tensioner Shaft؛ 287B.
- 287-8753 — Hydraulic Control Valve Screen؛ 287B و 297C.
- 207-9729 — Fuel Separator؛ 287B.
- 218-5839 — Hydraulic Control Lines Tube Assembly؛ 287B.
- 210-0825 — Track Tensioner Group؛ 287B.
- 141-4999 — Tooth Group؛ 287B و 297C.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/233-5598
- https://parts.cat.com/en/catcorp/product/8I-5078
- https://parts.cat.com/en/catcorp/product/231-7299
- https://parts.cat.com/en/catcorp/product/204-1472
- https://parts.cat.com/en/catcorp/product/252-0327
- https://parts.cat.com/en/catcorp/product/287-8753
- https://parts.cat.com/en/catcorp/product/207-9729
- https://parts.cat.com/en/catcorp/product/218-5839
- https://parts.cat.com/en/catcorp/product/210-0825
- https://parts.cat.com/en/catcorp/product/141-4999

برای 8I-5078 و 204-1472، محل دقیق آب‌بندی در شماتیک شیر باید مشخص شود؛ برای 231-7299 نوع شیر و نسخه اسپول؛ برای 233-5598 و 218-5839 مسیر و اتصالات لوله؛ برای 252-0327 و 210-0825 آرایش کشنده زنجیر؛ و برای 141-4999 سری دندانه و نوع باکت باید با شماره سریال/گروه دستگاه تطبیق داده شود. فیتمنت 297C-only به 287B تعمیم داده نشده است.

Master در زمان این ثبت 2,423 شماره یکتا دارد. Mirror و شمارنده Workflow با Master جاری همسان‌سازی شدند.


## دور یازدهم — کشنده زنجیر، پمپ سوخت و شیر کنترل (25 Nov 2026)

هشت شماره جدید از صفحات رسمی Cat Parts Store ثبت شد:
- 238-7712 — Track Tensioner Group؛ 287B.
- 252-0339 — 1-1/4in Track Tensioner Shaft؛ 287B.
- 231-7297 — Control Valve Spool Support Spring؛ 287B و 297C.
- 144-4532 — Hydraulic Control Check Valve Plug؛ 287B و 297C.
- 232-5877 — Electric Fuel Priming Pump؛ 287B.
- 258-2881 — Work Tool Positioner Hydraulic Tube؛ 297C (نه 287B).
- 336-1325 — Implement Control Valve Group؛ 297C (نه 287B).
- 180-8071 — Hydraulic Control Valve Plug؛ 297C (نه 287B).

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/238-7712
- https://parts.cat.com/en/catcorp/product/252-0339
- https://parts.cat.com/en/catcorp/product/231-7297
- https://parts.cat.com/en/catcorp/product/144-4532
- https://parts.cat.com/en/catcorp/product/232-5877
- https://parts.cat.com/en/catcorp/product/258-2881
- https://parts.cat.com/en/catcorp/product/336-1325
- https://parts.cat.com/en/catcorp/product/180-8071

فیتمنت سه قطعه 258-2881، 336-1325 و 180-8071 فقط برای 297C در این بازیابی تأیید شد؛ به 287B تعمیم داده نشود. پمپ 232-5877 شامل اتصالات، فیلتر، retaining ring و bowl است؛ سوکت برق و آرایش نصب باید تطبیق داده شود. قطعات کشنده زنجیر نیز با شماره سریال و مجموعه زیربندی کنترل شوند.

Master هنگام ثبت 2,431 شماره یکتا داشت؛ Mirror و Workflow با Master جاری همسان شدند.


## دور دوازدهم — شیرهای کنترل هیدرولیک 287B (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store با درج صریح 287B در Compatible Models تأیید و ثبت شد:
- 233-7128 — Quick Coupler Valve؛ 287B در فهرست مدل‌ها درج شده است.
- 299-9120 — 9/16in Hydraulic Pilot Control Valve؛ 287B در فهرست مدل‌ها درج شده است.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/233-7128
- https://parts.cat.com/en/catcorp/product/299-9120

برای 233-7128 نوع کوپلر و پورت‌های هیدرولیک و برای 299-9120 مدار پایلوت، پورت‌ها و شماره سریال دستگاه پیش از سفارش کنترل شود. این ثبت صرفاً تأیید حضور مدل در فهرست Cat است و به‌تنهایی سازگاری با هر پیکربندی را تضمین نمی‌کند.

### بازبینی شمارنده و Mirror

در ممیزی فایل‌ها، Master شامل 2,484 شماره یکتا بود، در حالی که Mirror و شمارنده Workflow روی 2,431 مانده بودند. اختلاف 53 شماره‌ای بدون نسبت‌دادن منشأ به batch خاص، رفع شد: دو شماره جدید این دور به Master افزوده شد، Mirror مستقیماً از Master جاری بازسازی شد و شمارنده Workflow روی 2,486 تنظیم شد. کنترل نهایی: Master برابر 2,486 خط یکتا، Mirror دقیقاً برابر Master، و CSV بررسی 287B/297C برابر 97 ردیف داده است. این شمارش به معنی موجودی یا سفارش‌پذیری نیست.


## دور سیزدهم — برق و شارژ 287B/297C (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models ثبت شد:
- 113-4463 — Rectifier Assembly-Alternator؛ فهرست مدل‌ها شامل 287B و 297C است.
- 239-0772 — Alternator Group؛ فهرست مدل‌ها شامل 287B و 297C است.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/113-4463
- https://parts.cat.com/en/catcorp/product/239-0772

پیش از سفارش، خانواده آلترناتور، ولتاژ و جریان خروجی، نوع کانکتور، پایه‌های نصب و شماره سریال دستگاه تطبیق داده شود. 113-4463 یک Rectifier Assembly است و نباید به‌جای کل آلترناتور فرض شود.

پس از ثبت این دو شماره، Master برابر 2,488 شماره یکتا و Mirror دقیقاً برابر Master است. CSV بررسی 287B/297C به 99 ردیف داده رسیده و شمارنده Workflow روی 2,488 قرار گرفت.


## دور چهاردهم — برق، استارت، کوپلر و مدار هیدرولیک (25 Nov 2026)

هشت شماره جدید از صفحات رسمی Cat Parts Store ثبت شد:
- 122-4401 — Quick Coupler Wiring Terminal؛ 287B.
- 100-3685 — Cap-Starter؛ 287B و 297C.
- 225-7999 — Panel Wiring Harness؛ 287B.
- 202-2284 — 12 Volt Rocker Switch؛ 287B.
- 192-0836 — Pressure Switch Assembly (Backup Alarm)؛ 287B؛ صفحه Cat مشخصات Normally Open، فشار 517 kPa (75 psi) و کانکتور 2 Pin DT را نشان می‌دهد.
- 258-4199 — Platform Wiring Harness؛ 287B.
- 291-0010 — Valve Group-MTG؛ 297C در فهرست مدل‌ها (نه 287B).
- 216-0066 — 50.8mm Inner Diameter Air Line Hose؛ 297C در فهرست مدل‌ها (نه 287B).

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/122-4401
- https://parts.cat.com/en/catcorp/product/100-3685
- https://parts.cat.com/en/catcorp/product/225-7999
- https://parts.cat.com/en/catcorp/product/202-2284
- https://parts.cat.com/en/catcorp/product/192-0836
- https://parts.cat.com/en/catcorp/product/258-4199
- https://parts.cat.com/en/catcorp/product/291-0010
- https://parts.cat.com/en/catcorp/product/216-0066

دو مورد 291-0010 و 216-0066 فقط برای 297C در نتایج بازیابی‌شده تأیید شده‌اند و نباید به 287B تعمیم داده شوند. برای دسته سیم‌ها، شماره سریال، نسخه پلتفرم، آپشن Quick Coupler و سوکت‌ها؛ برای کلیدها و سوئیچ فشار، عملکرد مدار و مشخصات الکتریکی/رزوه‌ای باید تطبیق داده شود.

پس از این دور، Master برابر 2,496 شماره یکتا، Mirror دقیقاً همسان، CSV برابر 107 ردیف داده و شمارنده Workflow برابر 2,496 است.


## دور پانزدهم — شیلنگ‌های هیدرولیک و صندلی اپراتور (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B تأیید و ثبت شد:
- 159-4537 — 0.375in High Pressure Hose Assembly؛ مدل‌های 287B و 297C؛ قطر داخلی 0.375in و طول 44.488in.
- 166-2552 — 0.375in Medium Pressure Hose Assembly؛ 287B؛ قطر داخلی 0.375in و طول 12.244in.
- 219-4380 — Basic Adjustable Operator Seat؛ 287B؛ شامل cushion، adjuster، damper، springs، switch و wire.
- 233-5994 — 0.374in Medium Pressure Hydraulic Hose Assembly؛ 287B و 257B؛ قطر داخلی 0.374in و طول 123.346in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/159-4537
- https://parts.cat.com/en/catcorp/product/166-2552
- https://parts.cat.com/en/catcorp/product/219-4380
- https://parts.cat.com/en/catcorp/product/233-5994

برای شیلنگ‌ها طول، نوع سرشیلنگ، فشار کاری، مسیر و شماره مدار باید با دستگاه تطبیق داده شود. برای صندلی، پایه نصب، کلید/سیم‌کشی و نسخه کابین بررسی شود. دو شماره 174-2385 و 222-5728 در همین جست‌وجو Discontinued بودند و به‌عنوان قطعه قابل سفارش به Master یا CSV فعال اضافه نشدند.

### همسان‌سازی پس از تغییر هم‌زمان

هنگام ثبت این دور، Master از 2,496 به 2,549 خط یکتا رسیده بود؛ 53 شماره افزایش هم‌زمان خارج از چهار قلم مستند این دور مشاهده شد و منشأ آن‌ها در این یادداشت حدس زده نمی‌شود. Mirror مجدداً از Master جاری بازسازی و دقیقاً همسان شد؛ Workflow نیز به 2,549 به‌روزرسانی شد. CSV بررسی به 111 ردیف داده رسید. شمارش Master، موجودی یا سفارش‌پذیری را نشان نمی‌دهد.


## دور شانزدهم — روشنایی، چراغ کار و فیلتر هوا (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models ثبت شد:
- 100-3246 — Miniature Lamp؛ 287B؛ لامپ T4W با پایه Ba9s.
- 214-2968 — 12V Shock Resistant Suspended Plastic Flood Lamp؛ 287B و 297C.
- 231-8133 — Air Filter Panel؛ 287B؛ نصب دوپیچ، طول 316.4mm و ارتفاع 130.2mm.
- 136-3848 — Amber Lens Assembly-Lamp؛ 287B؛ لنز کهربایی چراغ راهنما/نشانگر جانبی.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/100-3246
- https://parts.cat.com/en/catcorp/product/214-2968
- https://parts.cat.com/en/catcorp/product/231-8133
- https://parts.cat.com/en/catcorp/product/136-3848

ولتاژ و پایه لامپ، نوع چراغ و سوکت، نسخه قاب فیلتر و مجموعه چراغ/لنز باید با شماره سریال و آرایش واقعی دستگاه تطبیق داده شود. دو شیلنگ 174-2385 و 222-5728 در جست‌وجوی پیشین Discontinued بودند و به‌عنوان قطعه سفارش‌پذیر وارد Master فعال نشدند.

Master اکنون 2,553 شماره یکتا دارد؛ Mirror دقیقاً همسان است، CSV بررسی 115 ردیف داده دارد و شمارنده Workflow روی 2,553 تنظیم شده است.


## دور هفدهم — کلیدهای کابین، سوئیچ فشار و اتصالات سوخت (25 Nov 2026)

شش شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B ثبت شد:
- 142-8858 — Ignition Switch Assembly؛ 287B؛ رزوه قفل 1-32 و کانکتور 4 پین.
- 224-0744 — Pressure Switch Assembly؛ 287B؛ کانکتور 3-pin DT، رزوه 9/16-18 و آچارخور 1.188in.
- 212-6521 — Three-Position Rocker Switch؛ 287B؛ شش ترمینال تیغه‌ای و عملکرد pin engage/disengage و lock.
- 142-9326 — Rocker Switch Assembly - Rear Lights؛ 287B؛ چهار ترمینال تیغه‌ای و LED سبز/کهربایی 12V.
- 228-9132 — Fuel Pump Fitting؛ 287B و 297C؛ طول 3.75in و ارتفاع 0.85in.
- 142-9325 — Rocker Switch Assembly - Engine Preheat؛ 287B؛ دوحالته با LED سبز و چهار ترمینال تیغه‌ای.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/142-8858
- https://parts.cat.com/en/catcorp/product/224-0744
- https://parts.cat.com/en/catcorp/product/212-6521
- https://parts.cat.com/en/catcorp/product/142-9326
- https://parts.cat.com/en/catcorp/product/228-9132
- https://parts.cat.com/en/catcorp/142-9325

برای کلیدها و سوئیچ‌ها، عملکرد واقعی مدار، تعداد پین، پنل و نسخه دسته‌سیم؛ برای سوئیچ فشار، نقطه تحریک و کاربرد سیال؛ و برای اتصال سوخت، ابعاد و نوع رزوه/آب‌بندی باید پیش از سفارش تطبیق داده شود.

Master برابر 2,559 شماره یکتا، Mirror دقیقاً همسان، CSV برابر 121 ردیف داده و شمارنده Workflow برابر 2,559 است.


## ممیزی نهایی هم‌زمانی مخزن — 25 Nov 2026

در بازخوانی نهایی، Master در اثر تغییرات هم‌زمان از 2,559 به 2,607 شماره یکتا رسیده بود؛ 48 شماره اضافه‌شده در این فاصله به batchهای مستند این گزارش نسبت داده نمی‌شوند. Mirror دوباره مستقیماً از Master جاری همسان‌سازی شد و برابری بایت‌به‌بایت تأیید شد. شمارنده Workflow نیز روی 2,607 قرار گرفت. CSV بررسی مدل‌های 287B/297C همچنان 121 ردیف داده مستند دارد و فقط اقلامی را شامل می‌شود که در batchهای این گزارش بررسی شده‌اند.


## دور هجدهم — سیستم سوخت موتور و قفل در کابین (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B بررسی و ثبت شد:
- 249-7346 — Fuel Injection Pump؛ 287B در فهرست مدل‌ها؛ پیکربندی پمپ و کالیبراسیون باید با موتور/شماره سریال تطبیق داده شود.
- 246-8310 — Fuel Injection Pump؛ 287B و 297C در فهرست مدل‌ها؛ شماره سریال موتور و تنظیمات تزریق تعیین‌کننده‌اند.
- 300-2952 — Nozzle-Fuel Injection؛ 287B و 297C در فهرست مدل‌ها؛ نازل باید با مشخصات انژکتور و موتور تطبیق داده شود.
- 223-8488 — Cab Door Latch Cover؛ 287B در فهرست مدل‌ها؛ کاور سمت چپ محفظه اپراتور، با لزوم کنترل سمت و نسخه مجموعه قفل.

منابع رسمی:
- https://parts.cat.com/en/catcorp/249-7346
- https://parts.cat.com/en/catcorp/product/246-8310
- https://parts.cat.com/en/catcorp/product/300-2952
- https://parts.cat.com/en/catcorp/product/223-8488

در همین جست‌وجو 230-3705 سیلندر هیدرولیک با وضعیت Discontinued مشاهده شد؛ بنابراین به‌عنوان قطعه قابل سفارش در این دور ثبت نشد. شماره 225-9521 قبلاً در Master وجود داشت و دوباره شمرده نشد.

### همسان‌سازی مخزن

پیش از این دور Master برابر 2,707 شماره یکتا بود و Mirror/Workflow روی 2,607 مانده بودند. پس از افزودن چهار شماره جدید، Master به 2,711 رسید؛ Mirror مستقیماً از Master جاری بازسازی شد و برابری کامل آن تأیید شد. شمارنده Workflow روی 2,711 قرار گرفت. CSV بررسی مدل‌ها به 125 ردیف داده رسید.


## دور نوزدهم — خنک‌کاری موتور و شیرهای هیدرولیک (25 Nov 2026)

پنج قلم از صفحات رسمی Cat Parts Store بررسی شد و با توجه به وضعیت فایل‌ها، سه شماره جدید به Master اضافه شد؛ دو شماره دیگر از قبل در Master وجود داشتند:
- 235-4960 — Thermostat؛ 287B و 297C؛ ارتفاع 2.4in و قطر بیرونی 2.04in. از قبل در Master بود؛ در CSV بررسی ثبت شد.
- 587-4391 — Pump Group-Water؛ 287B و 297C؛ پمپ گریز از مرکز و تسمه‌گردان. از قبل در Master بود؛ در CSV بررسی ثبت شد.
- 144-1644 — Valve Group؛ 287B در فهرست مدل‌ها؛ شماره جدید Master.
- 261-6727 — Valve Group-Solenoid؛ 287B در فهرست مدل‌ها؛ شماره جدید Master.
- 218-5943 — Hydraulic Quick Coupler Lines Tube Assembly؛ 287B؛ تحمل فشار relief تا 28,000 kPa؛ شماره جدید Master.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/235-4960
- https://parts.cat.com/en/catcorp/product/587-4391
- https://parts.cat.com/en/catcorp/product/144-1644
- https://parts.cat.com/en/catcorp/product/261-6727
- https://parts.cat.com/en/catcorp/product/218-5943

پیش از سفارش ترموستات و پمپ آب، مدل موتور و پکیج خنک‌کاری؛ برای شیرها، مدار، ولتاژ بوبین و کانکتور؛ و برای لوله کوپلر، مسیر و نسخه manifold بررسی شود. دو قلم 228-9236 (پمپ هیدرولیک) و 230-3705 (سیلندر هیدرولیک) در نتایج Cat وضعیت Discontinued داشتند و به‌عنوان کالای سفارش‌پذیر جدید ثبت نشدند.

Master برابر 2,714 شماره یکتا، Mirror دقیقاً همسان، CSV برابر 128 ردیف داده و شمارنده Workflow برابر 2,714 است.


## دور بیستم — تهویه کابین، استارت و لوله‌ها (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models ثبت شد:
- 218-6947 — Cab Heater and Air Conditioner Harness؛ دسته‌سیم HVAC کابین.
- 218-6833 — Refrigerant Compressor؛ کمپرسور مبرد بدون کلاچ و دارای machined nose؛ ابعاد کلی 9.8 × 8.3 × 6.1 اینچ.
- 100-4119 — Armature Assembly-Starter؛ طول کلی 7.1 اینچ و قطر بیرونی 2.37 اینچ.
- 8Y-8080 — Tube؛ ماده Nylon 6/6 یا 6/12 طبق مشخصات صفحه Cat.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/218-6947
- https://parts.cat.com/en/catcorp/product/218-6833
- https://parts.cat.com/en/catcorp/product/100-4119
- https://parts.cat.com/en/catcorp/product/8Y-8080

برای قطعات HVAC، وجود آپشن تهویه/گرمایش، نوع مبرد، پایه کمپرسور و کانکتورهای دسته‌سیم؛ برای armature، مدل استارت و مشخصات الکتریکی؛ و برای Tube، طول، قطر، مسیر و اتصالات باید با شماره سریال و آرایش دستگاه تطبیق داده شود. شماره 234-4826 از قبل در Master بود و دوباره ثبت نشد؛ 122-6871 و 234-4826 نیز در جست‌وجوی فعلی به‌عنوان شماره جدید Master شمرده نشدند.

Master برابر 2,718 شماره یکتا، Mirror دقیقاً همسان، CSV برابر 132 ردیف داده و شمارنده Workflow برابر 2,718 است.


## ممیزی هم‌زمانی پس از دور بیستم — 25 Nov 2026

در کنترل پس از ثبت دور بیستم، Master از 2,718 به 2,754 شماره یکتا افزایش یافته بود؛ 36 شماره افزوده‌شده در فاصله اجرای موازی به این دور نسبت داده نمی‌شوند و در CSV این دور نیز به‌عنوان موارد بررسی‌شده ادعا نشده‌اند. Mirror مجدداً از Master جاری بازسازی شد و برابری کامل تأیید شد. شمارنده Workflow نیز به 2,754 اصلاح شد. CSV بررسی رسمی 287B/297C همچنان 132 ردیف داده مستند دارد.

## دور بیست‌ویکم — فیلتر هیدرولیک، کوپلر، کارتل و یاتاقان موتور (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models ثبت شد:
- 204-1499 — Hydraulic Filter Lines Tube Assembly؛ فهرست مدل‌ها شامل 287B است.
- 426-4046 — Coupling-Quick Disconnect؛ فهرست مدل‌ها شامل 287B و 297C است.
- 287-3922 — Engine Oil Pan؛ فهرست مدل‌ها شامل 287B و 297C است.
- 238-8282 — Metal Set-Connecting Rod؛ فهرست مدل‌ها شامل 287B و 297C است.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/204-1499
- https://parts.cat.com/en/catcorp/product/426-4046
- https://parts.cat.com/en/catcorp/product/287-3922
- https://parts.cat.com/en/catcorp/product/238-8282

پیش از سفارش، مسیر و اتصالات لوله فیلتر هیدرولیک، پروفایل و فشار کاری دو نیمه کوپلر، خانواده موتور و محل تخلیه کارتل، و شماره سریال موتور/سایز ژورنال و گرید یاتاقان باید تطبیق داده شوند. این چهار شماره در Master پیشین موجود نبودند و به آن اضافه شدند.

در بازخوانی ابتدای این دور، Master دارای 3,461 شماره یکتا بود، در حالی که Mirror و Workflow روی 2,754 مانده بودند؛ این اختلاف پیش از batch حاضر وجود داشت و به دور حاضر نسبت داده نمی‌شود. پس از افزودن چهار شماره جدید، Master جاری به‌روزرسانی شد، Mirror مستقیماً از Master بازسازی و شمارنده Workflow برابر تعداد خطوط Master تنظیم شد. CSV فقط چهار ردیف فیتمنت جدید این دور را اضافه می‌کند؛ شمارش Master به‌تنهایی به معنی موجودی یا سفارش‌پذیری نیست.

## دور بیست‌ودوم — هوارسانی موتور، استارت، روغن‌کاری و زیربندی (25 Nov 2026)

شش ردیف فیتمنت از صفحات رسمی Cat Parts Store بررسی و در CSV ثبت شد؛ سه شماره جدید به Master اضافه شد و سه شماره از قبل در Master وجود داشتند:
- 243-0406 — Engine Air Cleaner؛ 287B در Compatible Models.
- 100-4118 — Case Assembly-Starter؛ 287B در Compatible Models؛ ابعاد 3.3 × 3.3 × 5.0 اینچ.
- 113-1141 — Oil Pump Assembly؛ 287B در Compatible Models.
- 110-6331 — Secondary Standard Efficiency Engine Air Filter؛ 287B در Compatible Models؛ از قبل در Master.
- 261-6302 — Idler Group (Triple Flange)؛ 287B در Compatible Models؛ از قبل در Master.
- 305-9256 — Kit-Undercarriage؛ 287B و 287 در Compatible Models؛ از قبل در Master.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/243-0406
- https://parts.cat.com/en/catcorp/product/100-4118
- https://parts.cat.com/en/catcorp/product/113-1141
- https://parts.cat.com/en/catcorp/product/110-6331
- https://parts.cat.com/en/catcorp/product/261-6302
- https://parts.cat.com/en/catcorp/product/305-9256

برای فیلتر هوا، تطبیق primary/secondary و محفظه؛ برای پوسته استارت، خانواده و پایه نصب؛ برای پمپ روغن، موتور و شماره سریال؛ و برای idler/کیت زیربندی، آرایش زنجیر، گروه زیربندی و شماره سریال الزامی است. قطعه 261-6296 در نتایج Cat Discontinued بود و به‌عنوان کالای فعال سفارش‌پذیر ثبت نشد.

سه شماره جدید این دور به Master افزوده شد. Mirror از Master جاری بازسازی و شمارنده Workflow نیز با تعداد خطوط Master همسان شد. CSV شش ردیف بررسی رسمی این دور را ثبت می‌کند؛ تعداد Master به‌تنهایی بیانگر فیتمنت یک مدل یا موجودی نیست.

### ممیزی هم‌زمانی پس از دور بیست‌ودوم — 25 Nov 2026

در بازخوانی پس از ثبت دور 22، Master از 3,465 به 3,513 شماره یکتا افزایش یافته بود؛ 48 شماره افزایش‌یافته در این فاصله خارج از سه شماره جدید مستند دور 22 هستند و به batch حاضر نسبت داده نمی‌شوند. Mirror برابر Master و شمارنده Workflow نیز برابر 3,513 تأیید شد. CSV بررسی فیتمنت رسمی به 142 ردیف داده رسیده است.

## دور بیست‌وسوم — کنترل ترمز پارک، شیر هیدرولیک و کلیدهای استارت (25 Nov 2026)

پنج شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 218-5805 — Parking Brake Control Manifold Tube Assembly؛ 287B؛ فشار relief تا 28,000 kPa.
- 216-6157 — Hydraulic Check Valve Compression Spring؛ 287B؛ طول آزاد 23.32mm.
- 100-4113 — 12 Volt Electric Starting Motor Switch؛ 287B؛ 12V.
- 142-9320 — Rocker Switch Assembly (12V, Illuminated, Parking Brake)؛ 287B؛ دوحالته، LED سبز و چهار ترمینال.
- 215-3277 — Hydraulic Valve O-Ring Seal؛ 287B؛ قطر داخلی 0.437in و مقطع 0.07in.

دو قلم دیگر در صفحات Cat نیز تأیید شدند و از قبل در Master وجود داشتند، اما در بازبینی نهایی مشخص شد در CSV ردیف نداشتند؛ بنابراین به CSV افزوده شدند: 142-9328 — Switch Assembly و 289-3765 — Hydraulic Lift Cylinder Tube Assembly (قطر داخلی 12.58mm). این دو به‌عنوان شماره جدید Master شمرده نشدند.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/218-5805
- https://parts.cat.com/en/catcorp/product/216-6157
- https://parts.cat.com/en/catcorp/product/100-4113
- https://parts.cat.com/en/catcorp/product/142-9320
- https://parts.cat.com/en/catcorp/product/215-3277
- https://parts.cat.com/en/catcorp/product/142-9328
- https://parts.cat.com/en/catcorp/product/289-3765

برای لوله ترمز، مسیر و اتصالات manifold؛ برای فنر و O-ring، محل نصب و مشخصات شیر؛ و برای کلیدها، ولتاژ، pinout و پنل واقعی باید کنترل شود. این تأیید فقط حضور مدل 287B در فهرست Compatible Models را ثبت می‌کند و به معنی تضمین تناسب همه شماره‌سریال‌ها نیست.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد. CSV پنج ردیف جدید این دور را ثبت می‌کند.

## دور بیست‌وچهارم — درب کابین، قفل، لولا و آب‌بندی موتور (25 Nov 2026)

نه شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV افزوده شد:
- 223-0608 — Cab Door Steel Hinge؛ لولای فولادی در فهرست مدل‌های سازگار.
- 218-6744 — Cabin Glass Door Kit؛ کیت درب شیشه‌ای کابین.
- 218-6743 — Polycarbonate Front Door Kit؛ کیت درب پلی‌کربنات برای تبدیل canopy باز به کابین محصور.
- 225-3187 — Stainless Cab Door Rotary Latch؛ قفل چرخشی دوحالته برای striker با قطر 13.9mm.
- 282-9059 — Frame for Cab Door؛ قاب درب با ابعاد 28 × 7 × 42 اینچ.
- 229-8757 — Physical Contact Cab Door Limit Switch؛ رزوه 15/32in و آچارخور 0.68in.
- 235-4768 — Casted Steel Cab Door Hinge؛ لولای فولادی ریخته‌گری‌شده.
- 103-9083 — Engine Oil Pump O-Ring Seal؛ آب‌بند پمپ روغن موتور.
- 594-5979 — Polycarbonate Front Door Kit؛ کیت کامل تبدیل کابین با وزن فهرست‌شده 60.8lb.

یک شماره موجود در Master نیز در این دور بررسی و به CSV افزوده شد: 289-3766 — Lift Cylinder Lines Tube Assembly؛ 287B در فهرست مدل‌ها و فشار relief تا 28,000 kPa.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/223-0608
- https://parts.cat.com/en/catcorp/product/218-6744
- https://parts.cat.com/en/catcorp/product/218-6743
- https://parts.cat.com/en/catcorp/product/225-3187
- https://parts.cat.com/en/catcorp/product/282-9059
- https://parts.cat.com/en/catcorp/product/229-8757
- https://parts.cat.com/en/catcorp/235-4768
- https://parts.cat.com/en/catcorp/product/103-9083
- https://parts.cat.com/en/catcorp/product/594-5979
- https://parts.cat.com/en/catcorp/product/289-3766

پیش از سفارش، سمت و نوع لولا، نسخه شیشه/پلی‌کربنات و قاب کابین، striker و مدار interlock، و ابعاد/محل O-ring باید با دستگاه و شماره سریال تطبیق داده شوند. کیت‌های درب ممکن است شامل شیشه‌های جانبی نباشند یا فقط برای تبدیل canopy باز به کابین مناسب باشند.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد. CSV نه ردیف جدید Master و یک ردیف از قبل موجود را در این دور ثبت می‌کند.

### اصلاح کنترل CSV دور بیست‌وچهارم

در کنترل پس از ثبت، مشخص شد ردیف 289-3766 با وجود ذکر در متن دور، در CSV درج نشده بود. ردیف آن به CSV اضافه شد؛ این شماره از قبل در Master موجود است و شماره جدید Master محسوب نمی‌شود.

## دور بیست‌وپنجم — فیلتر هیدرولیک، محفظه بخاری و اتصالات HVAC (25 Nov 2026)

چهار شماره جدید و یک شماره موجود از صفحات رسمی Cat Parts Store با نمایش صریح 287B بررسی و در CSV ثبت شدند:
- 312-1683 — Cabin Heater Cover Housing؛ محفظه ABS سیستم بخاری/تهویه؛ ابعاد 22 × 17.53 × 9.11 اینچ.
- 231-8141 — 12.7mm Inner Diameter Double Flange Grommet؛ گرومت EPDM دو لبه برای محافظت سیم/کابل در برابر لرزش و سایش.
- 185-4015 — Cab Heater Clip؛ گیره/کلیپ 9.5mm برای شیلنگ/مجموعه بخاری کابین؛ ابعاد 0.37 × 0.19 × 0.93 اینچ.
- 231-8137 — Label-Heater Air Conditioner؛ برچسب شناسایی HVAC با ابعاد 2.5 × 3.76 اینچ.
- 1G-8878 — Hydraulic/Transmission Oil Filter؛ فیلتر spin-on با قطر 3.709 و طول 9.441 اینچ؛ از قبل در Master بود.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/312-1683
- https://parts.cat.com/en/catcorp/product/231-8141
- https://parts.cat.com/en/catcorp/product/185-4015
- https://parts.cat.com/en/catcorp/product/231-8137
- https://parts.cat.com/en/catcorp/product/1G-8878

برای محفظه بخاری، نسخه HVAC و اتصالات کانال؛ برای گرومت، قطر دسته‌سیم و سوراخ پنل؛ برای clip، قطر بیرونی شیلنگ؛ و برای فیلتر، هد و مدیای فیلتر باید تطبیق داده شوند. چهار شماره جدید به Master افزوده شد و یک شماره موجود فقط در CSV فیتمنت ثبت شد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور بیست‌وششم — آب‌بند موتور، فیلتر سوخت و قطعات سیلندر (25 Nov 2026)

نه شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B به Master و CSV اضافه شد:
- 095-1537 — 3.5 × 37.7mm 75A NBR O-Ring؛ قطر داخلی 1.484in و مقطع 0.138in.
- 117-5015 — Oil Seal for Engine Flywheel Housing Area؛ ابعاد کلی 4.5 × 4.5 × 0.6in.
- 207-9717 — 151mm Outer Diameter Square Seal Ring؛ NBR، قطر بیرونی 5.944in و مقطع 0.22in.
- 284-3743 — 115mm Long Expanded Rubber Seal؛ طول 4.53in، عرض 3.94in و ضخامت 0.25in.
- 239-8429 — Seal Assembly-Crankshaft؛ ابعاد 3.75 × 3.75 × 0.69in.
- 4I-9404 — 27.7mm Inside Diameter Seal-O-Ring.
- 5I-8111 — Engine Air Lines Gasket.
- 231-8144 — 1mm Thick Cab Heater Baffle Plate.
- 647-3702 — 50mm Bore Diameter Hydraulic Cylinder؛ رزوه داخلی 3/4-16in و وزن 15.39lb.

سه شماره موجود در Master نیز در این دور از صفحات رسمی Cat برای 287B بررسی شدند: 267-3766، 253-6949 و 177-1958؛ هر سه Hydraulic Cylinder Seal Kit هستند. Cat تصریح می‌کند کاربرد این کیت‌ها به شماره Cylinder Group وابسته است؛ بدون تطبیق گروه سیلندر و شماره سریال، سفارش قطعی توصیه نمی‌شود.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/095-1537
- https://parts.cat.com/en/catcorp/product/117-5015
- https://parts.cat.com/en/catcorp/product/207-9717
- https://parts.cat.com/en/catcorp/product/284-3743
- https://parts.cat.com/en/catcorp/product/239-8429
- https://parts.cat.com/en/catcorp/product/4I-9404
- https://parts.cat.com/en/catcorp/product/5I-8111
- https://parts.cat.com/en/catcorp/product/231-8144
- https://parts.cat.com/en/catcorp/product/647-3702
- https://parts.cat.com/en/catcorp/product/267-3766
- https://parts.cat.com/en/catcorp/product/253-6949
- https://parts.cat.com/en/catcorp/product/177-1958

برای تمام O-ringها و sealها، ابعاد شیار، جنس، سیال و محل نصب؛ برای seal crankshaft، موقعیت جلو/عقب؛ و برای سیلندر، bore، stroke، پورت و cylinder group باید بررسی شود. هیچ فیتمنت 297C-only به 287B تعمیم داده نشده است.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد. CSV نه شماره جدید و سه شماره موجود را در این دور پوشش می‌دهد.

### تکمیل CSV دور بیست‌وششم

ممیزی پس از ثبت نشان داد سه شماره موجود در Master (267-3766، 253-6949 و 177-1958) در CSV این دور درج نشده بودند. هر سه ردیف به CSV افزوده شدند. هر سه کیت آب‌بندی سیلندر به Cylinder Group و شماره سریال وابسته‌اند؛ این ردیف‌ها صرفاً فیتمنت مدل را مستند می‌کنند.

## دور بیست‌وهفتم — کیت‌های آب‌بندی سیلندر، شیر و سوخت‌رسانی (25 Nov 2026)

هفت ردیف جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B در CSV ثبت شد؛ سه شماره جدید به Master اضافه شدند و چهار شماره دیگر از قبل در Master موجود بودند:
- 195-2627 — Valve Seal Kit؛ 287B در Compatible Models.
- 5I-7933 — Engine Air Lines Gasket؛ 287B در Compatible Models.
- 242-6055 — 7.9mm ID Engine Fuel Filter Lines Hose؛ قطر داخلی 7.9mm، طول 9.05in و فشار کاری 2,799.27kPa.
- 382-6243 — Hydraulic Cylinder Seal Kit؛ 287B و 297C.
- 371-2737 — Hydraulic Cylinder Seal Kit - Standard Size؛ 287B.
- 218-6822 — Tilt Cylinder Seal Kit؛ 287B.
- 284-9039 — Vented Cap for Fuel Strainer؛ درپوش دارای vent و فیلتراسیون 10 micron، اندازه کلی 63.5mm.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/195-2627
- https://parts.cat.com/en/catcorp/product/5I-7933
- https://parts.cat.com/en/catcorp/product/242-6055
- https://parts.cat.com/en/catcorp/product/382-6243
- https://parts.cat.com/en/catcorp/product/371-2737
- https://parts.cat.com/en/catcorp/product/218-6822
- https://parts.cat.com/en/catcorp/product/284-9039

نکته مهم: کیت‌های seal سیلندر و شیر، فیتمنت مدل را نشان می‌دهند اما شماره کیت باید با cylinder/valve group و شماره سریال تطبیق داده شود؛ برخی صفحات Cat فهرست قطعات داخل کیت را نمایش نمی‌دهند. برای شیلنگ سوخت، قطر، نوع اتصال و مسیر؛ برای درپوش صافی، رزوه/دهانه و سیستم vent باید کنترل شود. قطعه 230-3705 در نتایج Cat Discontinued بود و وارد فهرست فعال سفارش‌پذیر نشد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور بیست‌وهشتم — کیت‌های شیر پایلوت، relief و واشر فلایویل (25 Nov 2026)

هفت شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 289-9560 — Seal Kit (Pilot Valve)؛ شامل O-ring لاستیکی، پین فولادی و پیچ مونتاژ.
- 151-4965 — Seal Kit (Pilot Valve)؛ شامل O-ring، پین و پیچ.
- 218-6856 — Seal Kit؛ وزن فهرست‌شده 0.18lb؛ محتویات در صفحه Cat فهرست نشده است.
- 437-2877 — Pilot Valve Seal Kit؛ شامل O-ringها و پیچ/بولت هم‌راستاسازی طبق توضیح Cat.
- 227-5509 — Relief Valve Seal Kit.
- 272-6538 — Solenoid Valve Group Seal Kit.
- 103-9280 — Fly Wheel Housing Gasket؛ ابعاد 11.1 × 8 × 0.02 اینچ.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/289-9560
- https://parts.cat.com/en/catcorp/product/151-4965
- https://parts.cat.com/en/catcorp/product/218-6856
- https://parts.cat.com/en/catcorp/product/437-2877
- https://parts.cat.com/en/catcorp/product/227-5509
- https://parts.cat.com/en/catcorp/product/272-6538
- https://parts.cat.com/en/catcorp/product/103-9280

برای هر کیت آب‌بندی، فیتمنت مدل به‌تنهایی کافی نیست: شماره گروه شیر پایلوت/relief/solenoid، شماره سریال، revision و فشار تنظیم باید تطبیق داده شود. برای واشر فلایویل نیز خانواده موتور و نسخه housing بررسی شود. شماره 141-0888 در این جست‌وجو فهرست Compatible Models قابل اتکایی برای 287B نداشت؛ بنابراین ثبت نشد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور بیست‌ونهم — محافظ سوخت، پایه لرزه‌گیر و تکیه‌گاه سیلندر (25 Nov 2026)

سه شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 252-0368 — Fuel Filler Guard؛ محافظ برنجی/پلی‌آمیدی برای دهانه سوخت و پمپ priming.
- 152-5878 — Isolation Mount؛ پایه لرزه‌گیر دو‌تکه نامتقارن با ارتفاع 2.43in، پیچ M16 و قطر داخلی 0.66in.
- 190-7989 — Support؛ تکیه‌گاه فولادی مجموعه نصب سیلندر بازوی بالابر، ابعاد 28.44 × 2.95 × 2.44in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/252-0368
- https://parts.cat.com/en/catcorp/product/152-5878
- https://parts.cat.com/en/catcorp/product/190-7989

برای محافظ سوخت، دهانه و نوع پمپ priming؛ برای پایه لرزه‌گیر، محل نصب، قطر بوش و سختی/ترکیب لاستیک؛ و برای تکیه‌گاه، موقعیت براکت و گروه سیلندر بازو باید با شماره سریال و آرایش دستگاه تطبیق داده شود. قطعه 304-3885 در همین بررسی در Compatible Models مدل 287B را نداشت؛ بنابراین به CSV فیتمنت 287B اضافه نشد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور سی‌ام — دستگیره کابین، صفحه quick coupler و پنل کابین (25 Nov 2026)

پنج شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 258-2533 — Quick Coupler Left Hand Side Handle؛ دستگیره سمت چپ، ابعاد کلی 296.5 × 108 × 74mm، وزن 3.96lb.
- 258-2534 — Quick Coupler Right Hand Side Handle؛ دستگیره سمت راست، ابعاد کلی مشابه 258-2533 و وزن 3.96lb.
- 187-3211 — 3mm Thickness Cabin Plate؛ صفحه فولادی کابین.
- 248-2171 — Push Button Handle؛ دستگیره فشاری بیرونی، قابل قفل با corporate key و نصب با پیچ M6.
- 192-2637 — 10mm Thick Quick Coupler Plate؛ صفحه فولادی 10mm برای محدودکردن حرکت پین‌های کوپلر مکانیکی.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-2533
- https://parts.cat.com/en/catcorp/258-2534
- https://parts.cat.com/en/catcorp/product/187-3211
- https://parts.cat.com/en/catcorp/product/248-2171
- https://parts.cat.com/en/catcorp/product/192-2637

احتیاط طبقه‌بندی: صفحات Cat برای 258-2533 و 258-2534 در عنوان، آن‌ها را دستگیره چپ/راست Quick Coupler معرفی می‌کنند، اما متن توضیحی همان صفحات به «door latch handle» اشاره دارد. بنابراین fitment رسمی 287B ثبت شده، ولی دسته‌بندی نهایی و فروش باید با parts diagram و شماره سریال حل شود؛ از عنوان به‌تنهایی نوع کاربرد را قطعی نکنید. برای 192-2637، خانواده کوپلر و پین/فنر نصب کنترل شود.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

### ممیزی هم‌زمانی پیش از دور سی‌ام — 25 Nov 2026

در شروع ثبت دور 30، Master نسبت به ممیزی نهایی دور 29 از 3,602 به 3,648 شماره یکتا رسیده بود؛ 46 شماره افزایش‌یافته پیش از batch این دور وجود داشتند و به دور 30 نسبت داده نمی‌شوند. پنج شماره مستند دور 30 سپس اضافه شدند و شمارش Master به 3,653 رسید. Mirror و شمارنده Workflow با Master جاری همگام شدند؛ CSV شامل ردیف‌های بررسی‌شده دور 30 است.

## دور سی‌ویکم — متعلقات مکانیکی quick coupler (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 319-2137 — Coupler Mounting Bracket؛ براکت چدنی داکتیل، ابعاد 109 × 62.1 × 30mm.
- 5B-0651 — 11.11mm Hex Size Straight Grease Adapter؛ گریس‌خور مستقیم برای نقاط روانکاری.
- 192-2640 — Cylinder Group (Quick Coupler)؛ کورس 103.5mm، فشار کاری 23,500kPa و پورت 9/16-18.
- 207-9785 — 43.50mm Long Clevis Pin؛ پین cross-hole با طول 1.555in و قطر 0.374in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/319-2137
- https://parts.cat.com/en/catcorp/product/5B-0651
- https://parts.cat.com/en/catcorp/product/192-2640
- https://parts.cat.com/en/catcorp/product/207-9785

پیش از سفارش، خانواده کوپلر، جهت و سوراخ‌های براکت، رزوه گریس‌خور، ابعاد pin-to-pin و پورت‌های سیلندر، و روش قفل‌کردن پین باید با قطعه نصب‌شده و شماره سریال دستگاه تطبیق داده شود. 206-0828 در صفحه Cat برای مدل 287B فیتمنت نداشت و در این batch ثبت نشد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور سی‌ودوم — صفحه درب کابین اپراتور (25 Nov 2026)

یک شماره جدید از صفحه رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 280-1575 — Cabin Door Plate؛ صفحه 82mm برای مجموعه درب ایستگاه اپراتور.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/280-1575

پیش از سفارش، نسخه درب، جهت نصب صفحه و الگوی سوراخ‌های اتصال باید با کابین و شماره سریال دستگاه تطبیق داده شود. قطعاتی که فقط در فهرست محتویات یک کیت درب دیده شدند اما صفحه مستقل Compatible Models آن‌ها برای 287B پیدا نشد، به‌عنوان فیتمنت مستقل ثبت نشدند.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

### ممیزی هم‌زمانی پس از دور سی‌ودوم — 25 Nov 2026

در شروع دور 32، Master از 3,657 به 3,705 شماره یکتا افزایش یافته بود؛ 48 شماره افزایش‌یافته در فاصله پس از ممیزی دور 31 و پیش از ثبت این batch اضافه شده بودند و به دور 32 نسبت داده نمی‌شوند. یک شماره مستند دور 32 افزوده شد و Master به 3,706 رسید. Mirror، شمارنده Workflow و CSV مجدداً بررسی شدند؛ CSV برابر 203 ردیف داده است.


## دور سی‌وسوم — الکتریکی، سوخت، خنک‌کاری و فیلتر (25 Nov 2026)

در این دور 6 شماره جدید پس از مشاهده صریح 287B در بخش Compatible Models صفحات رسمی Cat به Master افزوده شد:
- 216-4725 — Harness Assembly (Work Tools)
- 186-3362 — Harness Assembly
- 583-9488 — Water Temperature Regulator Thermostat
- 225-8012 — Platform Work Tool Harness
- 242-8277 — Harness Assembly (Proportional Operator Control Handle)
- 223-9974 — Hydraulic/Transmission Oil Filter

همچنین 5 شماره که از قبل در Master بودند، با فیتمنت رسمی در CSV ثبت/تکمیل شدند: 232-5877، 202-2284، 258-4199، 228-9132 و 142-9328.

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/216-4725
- https://parts.cat.com/en/catcorp/product/186-3362
- https://parts.cat.com/en/catcorp/product/583-9488
- https://parts.cat.com/en/catcorp/product/225-8012
- https://parts.cat.com/en/catcorp/product/242-8277
- https://parts.cat.com/en/catcorp/product/223-9974
- https://parts.cat.com/en/catcorp/product/232-5877
- https://parts.cat.com/en/catcorp/product/202-2284
- https://parts.cat.com/en/catcorp/product/258-4199
- https://parts.cat.com/en/catcorp/product/228-9132
- https://parts.cat.com/en/catcorp/product/142-9328

برای هارنس‌ها، سازگاری به نسل دسته کنترل، پیکربندی Work Tool، مسیر سیم‌کشی و نوع کانکتور وابسته است. برای ترموستات و فیلتر، نسخه موتور/پکیج خنک‌کاری و شماره سریال پیش از سفارش تطبیق داده شود. فیتمنت 297C فقط در مواردی که صریحاً در فهرست مدل‌ها آمده ثبت شده و به سایر شماره‌ها تعمیم داده نشده است.

Master پس از این batch برابر 3712 شماره یکتا است؛ Mirror و Workflow با Master همگام شدند. CSV با 6 ردیف داده ثبت شد.


## دور سی‌وچهارم — اجزای آلترناتور (25 Nov 2026)

سه شماره جدید با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شدند:
- 113-4460 — Rotor Assembly-Alternator
- 113-4462 — 12V Alternator Regulator
- 113-4467 — Alternator Terminal Kit

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/113-4460
- https://parts.cat.com/en/catcorp/product/113-4462
- https://parts.cat.com/en/catcorp/product/113-4467

پیش از سفارش، خانواده آلترناتور، شماره قطعه آلترناتور، ولتاژ، آرایش سیم حسگر و نوع ترمینال/کانکتور باید تطبیق داده شود. 261-6296 و 113-4461 در کاتالوگ Discontinued بودند و به‌عنوان کالای سفارش‌پذیر جدید وارد نشدند؛ 335-9117 نیز Discontinued است.

Master پس از این دور 3715 شماره یکتا دارد؛ Mirror و Workflow با Master همگام شدند.


### ممیزی هم‌زمانی پس از دور سی‌وچهارم — 25 Nov 2026

پس از ثبت batch سی‌وچهارم، شماره 8L-5188 به‌صورت هم‌زمان توسط تغییر دیگری به Master افزوده شد. این شماره به batch جاری نسبت داده نشده و بدون تأیید مستقل فیتمنت در CSV وارد نمی‌شود. Master اکنون 3716 خط یکتا دارد؛ Mirror و شمارنده Workflow به همین وضعیت تازه همگام شدند.

## دور سی‌وسوم — پین سیلندر quick coupler (25 Nov 2026)

یک شماره جدید از صفحه رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 8L-5188 — 65.78mm Long Pan Head Pin؛ قطر پین 14.262mm، طول تا سوراخ عرضی 59.97mm و قطر بیرونی/مشخصه بدنه 0.7in.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/8L-5188

این پین در مجموعه‌های quick coupler و cylinder group به‌کار می‌رود؛ قبل از سفارش، طول مؤثر، قطر، موقعیت سوراخ عرضی و روش نگهدارنده باید با گروه سیلندر نصب‌شده تطبیق داده شود. سایر O-ringهای پیشنهادی در صفحات مرتبط، مانند 3J-1907 و 6V-8398، فهرست Compatible Models مستقل آن‌ها 287B را نشان نداد؛ بنابراین وارد CSV نشدند.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.


### ممیزی هم‌زمانی تکمیلی — 25 Nov 2026

در فاصله ممیزی قبلی تا این بازبینی، 47 شماره دیگر به‌صورت هم‌زمان به Master اضافه شدند. این موارد به batchهای 33 و 34 نسبت داده نمی‌شوند و تا زمان بررسی منبع/فیتمنت مستقل، صرفاً وضعیت موجود Master هستند. شمارنده Workflow از 3,716 به 3763 همگام شد؛ Mirror در بازبینی هم‌زمان با Master برابر بود.


## دور سی‌وپنجم — کیت‌های آب‌بندی و تعمیر هیدرولیک (25 Nov 2026)

هفت شماره جدید با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شدند:
- 161-2136 — Seal Kit
- 241-9468 — Seal Kit
- 268-9529 — Piston Pump Seal Kit
- 1G-8732 — Serviced Seal Kit
- 9T-9072 — Seal Kit
- 148-9363 — Seal Kit
- 235-8465 — Seal Kit

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/161-2136
- https://parts.cat.com/en/catcorp/product/241-9468
- https://parts.cat.com/en/catcorp/product/268-9529
- https://parts.cat.com/en/catcorp/product/1G-8732
- https://parts.cat.com/en/catcorp/product/9T-9072
- https://parts.cat.com/en/catcorp/product/148-9363
- https://parts.cat.com/en/catcorp/product/235-8465

احتیاط: این اقلام کیت آب‌بندی‌اند و Compatible Models به‌تنهایی برای تعیین کاربرد دقیق کافی نیست. پیش از سفارش باید شماره گروه سیلندر/پمپ/شیر، شماره سریال، نسخه قطعه و supersession با Cat SIS یا نمایندگی تطبیق داده شود. 287B و 297C فقط در مواردی که هر دو صریحاً در فهرست آمده‌اند به‌صورت جداگانه ثبت شدند.

Master پس از این batch 3770 شماره یکتا دارد؛ Mirror و Workflow با Master همگام شدند.

### ممیزی هم‌زمانی پس از دور سی‌وسوم — 25 Nov 2026

در شروع دور 33، Master از 3,706 به 3,712 شماره یکتا رسیده بود؛ شش شماره رشد هم‌زمان خارج از batch این دور هستند. یک شماره مستند دور 33 اضافه شد و Master به 3,763 رسید؛ بنابراین 50 شماره دیگر نیز در فاصله اجرای ثبت و همگام‌سازی به‌صورت هم‌زمان اضافه شده‌اند و به دور 33 نسبت داده نمی‌شوند. Mirror و Workflow با Master جاری همگام شدند؛ CSV برابر 213 ردیف داده است.

## دور سی‌وچهارم — پایه و بوش نگهدارنده موتور (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 9W-8096 — Two Piece Symmetric Isolation Mount؛ پایه لرزه‌گیر دو‌تکه متقارن برای تکیه‌گاه جلوی موتور؛ ارتفاع 1.12in، قطر سر 2.22in، قطر pilot برابر 1.38in و قطر داخلی 0.53in.
- 9W-6226 — 13.5mm Inside Diameter Engine Mounting Sleeve؛ بوش فولادی مستقیم با طول 1.811in، قطر داخلی 0.531in و قطر خارجی 0.945in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/9W-8096
- https://parts.cat.com/en/catcorp/product/9W-6226

برای سفارش، موقعیت نصب، آرایش و preload پایه، قطر پیچ مرکزی و جفت‌شدن بوش با isolation mount باید کنترل شود. نکته فیتمنت: صفحات Cat برای 202-0920، 153-0073، 152-9864 و 142-8853 فقط مدل 287 را فهرست کردند، نه 287B؛ بنابراین هیچ‌کدام به Master فیتمنت 287B اضافه نشدند.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور سی‌وپنجم — کیت اورهال موتور، شیر پایلوت و خنک‌کاری (25 Nov 2026)

چهار ردیف فیتمنت از صفحات رسمی Cat Parts Store با نمایش صریح 287B بررسی و در CSV ثبت شد؛ سه شماره جدید به Master افزوده شد و یک شماره از قبل در Master وجود داشت:
- 594-6434 — Cat Engine Overhaul Gasket Kit؛ 287B و 297C؛ کیت شامل 42 ردیف قطعه/واشر/آب‌بند در فهرست Cat است و front/rear seals را شامل نمی‌شود.
- 341-3561 — Cat Engine Overhaul Gasket Kit-JAPAN؛ 287B؛ نسخه مخصوص بازار ژاپن، نه کالای عمومی سفارش‌پذیر در بازار ایران.
- 257-8739 — Regulator Housing Hose Clamp؛ 287B و 297C؛ بست استیل با عرض 0.511in و حداکثر قطر مؤثر 1.181in.
- 313-6251 — Joint Kit (Hydraulic Pilot Control Valve)؛ 287B؛ از قبل در Master بود؛ صفحه Cat یک plate assembly را نمایش می‌دهد و توضیح، shim/nut/washer/detent arm/cardan را ذکر می‌کند.

منابع رسمی:
- https://parts.cat.com/en/catcorp/594-6434
- https://parts.cat.com/en/catcorp/product/341-3561
- https://parts.cat.com/en/catcorp/product/257-8739
- https://parts.cat.com/en/catcorp/product/313-6251

برای کیت اورهال، engine arrangement و شماره سریال و محتوای دقیق جعبه؛ برای نسخه ژاپن، محدودیت منطقه‌ای؛ برای بست، قطر بیرونی شیلنگ و محل housing؛ و برای joint kit، خانواده شیر پایلوت و اجزای واقعی باید تطبیق داده شود.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور سی‌وششم — قطعات آب‌بندی بلوک و سرسیلندر موتور (25 Nov 2026)

پنج شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 103-9277 — Front Housing Plate Gasket؛ واشر صفحه جلویی، ابعاد 11.2 × 11.9in.
- 234-4818 — 0.8mm Thick Engine Housing Cover Gasket؛ واشر دوپیچه بین توربوشارژر و لوله، ابعاد 3.9 × 2.4 × 0.04in.
- 299-4645 — Cylinder Head Gasket؛ ابعاد 18.66 × 7.2 × 0.06in؛ فیتمنت 287B و 297C.
- 234-4814 — 94mm Outer Diameter Piston؛ پیستون استاندارد 94mm، ارتفاع 3.56in.
- 310-2682 — Engine Cylinder Block Plug؛ پلاگ فولادی press-fit/threaded برای مسیر آب بلوک موتور.

یک شماره موجود در Master نیز از قبل بررسی شده بود: 103-9280 — Fly Wheel Housing Gasket؛ 287B در فهرست Compatible Models دارد و دوباره به‌عنوان شماره جدید شمرده نشد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/103-9277
- https://parts.cat.com/en/catcorp/234-4818
- https://parts.cat.com/en/catcorp/product/299-4645
- https://parts.cat.com/en/catcorp/product/234-4814
- https://parts.cat.com/en/catcorp/product/310-2682
- https://parts.cat.com/en/catcorp/product/103-9280

برای پیستون، قطر واقعی bore، کلاس پیستون و ring set؛ برای واشر سرسیلندر، شماره سریال و ضخامت/نسخه سرسیلندر؛ برای plug، قطر سوراخ و روش نگهداری؛ و برای واشرهای housing، نسخه و سطوح اتصال موتور باید تطبیق داده شود. قطعاتی که فقط برای مدل «287» و نه «287B» فهرست شده‌اند، همچنان از این فیتمنت حذف می‌شوند.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور سی‌وهفتم — واشرهای موتور و شیلنگ انژکتور (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 234-4824 — Engine Governor Inlet Gasket؛ 8-bolt، ابعاد 14.6 × 3.3 × 0.06in؛ عنوان و توضیح صفحه Cat درباره محل کاربرد کاملاً هم‌راستا نیستند.
- 195-8355 — 1mm Thick Fuel Lines Gasket؛ واشر 1mm خطوط سوخت.
- 234-4809 — 2mm Thickness Washer؛ واشر فولادی با ID=11.8mm، OD=18mm و ضخامت 2mm.
- 113-0364 — Fuel Injection Hose؛ شیلنگ بین نازل‌های تزریق سوخت.

یک قطعه مرتبط دیگر، 234-4803 — Engine Oil Cooler Element، پیش‌تر در Master و CSV ثبت شده بود؛ صفحه Cat فیتمنت 287B را صریحاً نشان می‌دهد و ابعاد آن 9.9 × 3.1 × 2.0in است.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/234-4824
- https://parts.cat.com/en/catcorp/product/195-8355
- https://parts.cat.com/en/catcorp/product/234-4809
- https://parts.cat.com/en/catcorp/product/113-0364
- https://parts.cat.com/en/catcorp/product/234-4803

برای شیلنگ انژکتور، طول، end fitting و فشار؛ برای واشرها، محل اتصال و شماره سریال موتور؛ و برای washer، قطر پیچ و clamp stack-up باید بررسی شود. صفحه 234-4824 در عنوان «Governor Inlet» دارد ولی در توضیح، آب‌بندی exhaust manifold به cylinder head را بیان می‌کند؛ قبل از طبقه‌بندی نهایی باید diagram Cat بررسی شود.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.


## دور سی‌وششم — زیربندی و اتصالات هیدرولیک (25 Nov 2026)

چهار شماره جدید با فیتمنت صریح 287B از Cat Parts Store به Master افزوده شدند:
- 250-1493 — Hydraulic Hose Male End Elbow 45 Degree
- 124-2119 — Permanent Coupling 10MN
- 6T-9244 — Valve Cartridge
- 279-5418 — Hydraulic Hose Assembly

همچنین 278-1240 — Sprocket Bearing Group که از قبل در Master بود، با فیتمنت رسمی 287B در CSV تکمیل شد. 233-5994، 261-6302 و 122-6871 قبلاً در Master و CSV موجود بودند و دوباره ثبت نشدند.

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/250-1493
- https://parts.cat.com/en/catcorp/product/124-2119
- https://parts.cat.com/en/catcorp/product/6T-9244
- https://parts.cat.com/en/catcorp/product/279-5418
- https://parts.cat.com/en/catcorp/product/278-1240

برای اتصالات، رزوه، استاندارد ORFS، قطر شیلنگ، کلاس فشار و جهت زانویی باید با نمونه/گروه قطعه تطبیق داده شود. برای شیر کارتریجی، عملکرد و revision گروه شیر کنترل شود. شیلنگ 279-5418 با قطر داخلی 0.375in و طول 71.457in ثبت شده؛ مسیر و سرشلنگ‌ها پیش از سفارش تطبیق داده شوند.

قطعات 261-6296 (Track Roller)، 174-2385 (Hose Assembly) و 230-3705 (Cylinder Group) در Cat Discontinued هستند و به‌عنوان کالای سفارش‌پذیر جدید ثبت نشدند. 289-3779 با وضعیت Replaced مشاهده شد و تا تعیین جایگزین رسمی قابل سفارش فرض نمی‌شود.

Master پس از این batch 3847 شماره دارد؛ Mirror و Workflow با Master همگام شدند.


### ممیزی هم‌زمانی پس از دور سی‌وششم — 25 Nov 2026

در فاصله ثبت batch و کنترل نهایی، دو شماره دیگر به‌صورت هم‌زمان به Master افزوده شدند. این دو شماره به دور 36 نسبت داده نشده‌اند و بدون تأیید مستقل منبع در CSV این دور وارد نمی‌شوند. Master اکنون 3847 شماره یکتا دارد؛ Mirror و Workflow مجدداً با Master همگام شدند.

## دور سی‌وهشتم — پمپ آب، روغن‌کاری و آب‌بند موتور (25 Nov 2026)

سه شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 335-9124 — Water Pump Gasket؛ واشر 8-bolt بین پمپ آب و کاور پمپ، ابعاد 7.3 × 6.3 × 0.04in.
- 300-3988 — 2.62 × 139.37mm 70A NBR O-Ring؛ قطر داخلی 139.37mm و مقطع 2.62mm؛ Cat می‌گوید ابعاد/جنس برای مرجع‌اند و باید با شیار و سیال تطبیق شوند.
- 233-5494 — Engine Oil Line Strainer (Suction Bell)؛ مجموعه صافی مکش روغن، نصب با M8، ابعاد کلی 11.09 × 6.54 × 5.48in.

یک قطعه مرتبط از قبل در Master/CSV موجود بود: 336-9856 — Engine Oil Cooler Gasket؛ 287B در Compatible Models، ابعاد 14.57 × 7.4 × 0.08in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/335-9124
- https://parts.cat.com/en/catcorp/product/300-3988
- https://parts.cat.com/en/catcorp/product/233-5494
- https://parts.cat.com/en/catcorp/product/336-9856

برای واشر پمپ، cover revision و الگوی پیچ؛ برای O-ring، شیار، سیال و دما؛ و برای strainer، محل pickup و آرایش oil pan باید با شماره سریال تطبیق داده شود. شماره 239-8513 در نتایج این دور فقط در فهرست محتویات کیت‌ها/قطعات مرتبط دیده شد و صفحه مستقل Compatible Models آن برای 287B تأیید نشد؛ بنابراین به‌عنوان fitment مستقل اضافه نشد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

### ممیزی هم‌زمانی پس از دور سی‌وهشتم — 25 Nov 2026

در شروع دور 38، Master از 3,833 به 3,836 شماره یکتا رسیده بود؛ سه شماره رشد هم‌زمان خارج از batch دور 38 بودند. سه شماره مستند این دور اضافه شدند و Master در بازخوانی پس از sync برابر 3,851 بود؛ 12 شماره افزایش‌یافته دیگر در فاصله اجرا و sync به‌صورت هم‌زمان به Master اضافه شده‌اند و به دور 38 نسبت داده نمی‌شوند. Mirror و Workflow با Master جاری همگام‌اند؛ CSV برابر 257 ردیف داده است.


## دور سی‌ونهم — کنترل هیدرواستاتیک، شیر فشار و یاتاقان (25 Nov 2026)

سه شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 232-3586 — Cat Bearing Kit؛ کیت شامل cone و cup bearings و برای سرویس piston pump groups معرفی شده؛ مدل‌های 287B و 297C.
- 295-0046 — Valve Group-Solenoid and Relief؛ کنترل جریان و حداکثر فشار مدار هیدرولیک، با inlet screen؛ مدل‌های 287B و 297C.
- 2P-8104 — 10mm Single Row Ball Bearing؛ یاتاقان یک‌ردیفه با آب‌بند دوطرفه؛ مدل‌های 287B و 297C.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/232-3586
- https://parts.cat.com/en/catcorp/product/295-0046
- https://parts.cat.com/en/catcorp/product/2P-8104

برای 232-3586، شماره گروه پمپ پیستونی و serial number؛ برای 295-0046، گروه شیر کنترل و تنظیم فشار؛ و برای 2P-8104، محل نصب، ابعاد و آرایش یاتاقان باید پیش از سفارش تطبیق داده شود. وجود مدل در Compatible Models به‌تنهایی جایگزین بررسی serial number و پیکربندی واقعی نیست.

### ممیزی هم‌زمانی پس از دور سی‌وششم و پیش از دور سی‌ونهم — 25 Nov 2026

در fetch تازه ابتدای دور 39، Master از 3847 به 3851 شماره یکتا رسیده بود. این چهار شماره رشد هم‌زمان خارج از batch جاری محسوب می‌شوند و به دور 39 نسبت داده نشده‌اند. سه شماره جدید این دور به Master افزوده شد؛ Mirror و Workflow با Master جاری همگام شدند.


### ممیزی هم‌زمانی پس از دور سی‌ونهم — 25 Nov 2026

در کنترل نهایی، Master از 3851 به 3860 شماره یکتا رسیده است. سه شماره دور 39 در Master/CSV ثبت شده‌اند؛ شش شماره افزایش‌یافته دیگر در فاصله عملیات، هم‌زمان و خارج از batch جاری بوده‌اند و به دور 39 نسبت داده نمی‌شوند. CSV اکنون 266 ردیف داده دارد.


## دور چهلم — خنک‌کاری، فن هیدرولیک و پاک‌کن آیدلر (25 Nov 2026)

پنج شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 246-8314 — Thermostat Housing؛ بدنه آلومینیومی محفظه ترموستات؛ 287B و 297C.
- 203-4827 — 7 Blade Oil Cooler Fan؛ فن هفت‌پره با چرخش پادساعت‌گرد؛ 287B.
- 238-7698 — Idler Rear Scraper؛ پاک‌کن عقب چرخ آیدلر برای دفع گل و ذرات؛ 287B و 287.
- 230-3726 — 18mm Inner Diameter Shaft Seal؛ آب‌بند شفت موتور فن هیدرولیک؛ 287B.
- 230-3686 — Lip Type Seal Group؛ گروه آب‌بند لبه‌ای موتور فن؛ 287B.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/246-8314
- https://parts.cat.com/en/catcorp/product/203-4827
- https://parts.cat.com/en/catcorp/product/238-7698
- https://parts.cat.com/en/catcorp/product/230-3726
- https://parts.cat.com/en/catcorp/product/230-3686

پیش از سفارش، برای housing شماره سریال و خانواده موتور؛ برای فن جهت چرخش و فن‌درایو؛ برای scraper گروه idler و محل نصب؛ و برای sealها قطر شفت، قطر نشیمن، عرض و جهت نصب تطبیق داده شود. قطعه 230-3726 با قطر شفت 18mm و عرض 8mm معرفی شده است.


### ممیزی نهایی پس از دور چهلم — 25 Nov 2026

در fetch نهایی Master برابر 3870 خط و 3870 شماره یکتا است. Mirror به‌صورت byte-exact با Master برابر است؛ Workflow روی currently 3870 تنظیم شده و CSV دارای 277 ردیف داده است. در فاصله sync دور چهلم تا fetch نهایی، یک شماره دیگر به‌صورت هم‌زمان به Master افزوده شده و به batch 40 نسبت داده نمی‌شود. هر دو batch 39 و 40 در Master و CSV حضور دارند.

## دور سی‌ونهم — واشر aftercooler و پمپ آب (25 Nov 2026)

یک شماره جدید از صفحه رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 335-9125 — 1.59mm Thick Aftercooler Air Lines Gasket؛ واشر پنج‌پیچه بین کاور پمپ آب و بلوک موتور، ابعاد 6.7 × 4.1 × 0.04in.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/335-9125

در این بررسی 5I-7937 در متن توضیحات کاربردی نام 287B را ذکر می‌کند، اما فهرست رسمی Compatible Models آن 287B را ندارد؛ بنابراین به‌عنوان فیتمنت قطعی ثبت نشد. همچنین 315-4678 برای Oil Pump Assembly صفحه Cat بدون اطلاعات سازگاری داشت و وارد CSV نشد. 315-4667 نیز فهرست سازگار آن 287B را نداشت.

برای واشر 335-9125، نسخه کاور پمپ آب، الگوی پنج پیچ و engine arrangement باید تطبیق داده شود.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

### ممیزی هم‌زمانی پس از دور سی‌ونهم — 25 Nov 2026

Master از 3,851 (پایان ممیزی دور 38) به 3,860 در شروع دور 39 رسیده بود؛ 9 شماره رشد هم‌زمان پیش از batch بودند. یک شماره مستند دور 39 اضافه شد. در بازخوانی sync تعداد 3,870 و در ممیزی نهایی مجدد 3,877 شماره یکتا دیده شد؛ 9 و سپس 7 شماره افزایش‌یافته دیگر در طول اجرای batch/sync هم‌زمان اضافه شده‌اند و به دور 39 نسبت داده نمی‌شوند. Mirror و Workflow در ممیزی نهایی دقیقاً با Master 3,877 همگام‌اند؛ CSV به 284 ردیف داده رسیده است.

## دور چهلم — واشر منیفولد ورودی و توربوشارژر (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 234-4806 — Inlet Manifold Gasket؛ واشر منیفولد هوای ورودی با ضخامت 0.5mm، مناسب M8، ابعاد 14.64 × 3.42in.
- 5I-7689 — 1.4mm Thick Turbocharger Gasket؛ واشر توربوشارژر با طول 4.5in و ارتفاع 0.1in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/234-4806
- https://parts.cat.com/en/catcorp/product/5I-7689

برای سفارش، نسخه منیفولد و الگوی پیچ M8؛ و برای توربو، نوع فلنج، ضخامت واشر و engine arrangement باید تطبیق داده شود. 5I-7742، 5I-7561 و 2A-5222 در فهرست Compatible Models مستقل خود 287B را نداشتند؛ حتی اگر در صفحات قطعات توربو یا کیت‌ها به‌عنوان related/included part دیده شوند، به‌عنوان fitment مستقل ثبت نشدند.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

### ممیزی هم‌زمانی پس از دور چهلم — 25 Nov 2026

پس از پایان ممیزی دور 39، Master از 3,877 به 3,891 در شروع دور 40 رسیده بود؛ 14 شماره رشد هم‌زمان پیش از این batch بودند. دو شماره مستند دور 40 اضافه شدند؛ در sync تعداد Master به 3,897 و در ممیزی نهایی به 3,900 رسید، بنابراین 4 و سپس 3 شماره دیگر در حین اجرای batch و ممیزی هم‌زمان اضافه شدند و به دور 40 نسبت داده نمی‌شوند. Mirror در ممیزی نهایی برابر Master بود؛ شمارنده Workflow ابتدا روی 3,897 مانده بود و در این اصلاح به 3,900 تنظیم شد. CSV برابر 307 ردیف داده است.

### ممیزی نهایی هم‌زمانی پس از دور 40

بازخوانی نهایی بعد از اصلاح Workflow، Master را 3,904 شماره یکتا نشان داد؛ چهار شماره دیگر پس از ممیزی قبلی به‌صورت هم‌زمان اضافه شده بودند. Mirror دقیقاً برابر Master و شمارنده Workflow نیز روی 3,904 تأیید شد؛ CSV به 311 ردیف داده رسیده است. این چهار شماره نیز به دور 40 نسبت داده نمی‌شوند.


## دور چهل‌ویکم — انتقال قدرت، پمپ هیدرواستاتیک و زیربندی (25 Nov 2026)

در شروع این دور، Master برابر 3904 شماره یکتا بود؛ این مقدار نسبت به ممیزی قبلی 34 شماره افزایش هم‌زمان داشت و به دور 41 نسبت داده نمی‌شود.

### موارد دارای فیتمنت رسمی 287B
- 263-4996 — 14 Internal Spline Teeth Piston Pump Coupling Hub؛ فیتمنت 287B و 297C؛ کوپلینگ محرک پمپ هیدرواستاتیک با 14 شیار داخلی و 48 شیار خارجی.
- 210-0825 — Track Tensioner؛ فیتمنت 287B؛ گروه کشنده زنجیر/ترک.
- 280-7864 — Radial Piston Motor؛ فیتمنت 287B.
- 117-3285 — GEAR؛ فیتمنت 287B و 297C.
- 117-2827 — 46 Teeth Engine Camshaft Gear؛ فیتمنت 287B و 297C؛ چرخ‌دنده 46 دندانه میل‌بادامک.

### موارد مختص 297C — جدا از فهرست 287B
- 258-3465 — 21cc Gear Pump.
- 258-3521 — Hydraulic Gear Pump؛ حداکثر فشار اعلام‌شده 25000 kPa.
- 258-2970 — Axial Piston Motor.
- 258-2971 — 2 Speed Track Drive Piston Motor.
- 258-3942 — Seal؛ مشخصات کاربرد/ابعاد در صفحه کافی نیست.
- 278-8724 — Gear Set Kit برای piston motor؛ صفحه Cat مدل 297C را دارد ولی 287B را ندارد.

صفحه 258-2405 به‌عنوان پمپ Discontinued مشاهده شد و وارد فهرست سفارش‌پذیر نشد. 136-2840 و 7T-1662 بررسی شدند اما Compatible Models آن‌ها شامل 287B یا 297C نبود؛ بنابراین وارد Master فیتمنت این دو مدل نشدند.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/263-4996
- https://parts.cat.com/en/catcorp/product/210-0825
- https://parts.cat.com/en/catcorp/product/280-7864
- https://parts.cat.com/en/catcorp/product/117-3285
- https://parts.cat.com/en/catcorp/product/117-2827
- https://parts.cat.com/en/catcorp/product/258-3465
- https://parts.cat.com/en/catcorp/product/258-3521
- https://parts.cat.com/en/catcorp/product/258-2970
- https://parts.cat.com/en/catcorp/product/258-2971
- https://parts.cat.com/en/catcorp/product/258-3942
- https://parts.cat.com/en/catcorp/product/278-8724

برای کوپلینگ، تعداد/ابعاد شیار و گروه پمپ؛ برای کشنده ترک، آرایش زیربندی؛ برای موتورهای هیدرولیک، displacement و گروه drive؛ و برای چرخ‌دنده میل‌بادامک، خانواده موتور و timing revision باید با serial number تطبیق داده شود.

## دور چهل‌ویکم — واشر خطوط آب موتور (25 Nov 2026)

یک شماره جدید از صفحه رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 5I-7728 — 1mm Thick Water Lines Gasket؛ واشر خطوط آب با طول 4.5in و ارتفاع 0.1in.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/5I-7728

برای سفارش، محل flange، مدار coolant و engine arrangement باید بررسی شود. 5I-7572 و 5I-7735 در Compatible Models مستقل خود 287B را نداشتند و از ثبت فیتمنت حذف شدند؛ 5I-7678 قبلاً در Master/CSV وجود داشت.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

### اصلاح ثبت دور چهل‌ویکم و ممیزی هم‌زمانی

ممیزی اولیه نشان داد ردیف 5I-7728 در CSV ثبت شده بود اما به علت تداخل هم‌زمانی در Master ننشسته بود؛ در نتیجه Mirror نیز یک خط بیشتر از Master داشت. شماره 5I-7728 با fetch تازه به Master اضافه شد و Mirror از Master جاری بازسازی شد. شمارنده Workflow نیز برابر تعداد خطوط Master تنظیم شد. ردیف CSV از قبل موجود بود و دوباره درج نشد.

## دور چهل‌ودوم — موتور و قطعات زیربندی 287B/297C (25 Nov 2026)

ممیزی تازه مخزن در شروع این دور نشان داد Master در حال رشد هم‌زمان بوده است؛ شمارش آغازین 3,926 شماره یکتا بود و این تغییرات قبلی به دور جاری نسبت داده نمی‌شود. Mirror و Workflow با Master تازه همگام شدند.

### فیتمنت رسمی 287B
- 179-1854 — 4 Cylinder Engine؛ صفحه رسمی Cat در Compatible Models مدل‌های 277B، 267B و 287B را فهرست می‌کند. شماره به Master و CSV فیتمنت 287B اضافه شد.

### فقط 297C — خارج از فهرست 287B
- 258-3092 — Undercarriage Cap؛ فیتمنت 297C، بدون 287B.
- 337-5105 — SUPPORT GP-A؛ فیتمنت 297C، بدون 287B.
- 258-2449 — BRACKET AS؛ فیتمنت 297C، بدون 287B.
این سه مورد فقط در CSV مستقل 297C-only ثبت شدند و به فهرست قطعات 287B تعمیم داده نشدند.

### موارد ردشده یا نیازمند پیگیری
- 228-9236 و 10R-3429 در صفحات رسمی Cat با وضعیت Discontinued نمایش داده شدند؛ وارد فهرست سفارش‌پذیر نشدند.
- 216-4721 دارای نشان Replaced است؛ تا تعیین شماره جایگزین و تأیید مستقل، به فهرست سفارش‌پذیر اضافه نشد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/179-1854
- https://parts.cat.com/en/catcorp/product/258-3092
- https://parts.cat.com/en/catcorp/product/337-5105
- https://parts.cat.com/en/catcorp/product/258-2449

برای سفارش موتور کامل، مدل/آرایش موتور و PIN دستگاه باید تطبیق داده شود. برای قطعات زیربندی و براکت نیز نقشه قطعات و شماره سریال مبنای نهایی انتخاب است.

### بازخوانی نهایی پس از اصلاح دور 41

پس از اصلاح اولیه، یک شماره دیگر هم‌زمان به Master اضافه شد؛ Mirror و Workflow مجدداً به تعداد خطوط Master جاری sync شدند. این رشد هم‌زمان به دور 41 نسبت داده نمی‌شود.

### ممیزی هم‌زمانی نهایی دور 41

در بازخوانی‌های پس از اصلاح، Master به 3,939 شماره یکتا رسید و Mirror نیز پس از بازسازی دقیقاً برابر آن شد. شمارنده Workflow از 3,932 عقب مانده بود و در این مرحله به 3,939 اصلاح شد. هفت شماره افزایش‌یافته از ممیزی قبلی به‌صورت هم‌زمان به Master اضافه شده‌اند و به batch 41 نسبت داده نمی‌شوند.

## دور چهل‌وسوم — هیدرولیک، سوخت و زیربندی 287B/297C (25 Nov 2026)

در ممیزی ابتدای دور، Master برابر 3,939 شماره یکتا بود؛ چند تغییر هم‌زمان پس از دور قبل دیده شد و به این دور نسبت داده نمی‌شود. Mirror و Workflow پس از استخراج با Master تازه همگام شدند.

### قطعات رسمی 287B
- 218-5838 — Hydraulic Control Lines Tube Assembly؛ Compatible Models صریحاً 287B را دارد.
- 170-6305 — Fuel Level Indicator Assembly؛ فیتمنت 287B و ولتاژ 12V.
- 284-9039 — Vented Cap for Fuel Strainer؛ فیتمنت 287B و مشخصه فیلتر 10 micron.
- 200-2371 — Seal Kit (Solenoid Valve)؛ Compatible Models شامل هر دو 287B و 297C است.
- 238-7642 — 2 Section Gerotor Motor / Gear Pump؛ Compatible Models شامل 287B است و Cat Reman alternative نیز در صفحه نمایش داده می‌شود.

### قطعات مستقل 297C-only
- 372-5769 — Track Roller / Bogie Suspension Group.
- 258-3008 — Track Roller Group؛ توضیح صفحه به axle bushing اشاره می‌کند.
- 295-6420 — General Duty Bearing Cap.
- 258-3088 — 14.22mm Inner Diameter Inner Sleeve؛ برای sprocket group.

چهار مورد بخش دوم در CSV مستقل 297C-only ثبت شدند و به 287B تعمیم داده نشدند. پنج ردیف 287B به CSV فیتمنت اضافه شد؛ 238-7642 شماره جدید Master است و سایر شماره‌های 287B از قبل در Master وجود داشتند.

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/218-5838
- https://parts.cat.com/en/catcorp/product/170-6305
- https://parts.cat.com/en/catcorp/product/284-9039
- https://parts.cat.com/en/catcorp/product/200-2371
- https://parts.cat.com/en/catcorp/product/238-7642
- https://parts.cat.com/en/catcorp/product/372-5769
- https://parts.cat.com/en/catcorp/product/258-3008
- https://parts.cat.com/en/catcorp/product/295-6420
- https://parts.cat.com/en/catcorp/product/258-3088

در سفارش، برای قطعات هیدرولیک/سوخت/موتور تطبیق PIN، شماره گروه و آرایش مدار الزامی است. قطعات bogie، bearing cap و sprocket sleeve نیز باید با Parts Diagram و شماره سریال تطبیق داده شوند.

## دور چهل‌ودوم — فیلتر هوای اولیه موتور (25 Nov 2026)

یک شماره موجود در Master، پس از تأیید صفحه مستقل Cat برای 287B، به CSV فیتمنت افزوده شد:
- 110-6326 — Air Cleaner Primary Element؛ فیلتر اولیه standard-efficiency، ارتفاع/عرض 6.476in و عمق 14.016in؛ Compatible Models صریحاً 287B را دارد.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/110-6326

این قطعه با 110-6331 (secondary element) که پیش‌تر ثبت شده، جفت فیلتر اولیه/ثانویه را تشکیل می‌دهد؛ قبل از سفارش باید housing، نوع مدیا، جفت‌بودن عناصر و بازه سرویس بررسی شود. 1R-0749، 1R-0751، 1R-0739 و 1R-1807 در Compatible Models مستقل خود 287B را نداشتند و فیتمنت 287B برای آن‌ها ثبت نشد.

### ممیزی هم‌زمانی پس از دور 42

پس از آخرین ممیزی دور 41، Master در شروع دور 42 از 3,939 به 3,953 شماره یکتا رسیده بود؛ 14 شماره افزایش‌یافته پیش از batch بودند. دور 42 فقط ردیف CSV مربوط به 110-6326 را تکمیل کرد و شماره جدیدی به Master نیفزود. در ممیزی بعدی Master برابر 3,961 بود؛ هشت شماره دیگر هم‌زمان اضافه شدند و به دور 42 نسبت داده نمی‌شوند. Mirror دقیقاً برابر Master بود و شمارنده Workflow از 3,953 به 3,961 اصلاح شد.

## دور چهل‌وسوم — زیربندی، چرخ بوژی و اتصالات هیدرولیک (25 Nov 2026)

پنج شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 238-7728 — Undercarriage Bogie Wheel؛ چرخ بوژی پلی‌اتیلن برای هدایت زنجیر.
- 261-6104 — Bogie Wheel Group؛ گروه چرخ بوژی.
- 210-4693 — 62mm Inner Diameter Bearing Retainer؛ نگهدارنده بلبرینگ محور بوژی با قطر داخلی 62mm.
- 5P-1076 — M12 ID Steel Flat Washer؛ واشر فولادی سخت برای توزیع بار و حفاظت سطح اتصال.
- 6V-8716 — 38.10mm Hexagonal Plate Steel Straight Adapter؛ آداپتور مستقیم فولادی آب‌بنددار برای مدار سیال.

دو شماره دیگر در Master موجود بودند و فیتمنت رسمی آن‌ها نیز در همین دور بازبینی شد: 230-3733 — 355.6mm Outer Diameter Idler Wheel و 238-7698 — Idler Rear Scraper. اگر در ممیزی CSV ردیف مستقل آن‌ها مفقود باشد، باید تکمیل شود.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/238-7728
- https://parts.cat.com/en/catcorp/261-6104
- https://parts.cat.com/en/catcorp/210-4693
- https://parts.cat.com/en/catcorp/product/5P-1076
- https://parts.cat.com/en/catcorp/product/6V-8716
- https://parts.cat.com/en/catcorp/product/230-3733
- https://parts.cat.com/en/catcorp/product/238-7698

پیش از سفارش، آرایش bogie/undercarriage، قطر چرخ و محور، stack بلبرینگ، قطر و گام پیچ M12، رزوه و سطح آب‌بندی آداپتور باید با شماره سریال و configuration دستگاه تطبیق داده شود. 261-6296 Track Roller در صفحه Cat صریحاً Discontinued بود و به‌عنوان کالای فعال سفارش‌پذیر ثبت نشد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور چهل‌وچهارم — فیلترها، سوخت و مدار روغن موتور (25 Nov 2026)

ممیزی آغازین این دور Master را با 3,969 شماره یکتا نشان داد؛ CSV فیتمنت 287B نسبت به ممیزی پیشین نیز رشد هم‌زمان داشت. این تغییرات خارج از batch جاری‌اند و به آن نسبت داده نمی‌شوند.

### فیتمنت رسمی 287B (همچنین 297C در موارد مشخص)
- 234-4826 — Engine Oil Filter Union؛ Compatible Models شامل 287B و 297C.
- 1R-0734 — Advanced Efficiency Engine Oil Filter؛ شامل 287B و 297C.
- 243-0406 — Engine Air Cleaner؛ شامل 287B.
- 242-6055 — 7.9mm ID Engine Fuel Filter Lines Hose؛ شامل 287B.
- 110-6331 — Secondary Standard Efficiency Engine Air Filter؛ شامل 287B و 297C.
- 110-6326 — Air Cleaner Primary Element؛ شامل 287B و 297C.
- 207-9729 — Fuel Separator؛ شامل 287B.
- 232-5877 — Fuel Priming Pump؛ شامل 287B.
- 235-4955 — Engine Oil Filter Mounting Bracket؛ شامل 287B و 297C.
- 267-2528 — Standard Efficiency Engine Oil Filter؛ شامل 287B و 297C.

تمام شماره‌های بالا از قبل در Master وجود داشتند؛ این دور فقط CSV فیتمنت 287B را تکمیل کرد.

### فقط 297C
- 258-3894 — Hydraulic Pump Lines Hose؛ صفحه رسمی 297C را فهرست می‌کند و 287B را ندارد. فقط در CSV مستقل 297C-only ثبت شد.

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/234-4826
- https://parts.cat.com/en/catcorp/product/1R-0734
- https://parts.cat.com/en/catcorp/product/243-0406
- https://parts.cat.com/en/catcorp/product/242-6055
- https://parts.cat.com/en/catcorp/product/110-6331
- https://parts.cat.com/en/catcorp/product/110-6326
- https://parts.cat.com/en/catcorp/product/207-9729
- https://parts.cat.com/en/catcorp/product/232-5877
- https://parts.cat.com/en/catcorp/product/235-4955
- https://parts.cat.com/en/catcorp/product/267-2528
- https://parts.cat.com/en/catcorp/product/258-3894

برای فیلترهای هوا باید primary/secondary به‌صورت جفت و با housing درست انتخاب شود. فیلتر روغن و براکت باید با engine arrangement و filter head تطبیق داده شوند؛ برای پمپ پرایم سوخت نیز connector و شماره سریال بررسی شود.

### تکمیل CSV دور چهل‌وسوم

ممیزی نهایی نشان داد 230-3733 و 238-7698 از قبل در Master بودند، اما ردیف مستقل آن‌ها در CSV وجود نداشت؛ هر دو ردیف فیتمنت رسمی به CSV افزوده شدند. هیچ شماره جدیدی به Master اضافه نشد.

## دور چهل‌وچهارم — یاتاقان، بوش و اجزای چرخ‌دنده زیربندی (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 230-3755 — Sleeve Bearing (Bushing)؛ بوش برنزی با ID=2.5in، OD=2.69in و طول 3.5in.
- 204-1371 — 9.5mm Thick Wheel Shaft Retainer Plate؛ صفحه قفل چرخ بوژی با عرض 88.9mm و مناسب پیچ 3/8in.
- 199-5428 — 245mm Outer Diameter Bogie Wheel؛ چرخ بوژی پلی‌اتیلن با قطر بیرونی 245mm.
- 111-2414 — Tapered Roller Bearing Cone؛ مخروط بلبرینگ غلتکی مخروطی از فولاد آلیاژی.

چهار شماره موجود در Master نیز در همین دور از صفحات مستقل Cat تأیید و به CSV افزوده شدند:
- 278-1259 — Sprocket Bearing Cap؛ درپوش فولادی با سطح آب‌بندی لاستیکی، OD=84.988mm، ID=79.4mm و ارتفاع 7.493mm.
- 199-5332 — Sprocket Inner Sleeve؛ بوش داخلی سخت‌کاری‌شده با ID=14.23mm.
- 199-5333 — Sprocket Outer Sleeve؛ بوش بیرونی فولادی سخت‌کاری‌شده.
- 8J-7636 — Internal Retaining Ring؛ رینگ داخلی فولادی با قطر آزاد 3.62in و ضخامت 0.109in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/230-3755
- https://parts.cat.com/en/catcorp/product/204-1371
- https://parts.cat.com/en/catcorp/product/199-5428
- https://parts.cat.com/en/catcorp/product/111-2414
- https://parts.cat.com/en/catcorp/product/278-1259
- https://parts.cat.com/en/catcorp/product/199-5332
- https://parts.cat.com/en/catcorp/product/199-5333
- https://parts.cat.com/en/catcorp/product/8J-7636

برای بوش، قطر pin و موقعیت linkage؛ برای retainer، سوراخ‌های frame و پیچ؛ برای bogie wheel، عرض و موقعیت نصب؛ و برای یاتاقان/بوش‌های sprocket، bearing group، preload، shaft و groove باید با configuration و شماره سریال تطبیق داده شود. قطعه 261-6151 Sprocket در فهرست Compatible Models خود 287B را نداشت و ثبت نشد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

### ممیزی هم‌زمانی پس از دور چهل‌وچهارم

در sync اولیه دور 44، Master برابر 3,982 بود؛ ممیزی نهایی 3,985 شماره یکتا را نشان داد. سه شماره در فاصله sync و بازخوانی هم‌زمان اضافه شدند و به batch دور 44 نسبت داده نمی‌شوند. Mirror و Workflow در این مرحله مجدداً با Master 3,985 همگام شدند.


## دور ۴۵ — رسیدن Master به ۴۰۰۰ شماره (25 Nov 2026)

در این دور، ۱۵ شماره جدید از صفحات رسمی Cat Parts Store که 287B را صریحاً در Compatible Models دارند به Master و CSV فیتمنت 287B افزوده شدند:
- 218-0921 — Auxiliary Belt Drive Guard؛ 287B
- 224-9021 — Seatbelt Warning Film؛ 287B
- 110-2570 — Cap؛ 297C; 287B
- 166-2559 — Bracket؛ 287B
- 307-3043 — Seal Kit؛ 287B; 297C
- 117-7279 — Bushing؛ 287B
- 157-4835 — Load Capacity Instruction Plate؛ 297C; 287B
- 285-6105 — Utility Forks 1676 mm؛ 297C; 287B
- 231-8126 — Water Valve Assembly؛ 287B
- 107-3134 — Housing-Connector؛ 287B
- 238-7610 — Linkage Pin؛ 287B
- 287-3787 — Pin Assembly؛ 287B
- 190-8038 — Linkage Pin؛ 287B
- 249-7160 — Solenoid Valve؛ 287B
- 6E-5060 — Tamperproof Valve Cap؛ 287B

چهار قطعه دارای فیتمنت 297C و فاقد 287B جداگانه در CSV مستقل ثبت شدند:
- 149-3488 — 66.93mm Outer Diameter Engine Mount
- 294-7922 — Engine Crankshaft
- 262-7290 — ENGINE AR-PR
- 258-4116 — Engine Harness

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/218-0921
- https://parts.cat.com/en/catcorp/product/224-9021
- https://parts.cat.com/en/catcorp/product/110-2570
- https://parts.cat.com/en/catcorp/product/166-2559
- https://parts.cat.com/en/catcorp/product/307-3043
- https://parts.cat.com/en/catcorp/product/117-7279
- https://parts.cat.com/en/catcorp/product/157-4835
- https://parts.cat.com/en/catcorp/product/285-6105
- https://parts.cat.com/en/catcorp/product/231-8126
- https://parts.cat.com/en/catcorp/product/107-3134
- https://parts.cat.com/en/catcorp/product/238-7610
- https://parts.cat.com/en/catcorp/product/287-3787
- https://parts.cat.com/en/catcorp/product/190-8038
- https://parts.cat.com/en/catcorp/product/249-7160
- https://parts.cat.com/en/catcorp/product/6E-5060
- https://parts.cat.com/en/catcorp/product/149-3488
- https://parts.cat.com/en/catcorp/product/294-7922
- https://parts.cat.com/en/catcorp/product/262-7290
- https://parts.cat.com/en/catcorp/product/258-4116

نکات فیتمنت: برای seal kit و crankshaft، تطبیق serial number و engine/pump group الزامی است؛ برای engine mount، harness، pins و linkage parts، تطبیق ابعاد، connector، موقعیت نصب و configuration ضروری است. قطعات 297C-only به 287B تعمیم داده نشدند.

Master در لحظه ثبت دور به ۴۰۰۰ شماره رسید؛ در ممیزی نهایی، به‌دلیل سه ثبت هم‌زمان دیگر، تعداد به ۴۰۰۳ شماره یکتا افزایش یافت. Mirror به‌صورت byte-exact با Master تازه همگام شد و شمارنده Workflow روی ۴۰۰۳ تنظیم شد.

## دور چهل‌وپنجم — بلبرینگ و اجزای bearing group (25 Nov 2026)

سه شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 287B در Compatible Models به Master و CSV اضافه شد:
- 4B-3665 — 45mm Internal Diameter Single Row Ball Bearing؛ بلبرینگ تک‌ردیفه فولاد آلیاژی، ID=45mm، OD=3.346in و ارتفاع 0.748in.
- 111-2415 — Tapered Roller Bearing Cup؛ کاپ فولاد آلیاژی با OD=72mm و عرض 22mm؛ جفت با مخروط 111-2414.
- 8H-9789 — 72mm Outer Diameter Ball Bearing؛ بلبرینگ تک‌ردیفه با ID=1.38in، OD=2.84in و ارتفاع 0.67in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/4B-3665
- https://parts.cat.com/en/catcorp/product/111-2415
- https://parts.cat.com/en/catcorp/8H-9789

برای بلبرینگ‌ها، bearing group، ابعاد shaft/housing، کلاس لقی، load rating و preload باید کنترل شود؛ برای 111-2415، کاپ باید با مخروط 111-2414 جفت شود و از مخلوط‌کردن bearing sets متفاوت خودداری شود. 8H-9789 در صفحه Cat فیتمنت 287B را در فهرست Multi Terrain Loader صریحاً دارد.

Mirror از Master جاری بازسازی و شمارنده Workflow با تعداد خطوط Master تنظیم شد.

## دور چهل‌وششم — مهره قفل‌کننده track shoe (25 Nov 2026)

یک شماره موجود در Master از صفحه رسمی Cat برای 287B تأیید و به CSV اضافه شد:
- 1K-6872 — 1/2-13 Cone Lock Nut؛ مهره فولادی سخت‌کاری‌شده SAE J995 Grade 8 با پوشش روی؛ Compatible Models صریحاً 287B را دارد.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/1K-6872

برای سفارش، رزوه 1/2-13 UNC، طول/Grip پیچ جفت، گشتاور و مشخصات اتصال track shoe باید بررسی شود. 3B-4508، 6C-3241 و 8S-6212 در فهرست مستقل Compatible Models خود 287B را نداشتند؛ با وجود حضور در لیست قطعات کیت زیربندی، به‌عنوان فیتمنت مستقل 287B ثبت نشدند.


## دور ۴۶ — تکمیل فیتمنت رسمی هیدرولیک، موتور، برق و کابین (25 Nov 2026)

در این دور، صفحات رسمی Cat Parts Store دوباره بررسی و داده‌های فیتمنت همگام شد. شماره‌های ثبت‌شده در این نوبت شامل 218-5841، 284-3914، 8C-9783، 258-2806 و 258-2982 هستند. هم‌زمان چندین ثبت موازی دیگر نیز به Master اضافه شد؛ بنابراین تعداد نهایی فقط از fetch نهایی محاسبه شده است.

رکوردهای فیتمنت 287B در CSV تکمیل/افزوده شدند:
- 220-8588 — Hydraulic Oil Cooler Radiator Grill
- 218-5841 — Hydraulic Dual Flow Coupling
- 284-3914 — Handle
- 8C-9783 — Gasket
- 225-8009 — Joystick Control Wiring Harness
- 164-9989 — Film
- 232-3586 — Bearing Kit
- 233-5479 — Camshaft
- 294-5520 — Stay
- 258-7686 — Tie Rod Kit
- 225-7999 — Panel Wiring Harness

قطعات فقط 297C که در CSV مستقل ثبت شدند:
- 258-2806 — Hydraulic Tank Group
- 258-2982 — Hydraulic Tank Mounting Bracket

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/220-8588
- https://parts.cat.com/en/catcorp/product/218-5841
- https://parts.cat.com/en/catcorp/product/233-5479
- https://parts.cat.com/en/catcorp/product/294-5520
- https://parts.cat.com/en/catcorp/product/284-3914
- https://parts.cat.com/en/catcorp/product/8C-9783
- https://parts.cat.com/en/catcorp/product/258-7686
- https://parts.cat.com/en/catcorp/product/225-7999
- https://parts.cat.com/en/catcorp/product/225-8009
- https://parts.cat.com/en/catcorp/product/164-9989
- https://parts.cat.com/en/catcorp/product/232-3586
- https://parts.cat.com/en/catcorp/product/258-2806
- https://parts.cat.com/en/catcorp/product/258-2982

موارد Discontinued مانند 258-3156 و 222-5728 و مورد Replaced مانند 289-3779 به سفارش‌پذیرها اضافه نشدند. برای tie rod، bearing kit، gasket و harness، کنترل serial number، group، اندازه و connector پیش از سفارش الزامی است. قطعات 297C-only به فیتمنت 287B تعمیم داده نشدند.

Mirror و Workflow پس از بررسی تغییرات هم‌زمان با Master تازه همگام شدند.

### ممیزی هم‌زمانی پس از دور 46

در ممیزی اولیه پس از دور 46، Master برابر 4,009 و Mirror برابر 4,025 بود. بازخوانی تازه Master را نیز 4,025 نشان داد؛ 16 شماره در فاصله fetchهای قبلی به‌صورت هم‌زمان به Master اضافه شده بودند. Mirror از محتوای Master تازه بازسازی و شمارنده Workflow از 4,009 به 4,025 اصلاح شد. این 16 شماره به دور 46 نسبت داده نمی‌شوند.

## دور چهل‌وهفتم — مجموعه اکسل عقب 287B (25 Nov 2026)

یک شماره موجود در Master از صفحه رسمی Cat با سازگاری صریح 287B بررسی و به CSV افزوده شد:
- 257-7386 — 287 Series Skid Steer Loader Rear Axle؛ مجموعه اکسل عقب برای انتقال توان هیدرواستاتیک به چرخ‌های عقب؛ Compatible Models فقط 287B را فهرست می‌کند.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/257-7386

برای سفارش باید آرایش اکسل، موتور هیدرولیک/پورت‌ها و شماره سریال دستگاه تطبیق داده شود. 257-7385 (Front Axle Assembly) در این جست‌وجو صفحه مستقل با فهرست Compatible Models قابل تأیید برای 287B نداشت؛ بنابراین به‌عنوان فیتمنت قطعی ثبت نشد.

### ممیزی هم‌زمانی پس از دور 47

پس از پایان دور 46، Master از 4,046 به 4,064 شماره یکتا افزایش یافته بود؛ 18 شماره رشد هم‌زمان پیش از batch دور 47 وجود داشتند. دور 47 فقط ردیف CSV مربوط به 257-7386 را تکمیل کرد. در ممیزی بعدی Master برابر 4,078 بود؛ 14 شماره دیگر نیز در فاصله اجرا به‌صورت هم‌زمان اضافه شدند و به دور 47 نسبت داده نمی‌شوند. Mirror برابر Master بود و Workflow از 4,073 به 4,078 اصلاح شد.

### تکمیل ممیزی هم‌زمانی دور 47

در طول اصلاح Workflow، Master از 4,085 به 4,089 شماره یکتا افزایش یافت؛ چهار شماره هم‌زمان دیگر به batch 47 مربوط نیستند. Mirror دقیقاً برابر Master باقی ماند و شمارنده Workflow در این اصلاح به 4,089 تنظیم شد.

## دور ۴۸ — ممیزی فیتمنت 297C-only و پاک‌سازی Master (25 Nov 2026)

در ممیزی تازه صفحات رسمی Cat Parts Store، دو شیلنگی که فقط 297C (و مدل‌های دیگر) را در Compatible Models دارند از CSV فیتمنت 287B خارج و در CSV مستقل 297C-only نگه داشته شدند:
- 258-3877 — 31.75mm Inner Diameter Hydrostatic Pump Hose؛ سازگاری رسمی: 297C، 299C و 272C؛ بدون 287B.
- 258-3851 — 0.75in High Pressure Hose Assembly؛ سازگاری رسمی: 297C و 299C؛ بدون 287B.

صفحات رسمی:
- https://parts.cat.com/en/catcorp/product/258-3877
- https://parts.cat.com/en/catcorp/product/258-3851

قطعات فوق در Master عمومی باقی می‌مانند، اما نباید به فیتمنت 287B تعمیم داده شوند. پیش از سفارش شیلنگ‌ها باید طول، قطر داخلی، نوع تقویت، فشار کاری، اتصالات و مسیر نصب با PIN و آرایش هیدرولیک دستگاه تطبیق داده شود.

همچنین ممیزی Master نشان داد دو شماره تکراری 230-3726 و 230-3686 وجود داشت؛ نسخه یکتا با حفظ ترتیب اولیه نگه داشته شد. Mirror مجدداً byte-exact با Master شد و شمارنده Workflow با تعداد خطوط Master همگام شد.

## دور ۴۹ — قطعات رسمی تکمیلی و جداسازی 297C-only (25 Nov 2026)

از صفحات رسمی Cat Parts Store، شماره‌های جدید زیر با Compatible Models صریح ثبت شدند:
- 551-4677 — Plate Kit-Clad؛ فیتمنت 287B و 297C. صفحه کیت در حال حاضر اجزای داخل کیت را نمایش نمی‌دهد؛ پیش از فروش باید محتویات و کاربرد دقیق با Cat Dealer تأیید شود.
- 4B-0418 — 12.70mm Internal Diameter Loop Clip؛ فیتمنت 287B و 297C؛ قطر گیره 12.7mm و انتقال بست M10 یا 3/8in.
- 105-9411 — Support؛ فیتمنت 297C و فاقد 287B.
- 258-2448 — Bracket Assembly؛ فیتمنت 297C و فاقد 287B.
- 6R-3320 — Cover؛ فیتمنت 297C و فاقد 287B.
- 1B-2705 — Bolt؛ فیتمنت 297C و فاقد 287B.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/551-4677
- https://parts.cat.com/en/catcorp/product/4B-0418
- https://parts.cat.com/en/catcorp/product/105-9411
- https://parts.cat.com/en/catcorp/product/258-2448
- https://parts.cat.com/en/catcorp/product/6R-3320
- https://parts.cat.com/en/catcorp/product/1B-2705

در ممیزی طبقه‌بندی، 215-3273 (Cartridge Assembly) در فهرست رسمی Cat، 297C را دارد اما 287B را ندارد؛ بنابراین از CSV فیتمنت 287B خارج و به CSV مستقل 297C-only منتقل شد. همچنین 258-3877 و 258-3851 در CSV 297C-only باقی ماندند و از CSV 287B حذف شدند. هیچ قطعه 297C-only به 287B تعمیم داده نشد.

صفحات مرجع تکمیلی 287B که فیتمنتشان از قبل در CSV ثبت بود و در این دور بازبینی شدند:
- 216-4725 Harness Assembly
- 587-4391 Water Pump Group
- 218-5764 Plate
- 246-9039 Plate
- 234-0734 Bogie Wheel End Plate
- 6E-0725 Piston Pump Rotating Roller
- 186-3362 Harness Assembly
- 283-9476 Hydraulic Pump Hose
- 242-8277 Harness Assembly
- 287-3922 Engine Oil Pan
- 103-9747 Water Pump Side Cover
- 261-6111 Bogie Wheel Plate

منابع رسمی تکمیلی:
- https://parts.cat.com/en/catcorp/product/216-4725
- https://parts.cat.com/en/catcorp/product/587-4391
- https://parts.cat.com/en/catcorp/product/218-5764
- https://parts.cat.com/en/catcorp/product/246-9039
- https://parts.cat.com/en/catcorp/product/234-0734
- https://parts.cat.com/en/catcorp/product/6E-0725
- https://parts.cat.com/en/catcorp/product/186-3362
- https://parts.cat.com/en/catcorp/product/283-9476
- https://parts.cat.com/en/catcorp/product/242-8277
- https://parts.cat.com/en/catcorp/product/287-3922
- https://parts.cat.com/en/catcorp/product/103-9747
- https://parts.cat.com/en/catcorp/product/261-6111

برای 551-4677، محتویات کیت و سری ساخت باید با فروشنده رسمی تأیید شود. برای loop clip، قطر بست و محل نصب؛ برای hose، فشار کاری، coupling و مسیر؛ برای water pump و oil pan، engine arrangement و PIN؛ و برای bogie wheel plate و hydraulic parts، ابعاد، group و شماره سریال دستگاه باید تطبیق داده شوند.

## دور ۵۰ — تکمیل قطعات 297C-only (25 Nov 2026)

پنج شماره جدید از صفحات رسمی Cat Parts Store که 297C را صریحاً در Compatible Models دارند اما 287B را ندارند، به Master و CSV مستقل 297C-only افزوده شدند:
- 258-3790 — Seal؛ فیتمنت 297C، 287C و 277C و مدل‌های مرتبط.
- 258-3084 — Track Seal Washer Type؛ قطر بیرونی 385.75mm؛ فیتمنت 297C و مدل‌های نسل C/D، بدون 287B.
- 258-2732 — Fuel Tank Guard Assembly؛ فیتمنت 297C و مدل‌های مرتبط نسل C/D، بدون 287B.
- 134-2827 — Custom Length CM Seal؛ فیتمنت 297C، 287C و 277C، بدون 287B.
- 258-3549 — Bracket Assembly؛ فیتمنت 297C، 287C و 277C، بدون 287B.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-3790
- https://parts.cat.com/en/catcorp/product/258-3084
- https://parts.cat.com/en/catcorp/product/258-2732
- https://parts.cat.com/en/catcorp/product/134-2827
- https://parts.cat.com/en/catcorp/product/258-3549

این پنج شماره به‌عنوان فیتمنت 287B ثبت نشدند. برای sealها، ابعاد groove، مقطع، جنس و محل نصب؛ برای fuel tank guard و bracket، نسخه مخزن و الگوی اتصال باید با PIN و Parts Diagram تطبیق داده شود.

## دور ۵۱ — تکمیل فیتمنت‌های مستقل 297C (25 Nov 2026)

هفت شماره جدید از صفحات رسمی Cat Parts Store با نمایش صریح 297C و بدون نمایش 287B در Compatible Models به Master و CSV مستقل 297C-only افزوده شدند:
- 258-3621 — Hydraulic Cylinder Seal Kit؛ کاربرد وابسته به cylinder group.
- 258-4286 — Air Conditioner Tube؛ لوله مدار تهویه.
- 424-5259 — Seat Adjuster Kit؛ کیت تنظیم تعلیق صندلی.
- 258-4102 — Cab Wiring Harness؛ دسته‌سیم کابین.
- 585-1577 — Cab Radio with AM and FM؛ رادیوی کابین.
- 258-3537 — Fan Guard Assembly؛ محافظ فن.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-3621
- https://parts.cat.com/en/catcorp/product/258-4286
- https://parts.cat.com/en/catcorp/product/424-5259
- https://parts.cat.com/en/catcorp/product/258-4102
- https://parts.cat.com/en/catcorp/product/585-1577
- https://parts.cat.com/en/catcorp/product/258-3537

تمام موارد بالا از فیتمنت 287B جدا نگه داشته شدند. برای seal kit، cylinder group و serial number؛ برای A/C tube، routing و fittings؛ برای seat adjuster، mounting؛ برای harness و radio، گزینه‌های الکتریکی و connector؛ و برای fan guard، revision و clearance باید کنترل شوند.

## دور ۵۲ — مدار خنک‌کاری و قطعات بدنه 297C (25 Nov 2026)

از صفحات رسمی Cat Parts Store، سه شماره جدید به Master اضافه شد:
- 258-2880 — Fluid Carrying Tube Assembly؛ فیتمنت 297C و مدل‌های 287C/277C، بدون 287B.
- 258-3281 — Bracket Assembly؛ فیتمنت 297C و مدل‌های 287C/277C، بدون 287B.
- 300-9449 — Oil Pan Assembly؛ فیتمنت 287B و 297C؛ مجموعه شامل gasket و drain plug.

چهار قطعه موجود در Master نیز در CSV مستقل 297C-only تکمیل شدند:
- 278-8720 — Fan Motor Group؛ فقط 297C، 299C و 272C.
- 258-2552 — 9 Blade Aftercooler Fan؛ فقط 297C، 299C و 272C.
- 258-2880 — Fluid Carrying Tube Assembly.
- 258-3281 — Bracket Assembly.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-2880
- https://parts.cat.com/en/catcorp/product/258-3281
- https://parts.cat.com/en/catcorp/product/300-9449
- https://parts.cat.com/en/catcorp/product/278-8720
- https://parts.cat.com/en/catcorp/product/258-2552

قطعات 297C-only در فیتمنت 287B وارد نشدند. برای oil pan، engine arrangement و sump؛ برای fan motor، rotation، port و speed؛ برای aftercooler fan، قطر و جهت پره؛ و برای tube و bracket، routing، fitting و mounting pattern باید تطبیق داده شود.

## دور ۵۳ — لوله‌ها و کیت‌های آب‌بندی 297C (25 Nov 2026)

شش شماره جدید از صفحات رسمی Cat Parts Store که 297C را صریحاً در Compatible Models دارند اما 287B را ندارند، به Master و CSV مستقل 297C-only افزوده شدند:
- 258-3343 — Fluid Carrying Tube Assembly؛ قطر بیرونی 0.5in.
- 258-2938 — Fluid Carrying Tube Assembly؛ قطر بیرونی 0.63in.
- 258-3508 — Fluid Carrying Tube Assembly؛ قطر بیرونی 0.5in.
- 258-3879 — Fluid Carrying Tube Assembly؛ قطر بیرونی 0.5in.
- 172-5285 — Hydraulic Cylinder Seal Kit؛ کاربردهای مدل 297C و نسل‌های مرتبط، بدون 287B.
- 164-3213 — Hydraulic Cylinder Seal Kit؛ کاربردهای مدل 297C و نسل‌های مرتبط، بدون 287B.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-3343
- https://parts.cat.com/en/catcorp/product/258-2938
- https://parts.cat.com/en/catcorp/product/258-3508
- https://parts.cat.com/en/catcorp/product/258-3879
- https://parts.cat.com/en/catcorp/product/172-5285
- https://parts.cat.com/en/catcorp/product/164-3213

این قطعات به فیتمنت 287B تعمیم داده نشدند. برای tube assemblyها، قطر بیرونی، مسیر، اتصالات و فشار مدار؛ برای seal kitها، شماره گروه سیلندر، PIN و نسخه مهندسی کیت باید پیش از سفارش تطبیق داده شود.

## دور ۵۴ — تکمیل لوازم کابین و شیلنگ 297C (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 297C و بدون 287B ثبت شدند:
- 424-5245 — Seat Kit؛ فیتمنت 287C، 277C، 297C و مدل‌های مرتبط؛ صفحه کیت اجزای داخلی را فهرست نکرده است.
- 258-2841 — Medium Pressure Hydraulic Hose Assembly؛ فیتمنت 287C، 277C، 297C و مدل‌های مرتبط؛ قطر داخلی 0.25in و طول 35.63in.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/424-5245
- https://parts.cat.com/en/catcorp/product/258-2841

هر دو قطعه در Master عمومی و CSV مستقل 297C-only ثبت شدند و به فیتمنت 287B تعمیم داده نشدند. برای Seat Kit باید محتویات و configuration صندلی با فروشنده رسمی تأیید شود؛ برای Hose Assembly نیز فشار کاری، نوع اتصال و مسیر نصب باید با PIN دستگاه تطبیق داده شود.

## دور ۵۵ — تکمیل قطعات اتصال و آب‌بندی (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store به Master اضافه شدند:
- 113-0693 — 3/8in ID Steel Helical Spring Split Washer؛ Compatible Models صریحاً 287B و 297C را شامل می‌شود.
- 166-0321 — Seal Kit؛ Compatible Models شامل 297C و 287C است، اما 287B را نشان نمی‌دهد؛ فقط در CSV مستقل 297C-only ثبت شد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/113-0693
- https://parts.cat.com/en/catcorp/product/166-0321

برای 113-0693، قطر داخلی، نوع واشر و stack-up اتصال باید کنترل شود. برای 166-0321، صفحه Cat اعلام می‌کند قطعات داخل کیت در صفحه نمایش داده نشده‌اند؛ گروه کاربرد و PIN باید قبل از سفارش با فروشنده رسمی تطبیق داده شود. 166-0321 به فیتمنت 287B تعمیم داده نشد.

## دور ۵۶ — زیرمجموعه‌های رسمی Undercarriage برای 297C (25 Nov 2026)

۲۱ شماره جدید از صفحات رسمی Cat Parts Store در زیرمجموعه‌های undercarriage، axle، track seal، sleeve، roller و tensioner به Master افزوده شدند و در CSV مستقل 297C-only ثبت شدند؛ صفحات آن‌ها 297C را نشان می‌دهند اما 287B را در Compatible Models ندارند:
- 258-3122 — Carriage Bolt، طول 371.48mm.
- 258-3014 — Bearing Sleeve.
- 258-3035 — 60mm Internal Diameter Face Seal.
- 258-3087 — Track Seal Washer Type، قطر بیرونی 385.8mm.
- 258-3088 — Inner Sleeve، قطر داخلی 14.22mm.
- 258-3089 — Outer Sleeve، قطر داخلی 26.16mm.
- 258-3026 — Idler Axle Housing.
- 309-3303 — Front Axle Assembly LH.
- 309-3304 — Front Axle Assembly RH.
- 309-3306 — Rear Axle Assembly.
- 258-3008 — Track Roller Group، قطر بیرونی 50.8mm.
- 327-7724 — Idler Axle Group.
- 2F-8509 — Tapered Roller Cone Bearing.
- 258-3092 — Undercarriage Cap.
- 258-3047 — Rubber Cushion، قطر بیرونی 25.40mm.
- 258-3064 — Rear Axle Idler Shaft، طول 399.2mm.
- 309-3295 — Wheel Axle، قطر بیرونی 38.10mm.
- 258-3053 — Idler Axle Wheel (Inner)، قطر 381mm.
- 258-3052 — Idler Axle Wheel (Outer)، قطر 381mm.
- 258-3083 — Track Tensioner Group.
- 372-5769 — Track Roller.

شماره 6C-3241 نیز در Master موجود بود و در این دور به CSV مستقل 297C-only افزوده شد؛ Compatible Models آن 297C و 287C را دارد اما 287B را ندارد.
شماره 3B-4508 نیز در Master موجود بود و ردیف فیتمنت 287B/297C آن به CSV رسمی 287B اضافه شد.

منابع رسمی Cat:
- https://parts.cat.com/en/catcorp/product/258-3122
- https://parts.cat.com/en/catcorp/product/258-3014
- https://parts.cat.com/en/catcorp/product/258-3035
- https://parts.cat.com/en/catcorp/product/258-3087
- https://parts.cat.com/en/catcorp/product/258-3088
- https://parts.cat.com/en/catcorp/product/258-3089
- https://parts.cat.com/en/catcorp/product/258-3026
- https://parts.cat.com/en/catcorp/product/309-3303
- https://parts.cat.com/en/catcorp/product/309-3304
- https://parts.cat.com/en/catcorp/product/309-3306
- https://parts.cat.com/en/catcorp/product/258-3008
- https://parts.cat.com/en/catcorp/product/327-7724
- https://parts.cat.com/en/catcorp/product/2F-8509
- https://parts.cat.com/en/catcorp/product/258-3092
- https://parts.cat.com/en/catcorp/product/258-3047
- https://parts.cat.com/en/catcorp/product/258-3064
- https://parts.cat.com/en/catcorp/product/309-3295
- https://parts.cat.com/en/catcorp/product/258-3053
- https://parts.cat.com/en/catcorp/product/258-3052
- https://parts.cat.com/en/catcorp/product/258-3083
- https://parts.cat.com/en/catcorp/product/372-5769
- https://parts.cat.com/en/catcorp/product/6C-3241
- https://parts.cat.com/en/catcorp/product/3B-4508

این قطعات در فیتمنت 287B ثبت نشده‌اند. برای قطعات undercarriage، شماره گروه axle/roller، track pitch، ابعاد sleeve و seal، قطر شفت و آرایش undercarriage باید با PIN دستگاه کنترل شود.

## دور ۵۷ — تکمیل قطعات نگهدارنده 287B (25 Nov 2026)

- 126-5701 — 10mm Thick Retainer Plate؛ صفحه رسمی Cat Parts Store مدل 287B را صریحاً در Compatible Models نشان می‌دهد و 297C را در این فهرست ندارد. شماره به Master و CSV رسمی 287B افزوده شد.
- 261-6296 — Track Roller؛ صفحه رسمی Cat آن را DISCONTINUED اعلام می‌کند. شماره در Master تاریخی باقی می‌ماند و در CSV فیتمنت آن یادداشت DISCONTINUED و الزام تماس با Dealer برای replacement ثبت شده است؛ این مورد کالای سفارش‌پذیر جدید نیست.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/126-5701
- https://parts.cat.com/en/catcorp/product/261-6296

برای 126-5701، ضخامت 10mm، الگوی سوراخ‌ها و محل نصب باید با Parts Diagram و PIN تطبیق داده شود. قطعات Discontinued از سفارش‌پذیری خارج می‌مانند.

## دور ۵۸ — لوله هیدرولیک و وضعیت قطعات متوقف‌شده (25 Nov 2026)

- 289-3787 — Fluid Carrying Tube Assembly؛ صفحه رسمی Cat مدل 287B را صریحاً در Compatible Models نشان می‌دهد؛ قطر بیرونی 0.63in. ردیف فیتمنت 287B در CSV تکمیل شد.
- 272-3050 — Muffler Assembly؛ صفحه رسمی Cat مدل 287B را نشان می‌دهد، اما وضعیت DISCONTINUED دارد. شماره صرفاً برای تاریخچه کاتالوگ در Master و CSV ثبت شده و به‌صراحت غیرقابل سفارش به‌عنوان کالای نو است؛ برای replacement باید با Cat Dealer تماس گرفته شود.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/289-3787
- https://parts.cat.com/en/catcorp/product/272-3050

برای 289-3787، قطر لوله، routing، اتصالات و فشار مدار با PIN دستگاه تطبیق داده شود. برای 272-3050 هیچ موجودی یا فروش جدیدی فرض نشود.

## دور ۵۹ — تکمیل اجزای کیت Undercarriage 287B (25 Nov 2026)

دو شماره از صفحات رسمی Cat Parts Store که 287B را صریحاً در Compatible Models نشان می‌دهند، تکمیل شدند:
- 8S-6212 — 1/2-13 x 13in Hex Head Bolt؛ طول 13in و grip length برابر 11.5in؛ در Master و CSV فیتمنت 287B ثبت شد.
- 220-8161 — Rubber Track Belt؛ عرض 457mm، گام 100mm، 51 بخش؛ در Master از قبل موجود بود و ردیف فیتمنت 287B آن در CSV تکمیل شد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/8S-6212
- https://parts.cat.com/en/catcorp/product/220-8161

برای track belt، tread pattern، عرض، pitch و تعداد sections باید با track frame و sprocket مطابقت داده شود. برای 8S-6212 نیز طول، grade و محل اتصال با Parts Diagram کنترل شود. قطعات کیت 305-9256 به‌صورت خودکار هم‌فیت فرض نشدند؛ هر قطعه فقط با Compatible Models صفحه خودش ثبت می‌شود.

## دور ۶۰ — تکمیل قطعات HVAC کابین 287B (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store به Master و CSV فیتمنت 287B افزوده شدند:
- 231-8122 — Bottom Housing Assembly (HVAC)؛ Compatible Models شامل 287B است؛ بدنه ABS مشکی، عرض 16.3in، ارتفاع 4.1in و طول 22.2in.
- 231-8127 — Cabin Heater Water Valve Grommet؛ Compatible Models شامل 287B است؛ گِرومت EPDM با دو سوراخ 12.7mm.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/231-8122
- https://parts.cat.com/en/catcorp/product/231-8127

برای housing، نسخه HVAC، mount و insulation؛ برای grommet، قطر سوراخ‌ها، محل عبور شیلنگ و سازگاری با heater valve باید با cab configuration و PIN تطبیق داده شود.

## دور ۶۱ — تکمیل harness و work tool برای 297C (25 Nov 2026)

شش شماره جدید از صفحات رسمی Cat Parts Store به Master و CSV مستقل 297C-only اضافه شدند؛ 297C در Compatible Models وجود دارد و 287B در آن فهرست نشده است:
- 258-4126 — Work Tool Wiring Harness.
- 258-2881 — Work Tool Positioner Hydraulic Tube؛ قطر بیرونی 0.63in.
- 258-4116 — Engine Harness.
- 258-5193 — Rotating Group؛ توضیح عملکرد در صفحه رسمی محدود است.
- 258-2449 — Bracket Assembly.
- 258-2970 — Axial Piston Motor.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-4126
- https://parts.cat.com/en/catcorp/product/258-2881
- https://parts.cat.com/en/catcorp/product/258-4116
- https://parts.cat.com/en/catcorp/product/258-5193
- https://parts.cat.com/en/catcorp/product/258-2449
- https://parts.cat.com/en/catcorp/product/258-2970

این قطعات در فیتمنت 287B وارد نشدند. برای harnessها، connector pinout و engine/work tool options؛ برای tube، قطر، routing، اتصالات و فشار؛ برای motor، displacement، rotation و port؛ و برای bracket، mounting pattern باید با PIN و configuration دستگاه تطبیق داده شود.

## دور ۶۲ — تکمیل قطعات مخزن هیدرولیک (25 Nov 2026)

سه شماره از صفحات رسمی Cat Parts Store در این دور طبقه‌بندی شدند:
- 142-8937 — Lockable Non Vent Hydraulic Tank Cap؛ Compatible Models صریحاً 287B و 297C را دارد؛ در CSV رسمی 287B اضافه شد.
- 258-2829 — 83mm Outer Diameter Cap Breather؛ Compatible Models شامل 297C است اما 287B را ندارد؛ در CSV مستقل 297C-only ثبت شد.
- 264-4297 — Low Temperature Sensor؛ Compatible Models شامل 297C است اما 287B را ندارد؛ شماره جدید به Master و CSV مستقل 297C-only اضافه شد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/142-8937
- https://parts.cat.com/en/catcorp/product/258-2829
- https://parts.cat.com/en/catcorp/product/264-4297

برای cap، قطر دهانه، thread، آب‌بندی و non-vented بودن؛ برای breather، عملکرد تنفسی و اندازه رزوه؛ و برای sensor، thread، 2-pin DT و نوع خروجی باید با tank group و PIN دستگاه تطبیق داده شود. قطعه 258-2829 به فیتمنت 287B تعمیم داده نشد.

## دور ۶۳ — breather و fuel tube رسمی Cat (25 Nov 2026)

سه شماره از صفحات رسمی Cat Parts Store تکمیل شدند:
- 305-8044 — AC Breather Kit؛ Compatible Models شامل 297C است اما 287B را ندارد؛ به Master و CSV مستقل 297C-only افزوده شد. صفحه کیت اجزایی مانند 305-8048 Air Conditioner Breather Tube، 348-3485 Air Cleaner Vacuator Valve و 7X-2031 Push On Nut را نشان می‌دهد؛ این اجزا بدون بررسی مستقل فیتمنت جداگانه ثبت نشدند.
- 258-2988 — Fuel Tube Assembly؛ Compatible Models شامل 297C است اما 287B را ندارد؛ به Master و CSV مستقل 297C-only افزوده شد.
- 235-4931 — 9mm Inner Diameter Breather Hose؛ Compatible Models صریحاً 287B و 297C را شامل می‌شود؛ به Master و CSV رسمی 287B اضافه شد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/305-8044
- https://parts.cat.com/en/catcorp/product/258-2988
- https://parts.cat.com/en/catcorp/product/235-4931

برای AC Breather Kit، گزینه HVAC و اجزای kit؛ برای fuel tube، tee adapter و مسیر supply/return؛ و برای breather hose، قطر داخلی، طول و مسیر اتصال crankcase باید با PIN و engine arrangement تطبیق داده شود. 305-8044 و 258-2988 به فیتمنت 287B تعمیم داده نشدند.

## دور ۶۴ — تکمیل قطعات شیلنگ، تهویه و خنک‌کاری (25 Nov 2026)

بررسی صفحات رسمی Cat Parts Store، ۱۲ فیتمنت جدید برای دو مدل هدف را تأیید کرد:

**287B و 297C (در CSV فیتمنت 287B):**
- 287-6015 — Crankcase Breather Hose؛ هر دو مدل در Compatible Models.
- 177-1912 — Hose Assembly؛ هر دو مدل در Compatible Models.
- 159-4537 — Hose Assembly؛ هر دو مدل در Compatible Models.
- 207-9756 — Hose Assembly؛ هر دو مدل در Compatible Models.
- 279-5418 — Hose Assembly؛ هر دو مدل در Compatible Models.
- 161-0190 — HOSE A؛ هر دو مدل در Compatible Models.
- 036-1865 — Zinc Plated Heat Exchanger Radiator Cap؛ هر دو مدل در فهرست Compatible Models.
- 234-4802 — Engine Oil Cooler Cover؛ هر دو مدل در Compatible Models.
- 166-9312 — HOSE A؛ هر دو مدل در Compatible Models.
- 156-5508 — HOSE A؛ هر دو مدل در Compatible Models.

**فیتمنت 287B:**
- 218-6833 — Refrigerant Compressor؛ صفحه رسمی 287B را فهرست می‌کند.

**فقط 297C (در CSV مستقل):**
- 631-6270 — Cylinder Group؛ صفحه رسمی 297C را دارد اما 287B را ندارد؛ به 287B تعمیم داده نشد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/287-6015
- https://parts.cat.com/en/catcorp/product/177-1912
- https://parts.cat.com/en/catcorp/product/159-4537
- https://parts.cat.com/en/catcorp/product/218-6833
- https://parts.cat.com/en/catcorp/product/207-9756
- https://parts.cat.com/en/catcorp/product/279-5418
- https://parts.cat.com/en/catcorp/product/161-0190
- https://parts.cat.com/en/catcorp/product/036-1865
- https://parts.cat.com/en/catcorp/product/234-4802
- https://parts.cat.com/en/catcorp/product/166-9312
- https://parts.cat.com/en/catcorp/product/156-5508
- https://parts.cat.com/en/catcorp/product/631-6270

یادداشت سفارش: شیلنگ‌ها باید از نظر قطر داخلی، نوع تقویت، فشار، طول و مسیر با PIN و مدار واقعی تطبیق داده شوند؛ کمپرسور HVAC و cap نیز به مشخصات مبرد/اتصالات و فشار نامی نیاز دارند. برای 631-6270، محل سیلندر، کورس، قطر bore/rod و mounting باید با serial number بررسی شود. ثبت فیتمنت در فهرست مدل، جایگزین تأیید PIN و پیکربندی نیست.

## دور ۶۴ — تکمیل HVAC و قطعات کابین (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store با Compatible Models شامل 297C و بدون 287B به Master و CSV مستقل 297C-only افزوده شدند:
- 350-9034 — Cab Heater and Mounting Kit؛ فیتمنت 287C، 277C، 297C و مدل‌های C2 مرتبط؛ کیت شامل heater، ducting، insulation، seals، louvers و hardware است.
- 258-4379 — 5 Star Clamp Knob with M6 Threaded Stud؛ فیتمنت 297C و مدل‌های مرتبط، بدون 287B؛ قطر بیرونی 1.27in، طول 1.9in و stud رزوه M6.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/350-9034
- https://parts.cat.com/en/catcorp/product/258-4379

**اصلاح جزئیات 305-8044:** فهرست دقیق Items Included در صفحه Cat شامل 121-9870، 133-6934، 172-8591، 258-4379، 305-8046، 305-8047، 305-8048، 348-3485 و 7X-2031 است. صفحه 305-8047 اعلام می‌کند اطلاعات Compatible Models برای آن موجود نیست؛ بنابراین 305-8047 و سایر اجزای فاقد fitment مستقل به‌عنوان قطعه فیت‌شده ثبت نشده‌اند. 258-4379 اکنون به‌طور مستقل در CSV 297C-only آمده است.

منابع:
- https://parts.cat.com/en/catcorp/product/305-8044
- https://parts.cat.com/en/catcorp/product/305-8047
- https://parts.cat.com/en/catcorp/product/258-4379

برای kit heater، گزینه‌های کابین، لوله‌کشی، duct، louver و محل نصب باید با PIN تطبیق داده شوند؛ برای clamp knob نیز رزوه و interface فرمان بررسی شود.

## دور ۶۵ — قطعات شاسی، زیر‌بندی، seal kit و متعلقات (25 Nov 2026)

از صفحات رسمی Cat Parts Store این فیتمنت‌ها تکمیل شدند:

**287B (در CSV رسمی 287B):**
- 164-9989 — FILM؛ صفحه رسمی هر دو مدل 287B و 297C را فهرست می‌کند.
- 231-7161 — PLUG - GP؛ فیتمنت 287B.
- 305-9256 — KIT-UNDERCARRIAGE؛ فیتمنت 287B؛ صفحه رسمی ۱۲ قلم و تعدادهای هر قلم را نمایش می‌دهد؛ محتویات و ترکیب زیر‌بندی باید با دستگاه تطبیق داده شود.
- 301-7293 — SERVICE MTR KIT؛ فیتمنت 287B؛ صفحه Cat توضیح و محتویات کیت را ارائه نمی‌کند، بنابراین سفارش/فروش تا تأیید محتوای کیت از Dealer مجاز نیست.
- 238-7710 — FRAME AS.-RH؛ فیتمنت 287B.
- 119-1414 — SCREEN؛ فیتمنت 287B.

**فقط 297C (در CSV مستقل):**
- 105-9411 — SUPPORT؛ صفحه رسمی 297C را دارد اما 287B را ندارد.
- 139-6039 — NUT؛ صفحه رسمی 297C را دارد اما 287B را ندارد.

**موارد کنارگذاشته‌شده از ثبت سفارش‌پذیر:**
- 218-6996 — FITTING AS؛ صفحه Cat صریحاً Discontinued و Contact your dealer for replacement options اعلام می‌کند؛ به Master و فهرست قابل سفارش افزوده نشد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/164-9989
- https://parts.cat.com/en/catcorp/product/157-4835
- https://parts.cat.com/en/catcorp/product/238-7722
- https://parts.cat.com/en/catcorp/product/231-7161
- https://parts.cat.com/en/catcorp/product/218-6996
- https://parts.cat.com/en/catcorp/product/253-6949
- https://parts.cat.com/en/catcorp/product/305-9256
- https://parts.cat.com/en/catcorp/product/239-5010
- https://parts.cat.com/en/catcorp/product/301-7293
- https://parts.cat.com/en/catcorp/product/238-7710
- https://parts.cat.com/en/catcorp/product/218-6824
- https://parts.cat.com/en/catcorp/product/139-6039
- https://parts.cat.com/en/catcorp/product/119-1414
- https://parts.cat.com/en/catcorp/product/199-2129
- https://parts.cat.com/en/catcorp/product/105-9411

هشدار فنی: برای Hydraulic Cylinder Seal Kitهای 253-6949 و 218-6824، صفحه Cat می‌گوید کاربرد کیت وابسته به شماره Cylinder Group است؛ بنابراین Compatible Models به‌تنهایی برای انتخاب seal kit کافی نیست. برای 305-9256 باید اجزای کیت، تعداد track rollers/idlers/sleeves و track belt با زیر‌بندی واقعی تطبیق یابد. برای قطعات شاسی و screen، سمت نصب، ابعاد، سوراخ‌کاری و PIN ضروری است.

## دور ۶۵ — قطعات relief valve موتور 287B (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store به Master و CSV فیتمنت 287B افزوده شدند:
- 103-9725 — Engine Oil Pressure Relief Valve Assembly؛ Compatible Models صریحاً 287B و 297C را شامل می‌شود.
- 112-4645 — Relief Valve Spring؛ Compatible Models شامل 287B است و 297C در فهرست آن دیده نمی‌شود.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/103-9725
- https://parts.cat.com/en/catcorp/product/112-4645

برای 103-9725، engine arrangement و pressure setting؛ برای 112-4645، free length، spring rate و valve group application باید با موتور و شماره سریال دستگاه تطبیق داده شود.

## دور ۶۶ — تکمیل شیلنگ‌های هوا و سوخت 297C (25 Nov 2026)

سه شماره از صفحات رسمی Cat Parts Store با Compatible Models شامل 297C و بدون 287B تکمیل شدند:
- 216-0066 — 50.8mm Inner Diameter Air Line Hose؛ کاربرد بین موتور و aftercooler؛ فقط 297C در این گروه مدل.
- 258-3662 — Water Separator and Fuel Filter Hose؛ فیتمنت 287C، 277C، 297C و skid steerهای C مرتبط، بدون 287B.
- 373-9662 — Fumes Disposal Breather Hose؛ فیتمنت 287C، 277C، 297C و مدل‌های مرتبط، بدون 287B.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/216-0066
- https://parts.cat.com/en/catcorp/product/258-3662
- https://parts.cat.com/en/catcorp/product/373-9662

شماره 373-9662 به Master و CSV مستقل 297C-only افزوده شد؛ 216-0066 و 258-3662 از قبل در Master بودند و ردیف CSV آن‌ها تکمیل شد. هیچ‌یک به فیتمنت 287B تعمیم داده نشدند. برای 216-0066، قطر 50.8mm و اتصال turbocharger/aftercooler؛ برای 258-3662، مسیر fuel filter/water separator و اتصالات؛ و برای 373-9662، مسیر crankcase fumes و engine emissions configuration باید کنترل شوند.

## دور ۶۷ — ممیزی جداسازی CSV فیتمنت (25 Nov 2026)

ممیزی تطبیقی Master، CSV رسمی 287B و CSV مستقل 297C-only پنج مورد را پیدا کرد که در CSV 287B به اشتباه باقی مانده بودند، در حالی که صفحات رسمی Cat فقط 297C و مدل‌های C مرتبط را نشان می‌دادند:
- 278-8720 — Fan Motor Group.
- 258-2552 — 9 Blade Aftercooler Fan.
- 258-2881 — Work Tool Positioner Hydraulic Tube.
- 216-0066 — Air Line Hose.
- 258-3662 — Water Separator and Fuel Filter Hose.

این پنج ردیف از CSV فیتمنت 287B حذف شدند و در CSV مستقل 297C-only باقی ماندند. هیچ شماره‌ای از Master عمومی حذف نشد؛ Master فهرست شماره‌های OEM است، در حالی که CSVها مرجع فیتمنت مدل هستند. پس از این اصلاح، اشتراک این پنج شماره با CSV 287B صفر شد.

## دور ۶۶ — پمپ هیدرولیک، فیلتر و قطعات موتور (25 Nov 2026)

بررسی مجدد صفحات رسمی Cat Parts Store و تطبیق با CSVها انجام شد:
- 283-9476 — 25.4mm Inner Diameter Hydraulic Pump Hose؛ صفحه رسمی Cat صریحاً 287B را در Compatible Models دارد. در CSV رسمی 287B اضافه شد.
- 258-3621 — Hydraulic Cylinder Seal Kit؛ صفحه رسمی 297C را دارد اما 287B را ندارد. در CSV مستقل 297C-only اضافه شد؛ کاربرد کیت وابسته به Cylinder Group است و بدون شماره گروه سیلندر نباید سفارش نهایی شود.

مواردی که قبلاً در Master/CSV بودند و دوباره تکرار نشدند:
- 1R-0734 — Advanced Efficiency Engine Oil Filter؛ Compatible Models شامل 287B و 297C.
- 203-4827 — 7 Blade Oil Cooler Fan؛ Compatible Models شامل 287B و 297C.
- 234-4826 — Engine Oil Filter Union؛ Compatible Models شامل 287B و 297C.
- 225-9521 — Cyl Gp Basic؛ Compatible Models شامل 287B و 297C.
- 267-3766 و 177-1958 — Hydraulic Cylinder Seal Kits؛ Compatible Models شامل 287B و 297C؛ انتخاب نهایی وابسته به Cylinder Group است.
- 243-0406 — Engine Air Cleaner؛ Compatible Models شامل 287B و 267B، نه 297C.
- 110-6331 — Secondary Standard Efficiency Engine Air Filter؛ Compatible Models شامل 287B و 297C.

موارد غیرقابل سفارش یا خارج از فیتمنت:
- 228-9236 — PUMP GP-PS-V؛ صفحه Cat وضعیت Discontinued دارد؛ وارد فهرست سفارش‌پذیر نشد.
- 258-2552 و 278-8720 در Compatible Models فقط 297C و مدل‌های دیگر C را دارند و 287B را ندارند؛ در CSV 287B ثبت نمی‌شوند.
- 631-6270 در دور قبل به‌عنوان 297C-only ثبت شده و 287B نیست.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/283-9476
- https://parts.cat.com/en/catcorp/product/258-3621
- https://parts.cat.com/en/catcorp/product/1R-0734
- https://parts.cat.com/en/catcorp/product/203-4827
- https://parts.cat.com/en/catcorp/product/234-4826
- https://parts.cat.com/en/catcorp/product/225-9521
- https://parts.cat.com/en/catcorp/product/267-3766
- https://parts.cat.com/en/catcorp/product/177-1958
- https://parts.cat.com/en/catcorp/product/243-0406
- https://parts.cat.com/en/catcorp/product/110-6331
- https://parts.cat.com/en/catcorp/product/228-9236
- https://parts.cat.com/en/catcorp/product/258-2552
- https://parts.cat.com/en/catcorp/product/278-8720

نکته فنی: برای hose قطر داخلی، طول، فشار، اتصالات و مسیر؛ برای oil cooler fan قطر، تعداد پره و جهت چرخش؛ و برای seal kit شماره Cylinder Group باید پیش از سفارش کنترل شود.

## دور ۶۹ — اجزای HVAC و کابین (25 Nov 2026)

شش شماره جدید با Compatible Models شامل 297C و بدون 287B به Master و CSV مستقل 297C-only اضافه شدند:
- 258-4253 — Interior Duct Assembly.
- 258-4270 — Operator Cabin Heater.
- 266-2430 — Control Group (Air and Temperature)، پنل 24V با connector دوازده پین.
- 258-3792 — 18mm Thick Cabin Heater Mounting Seal.
- 258-4249 — Cab Air Inlet Duct، داکت پلی‌اتیلن زیر صندلی.
- 265-6618 و 265-6619 — Standard Efficiency Cabin Air Filters؛ هر دو از قبل در Master بودند و ردیف‌های CSV 297C-only تکمیل شد.

همچنین 218-6645 — M16 90 Degree Elbow Adapter Hose Bead to STOR — با فیتمنت رسمی 287B و 297C به Master و CSV رسمی 287B افزوده شد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-4253
- https://parts.cat.com/en/catcorp/product/258-4270
- https://parts.cat.com/en/catcorp/product/266-2430
- https://parts.cat.com/en/catcorp/product/258-3792
- https://parts.cat.com/en/catcorp/product/258-4249
- https://parts.cat.com/en/catcorp/product/265-6618
- https://parts.cat.com/en/catcorp/product/265-6619
- https://parts.cat.com/en/catcorp/product/218-6645

برای duct و heater، routing، airflow، coolant و electrical option؛ برای control panel، ولتاژ و pinout؛ برای filter، ابعاد و housing؛ و برای elbow، thread M16، hose bead و STOR interface باید با cab configuration و PIN تطبیق داده شود.

## دور ۷۰ — تکمیل seals و louver کابین 297C (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store با Compatible Models شامل 297C و بدون 287B به Master و CSV مستقل 297C-only اضافه شدند:
- 258-3794 — 12mm Thick Cab Heater Insulation؛ عایق لاستیک منبسط‌شده، ضخامت 12mm.
- 258-3795 — 148mm Long Cab Heater Louver Seal؛ ضخامت 10mm و آب‌بندی بین louver و heater.
- 258-3796 — Rectangular Plastic Inlet Duct Seal؛ فوم سلول‌بسته 10mm در انتهای inlet duct.
- 258-4248 — 397mm Length Cab Heater Louver Cover؛ پوشش پلی‌الفین خروجی هوای گرم.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-3794
- https://parts.cat.com/en/catcorp/product/258-3795
- https://parts.cat.com/en/catcorp/product/258-3796
- https://parts.cat.com/en/catcorp/product/258-4248

این قطعات به فیتمنت 287B تعمیم داده نشدند. برای insulation و sealها، ضخامت، profile، طول و سطح اتصال؛ و برای louver cover، طول 397mm و سازگاری با outlet باید با HVAC group و PIN تطبیق داده شود.

## دور ۷۱ — تکمیل قطعات سیستم تهویه مطبوع (25 Nov 2026)

شش شماره جدید از صفحات رسمی Cat Parts Store به Master اضافه شدند:
- 258-2466 — 8mm Thick Refrigerant Compressor Bracket؛ Compatible Models شامل 297C و مدل‌های C2 است، بدون 287B.
- 186-6190 — Refrigerant Accumulator؛ Compatible Models صریحاً 287B و 297C را دارد.
- 276-9875 — Aluminum Refrigerant Compressor؛ Compatible Models شامل 297C و 287C/277C است، بدون 287B.
- 258-3539 — Non-Cogged V-Belt؛ طول 38in و عرض 0.5in؛ فیتمنت 297C و مدل‌های C مرتبط، بدون 287B.
- 258-4290 — Air Conditioner Group؛ ابعاد 25.2 x 21.8 x 7.8in؛ فیتمنت 297C و مدل‌های C مرتبط، بدون 287B.
- 266-0299 — 12 Volt Air Conditioner Rocker Switch؛ پنج ترمینال و LED سبز؛ فیتمنت 297C و مدل‌های D/C مرتبط، بدون 287B.

186-6190 به CSV رسمی 287B اضافه شد؛ پنج شماره دیگر در CSV مستقل 297C-only ثبت شدند.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/258-2466
- https://parts.cat.com/en/catcorp/product/186-6190
- https://parts.cat.com/en/catcorp/product/276-9875
- https://parts.cat.com/en/catcorp/product/258-3539
- https://parts.cat.com/en/catcorp/product/258-4290
- https://parts.cat.com/en/catcorp/product/266-0299

برای accumulator و compressor، refrigerant type، pressure, clutch voltage و connections؛ برای bracket و belt، alignment و pulley profile؛ و برای switch، 12V، terminal layout و panel cutout باید با HVAC configuration و PIN تطبیق داده شود.


## دور ۶۷ — 25 Nov 2026

- ممیزی ابتدای دور: Master برابر 4,294 شماره یکتا بود؛ Mirror byte-exact و شمارنده Workflow برابر 4294 بود.
- سه فیتمنت جدید/تکمیل‌نشده در CSV رسمی 287B بررسی و ثبت شد:
  - 219-5431 — Hydraulic Cylinder Seal Kit؛ صفحه رسمی Cat مدل‌های 287B و 297C را صریحاً در Compatible Models دارد؛ شماره گروه سیلندر و PIN برای تأیید کاربرد لازم است.
  - 218-6824 — Hydraulic Cylinder Seal Kit؛ صفحه رسمی Cat مدل‌های 287B و 297C را صریحاً فهرست می‌کند؛ گروه سیلندر و پیکربندی باید تطبیق داده شود.
  - 219-5419 — Hydraulic Cylinder Seal Kit؛ صفحه رسمی Cat مدل‌های 287B و 297C را صریحاً فهرست می‌کند؛ شماره گروه سیلندر و PIN لازم است.
- فقط 219-5419 شماره جدید Master بود؛ دو شماره دیگر از قبل در Master بودند و صرفاً ردیف فیتمنت‌شان به CSV افزوده شد.
- قطعات seal kit تا تطبیق cylinder group/PIN نباید بدون بررسی فنی به سفارش قطعی تبدیل شوند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/219-5431 ؛ https://parts.cat.com/en/catcorp/product/218-6824 ؛ https://parts.cat.com/en/catcorp/product/219-5419
- موارد تکراری/قبلاً ثبت‌شده از نتایج همین جستجو دوباره به Master یا CSV اضافه نشدند.
- وضعیت پس از ثبت: Master هدف 4,295 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4295.


## دور ۶۸ — 25 Nov 2026

- مبنای دور: Master برابر 4,295 شماره یکتا پس از دور 67؛ Mirror و Workflow همگام بودند.
- دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B به Master و CSV 287B افزوده شد:
  - 142-8719 — M14 Engine Pump Coupling Adapter Plate؛ صفحه رسمی 287B را فهرست می‌کند؛ ابعاد/پیکربندی اتصال موتور و پمپ باید تطبیق داده شود.
  - 151-1975 — Adapter-Straight؛ صفحه رسمی 287B را فهرست می‌کند؛ رزوه و اتصال جفت‌شونده باید کنترل شود.
- نتایج 103-9747، 289-0850، 113-1141، 232-5877، 238-7709 و 234-4798 از قبل در Master و CSV ثبت شده بودند و دوباره درج نشدند.
- 335-9117 صریحاً Discontinued است؛ به موجودی سفارش‌پذیر اضافه نشد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/142-8719 ؛ https://parts.cat.com/en/catcorp/product/151-1975 ؛ https://parts.cat.com/en/catcorp/product/335-9117
- وضعیت پس از ثبت: Master برابر 4,297 شماره یکتا؛ Mirror byte-exact؛ Workflow برابر 4297.

## دور ۷۲ — ممیزی breather و کنترل ولو (25 Nov 2026)

شماره‌های زیر از صفحات رسمی Cat Parts Store بررسی شدند:
- 235-4951 — Crankcase Breather Adapter؛ Compatible Models شامل 287B و 297C؛ شماره جدید به Master و CSV رسمی 287B افزوده شد.
- 195-8356 — Crankcase Breather Bolt؛ Compatible Models شامل 287B و 297C؛ شماره جدید به Master و CSV رسمی 287B افزوده شد.
- 234-4837 — Crankcase Breather Clamp؛ 287B و 297C؛ در Master/CSV موجود بود.
- 235-4937 — Crankcase Breather Hose؛ 287B و 297C؛ در Master/CSV موجود بود.
- 320-1049 — Crankcase Breather Hose Clamp؛ 287B و 297C؛ در Master/CSV موجود بود.
- 231-7297 — Control Valve Spool Support Spring؛ 287B و 297C؛ در Master/CSV موجود بود.
- 336-1325 — Implement Control Valve Group؛ 297C و 287C/287C2، بدون 287B؛ از CSV 287B خارج و به CSV مستقل 297C-only منتقل شد.
- 396-4880 — Implement Control Valve؛ 297C و 287C/287C2، بدون 287B؛ شماره جدید به Master و CSV مستقل 297C-only افزوده شد.
- 1R-0734 — Advanced Efficiency Engine Oil Filter؛ 287B و 297C؛ در Master/CSV موجود بود.
- 101-0745 — 600mm Long Wiper Blade؛ ردیف فیتمنت 287B در CSV تکمیل شد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/235-4951
- https://parts.cat.com/en/catcorp/product/195-8356
- https://parts.cat.com/en/catcorp/product/234-4837
- https://parts.cat.com/en/catcorp/product/235-4937
- https://parts.cat.com/en/catcorp/product/320-1049
- https://parts.cat.com/en/catcorp/product/231-7297
- https://parts.cat.com/en/catcorp/product/336-1325
- https://parts.cat.com/en/catcorp/product/396-4880
- https://parts.cat.com/en/catcorp/product/1R-0734
- https://parts.cat.com/en/catcorp/product/101-0745

برای breather، diameter، hose routing، clamp force و crankcase pressure؛ برای control valve، pressure، flow و port arrangement؛ و برای wiper، adapter و arm geometry باید با PIN و parts diagram تطبیق داده شود.


## دور ۶۹ — 25 Nov 2026

- دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B و 297C به Master و CSV رسمی 287B افزوده شد:
  - 119-9631 — 12 Volt Direct Current Thermo Switch؛ سازگاری 287B و 297C در صفحه رسمی ثبت شده است؛ connector، رزوه و آستانه دما باید تطبیق داده شود.
  - 7T-6092 — Holder Assembly-Brush؛ سازگاری 287B و 297C در صفحه رسمی ثبت شده است؛ کاربرد دقیق مجموعه الکتریکی/استارتر/آلترناتور باید کنترل شود.
- نتایج دیگر جستجو در این مرحله از قبل در Master/CSV ثبت بودند؛ قطعات Discontinued وارد سفارش‌پذیرها نشدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/119-9631 ؛ https://parts.cat.com/en/catcorp/product/7T-6092
- شمارنده هدف این دور: 4302 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.

## دور ۷۳ — تکمیل مدار تهویه 287B و وضعیت hose discontinued (25 Nov 2026)

- 218-6813 — 15.88mm Inner Diameter Air Conditioner Lines Hose Assembly؛ Compatible Models صریحاً 287B را دارد؛ 0.625in ID، طول 42.559in، coupling نری 1-1/16in با زاویه 180° و اتصال مادگی مستقیم 7/8in. شماره جدید به Master و CSV رسمی 287B اضافه شد.
- 261-7162 — 15.88mm Inner Diameter Air Conditioner Lines Hose؛ Compatible Models شامل 287B است، اما صفحه Cat آن را DISCONTINUED و no longer available اعلام می‌کند. شماره به Master و CSV فقط برای تاریخچه ثبت شد و غیرقابل سفارش به‌عنوان کالای نو است.
- قطعات مرتبط 218-6833،299-9120،289-6360،218-6836،203-1100،234-4826،231-8137 و 313-6251 در Master/CSV موجود بودند و در این دور دوباره بررسی شدند.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/218-6813
- https://parts.cat.com/en/catcorp/product/261-7162
- https://parts.cat.com/en/catcorp/product/218-6833
- https://parts.cat.com/en/catcorp/product/299-9120
- https://parts.cat.com/en/catcorp/product/289-6360
- https://parts.cat.com/en/catcorp/product/218-6836
- https://parts.cat.com/en/catcorp/product/203-1100
- https://parts.cat.com/en/catcorp/product/234-4826
- https://parts.cat.com/en/catcorp/product/231-8137
- https://parts.cat.com/en/catcorp/product/313-6251

برای 218-6813، قطر hose، طول، coupling و نوع refrigerant باید تطبیق داده شود. 261-7162 فقط سابقه کاتالوگی است و فروش/موجودی جدید برای آن فرض نمی‌شود.


## دور ۷۰ — 25 Nov 2026

- سه مورد جدید/تکمیل‌نشده از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B در CSV ثبت شد:
  - 166-2559 — BRACKET؛ فیتمنت 287B؛ محل نصب و ابعاد سوراخ‌ها باید کنترل شود.
  - 218-0921 — Auxiliary Belt Drive Guard؛ فیتمنت 287B؛ نوع موتور و آرایش belt drive باید تطبیق داده شود.
  - 158-6695 — Cover Assembly؛ فیتمنت 287B؛ محل دقیق پنل/کاور و سخت‌افزار نصب باید بررسی شود. این شماره به Master افزوده شد.
- 234-0733 به علت وضعیت صریح Discontinued به فهرست سفارش‌پذیر اضافه نشد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/166-2559 ؛ https://parts.cat.com/en/catcorp/product/218-0921 ؛ https://parts.cat.com/en/catcorp/product/158-6695 ؛ https://parts.cat.com/en/catcorp/product/234-0733
- شمارنده هدف دور: 4305 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.

## دور ۷۴ — تکمیل قطعات کنترل اپراتور و هیدرولیک (25 Nov 2026)

چهار شماره جدید از صفحات رسمی Cat Parts Store به Master و CSV فیتمنت 287B افزوده شدند:
- 231-4260 — Operator Cabin Joystick Handle Control (RH)؛ 12-pin harness و wire length برابر 23.6in؛ Compatible Models شامل 287B.
- 227-5511 — Seal Kit؛ Compatible Models شامل 287B و 297C؛ صفحه قطعات O-ring مرتبط را نشان می‌دهد اما breakdown رسمی اجزای داخل kit ندارد.
- 204-1488 — 19.3mm Outer Diameter Compression Spring؛ طول 1.94in و قطر بیرونی 0.76in؛ Compatible Models شامل 287B و 297C.
- 173-0702 — 159.60mm Long Joystick Boot؛ Compatible Models شامل 287B است و 297C را نشان نمی‌دهد.

شماره 218-5807 — Parking Brake Control Manifold Tube Assembly — از قبل در Master و CSV بود و در این دور بازبینی شد؛ Compatible Models فقط 287B را در گروه Multi Terrain Loader نشان می‌دهد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/231-4260
- https://parts.cat.com/en/catcorp/product/227-5511
- https://parts.cat.com/en/catcorp/product/204-1488
- https://parts.cat.com/en/catcorp/product/173-0702
- https://parts.cat.com/en/catcorp/product/218-5807

برای joystick، connector pinout، wire length و سمت RH؛ برای seal kit، گروه کاربرد و اجزای داخل کیت؛ برای spring، قطر و نرخ فنر؛ و برای boot، profile و sealing lip باید با control group و PIN تطبیق داده شود.


## دور ۷۱ — 25 Nov 2026

- چهار فیتمنت جدید/تکمیل‌نشده از صفحات رسمی Cat Parts Store به CSV رسمی 287B اضافه شد:
  - 238-7710 — FRAME AS.-RH؛ سازگاری 287B؛ سمت راست و پیکربندی Track Frame با PIN کنترل شود.
  - 157-4835 — Load Capacity Instruction Plate؛ سازگاری 287B و 297C؛ زبان برچسب و ظرفیت مجاز متناسب با آرایش دستگاه بررسی شود.
  - 230-5407 — FRAME AS.؛ سازگاری 287B و 297C؛ محل دقیق فریم و شماره سریال دستگاه تطبیق داده شود. شماره جدید Master.
  - 187-3212 — 405mm Long Plate؛ سازگاری 287B؛ ابعاد و نقاط نصب در مجموعه cab/debris barrier بررسی شود. شماره جدید Master.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/238-7710 ؛ https://parts.cat.com/en/catcorp/product/157-4835 ؛ https://parts.cat.com/en/catcorp/product/230-5407 ؛ https://parts.cat.com/en/catcorp/product/187-3212
- وضعیت فایل‌های Master/Mirror/Workflow در زمان ثبت: 4,311 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4311.

## دور ۷۵ — کیت کنترل work tool متوقف‌شده (25 Nov 2026)

- 233-5638 — KIT-WORK TOOL CONTROL & WIRING؛ صفحه رسمی Cat Compatible Models شامل 287B و 257B است، اما محصول به‌صورت DISCONTINUED نمایش داده می‌شود و صفحه برای replacement options به Dealer ارجاع می‌دهد.
- شماره 233-5638 به Master و CSV رسمی 287B فقط برای تاریخچه افزوده شد؛ status صریحاً HISTORICAL ONLY / DISCONTINUED است و قابل سفارش به‌عنوان کالای نو نیست.
- صفحه kit تعداد 18 جزء را نمایش می‌دهد؛ قطعاتی مانند 216-4725،225-8012 و 231-4258 در صفحات مستقل خودشان fitment دارند و باید جداگانه ارزیابی شوند. هیچ‌یک از اجزای kit صرفاً بر اساس عضویت در این kit فیتمنت 287B نگرفتند.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/233-5638

برای جایگزینی کیت، فقط Cat Dealer می‌تواند replacement فعلی و compatibility آن را تأیید کند. هیچ شماره جایگزین از روی این صفحه حدس زده نشده است.


## دور ۷۲ — 25 Nov 2026

- دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B ثبت شد:
  - 234-7731 — Bracket Assembly؛ سازگاری 287B و 297C؛ ارتفاع درج‌شده 2.58in؛ محل نصب و PIN تطبیق داده شود.
  - 3E-9179 — Terminal-Blade؛ سازگاری 287B؛ ترمینال برای سیم 16–14 AWG؛ گیج سیم، نوع پرس و ابعاد ترمینال کنترل شود.
- هر دو شماره به Master و CSV رسمی 287B افزوده شدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/234-7731 ؛ https://parts.cat.com/en/catcorp/product/3E-9179
- وضعیت Master/Mirror/Workflow در زمان ثبت: 4,314 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4314.


## دور ۷۳ — 25 Nov 2026

- دو فیتمنت رسمی جدید/تکمیل‌نشده برای 287B ثبت شد:
  - 107-3134 — Housing-Connector؛ صفحه رسمی Cat مدل 287B را صریحاً فهرست می‌کند؛ خانواده کانکتور، کلیدگذاری و تعداد پین/سوکت باید تطبیق داده شود. شماره از قبل در Master بود و ردیف CSV تکمیل شد.
  - 165-0312 — Bare Covering Jumper Wire؛ صفحه رسمی Cat مدل‌های 287B و 297C را فهرست می‌کند؛ طول، گیج هادی و نوع ترمینیشن باید کنترل شود. شماره جدید Master.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/107-3134 ؛ https://parts.cat.com/en/catcorp/product/165-0312
- شمارنده هدف دور: 4317 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.

## دور ۷۶ — تکمیل قطعات مدار مبرد (25 Nov 2026)

دو شماره جدید از صفحات رسمی Cat Parts Store به Master و CSV فیتمنت 287B اضافه شدند:
- 232-1384 — Directional Flow Brown Orifice Tube؛ Compatible Models شامل 287B و 297C؛ قطر بیرونی 10.9mm و orifice برابر 1.194mm.
- 9X-7382 — 1.78 x 14mm 78A HNBR O-Ring؛ Compatible Models شامل 287B و 297C؛ مقطع 1.78mm، قطر داخلی 14mm و ماده HNBR با سختی 78A.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/232-1384
- https://parts.cat.com/en/catcorp/product/9X-7382

این قطعات در مدار تهویه و refrigerant استفاده می‌شوند؛ جهت جریان orifice، قطر شیار و سازگاری ماده HNBR با refrigerant HFC-134a باید قبل از سفارش و نصب کنترل شود.


## دور ۷۴ — 25 Nov 2026

- سه شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B ثبت شد:
  - 259-1107 — 28 Volt Single Pole Toggle Switch؛ فیتمنت 287B و 297C؛ کلید سه‌حالته 5/14/28V با کانکتور 3-pin DT؛ منطق مدار و pinout کنترل شود.
  - 277-0655 — KIT-ROADING CONVERSION؛ فیتمنت 287B؛ کیت شامل 34 قلم؛ محتویات کامل و پیکربندی ماشین تطبیق داده شود.
  - 186-3735 — CONNECTOR PIN؛ فیتمنت 287B و 297C؛ پین روکش طلا برای سیم 16–18 AWG و جریان تا 7.5A؛ cavity و retention کنترل شود.
- هر سه شماره به Master و CSV رسمی 287B افزوده شدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/259-1107 ؛ https://parts.cat.com/en/catcorp/product/277-0655 ؛ https://parts.cat.com/en/catcorp/product/186-3735
- شمارنده هدف دور: 4320 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.

## دور ۷۷ — تکمیل کیت plunger شیر پایلوت (25 Nov 2026)

- 198-1076 — Plunger Kit؛ صفحه رسمی Cat Compatible Models شامل 287B و مدل‌های مرتبط است و 297C را در فهرست این قطعه نشان نمی‌دهد. شماره جدید به Master و CSV فیتمنت 287B اضافه شد.
- اجزای اعلام‌شده در صفحه: plunger guide، hollow plunger، washer، standard plate و snap ring.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/198-1076

برای این kit، نوع pilot valve، شماره گروه، جهت نصب و serial range باید با Parts Diagram دستگاه تطبیق داده شود؛ فیتمنت 287B به‌تنهایی تطبیق نهایی گروه شیر را تضمین نمی‌کند.


## دور ۷۶ — 25 Nov 2026

- 036-1865 — Zinc Plated Heat Exchanger Radiator Cap؛ صفحه رسمی Cat Parts Store مدل‌های 287B و 297C را صریحاً فهرست می‌کند. شماره از قبل در Master بود و ردیف فیتمنت آن به CSV رسمی 287B افزوده شد.
- مشخصات سفارش باید با فشار نامی، ابعاد دهانه و آرایش سیستم خنک‌کاری تطبیق داده شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/036-1865

## دور ۷۸ — تکمیل هشدار دنده عقب (25 Nov 2026)

- 161-2539 — Backup Alarm Assembly؛ صفحه رسمی Cat Compatible Models شامل 287B است و 297C را در فهرست آن نشان نمی‌دهد.
- مشخصات رسمی: 107 dB(A)، بازه ولتاژ 12 تا 24V، مقاوم در برابر آب و مناسب پیچ‌های 1/4-20.
- شماره جدید به Master و CSV رسمی 287B افزوده شد.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/161-2539

برای سفارش، ولتاژ سیستم، محل نصب، پیچ‌های 1/4-20 و الزامات سطح صدای هشدار باید کنترل شوند.


## دور ۷۷ — 25 Nov 2026

- سه شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B ثبت شد:
  - 218-6389 — Control Console؛ کنسول کنترل اپراتور؛ layout، سوئیچ‌ها، کانکتور harness و PIN باید بررسی شود.
  - 154-4233 — Interlock Control؛ کنترل الکترونیکی interlock؛ نسخه مدار ایمنی و pinout باید تطبیق داده شود.
  - 218-6485 — Control Group-Handle؛ مجموعه دسته کنترل پایلوت سمت چپ؛ سمت joystick و سازگاری با شیر/هارنس کنترل شود.
- هر سه شماره به Master و CSV رسمی 287B افزوده شدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/218-6389 ؛ https://parts.cat.com/en/catcorp/product/154-4233 ؛ https://parts.cat.com/en/catcorp/product/218-6485
- شمارنده هدف دور: 4326 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۷۸ — 25 Nov 2026

- 418-5850 — Cabin Door Window؛ صفحه رسمی Cat Parts Store مدل 287B را صریحاً در Compatible Models فهرست می‌کند. این شماره جدید به Master و CSV رسمی 287B افزوده شد.
- پیش از سفارش، نسل درب کابین، ابعاد شیشه، پروفیل آب‌بندی و نقاط نصب باید تطبیق داده شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/418-5850
- شمارنده هدف دور: 4327 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.

## دور ۷۹ — seal kit پمپ و فیلتر آب‌گیر (25 Nov 2026)

در بررسی صفحات رسمی Cat Parts Store:
- 148-9363 — Seal Kit؛ Compatible Models شامل 287B و 297C؛ در Master و CSV رسمی 287B موجود بود.
- 307-3043 — Piston Pump Seal Kit؛ Compatible Models شامل 287B و 297C؛ در Master و CSV رسمی 287B موجود بود.
- 200-2371 — Seal Kit؛ Compatible Models شامل 287B و 297C؛ در Master و CSV رسمی 287B موجود بود.
- 647-3710 — Cylinder Seal Kit؛ Compatible Models شامل 287B و 297C؛ در Master و CSV رسمی 287B موجود بود.
- 278-8733 — Piston Motor Seal Kit؛ Compatible Models شامل 297C و 287C/277C است اما 287B را ندارد؛ شماره جدید به Master و CSV مستقل 297C-only اضافه شد.
- 361-9555 — Fuel Water Separator؛ Compatible Models شامل 297C، 287C و 277C است اما 287B را ندارد؛ از CSV 287B حذف و در CSV مستقل 297C-only ثبت شد.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/148-9363
- https://parts.cat.com/en/catcorp/product/307-3043
- https://parts.cat.com/en/catcorp/product/200-2371
- https://parts.cat.com/en/catcorp/product/647-3710
- https://parts.cat.com/en/catcorp/product/278-8733
- https://parts.cat.com/en/catcorp/product/361-9555

برای seal kitها، pump/cylinder group و serial range باید با PIN و Parts Diagram تطبیق داده شود. 361-9555 به فیتمنت 287B تعمیم داده نشد.


## دور ۷۹ — 25 Nov 2026

- دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B ثبت شد:
  - 231-7321 — 841.80mm Height Safety Glass؛ شیشه سکوریت با ابعاد درج‌شده 3.86 × 10.43 × 33.27 اینچ؛ موقعیت دقیق پنل کابین و کد شیشه تطبیق داده شود.
  - 258-7688 — Joystick Kit؛ سازگاری 287B و 297C؛ کیت با 14 قلم درج‌شده؛ آرایش joystick، trigger/switch و مدار pilot با PIN بررسی شود.
- هر دو شماره به Master و CSV رسمی 287B افزوده شدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/231-7321 ؛ https://parts.cat.com/en/catcorp/product/258-7688
- وضعیت شمارنده: 4330 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4330.


## دور ۸۰ — 25 Nov 2026

- چهار فیتمنت جدید/تکمیل‌نشده از صفحات رسمی Cat Parts Store به CSV رسمی 287B افزوده شد:
  - 223-3726 — Handle-Modular؛ فیتمنت 287B؛ دسته ماژولار 12-pin با ابعاد 7.5 × 3.0 × 5.4 اینچ و سیم 13.8 اینچ؛ pinout بررسی شود. شماره جدید Master.
  - 278-8717 — 18mm Inner Diameter Gear Motor Shaft Seal؛ فیتمنت 287B؛ قطر شفت و جهت نصب/جنس آب‌بند بررسی شود. شماره جدید Master.
  - 278-1970 — Hydraulic Cylinder Seal Kit؛ فیتمنت 287B و 297C؛ حتماً cylinder group number و PIN پیش از سفارش تطبیق داده شود.
  - 233-5633 — FILM؛ فیتمنت 287B؛ Cat شرح کاربرد را در صفحه پر نکرده، بنابراین محل/کاربرد دقیق باید از Parts Diagram تأیید شود.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/223-3726 ؛ https://parts.cat.com/en/catcorp/product/278-8717 ؛ https://parts.cat.com/en/catcorp/product/278-1970 ؛ https://parts.cat.com/en/catcorp/product/233-5633
- وضعیت Master/Mirror/Workflow در زمان ثبت: 4,333 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4333.

## دور ۸۰ — تکمیل track frame 287B (25 Nov 2026)

- 238-7711 — Frame Assembly LH؛ صفحه رسمی Cat Compatible Models شامل 287B و 287 است؛ شماره جدید به Master و CSV فیتمنت 287B افزوده شد.
- 238-7710 — Frame Assembly RH؛ از قبل در Master و CSV رسمی 287B ثبت بود.
- 238-7712 — Track Tensioner Group؛ از قبل در Master و CSV رسمی 287B ثبت بود.

منابع رسمی:
- https://parts.cat.com/en/catcorp/product/238-7710
- https://parts.cat.com/en/catcorp/product/238-7711
- https://parts.cat.com/en/catcorp/product/238-7712

برای frame assembly، سمت چپ/راست، weldment revision، mounting bosses و PIN range باید با chassis و track frame دستگاه تطبیق داده شود. شماره‌های RH/LH با یکدیگر قابل جایگزینی فرض نمی‌شوند.


## دور ۸۱ — 25 Nov 2026

- دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B ثبت شد:
  - 233-5680 — FILM؛ فیتمنت 287B؛ جنس PVC/PET؛ شرح Cat خالی است و محل دقیق فیلم باید از Parts Diagram همان PIN تأیید شود.
  - 224-8645 — Warning Film Label؛ فیتمنت 287B و 297C؛ ابعاد 31.55 × 42.41 × 3.14 اینچ؛ محل نصب و revision متن ایمنی باید تطبیق داده شود.
- هر دو شماره به Master و CSV رسمی 287B افزوده شدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/233-5680 ؛ https://parts.cat.com/en/catcorp/product/224-8645
- شمارنده هدف دور: 4335 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۸۲ — 25 Nov 2026

- دو فیتمنت جدید/تکمیل‌نشده از صفحات رسمی Cat Parts Store در CSV رسمی 287B ثبت شد:
  - 233-5698 — Fluid Carrying Tube Assembly؛ فیتمنت 287B؛ قطر بیرونی 0.37in؛ مسیر لوله، خم‌ها و اتصالات باید تطبیق داده شود. شماره از قبل در Master بود.
  - 278-1969 — CYL GP-BASIC؛ فیتمنت 287B و 297C؛ شماره جدید Master. پیش از سفارش، bore/stroke، شماره گروه سیلندر و PIN دستگاه بررسی شود.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/233-5698 ؛ https://parts.cat.com/en/catcorp/product/278-1969
- شمارنده هدف دور: 4336 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۸۳ — 25 Nov 2026

- دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B ثبت شد:
  - 230-3757 — 27.8mm Inner Diameter Shaft Seal؛ آب‌بند NBR برای gear pump؛ قطر شفت درج‌شده 27.8mm؛ قطر بیرونی/عرض و group پمپ باید تطبیق داده شود.
  - 230-4959 — SEAL KIT؛ سازگاری 287B و 297C؛ کاربرد دقیق، group، محدوده PIN و محتویات کیت پیش از سفارش از Parts Diagram کنترل شود.
- هر دو شماره به Master و CSV رسمی 287B افزوده شدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/230-3757 ؛ https://parts.cat.com/en/catcorp/product/230-4959
- شمارنده هدف دور: 4338 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۸۴ — 25 Nov 2026

- چهار فیتمنت جدید/تکمیل‌نشده از صفحات رسمی Cat Parts Store به CSV رسمی 287B افزوده شد:
  - 125-9134 — 70.60mm Outer Diameter Bearing؛ فیتمنت 287B؛ موقعیت، بار مجاز و ابعاد شفت/نشیمن تطبیق داده شود. شماره جدید Master.
  - 393-3670 — BEARING-SLV-GD؛ فیتمنت 287B و 297C؛ ابعاد درج‌شده 1.506in ID، 2.002in OD و 1.09in طول؛ شماره جدید Master.
  - 231-7161 — PLUG - GP؛ فیتمنت 287B؛ محل نصب و سطح آب‌بندی از Parts Diagram کنترل شود.
  - 230-3726 — 18mm Inner Diameter Shaft Seal؛ فیتمنت 287B؛ آب‌بند NBR برای fan motor؛ قطر شفت، OD و عرض با group موتور تطبیق داده شود.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/125-9134 ؛ https://parts.cat.com/en/catcorp/product/393-3670 ؛ https://parts.cat.com/en/catcorp/product/231-7161 ؛ https://parts.cat.com/en/catcorp/product/230-3726
- وضعیت ثبت: 4341 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4341.


## دور ۸۵ — 25 Nov 2026

- 232-4703 — GASKET؛ صفحه رسمی Cat Parts Store مدل‌های 287B و 297C را صریحاً در Compatible Models فهرست می‌کند. شماره جدید به Master و CSV رسمی 287B افزوده شد.
- پیش از سفارش، سطح تماس، جنس/پروفیل گسکت و موقعیت دقیق آن در Parts Diagram تأیید شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/232-4703
- شمارنده هدف دور: 4342 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.

## دور ۸۱ — سیلندر هیدرولیک نسل جدید 297C (25 Nov 2026)

- 578-3190 — General Duty Hydraulic Cylinder؛ صفحه رسمی Cat Compatible Models شامل 297C و مدل‌های 287C/277C است، اما 287B را نشان نمی‌دهد.
- شماره جدید به Master و CSV مستقل 297C-only اضافه شد.
- مشخصات صفحه: ساختار فولاد کربنی، cylinder barrel، piston rod و seals؛ کاربرد برای حرکت خطی lift/tilt.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/578-3190

این قطعه به فیتمنت 287B تعمیم داده نشد. پیش از سفارش باید bore، stroke، port locations، mounting dimensions، cylinder arrangement و PIN دستگاه با Dealer/Parts Diagram تطبیق داده شود.


## دور ۸۶ — 25 Nov 2026

- 230-3686 — Lip Type Seal Group (Fan Motor Group)؛ صفحه رسمی Cat Parts Store مدل 287B را صریحاً در Compatible Models فهرست می‌کند. شماره از قبل در Master بود و ردیف فیتمنت آن به CSV رسمی 287B اضافه شد.
- ابعاد صفحه: shaft diameter برابر 0.708in، ID برابر 0.7in، OD برابر 1.575in، عرض 0.264in و ضخامت 0.3in؛ گروه فن و نشیمن آب‌بند باید تطبیق داده شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/230-3686

## دور ۸۲ — bearing سیلندر tilt 297C (25 Nov 2026)

- 625-7420 — Hydraulic Tilt Cylinder Bearing؛ Compatible Models شامل 297C و 287C/277C است اما 287B را نشان نمی‌دهد.
- مشخصات رسمی: قطر داخلی 1.504in، قطر بیرونی 1.89in و طول 1.89in؛ جنس Carbon Steel.
- شماره به Master و CSV مستقل 297C-only افزوده شد.

منبع رسمی:
- https://parts.cat.com/en/catcorp/product/625-7420

این قطعه به فیتمنت 287B تعمیم داده نشد. پیش از سفارش، قطر شفت، طول sleeve، bearing interface و cylinder arrangement با PIN و Parts Diagram تطبیق داده شود.


## دور ۸۷ — 25 Nov 2026

- 229-5468 — COUPLING-MAL؛ صفحه رسمی Cat Parts Store مدل‌های 287B و 297C را صریحاً در Compatible Models فهرست می‌کند. شماره جدید به Master و CSV رسمی 287B افزوده شد.
- جنس درج‌شده Alloy Steel است؛ چون صفحه Cat ابعاد/شرح دقیق ندارد، نوع اتصال، رزوه/اینترفیس و قطعه مادگی جفت‌شونده باید از Parts Diagram کنترل شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/229-5468
- شمارنده هدف دور: 4344 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۸۸ — 25 Nov 2026

- 218-6490 — Operator Cabin Joystick Handle Control؛ صفحه رسمی Cat Parts Store مدل 287B را صریحاً در Compatible Models فهرست می‌کند. شماره جدید به Master و CSV رسمی 287B افزوده شد.
- دسته کنترل شامل boot و دکمه‌هاست؛ سمت دسته، چیدمان دکمه‌ها، pinout هارنس و آرایش pilot-control باید با دستگاه تطبیق داده شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/218-6490
- شمارنده هدف دور: 4351 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۸۹ — 25 Nov 2026

- 096-8482 — 2mm Thick Oil Pan Drain Plug Gasket؛ صفحه رسمی Cat Parts Store مدل‌های 287B و 297C را صریحاً در Compatible Models فهرست می‌کند. شماره جدید به Master و CSV رسمی 287B افزوده شد.
- ضخامت درج‌شده 2mm است؛ اندازه plug، سطح آب‌بندی کارتل و پیکربندی oil pan باید تطبیق داده شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/096-8482
- شمارنده هدف دور: 4352 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۹۰ — 25 Nov 2026

- سه شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B ثبت شد:
  - 193-8385 — 3mm Thick Side Panel Mounting Plate؛ فیتمنت 287B؛ جنس فولاد کربنی/سازه‌ای؛ سمت پنل و الگوی سوراخ‌ها بررسی شود.
  - 227-4315 — Mounting Plate؛ فیتمنت 287B و 297C؛ ابعاد 45 × 254 × 93.5 میلی‌متر و وزن 3.07lb؛ محل نصب و revision براکت تطبیق داده شود.
  - 218-6006 — Bracket Assembly؛ فیتمنت 287B؛ ابعاد 5.51 × 6.93 × 4.21in، ضخامت 0.24in و وزن 1.66lb؛ محل اتصال و hole spacing بررسی شود.
- هر سه شماره به Master و CSV رسمی 287B افزوده شدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/193-8385 ؛ https://parts.cat.com/en/catcorp/product/227-4315 ؛ https://parts.cat.com/en/catcorp/product/218-6006
- شمارنده هدف دور: 4355 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۹۱ — 25 Nov 2026

- 117-7248 — 0.6mm Thick Piston Pump Rotating Barrel Shim؛ صفحه رسمی Cat Parts Store مدل 287B را صریحاً در Compatible Models فهرست می‌کند. شماره جدید به Master و CSV رسمی 287B افزوده شد.
- ضخامت درج‌شده 0.6mm است؛ stack شیم، گروه پمپ و تلرانس clearance/preload باید مطابق مشخصات پمپ بررسی شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/117-7248
- شمارنده هدف دور: 4356 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۹۲ — 25 Nov 2026

- دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B و 297C ثبت شد:
  - 446-1412 — Seal Kit؛ سازگاری 287B و 297C؛ گروه کاربرد، محدوده سریال و محتویات seal kit پیش از سفارش باید از Parts Diagram تأیید شود.
  - 069-4080 — Adapter-Elbow 90°؛ سازگاری 287B و 297C؛ جنس برنج/فولاد آلیاژی و ابعاد 1.6 × 1.1 × 0.6 اینچ؛ رزوه/پورت و فشار کاری باید تطبیق داده شود.
- هر دو شماره به Master و CSV رسمی 287B افزوده شدند؛ قطعات 258-3662، 278-8720 و 258-3537 در CSV مستقل 297C-only از قبل ثبت بودند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/446-1412 ؛ https://parts.cat.com/en/catcorp/product/069-4080 ؛ https://parts.cat.com/en/catcorp/product/258-3662 ؛ https://parts.cat.com/en/catcorp/product/278-8720 ؛ https://parts.cat.com/en/catcorp/product/258-3537
- شمارنده هدف دور: 4358 شماره یکتا؛ Mirror و Workflow با Master همگام شدند.


## دور ۹۳ — 25 Nov 2026

- دو شماره جدید از صفحات رسمی Cat Parts Store ثبت شد:
  - 5P-9909 — Adhesive Rubber Bulk Seal؛ فیتمنت صریح 287B و 297C؛ جنس CR expanded rubber، cross-section width برابر 1.000in و thickness برابر 0.750in؛ طول سفارشی و پروفیل باید با joint تطبیق داده شود. به Master و CSV 287B افزوده شد.
  - 247-5904 — Bearing Housing؛ فیتمنت صریح 297C و نبود 287B در Compatible Models؛ قطر بیرونی 8.86in، عرض 2.68in و سوراخ‌های M16؛ فقط در CSV مستقل 297C-only ثبت شد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/5P-9909 ؛ https://parts.cat.com/en/catcorp/product/247-5904
- وضعیت شمارنده: 4360 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4360.


## دور ۹۴ — 25 Nov 2026

- دو قطعه جدید/تکمیل‌نشده که صفحه رسمی Cat فقط 297C را (و نه 287B) فهرست می‌کند، در CSV مستقل 297C-only ثبت شد:
  - 258-3942 — SEAL؛ جنس Acrylic Adhesive/Chloroprene Rubber؛ محل نصب، پروفیل و ابعاد باید از Parts Diagram تعیین شود. شماره جدید Master.
  - 258-2970 — MOTOR GP-PSB (Axial Piston Motor)؛ ابعاد درج‌شده طول 12.8in و ارتفاع 10.9in؛ displacement، shaft/interface، پورت‌ها و مدار هیدرولیک با PIN تطبیق داده شود. شماره از قبل در Master بود.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/258-3942 ؛ https://parts.cat.com/en/catcorp/product/258-2970
- وضعیت شمارنده: 4361 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4361.


## دور ۹۵ — 25 Nov 2026

- 453-5488 — Seal Kit؛ صفحه رسمی Cat مدل 297C را فهرست می‌کند و 287B را ندارد؛ کیت Teflon با وزن 0.03lb؛ گروه آب‌بندی و stack قطعات باید بررسی شود. به Master و CSV مستقل 297C-only افزوده شد.
- 291-0010 — VALVE GP-MTG؛ صفحه رسمی Cat فقط مدل‌های 287C/277C/297C/287C2/277C2 را فهرست می‌کند و 287B در آن نیست؛ ردیف اشتباه آن از CSV 287B حذف و در CSV 297C-only ثبت شد.
- 218-6858 در CSV 287B باقی ماند؛ صفحه رسمی Compatible Models صریحاً 287B و 297C را شامل می‌کند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/453-5488 ؛ https://parts.cat.com/en/catcorp/product/291-0010 ؛ https://parts.cat.com/en/catcorp/product/218-6858
- وضعیت شمارنده: 4362 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4362.


## دور ۹۶ — 25 Nov 2026

- چهار شماره جدید/تکمیل‌نشده از صفحات رسمی Cat Parts Store ثبت شد:
  - 295-1799 — VALVE GP-RLF؛ فیتمنت صریح 287B و 297C؛ شیر relief فولادی؛ فشار تنظیمی و اتصال پورت باید با مدار دستگاه تطبیق داده شود. در Master و CSV 287B ثبت شد.
  - 258-3247 — Mounting Bracket؛ فقط 297C (بدون 287B)؛ براکت فولادی با weld nut و رزوه M10، ابعاد 137 × 112 × 181mm؛ در CSV 297C-only ثبت شد.
  - 258-4004 — Right-Hand Instrument Panel؛ فقط 297C؛ پنل ABS؛ نسل کنسول، محل gauge و سیم‌کشی بررسی شود. در CSV 297C-only ثبت شد.
  - 258-2964 — TUBE AS.؛ فقط 297C؛ مسیر لوله، اتصالات و فشار کاری باید از Parts Diagram تأیید شود. در CSV 297C-only ثبت شد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/295-1799 ؛ https://parts.cat.com/en/catcorp/product/258-3247 ؛ https://parts.cat.com/en/catcorp/product/258-4004 ؛ https://parts.cat.com/en/catcorp/product/258-2964
- وضعیت شمارنده: 4366 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4366.


## دور ۹۷ — 25 Nov 2026

- هفت مورد از صفحات رسمی Cat Parts Store ثبت شد:
  - 258-7700 — Boot Kit؛ فیتمنت 287B و 297C؛ به Master و CSV 287B افزوده شد؛ محل boot، پروفیل و گروه عملگر باید تطبیق داده شود.
  - 258-2806 — TANK GP-HYD؛ فقط 297C؛ ظرفیت، پورت‌ها، cap/breather و مدار هیدرولیک باید بررسی شود.
  - 258-2884 — Ride Control And Work Tool Positioner Hydraulic Tube؛ فقط 297C؛ قطر بیرونی 0.63in؛ routing، خم‌ها و اتصالات کنترل شود.
  - 258-3008 — Track Roller Group؛ فقط 297C؛ قطر بیرونی درج‌شده 50.8mm/2.0in؛ bore و پیکربندی undercarriage تطبیق داده شود.
  - 258-4005 — Right-Hand Front Instrument Panel Plastic Cover؛ فقط 297C؛ جنس ABS؛ نسل کنسول و محل gauge بررسی شود.
  - 258-2971 — 2 Speed Track Drive Piston Motor؛ فقط 297C؛ ابعاد 12.8 × 10.9in؛ displacement، shaft و پورت‌ها بررسی شود.
  - 258-2571 — PLATE AS؛ فقط 297C؛ جنس alloy mixed metal/carbon steel؛ محل نصب و hole pattern کنترل شود.
- موارد 297C-only در CSV مستقل ثبت شدند؛ 258-7700 در CSV 287B ثبت شد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/258-7700 ؛ https://parts.cat.com/en/catcorp/product/258-2806 ؛ https://parts.cat.com/en/catcorp/product/258-2884 ؛ https://parts.cat.com/en/catcorp/product/258-3008 ؛ https://parts.cat.com/en/catcorp/product/258-4005 ؛ https://parts.cat.com/en/catcorp/product/258-2971 ؛ https://parts.cat.com/en/catcorp/product/258-2571
- وضعیت شمارنده: 4371 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4371.


## دور ۹۸ — 25 Nov 2026

- چهار فیتمنت رسمی بازبینی شد و در طبقه‌بندی 297C-only قرار گرفت:
  - 258-3894 — Hydraulic Pump Lines Hose؛ فقط 297C؛ synthetic-rubber fuel/oil hose با فشار کاری 110.32kPa و دمای تا 100°C؛ routing و اتصالات بررسی شود.
  - 258-3465 — 21cc Gear Pump؛ فقط 297C؛ displacement، shaft/interface، پورت‌ها و pump group بررسی شود.
  - 258-3356 — Auxiliary Hydraulic Lines Tube؛ فقط 297C؛ قطر بیرونی 0.75in؛ مسیر، خم‌ها و اتصالات تطبیق داده شود. شماره جدید Master.
  - 258-3591 — Work Tool Tube؛ فقط 297C؛ قطر 15.88mm، دو اتصال 1-14 swivel nut و طول کلی 56.2in؛ مسیر هیدرولیک work tool بررسی شود. شماره جدید Master.
- دو مورد 258-3894 و 258-3465 از CSV 287B حذف و به CSV مستقل 297C-only منتقل شدند؛ این اصلاح بر اساس Compatible Models رسمی Cat است.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/258-3894 ؛ https://parts.cat.com/en/catcorp/product/258-3465 ؛ https://parts.cat.com/en/catcorp/product/258-3356 ؛ https://parts.cat.com/en/catcorp/product/258-3591
- وضعیت شمارنده: 4373 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4373.


## دور ۹۹ — 25 Nov 2026

- 258-3849 — Homologation Identification Plate؛ صفحه رسمی Cat مدل 297C را فهرست می‌کند و 287B را ندارد؛ پلاک تأیید نوع به سه زبان آلمانی/ایتالیایی/انگلیسی است؛ زبان، مقادیر وزن محور و بازار/نسخه دستگاه باید تطبیق داده شود.
- شماره 258-3849 به Master و CSV مستقل 297C-only افزوده شد.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/258-3849
- وضعیت شمارنده: 4374 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4374.


## دور ۱۰۰ — 25 Nov 2026

- پنج فیتمنت رسمی Cat با سازگاری صریح 287B در CSV ثبت شد:
  - 257-8388 — Breather Assembly؛ شامل crankcase breather، tube و elbow 90°؛ اتصال به cover و مسیر لوله بررسی شود. شماره جدید Master.
  - 249-9275 — Crankcase Breather Tube؛ جنس carbon steel/alloy zinc؛ مسیر و اتصالات باید با آرایش crankcase تطبیق داده شود. شماره جدید Master.
  - 158-6697 — Gauge & Warning Right-Hand Side Instrument Panel؛ ABS؛ ابعاد کلی 19.4 × 19.75 × 7.53in؛ layout گیج‌ها و نسل کنسول بررسی شود. شماره جدید Master.
  - 223-0609 — 902.70mm Height Safety Glass؛ شیشه laminated سبز با ceramic frit مشکی، ضخامت 0.27in و ابعاد 35.54 × 18.58in؛ محل پنل و revision شیشه کنترل شود. شماره جدید Master.
  - 235-4948 — Crankcase Breather؛ قطر 2.52in و طول 3.622in؛ از قبل در Master بود و ردیف CSV تکمیل شد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/257-8388 ؛ https://parts.cat.com/en/catcorp/product/249-9275 ؛ https://parts.cat.com/en/catcorp/product/158-6697 ؛ https://parts.cat.com/en/catcorp/product/223-0609 ؛ https://parts.cat.com/en/catcorp/product/235-4948
- وضعیت شمارنده: 4378 شماره یکتا؛ Mirror برابر Master؛ Workflow برابر 4378.


## دور ۷۰ — 25 Nov 2026

- مبنای تازه پیش از این دور: 4,378 شماره یکتا؛ Master و Mirror همسان و شمارنده Workflow برابر 4378 بود.
- سه شماره جدید از صفحات رسمی Cat Parts Store که 297C را در Compatible Models دارند ولی 287B را ندارند، به Master افزوده شد و در CSV مستقل 297C-only ثبت شد:
  - 345-4733 — Support Assembly؛ فیتمنت 297C، بدون 287B.
  - 430-7601 — Cabin Wiring Harness؛ فیتمنت 297C، بدون 287B؛ کابین/آرایش سیم‌کشی و PIN باید کنترل شود.
  - 287-4300 — Hydraulic Quick Coupler؛ فیتمنت 297C، بدون 287B؛ رابط اتصال ابزار و مدار قفل هیدرولیک باید تطبیق داده شود.
- 258-2449 — Bracket Assembly از قبل در Master بود ولی در CSV مستقل 297C-only ثبت نشده بود؛ ردیف آن اضافه شد.
- هیچ‌یک از این چهار مورد به فیتمنت 287B تعمیم داده نشد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/345-4733 ؛ https://parts.cat.com/en/catcorp/product/430-7601 ؛ https://parts.cat.com/en/catcorp/product/287-4300 ؛ https://parts.cat.com/en/catcorp/product/258-2449
- Master هدف پس از ثبت: 4381 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4381.


## دور ۷۰ — 25 Nov 2026

- مبنای تازه پیش از این دور: 4,378 شماره یکتا؛ Master و Mirror همسان و شمارنده Workflow برابر 4378 بود.
- سه شماره جدید از صفحات رسمی Cat Parts Store که 297C را در Compatible Models دارند ولی 287B را ندارند، به Master افزوده شد و در CSV مستقل 297C-only ثبت شد:
  - 345-4733 — Support Assembly؛ فیتمنت 297C، بدون 287B.
  - 430-7601 — Cabin Wiring Harness؛ فیتمنت 297C، بدون 287B؛ کابین/آرایش سیم‌کشی و PIN باید کنترل شود.
  - 287-4300 — Hydraulic Quick Coupler؛ فیتمنت 297C، بدون 287B؛ رابط اتصال ابزار و مدار قفل هیدرولیک باید تطبیق داده شود.
- 258-2449 — Bracket Assembly از قبل در Master بود ولی در CSV مستقل 297C-only ثبت نشده بود؛ ردیف آن اضافه شد.
- هیچ‌یک از این چهار مورد به فیتمنت 287B تعمیم داده نشد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/345-4733 ؛ https://parts.cat.com/en/catcorp/product/430-7601 ؛ https://parts.cat.com/en/catcorp/product/287-4300 ؛ https://parts.cat.com/en/catcorp/product/258-2449
- Master هدف پس از ثبت: 4381 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4381.


## دور ۷۱ — 25 Nov 2026

- دو شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت صریح 287B به Master و CSV 287B افزوده شد:
  - 5I-8110 — 90 Degree Elbow Adapter؛ اتصال Male NPT به Hose Bead؛ صفحه رسمی Cat فهرست 287B و 297C را دارد. رزوه، قطر شیلنگ و فشار مدار باید تطبیق داده شود.
  - 150-7568 — 3/8in 45 Degree Elbow Adapter؛ صفحه رسمی Cat فهرست 287B را دارد؛ فشار کاری اعلام‌شده 690 kPa است؛ اتصال‌های دو سر و فشار مدار کنترل شود.
- موارد دیگر بررسی‌شده در نتایج این مرحله از قبل در Master و CSV موجود بودند و دوباره درج نشدند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/5I-8110 ؛ https://parts.cat.com/en/catcorp/product/150-7568
- شمارنده هدف پس از ثبت: 4383 شماره یکتا؛ Mirror و Workflow همگام شدند.


## دور ۷۲ — 25 Nov 2026

- هشت شماره جدید از صفحات رسمی Cat Parts Store که 297C را فهرست می‌کنند و 287B را فهرست نمی‌کنند، به Master و CSV مستقل 297C-only اضافه شدند: 258-2849، 258-4084، 258-4160، 258-4391، 258-2781، 348-4171، 267-8390 و 280-8307.
- چهار شماره از قبل در Master بودند اما در CSV مستقل فیتمنت ثبت نشده بودند؛ ردیف آنها تکمیل شد: 258-4116، 258-3247، 258-4102 و 258-3849.
- هیچ‌یک از این 12 شماره به فیتمنت 287B تعمیم داده نشد. موارد سیم‌کشی، براکت، لوله روغن‌خنک‌کن و نشانگر سطح باید با پیکربندی، PIN و شماره سریال دستگاه تطبیق داده شوند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/258-4116 ؛ https://parts.cat.com/en/catcorp/product/258-2849 ؛ https://parts.cat.com/en/catcorp/product/258-4084 ؛ https://parts.cat.com/en/catcorp/product/258-4160 ؛ https://parts.cat.com/en/catcorp/product/258-4391 ؛ https://parts.cat.com/en/catcorp/product/258-2781 ؛ https://parts.cat.com/en/catcorp/product/348-4171 ؛ https://parts.cat.com/en/catcorp/product/267-8390 ؛ https://parts.cat.com/en/catcorp/product/280-8307 ؛ https://parts.cat.com/en/catcorp/product/258-3247 ؛ https://parts.cat.com/en/catcorp/product/258-4102 ؛ https://parts.cat.com/en/catcorp/product/258-3849
- شمارنده هدف پس از ثبت: 4391 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4391.


## دور ۷۳ — 25 Nov 2026

- 280-8302 — Cover Assembly (Air Cleaner Assembly) از صفحه رسمی Cat Parts Store بررسی شد؛ Compatible Models شامل 287C، 277C، 297C، 287C2 و 277C2 است و 287B در فهرست نیست. بنابراین فقط در Master کلی و CSV مستقل 297C-only ثبت شد.
- مشخصه صفحه: Round air-cleaner cover با Dust Tube برابر 2.126in؛ گروه هواکش و آرایش تخلیه گردوغبار باید تطبیق داده شود.
- سایر شماره‌های نتایج این جستجو از قبل در Master/CSV ثبت بودند و تکرار نشدند.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/280-8302
- شمارنده هدف پس از ثبت: 4392 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4392.


## دور ۷۴ — 25 Nov 2026

- 129-8545 — 13mm Inner Diameter Glass Mount Washer از صفحه رسمی Cat Parts Store بررسی شد؛ Compatible Models شامل 277C، 277C2، 297C، 287C2 و 287C است و 287B در فهرست نیست. در Master و CSV مستقل 297C-only ثبت شد.
- مشخصه صفحه: قطر داخلی 13mm؛ محل نصب شیشه، مجموعه واشر/فاصله‌گذار و نسخه کابین باید تطبیق داده شود.
- سایر نتایج جستجو از قبل در Master و CSVهای مربوط ثبت بودند و تکرار نشدند.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/129-8545
- شمارنده هدف پس از ثبت: 4393 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4393.


## دور ۷۵ — 25 Nov 2026

- سه شماره جدید از صفحات رسمی Cat Parts Store با فیتمنت 297C و بدون 287B به Master و CSV مستقل 297C-only افزوده شد: 247-5874 — Plate-Cover؛ 337-9101 — Seal Kit؛ 293-2872 — Switch Wiring Harness.
- 166-0321 — Seal Kit قبلاً در Master و CSV 297C-only بود؛ صفحه رسمی Cat فیتمنت 287B را نیز نشان می‌دهد، بنابراین ردیف متناظر به CSV 287B افزوده شد. کاربرد دقیق و اجزای کیت پیش از سفارش با PIN/پیکربندی تطبیق داده شود.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/247-5874 ؛ https://parts.cat.com/en/catcorp/product/337-9101 ؛ https://parts.cat.com/en/catcorp/product/293-2872 ؛ https://parts.cat.com/en/catcorp/product/166-0321
- شمارنده هدف پس از ثبت: 4396 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4396.


## دور ۷۶ — 25 Nov 2026

- پنج شماره جدید به Master افزوده شد:
  - 223-4275 — Single Rotor Carbon Steel Latch؛ صفحه رسمی Cat فیتمنت 287B و 297C را صریحاً فهرست می‌کند؛ در CSV 287B ثبت شد.
  - 280-8408 — Plastic Belt Guard؛ فقط 297C در فیتمنت مدل‌های این خانواده؛ در CSV مستقل 297C-only ثبت شد.
  - 258-4092 — Cabin Glass Window؛ فقط 297C؛ نسخه شیشه، آب‌بندی و موقعیت پنجره باید تطبیق داده شود.
  - 258-2443 — Plastic Belt Guard؛ فقط 297C؛ آرایش تسمه و نقاط نصب باید کنترل شود.
  - 273-5914 — Seat Suspension Assembly؛ فقط 297C؛ پایه صندلی و رنج وزن اپراتور باید تطبیق داده شود.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/223-4275 ؛ https://parts.cat.com/en/catcorp/product/280-8408 ؛ https://parts.cat.com/en/catcorp/product/258-4092 ؛ https://parts.cat.com/en/catcorp/product/258-2443 ؛ https://parts.cat.com/en/catcorp/product/273-5914
- شمارنده هدف پس از ثبت: 4401 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4401.


## دور ۷۷ — 25 Nov 2026

- 223-4240 — Two Rotor Carbon Steel Latch از صفحه رسمی Cat Parts Store بررسی شد؛ Compatible Models صریحاً 287B و 297C را شامل می‌شود. شماره جدید به Master و CSV رسمی 287B اضافه شد.
- مشخصات: latch دو روتوره برای striker bolt با قطر 17.1mm و نصب رزوه‌ای M6؛ قطر striker و هم‌راستایی درپوش موتور باید کنترل شود.
- دیگر نتایج این مرحله از قبل در Master و CSV 287B ثبت بودند.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/223-4240
- شمارنده هدف پس از ثبت: 4402 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4402.


## دور ۷۸ — 25 Nov 2026

- سه شماره جدید از صفحات رسمی Cat Parts Store که 297C را در Compatible Models فهرست می‌کنند ولی 287B را ندارند، به Master و CSV مستقل 297C-only افزوده شد:
  - 258-3284 — 495mm Long Cabin Sliding Glass Window؛ پنجره کشویی؛ ابعاد شیشه، مکانیزم لغزنده و آب‌بندی باید تطبیق داده شود.
  - 373-9653 — Clip-Hose؛ قطر بیرونی شیلنگ و نقطه نصب باید کنترل شود.
  - 258-4094 — 37.5mm Thick Cabin Right-Hand Fixed Glass Window؛ ضخامت اعلامی 37.5mm؛ موقعیت شیشه و نسخه کابین باید تطبیق داده شود.
- موارد دیگر نتایج جستجو از قبل در Master و CSVهای مربوط ثبت بودند.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/258-3284 ؛ https://parts.cat.com/en/catcorp/product/373-9653 ؛ https://parts.cat.com/en/catcorp/product/258-4094
- شمارنده هدف پس از ثبت: 4405 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4405.


## دور ۸۰ — 25 Nov 2026

- 258-2982 — 5mm Thick Hydraulic Tank Mounting Bracket از قبل در Master بود اما ردیف CSV مستقل 297C-only آن ثبت نشده بود؛ ردیف تکمیل شد. صفحه رسمی Cat فیتمنت 297C را دارد و 287B را ندارد.
- 258-4225 — Operator Cabin Floor Mat به‌عنوان شماره جدید به Master و CSV مستقل 297C-only اضافه شد. صفحه رسمی Cat مدل‌های 287C، 277C، 297C، 287C2 و 277C2 را فهرست می‌کند و 287B در فهرست نیست. کف‌پوش با مهره جوشی M6 عرضه می‌شود؛ فرم کف و نقاط نصب باید تطبیق داده شود.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/258-2982 ؛ https://parts.cat.com/en/catcorp/product/258-4225
- شمارنده هدف پس از ثبت: 4410 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4410.


## دور ۸۱ — 25 Nov 2026

- 336-9857 — Bolt از صفحه رسمی Cat Parts Store بررسی شد؛ Compatible Models صریحاً 287B و 297C را شامل می‌شود؛ شماره جدید به Master و CSV 287B افزوده شد. رزوه، طول و گرید باید با parts diagram تطبیق داده شود.
- 158-6694 — Gauge & Warning Instrument Panel قبلاً در Master بود اما ردیف فیتمنت CSV 287B نداشت؛ ردیف آن تکمیل شد. چیدمان نشانگرها، چراغ‌های هشدار و اتصالات دسته‌سیم باید با نسخه کنسول تطبیق داده شود.
- 234-0733 — Bracket-Cast در Master تاریخی باقی ماند، اما صفحه رسمی Cat آن را Discontinued نشان می‌دهد؛ ردیف CSV اصلاح و صریحاً غیرقابل سفارش علامت‌گذاری شد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/336-9857 ؛ https://parts.cat.com/en/catcorp/product/158-6694 ؛ https://parts.cat.com/en/catcorp/product/234-0733
- شمارنده هدف پس از ثبت: 4411 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4411.


## دور ۸۳ — 25 Nov 2026

- سه شماره جدید از صفحات رسمی Cat Parts Store به Master و CSV مستقل 297C-only افزوده شد:
  - 8Y-8081 — 16.05mm Inner Diameter Convoluted Tube؛ فیتمنت 297C موجود و 287B غایب؛ مسیر، شعاع خمش و اتصالات باید تطبیق داده شود.
  - 149-3488 — 66.93mm Outer Diameter Engine Mount؛ فیتمنت 297C موجود و 287B غایب؛ هندسه پایه، بوش bonded و آرایش موتور باید تطبیق داده شود.
  - 280-8327 — Tube؛ فیتمنت 297C دارد اما صفحه رسمی Cat آن را Discontinued نشان می‌دهد؛ در Master تاریخی ثبت شد و در CSV با وضعیت صریح غیرقابل سفارش علامت خورد.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/8Y-8081 ؛ https://parts.cat.com/en/catcorp/product/149-3488 ؛ https://parts.cat.com/en/catcorp/product/280-8327
- شمارنده هدف پس از ثبت: 4414 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4414.


## دور ۸۴ — 25 Nov 2026

- 291-8148 — SEAL-O-RING از صفحه رسمی Cat Parts Store بررسی شد؛ Compatible Models شامل 297C است و 287B در فهرست نیست؛ شماره به Master و CSV مستقل 297C-only افزوده شد.
- صفحه جستجو ابعاد O-ring را نشان نداد؛ قطر داخلی، قطر مقطع، جنس و شیار محل نصب باید پیش از سفارش از parts diagram یا Cat Dealer تأیید شود.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/291-8148
- شمارنده هدف پس از ثبت: 4415 شماره یکتا؛ Mirror byte-exact و Workflow برابر 4415.


## دور ۷۰ — 25 Nov 2026

- بررسی منابع رسمی Cat Parts Store یک مورد جدید با فیتمنت صریح 287B و 297C نشان داد:
  - 161-0189 — 0.25in ID High Pressure Hose Assembly؛ قطر داخلی 0.25 اینچ، طول کلی 31.417 اینچ و ساختار 2-wire braid؛ انتهای اتصالات، مسیر نصب، فشار کاری و PIN باید کنترل شود.
- این شماره قبلاً در Master و CSV ثبت نشده بود؛ به هر دو افزوده شد. سایر نتایج بررسی‌شده در این جستجو از قبل ثبت بودند.
- منبع رسمی: https://parts.cat.com/en/catcorp/product/161-0189
- Master count after batch: 4428; Mirror and workflow counter synchronized.


## دور ۷۱ — 25 Nov 2026

- چهار قطعه جدید از صفحات رسمی Cat Parts Store با Compatible Models صریح 287B شناسایی و ثبت شد:
  - 234-0743 — Internal Retaining Ring، قطر آزاد 3.00in و ضخامت 0.126in؛ فقط 287B در فهرست مدل‌های مرتبط دیده شد.
  - 064-3843 — External Retaining Ring، قطر داخلی اسمی 55.55mm؛ 287B و 297C در فهرست سازگاری.
  - 1H-8134 — External Retaining Ring، قطر bore برابر 35.23mm؛ 287B و 297C در فهرست سازگاری.
  - 212-4483 — Internal Retaining Ring، قطر داخلی 68mm؛ فقط 287B در فهرست مدل‌های مرتبط دیده شد.
- هر چهار شماره به Master و CSV فیتمنت 287B اضافه شدند. برای سفارش باید قطر شیار، ضخامت و محل نصب با نقشه قطعات/PIN تطبیق داده شود.
- منابع رسمی: https://parts.cat.com/en/catcorp/product/234-0743 ؛ https://parts.cat.com/en/catcorp/product/064-3843 ؛ https://parts.cat.com/en/catcorp/product/1H-8134 ؛ https://parts.cat.com/en/catcorp/product/212-4483
- Master هدف پس از این دور: 4432 شماره یکتا؛ Mirror و Workflow با آن همگام شدند.
