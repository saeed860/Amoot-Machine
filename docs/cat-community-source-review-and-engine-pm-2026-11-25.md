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
- منبع: https://crcomponents.com/track-loader-parts/cat/287b/

## داده رسمی موتور / PM kit
- Cat Parts Store صفحه 606-1786 را با عنوان «C15 - 500 Hours PM Kit» منتشر کرده و محتویات آن را فهرست می‌کند: 1R-0762 (Engine Fuel Filter)، 1R-1808 (Engine Oil Filter)، 423-8525 (Water Separator and Fuel Filter).
- ناسازگاری مهم: پنل Compatible Models در همان صفحه «GENERATOR SET / XQP300 C9 GEN SET C9» را نشان می‌دهد، درحالی‌که عنوان کیت C15 است.
- به همین دلیل رکوردها در CSV با وضعیت REVIEW_REQUIRED_MODEL_CONFLICT یا OFFICIAL_COMPONENT_LISTED_PARENT_FITMENT_CONFLICT ذخیره شده‌اند. این اطلاعات نباید به‌عنوان فیتمنت قطعی C15 نمایش داده شود.
- 423-8525 به فهرست مرکزی Cat OEM اضافه شد چون خود صفحه رسمی Cat آن را به‌عنوان جزء کیت فهرست کرده است؛ اما تناقض مدل همچنان باز است.
- منبع: https://parts.cat.com/en/catcorp/product/606-1786

## کنترل Master و فایل ورودی
- Master: data/cat-official-part-numbers.txt
- فایل ورودی جدید: data/offroad-batch-import-cat-1536.txt
- تعداد مورد انتظار: 1,536 شماره، یکتا؛ فایل ورودی باید mirror دقیق Master باشد.
- CSV تکمیلی: data/cat-engine-pm-kit-source-verification-2026-11-25.csv
- این فایل‌ها فقط آماده‌سازی داده هستند؛ هیچ ادعایی مبنی بر آپلود داده در حساب Offroad Equipment وجود ندارد.

## قواعد حفظ کیفیت داده
1. شماره‌های فروشنده و aftermarket وارد Master OEM نشوند.
2. Kit number با قطعات داخل کیت یکی تلقی نشود.
3. مدل مندرج در عنوان محصول، به‌تنهایی فیتمنت نیست؛ Compatible Models و serial number مقدم‌اند.
4. منبع انجمنی بدون شماره‌قطعه قابل بررسی، صرفاً Lead است.
5. برای هر فیتمنت قطعی، سریال کامل/پیشوند سریال و پیکربندی دستگاه نگهداری شود.
