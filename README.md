# آموت ماشین — نسخه GitHub Pages

این بسته، نسخه **استاتیک و نمایشی** فروشگاه آموت ماشین است و برای انتشار رایگان روی GitHub Pages آماده شده است.

## انتشار روی GitHub Pages
1. یک مخزن جدید در GitHub بسازید (مثلاً `amoot-machine`).
2. تمام محتویات این پوشه (`index.html`, `style.css`, `app.js`, `README.md`) را در ریشه مخزن بارگذاری کنید.
3. در مخزن وارد **Settings → Pages** شوید.
4. در بخش **Build and deployment** گزینه **Deploy from a branch** را انتخاب کنید.
5. Branch را روی `main` و Folder را روی `/(root)` بگذارید و Save کنید.
6. پس از پایان انتشار، آدرس `https://USERNAME.github.io/REPOSITORY/` در دسترس خواهد بود.

اگر مخزن با نام `USERNAME.github.io` ساخته شود، آدرس سایت `https://USERNAME.github.io/` خواهد بود.

## ورود نمایشی مدیریت
- نام کاربری: `admin`
- رمز نمایشی: `amoot-demo-2026`

## امکانات نسخه استاتیک
- فروشگاه فارسی RTL و واکنش‌گرا
- جستجو و فیلتر محصولات
- فرم درخواست تأمین
- داشبورد مرورگری برای افزودن، ویرایش و آرشیو محصولات، همراه با ثبت آدرس اینترنتی تصویر یا بارگذاری فایل تصویر
- ورود و خروج Excel (با استفاده از SheetJS از CDN) و CSV
- پشتیبان‌گیری و بازیابی JSON

## محدودیت مهم GitHub Pages
GitHub Pages فقط فایل‌های استاتیک HTML/CSS/JS را میزبانی می‌کند؛ اجرای Python/Node، API و پایگاه داده سمت سرور روی آن ممکن نیست. بنابراین این نسخه داده‌ها را در `localStorage` همان مرورگر ذخیره می‌کند: تغییرات فقط برای همان مرورگر و همان دستگاه قابل مشاهده‌اند و درخواست‌ها به مدیر ارسال نمی‌شوند. ورود مدیریت نیز **امنیت واقعی ندارد** و رمز آن در فایل جاوااسکریپت قابل مشاهده است. این نسخه را برای نمایش و آزمایش رابط کاربری استفاده کنید، نه مدیریت واقعی فروش و اطلاعات مشتریان.

برای فروشگاه عملیاتی چندکاربره، بک‌اند و دیتابیس باید روی یک سرویس جداگانه میزبانی شوند و فرانت‌اند GitHub Pages به API امن متصل شود. رمز نمایشی را برای داده‌های واقعی استفاده نکنید.


## تصاویر نمونه
تصاویر نمونه دسته‌بندی‌ها و برخی محصولات از عکس‌های واقعی ماشین‌آلات و قطعات در Wikimedia Commons و کتابخانه رسانه‌ای Caterpillar بارگذاری می‌شوند. برای تصاویر Wikimedia، صفحه منبع و مجوز هر عکس در لینک زیر قابل بررسی است؛ هنگام استفاده تجاری، شرایط مجوز و درج نام عکاس/انتساب را رعایت کنید:
- [CAT 320 excavator — Wikimedia Commons](https://commons.wikimedia.org/wiki/File:CAT_320.excavator.jpg)
- [12 Cylinder Diesel Engine — Wikimedia Commons](https://commons.wikimedia.org/wiki/File:12_Cylinder_Diesel_Engine.jpg)
- [Hydraulic Pump — Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Hydraulikaggregat.jpg)
- [Fuel Filter — Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Fuelfilter_open.jpg)
- [Bosch Unit Pump — Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Bosch_unit_pump.JPG)
- [Caterpillar media image](https://s7d2.scene7.com/is/image/Caterpillar/C10337996)

تصاویر نمونه صرفاً برای نمایش ظاهر سایت هستند و لزوماً عکس همان شماره فنی یا کالای قابل فروش نیستند. برای راه‌اندازی فروش واقعی، عکس دقیق هر کالا باید توسط مدیر فروشگاه جایگزین شود.
