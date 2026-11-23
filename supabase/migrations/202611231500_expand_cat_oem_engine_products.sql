-- Expand Amoot's sellable Cat catalog with additional product pages and Cat-owned product images.
-- All records are quote-only until Amoot verifies supply and pricing: price NULL, stock 0.
-- Model family labels below are not a universal fitment guarantee; preserve Cat's listed configuration notes.
insert into public.products
 (sku,name,brand,category,machine_model,description,image_url,price_irr,stock,status)
values
(
 'CAT-20R-2510','موتور کامل بازسازی‌شده Cat C18 – 20R-2510','Caterpillar','موتور کامل و مجموعه موتور',
 'C18',
 'Cat Reman C18 engine؛ موتور 18.1 لیتری، تزریق مستقیم DI-T، فناوری ACERT/ATAAC و Tier 3. Cat برای این شماره قطعه کاربردهایی از جمله Wheel Dozer 834H، Landfill Compactor 836H و Wheel Loader 988H را فهرست کرده است. این شماره یک موتور کامل بازسازی‌شده است، نه قطعه عمومی؛ تطبیق arrangement، سریال و پیکربندی قبل از سفارش الزامی است. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/20R-2510',
 'https://caterpillar.scene7.com/is/image/Caterpillar/C10674384?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-20R-5367','موتور کامل بازسازی‌شده Cat C9 – 20R-5367','Caterpillar','موتور کامل و مجموعه موتور',
 'C9',
 'Cat Reman C9 engine؛ حجم 9.3 لیتر، تزریق مستقیم DI-T، ATAAC، سیستم MEUI و Tier 4. Cat مشخصات فنی تفصیلی این شماره را در صفحه عمومی کامل نکرده و کاربرد سازگار فهرست‌شده را Track-Type Tractor مدل‌های D6T XL، D6T XW و D6T LGP اعلام کرده است. برای همین شماره، تطبیق دقیق سریال و arrangement ضروری است. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/20R-5367',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20220216-bc6da-9e1ad?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-30R-0084','موتور کامل بازسازی‌شده Cat C18 – 30R-0084','Caterpillar','موتور کامل و مجموعه موتور',
 'C18',
 'Cat Reman C18 engine؛ حجم 18.1 لیتر، DI-T، ATAAC، ADEM 4، Tier 4، MEUI و سازگاری DEF؛ خروجی جلو، کارتل مرکزی و بدون ترمز. Cat در صفحه این شماره Wheel Loader مدل 988K را در Compatible Models آورده است. این محصول با 20R-2510 از نظر پیکربندی و سطح آلایندگی متفاوت است؛ جایگزین مستقیم فرض نشود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/30R-0084',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20240104-394a1-9808e?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-10R-9954','کیت اورهال بالای موتور Cat Reman 3516B – 10R-9954','Caterpillar','کیت تعمیرات اساسی موتور',
 '3516B',
 'کیت اورهال بالای موتور Cat Reman برای موتور 3516B در کاربرد Marine Propulsion. توضیح رسمی Cat: شامل 16 سرسیلندر بازسازی‌شده Cat و 16 انژکتور سوخت بازسازی‌شده Cat است. صفحه رسمی فهرست قطعات و تعداد اقلام همراه را نیز نشان می‌دهد. فقط برای نسخه و آرایش تأییدشده 3516B سفارش داده شود؛ با 3516 یا 3516C یکسان فرض نشود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/10R-9954',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20251216-43bdd-27715?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-5N-4504','صفحه پورت پمپ آب دریا Cat 5N-4504 – ضخامت 25 میلی‌متر','Caterpillar','قطعات موتور',
 '3408، 3512، 3512B، 3512C، 3516B',
 'Cat 25mm Thick Port Plate؛ صفحه پورت برای پمپ کمکی آب دریا که دهانه‌های ورودی و خروجی پمپ را پوشانده و آب‌بندی می‌کند. جنس اعلام‌شده: آلیاژ آلومینیوم و آلیاژ مس. Cat در فهرست سازگاری این شماره، Engine-Machine 3408، گروه Gen Set Engine شامل 3408 و 3512/3512B، و Marine Auxiliary شامل 3516B را آورده است. فهرست کامل مدل‌ها در صفحه مرجع بررسی شود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/5N-4504',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20251118-395db-6789d?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-7W-0009','سرسیلندر کامل Cat 7W-0009 – HEAD A 3406','Caterpillar','قطعات موتور',
 '3406B، 3406C',
 'عنوان رسمی Cat Parts Store: HEAD A 3406. صفحه رسمی این شماره مدل‌های Truck Engine و Gen Set Engine شامل 3406B و 3406C و نیز Marine Engine 3406B و Engine-Industrial 3406B را فهرست می‌کند. Cat برای این شماره در صفحه عمومی توضیح و مشخصات ابعادی ارائه نکرده است؛ بنابراین هیچ مشخصه فنی اضافه‌ای حدس زده نشده است. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/7W-0009',
 'https://caterpillar.scene7.com/is/image/Caterpillar/C10513482?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-9X-3406','کانکتور مادگی فلنجی دوپین Cat 9X-3406 – 10 آمپر','Caterpillar','قطعات برقی',
 'G3512، G3516، G3406، G3408',
 'Cat 2 Pin Flange Mount Receptacle Connector؛ کانکتور مادگی فلنجی دوپین با جریان نامی 10A. مشخصات رسمی: 18 AWG، سری MS-5015، پوسته 10SL، بدنه آلومینیوم ریختگی، رزوه 0.625-24 UNEF، ابعاد حدود 1.1 × 1.0 × 1.0 اینچ. Cat در گروه‌های سازگاری Generator Set/Gas Engine مدل‌های G3512، G3516، G3406 و G3408 را فهرست کرده است. این تطبیق برای زیرمدل‌های G است و نباید به‌صورت خودکار به تمام مدل‌های دیزل 3512/3516 تعمیم داده شود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/9X-3406',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20210623-bec83-92c94?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-260-3406','مجموعه شلنگ خنک‌کننده دمای بالا Cat 260-3406','Caterpillar','شلنگ و اتصالات',
 'G3516، G3516B، G3516C',
 'Cat High Temperature Coolant Hose Assembly؛ شلنگ خنک‌کننده دمای بالا با قطر داخلی 1 اینچ، طول کلی 96.26 اینچ و ساختار یک‌لایه بافته سیم فولادی. صفحه رسمی Cat کاربردهای سازگار را GEN SET ENGINE مدل G3516B، GENERATOR SET مدل‌های G3516B/G3516C و GAS ENGINE مدل G3516 اعلام می‌کند. این قطعه را به همه موتورهای 3516 تعمیم ندهید؛ نسخه G و زیرمدل دقیق باید بررسی شود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/260-3406',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20230426-042a3-6d721?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
)
on conflict (sku) do update set
 name=excluded.name, brand=excluded.brand, category=excluded.category,
 machine_model=excluded.machine_model, description=excluded.description,
 image_url=excluded.image_url, price_irr=null, stock=0, status='ACTIVE',
 updated_at=now();
