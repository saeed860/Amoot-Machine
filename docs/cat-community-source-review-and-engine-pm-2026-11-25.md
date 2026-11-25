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
