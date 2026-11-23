-- Further verified Cat Reman and engine-upgrade records for 3512B, 3516B, 3406B and 3408.
insert into public.products
 (sku,name,brand,category,machine_model,description,image_url,price_irr,stock,status)
values
(
 'CAT-20R-0043','کیت اورهال بالای موتور Cat Reman 3512B – 20R-0043','Caterpillar','قطعات موتور',
 '3512B',
 'Cat Reman Top End Engine Overhaul Kit برای موتور 3512B در کاربرد Marine Propulsion. مجموعه شامل 12 سرسیلندر بازسازی‌شده Cat و 12 انژکتور سوخت بازسازی‌شده Cat است. Cat در Compatible Models این شماره را برای Marine Engine مدل 3512B درج کرده است. اقلام آب‌بندی و تعدادهای درج‌شده در صفحه رسمی نیز بخشی از مجموعه هستند؛ برای Core Return و جزئیات سفارش با نمایندگی Cat هماهنگ شود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/20R-0043',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20251216-362e7-41be7?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-20R-3958','بلوک کوتاه موتور بازسازی‌شده Cat 3406B – 20R-3958','Caterpillar','قطعات موتور',
 '3406B',
 'Cat 3406B Reman Short Block. طبق توضیح رسمی Cat، بلوک کوتاه شامل بلوک سیلندر، میل‌لنگ، پیستون‌ها و شاتون‌هاست؛ مجموعه در کارخانه بازسازی و با قطعات اصلی Cat و به‌روزرسانی‌های مهندسی مونتاژ می‌شود. کاربرد پیشنهادی Cat: 3406B؛ صفحه رسمی در Compatible Models نیز تجهیزاتی از جمله RM-350B، SM-350 و موتور صنعتی 3406C را فهرست می‌کند. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/20R-3958',
 'https://caterpillar.scene7.com/is/image/Caterpillar/C10538791?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-0R-8200','پک سیلندر بازسازی‌شده Cat 3408/3412 – نسبت تراکم 15.5:1 – 0R-8200','Caterpillar','قطعات موتور',
 '3408، 3408E، 3412E',
 'Cat Reman 3408/3412 Cylinder Pack با نسبت تراکم 15.5:1 و وزن اعلام‌شده 35 پوند. طبق توضیح رسمی Cat، پک شامل لاینر سیلندر، پیستون، رینگ‌ها، گژن‌پین، خارها، شاتون و آب‌بندهای لازم است و به‌صورت پیش‌مونتاژ عرضه می‌شود. Cat در Compatible Models موتور صنعتی 3408E و 3412E را فهرست کرده است؛ تطبیق با نسخه دقیق موتور و نسبت تراکم الزامی است. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/0R-8200',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20240717-bfda6-46281?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-593-5344','کیت تبدیل سوخت دیزل به گاز طبیعی Cat 3516B – 593-5344','Caterpillar','کیت تعمیرات و ارتقای موتور',
 '3516B',
 'Cat 3516B Electric Power Dynamic Gas Upgrade؛ گروه قطعات ترکیبی برای تبدیل موتور دیزل 3516B Electric Power از نوع aftermarket به قابلیت کار با گاز طبیعی نیز. Cat در Compatible Models، Power Module مدل 3516B را درج کرده و در صفحه عمومی مشخصات تفصیلی یا فهرست قطعات همراه را منتشر نکرده است. فقط پس از تأیید شماره آرایش و امکان تبدیل با نمایندگی Cat سفارش داده شود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/593-5344',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20210719-79f82-3c1da?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
)
on conflict (sku) do update set
 name=excluded.name, brand=excluded.brand, category=excluded.category,
 machine_model=excluded.machine_model, description=excluded.description,
 image_url=excluded.image_url, price_irr=null, stock=0, status='ACTIVE',
 updated_at=now();
