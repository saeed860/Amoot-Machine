# گسترش منابع کاتالوگ CAT — 2026-11-25

## منابع جدیدی که واقعاً در استخراج استفاده شدند

1. **صفحه رسمی نگهداری Cat D1/D2/D3**  
   https://www.cat.com/en_ID/support/caterpillar-service-center/cat-D1-D2-D3-maintenance-and-service.html  
   شماره‌قطعه‌ها و فواصل سرویس با پیشوندهای سریال XKF, XKL, XT3, XKM, XKR, XKW, XKY, XT5 استخراج شدند.

2. **راهنمای رسمی Cat D6N**  
   https://s7d2.scene7.com/is/content/Caterpillar/CM20230309-f3ddc-64c2a  
   شامل شماره‌قطعه‌های سرویس، گروه‌های فیلتر، پیکربندی‌های متفاوت و پیشوندهای سریال JAH, DJA, DJY, LJR, MLW, GHS, PBA, PER است.

3. **صفحه رسمی نگهداری Cat 320 / 320 GC / 323**  
   https://www.cat.com/en_ID/support/caterpillar-service-center/cat-320-320GC-323-maintenance-and-service.html  
   داده‌های قابل انتساب به DKJ و YBL، از جمله فیلترها، تسمه، breather، فیلترهای کابین و هیدرولیک استخراج شدند. مواردی که اتصال سطر/ستون در صفحه روشن نبود، عمداً وارد نشده‌اند.

4. **راهنمای رسمی Cat Backhoe Loaders 415–450**  
   https://www.cat.com/en_US/support/maintenance/parts-reference-guides/backhoe_loader_415_450.html  
   هم قطعات نگهداری و هم GET و قطعات اتصال/نوک با شرح، عرض یا تعداد درج‌شده استخراج شدند. قطعات attachment در گروه جدا نگهداری می‌شوند و به‌عنوان قطعه موتور یا فیلتر ثبت نشده‌اند.

5. **کاتالوگ رسمی Cat Filter & Fluid Application Guide (ویرایش پنجم)**  
   https://caterpillar.scene7.com/is/content/Caterpillar/C10659468  
   مرجع تکمیلی برای فیلترهای موتور و ماشین، روغن‌ها و سیالات است. چون نسخه سند 2015 است، برای شماره‌قطعه‌های جاری به‌تنهایی مرجع نهایی نیست.

6. **کاتالوگ‌ها و منابع مستقل cross-reference**  
   - RTL Equipment CAT cross-reference: https://parts.rtlequipment.com/pages/cat-filter-cross-reference  
   - Hawhee CAT engine filter cross-reference: https://hawheetruckrepair.com/pages/blog-caterpillar-filter-cross-reference-c7-c12-c13-c15  
   - Baldwin off-highway cross-reference PDF: https://inlinefilters.co.uk/wp-content/uploads/2022/03/Baldwin-2-OffHighway.pdf  
   - Donaldson P550920 cross-reference example: https://www.finditparts.com/products/2318689/donaldson-p550920  
   این منابع فقط برای شماره‌های معادل فیلترها استفاده شده‌اند؛ معادل فیلتر، تضمین سازگاری با ماشین نیست.

## فایل‌های داده ثبت‌شده در مخزن

