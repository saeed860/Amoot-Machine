-- Two more Cat Reman engine assemblies with product-specific Cat images.
insert into public.products
 (sku,name,brand,category,machine_model,description,image_url,price_irr,stock,status)
values
(
 'CAT-20R-4278','بلوک بلند موتور بازسازی‌شده Cat 3406 – 20R-4278','Caterpillar','قطعات موتور',
 '3406',
 'Cat 3406 Reman Long Block (DI-TA). مجموعه بلوک بلند شامل بلوک، میل‌لنگ، مجموعه سیلندر، سرسیلندر، میل‌بادامک، مکانیزم سوپاپ، چرخ‌دنده‌های جلویی، واترپمپ و متعلقات اصلی است؛ پمپ انتقال سوخت و اویل‌کولر به‌صورت جداگانه همراه محصول ارسال می‌شوند. Cat این شماره را برای کاربرد 3406 معرفی کرده و در Compatible Models تجهیزاتی مانند D8N و 623E را فهرست می‌کند. این شماره با پیکربندی موتور و شماره سریال باید تطبیق داده شود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/20R-4278',
 'https://caterpillar.scene7.com/is/image/Caterpillar/C10551639?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-10R-9063','بلوک کوتاه موتور بازسازی‌شده Cat C15 – 10R-9063','Caterpillar','قطعات موتور',
 'C15',
 'Cat Reman C15 Reman Short Block (Machine) (Tier III) (DI-T). طبق توضیح رسمی Cat، مجموعه شامل بلوک سیلندر، میل‌لنگ، مجموعه سیلندر و نازل‌های روغن است؛ سطوح بلوک ماشین‌کاری و میل‌لنگ بازسازی و قطعات مصرفی داخلی با قطعات نو Cat جایگزین می‌شوند. Cat کاربرد پیشنهادی را C15 اعلام کرده و مدل‌های تجهیز سازگار را در صفحه رسمی فهرست کرده است. پیش از سفارش، شماره سریال و Arrangement بررسی شود. قیمت و موجودی آموت: فقط استعلام. منبع رسمی: https://parts.cat.com/en/catcorp/product/10R-9063',
 'https://caterpillar.scene7.com/is/image/Caterpillar/C10551520?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
)
on conflict (sku) do update set
 name=excluded.name, brand=excluded.brand, category=excluded.category,
 machine_model=excluded.machine_model, description=excluded.description,
 image_url=excluded.image_url, price_irr=null, stock=0, status='ACTIVE',
 updated_at=now();
