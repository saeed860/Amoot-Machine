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
