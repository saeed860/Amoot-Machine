-- Expand Caterpillar catalog coverage using product records verified on parts.cat.com.
-- These are catalog references, not stock offers. No price or inventory is asserted.
-- Keep source model coverage in machine_model and exact product references in description.
insert into public.products
 (sku,name,brand,category,machine_model,description,image_url,price_irr,stock,status)
values
(
 '6J-2680','اورینگ آب‌بندی Cat 6J-2680 – قطر مقطع 3.53 و قطر داخلی 69.44 میلی‌متر','Caterpillar','قطعات هیدرولیک',
 '3512، 3512B، 3512C، 3516، 3516B، 3516C، 3408، 3406، C9',
 'اورینگ Cat از جنس NBR با سختی 90A و ابعاد 3.53 × 69.44 میلی‌متر؛ در کاتالوگ رسمی برای خطوط پمپ هیدرولیک معرفی شده است. مدل‌های سازگارِ نمایش‌داده‌شده در Cat Parts شامل 3512B/3512C/3516B/3516C و چندین خانواده دیگر است؛ تطبیق نهایی با شماره سریال و آرایش دستگاه لازم است. مرجع رسمی: https://parts.cat.com/en/catcorp/product/6J-2680',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20210628-91b9e-5a5dc?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 '0S-0699','استاد دو سر رزوه Cat 0S-0699 – طول 37 میلی‌متر','Caterpillar','قطعات موتور',
 'C15، C18، C9، 3406، 3406E، 3512B، 3516B',
 'استاد فولادی دو سر رزوه (Double End Threaded Stud)؛ طول کلی 0.37 اینچ و رزوه 3/8-16 طبق مشخصات Cat Parts. فهرست مدل‌های سازگار رسمی شامل C15، C18، C9، 3406، 3406E و برخی نسخه‌های 3512/3516 است. کاربرد و گشتاور بستن باید با دستورالعمل همان موتور کنترل شود. مرجع رسمی: https://parts.cat.com/en/catcorp/product/0S-0699',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20190108-55620-05595?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 '8B-9725','واشر فولادی Cat 8B-9725 – ضخامت 6 میلی‌متر','Caterpillar','قطعات موتور',
 '3512، 3512B، 3512C، 3516، 3516B، 3516C',
 'واشر فولادی Cat با ضخامت اسمی 6 میلی‌متر. در کاتالوگ Cat Parts در گروه Sleeve Bearings ثبت شده و در فهرست مدل‌های سازگار، چندین نسخه 3512 و 3516 دیده می‌شود. ابعاد کامل و محل نصب باید با نقشه قطعات نسخه موتور بررسی شود. مرجع رسمی: https://parts.cat.com/en/catcorp/product/8B-9725',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20211104-dd4b3-ef302?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 '0T-0320','پیچ شش‌گوش Cat 0T-0320 – 7/16-14 × 1-1/4 اینچ','Caterpillar','قطعات موتور',
 '3512، 3512B، 3512C، 3516، 3516B، 3516C، 3408، 3406، C9، C15',
 'پیچ سرشش‌گوش Cat با رزوه 7/16-14 و طول 1.25 اینچ. صفحه رسمی Cat Parts مشخصات ابعادی و فهرست گسترده‌ای از کاربردها از جمله برخی نسخه‌های 3512/3516، 3406/3408 و C9/C15 را نشان می‌دهد. محل نصب، گرید و گشتاور باید از نقشه/راهنمای همان تجهیز تأیید شود. مرجع رسمی: https://parts.cat.com/en/catcorp/product/0T-0320',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20180329-41915-27377?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 '131-5453','کنترلر الکترونیکی گاورنر Cat 131-5453','Caterpillar','قطعات برقی',
 '3406، 3408، 3512، 3516، C18',
 'کنترل الکترونیکی گاورنر Cat برای کنترل تأمین سوخت موتورهای دیزل یا گاز طبیعی و عملگرهای الکتروهیدرولیکی Woodward. مشخصات درج‌شده در صفحه رسمی: طول 13.3 اینچ، ارتفاع 5.7 اینچ و جنس Carbon Steel. فهرست مدل‌های سازگار Cat شامل 3406/3408، 3512/3516 و C18 در برخی گروه‌های تجهیز است. شماره نسخه و اتصالات الکتریکی قبل از سفارش کنترل شود. مرجع رسمی: https://parts.cat.com/en/catcorp/product/131-5453',
 'https://caterpillar.scene7.com/is/image/Caterpillar/C10532571?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 '3N-4622','شلنگ هیدرولیک Cat 3N-4622 – سری 716','Caterpillar','قطعات هیدرولیک',
 '3512، 3512B، 3512C، 3516، 3516B، 3516C، C18، C15، C9، 3408، 3406',
 'مجموعه شلنگ هیدرولیک فشار متوسط Cat سری 716 برای انتقال سیالات هیدرولیک و روانکار پایه نفتی/آبی در دمای بالا. قطر داخلی 0.25 اینچ، طول کلی 11.654 اینچ و ساختار تقویت‌شده با یک لایه سیم فولادی با استحکام کششی بالا. Cat هشدار می‌دهد ترکیب شلنگ و اتصالات باید دقیقاً مطابق کاربرد انتخاب شود. مدل‌های متعدد از جمله 3512/3516، C18/C15/C9 و 3408/3406 در فهرست کاربردها آمده‌اند. مرجع رسمی: https://parts.cat.com/en/catcorp/product/3N-4622',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20230127-887f9-343f3?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 '3L-3380','بوش عایق ترمینال موتور الکتریکی Cat 3L-3380','Caterpillar','قطعات برقی',
 '3512، 3516، C18، C15، C9، 3406، 3408',
 'بوش عایق ترمینال موتور الکتریکی Cat با قطر خارجی 31.75 میلی‌متر و طول 14.22 میلی‌متر؛ نوع فلنج‌دار و سبک Shoulder. مشخصات تکمیلی صفحه رسمی شامل ارتفاع شانه 5.6 میلی‌متر و قطر خارجی ساق 20.68 میلی‌متر است. کاربرد بوش‌ها اختصاصی است و باید با نقشه و قطعه نمونه تطبیق داده شود. فهرست رسمی Cat شامل خانواده‌های 3512/3516، C18/C15/C9 و 3406/3408 است. مرجع رسمی: https://parts.cat.com/en/catcorp/product/3L-3380',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20180329-41915-27377?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 '2W-9215','برچسب اطلاعات دمای هوای منیفولد Cat 2W-9215','Caterpillar','قطعات موتور',
 '3408، 3406، 3512، 3516، C18',
 'فیلم/برچسب اطلاعات شناسایی مربوط به دمای هوای منیفولد (Manifold Air Temperature). فهرست مدل‌های سازگار رسمی Cat شامل 3408، 3406، 3512، 3516 و C18 در گروه‌های مختلف موتور و ژنراتور است. این قطعه مصرفی/اطلاعاتی است؛ محل نصب و نسخه برچسب باید با تجهیز تطبیق داده شود. مرجع رسمی: https://parts.cat.com/en/catcorp/product/2W-9215',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20250801-12937-314ea?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
)
on conflict (sku) do update set
 name=excluded.name,brand=excluded.brand,category=excluded.category,
 machine_model=excluded.machine_model,description=excluded.description,
 image_url=excluded.image_url,price_irr=null,stock=0,status='ACTIVE',
 updated_at=now();