- `data/cat-official-dealer-guide-fitment-2026-11-25.csv` — 29 ردیف راهنماهای لودر چرخ‌لاستیکی M و 910/914/920.
- `data/cat-dozer-official-fitment-2026-11-25.csv` — 55 ردیف D1/D2/D3 و D6N پس از بازبینی ستون‌ها و پیشوندها.
- `data/cat-320-excavator-official-fitment-2026-11-25.csv` — 17 ردیف 320 GC/323.
- `data/cat-415-450-backhoe-official-fitment-2026-11-25.csv` — 57 ردیف 415–450 شامل سرویس و قطعات GET.
- `data/cat-336-excavator-official-fitment-2026-11-25.csv` — 24 ردیف 336/336 GC با شکست‌های سریال.
- `data/cat-articulated-truck-official-fitment-2026-11-25.csv` — 27 ردیف 725 تا 745.
- `data/cat-baldwin-offhighway-model-crossrefs-2026-11-25.csv` — 89 ردیف cross-reference مدل‌محور از کاتالوگ Baldwin.
- `data/cat-official-product-page-verifications-2026-11-25.csv` — 37 شماره تأییدشده با صفحه محصول رسمی Cat.
- `data/cat-batteries-starters-alternators-fitment-2026-11-25.csv` — 31 ردیف کاربرد باتری/استارتر/آلترناتور.
- `data/cat-zeppelin-dealer-filterkits-2022-23.csv` — 71 ردیف کد کیت فیلتر نمایندگی Zeppelin با fitment.
- `data/cat-zeppelin-mirrors-wipers-2022-23.csv` — 20 ردیف آینه و برف‌پاک‌کن با کد خام و شماره نرمال‌شده.
- `data/cat-aftermarket-filter-cross-reference-leads-2026-11-25.csv` — 20 مشاهده cross-reference؛ جدا از فهرست OEM و بدون ادعای fitment.

## شمارش و وضعیت ادغام

- مجموع داده‌های fitment در شش فایل اول: **209 ردیف**.
- شناسه‌های یکتای CAT در این شش فایل: **179 شماره**.
- از این تعداد **35 شماره** از قبل در فهرست اصلی موجود بود و **144 شماره** در فهرست اصلی فعلی نبود.
- شمارش فهرست اصلی در زمان محاسبه: **1077 شماره یکتا**.
- فایل cross-reference جداگانه است و شماره‌های Baldwin/Donaldson/Fleetguard/WIX نباید به فهرست شماره‌قطعات CAT اضافه شوند.
- `data/cat-official-part-numbers.txt` به‌روزرسانی شد و 144 شماره جدید از شش فایل fitment به آن اضافه شد. شماره‌های معادل aftermarket به این فایل اضافه نشدند.

## قواعد داده

- شماره‌های اصلی Cat، شماره‌های جایگزین سازندگان فیلتر، شماره‌های فروشنده و SKU از هم جدا هستند.
- پیشوند سریال، پیکربندی A/C، نوع هوزینگ فیلتر، تعداد و فاصله سرویس در صورت درج در منبع حفظ می‌شوند.
- هرجا صفحه یا جدول چند تعبیر ممکن داشت، مورد با یادداشت ابهام ثبت شده یا از fitment حذف شده است.
- وضعیت `CAT_OFFICIAL_PAGE` یا `CAT_OFFICIAL_GUIDE` یعنی شماره در منبع رسمی Cat دیده شده؛ این به معنی تأیید تناسب برای هر شماره سریال نیست.
- وضعیت‌های cross-reference فقط نشان می‌دهند منبع مستقل چه معادلی گزارش کرده است؛ جایگزینی باید با کاتالوگ سازنده فیلتر و شماره سریال ماشین کنترل شود.
- قیمت، موجودی و زمان تحویل از این منابع استنتاج نشده‌اند.

## گام بعدی

1. اجرای آزمایشی workflow شماره 45574758840 با timeoutهای متوالی 60 ثانیه برای دو شماره اول متوقف شد؛ artifact شامل داده قابل استفاده نبود. trigger خودکار push حذف شد و workflow فقط دستی/آزمایشی باقی ماند.
2. فهرست اصلی در آخرین بررسی 1077 شماره یکتا دارد؛ فایل جدید Offroad با همین 1077 شماره آماده است.
3. ادامه استخراج رسمی برای excavatorهای دیگر، backhoe F2، motor graders، compact track loaders و engine families.
4. توسعه cross-reference با کاتالوگ‌های خود سازندگان فیلتر (Donaldson، Baldwin، Fleetguard و WIX) و نگهداری اختلاف‌ها به‌صورت مشاهده‌های مستقل.
