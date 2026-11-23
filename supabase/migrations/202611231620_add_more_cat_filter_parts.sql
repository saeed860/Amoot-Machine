insert into public.products
 (sku,name,brand,category,machine_model,description,image_url,price_irr,stock,status)
values
(
 'CAT-136-3742','فیلتر روغن موتور Cat 136-3742 – Standard Efficiency','Caterpillar','فیلتر و مصرفی',
 'C15، C18، 3512E، 3516C و G3406',
 'فیلتر روغن موتور Cat Standard Efficiency برای کاربردهای ثبت‌شده در کاتالوگ Cat؛ صفحه رسمی این پارت‌نامبر را برای خانواده‌هایی از جمله C15، C18، 3512E، 3516C و G3406 فهرست می‌کند. سازگاری نهایی باید با Arrangement و شماره سریال تأیید شود. منبع رسمی: https://parts.cat.com/en/catcorp/product/136-3742',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20210408-0018b-f6788?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-8H-7202','فیلتر اولیه سوخت Cat 8H-7202 – Case-Primary','Caterpillar','فیلتر و مصرفی',
 '3512، 3516، C18، C15، C9، 3406 و 3408',
 'فیلتر اولیه سوخت Case-Primary؛ Cat در فهرست مدل‌های سازگار صفحه رسمی، خانواده‌هایی شامل 3516B، 3512B، C18، C15، C9، 3406 و 3408 را ثبت کرده است. برای انتخاب دقیق باید نوع محفظه و نسخه سیستم سوخت با موتور تطبیق داده شود. منبع رسمی: https://parts.cat.com/en/catcorp/product/8H-7202',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20250819-a6b04-e6765?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
),
(
 'CAT-9M-2342','صافی / توری فیلتر سوخت Cat 9M-2342','Caterpillar','فیلتر و مصرفی',
 '3512، 3516، 3406 و 3408',
 'مجموعه توری و صافی اولیه سوخت Cat؛ صفحه رسمی آن کاربردهایی از جمله 3512، 3516، 3406 و 3408 را در خانواده‌های موتور و ژنراتور فهرست می‌کند. این قطعه یک Fuel Filter Screen با ساختار توری فلزی است و جایگزین فیلتر کارتریجی یا Spin-On نیست. منبع رسمی: https://parts.cat.com/en/catcorp/product/9M-2342',
 'https://caterpillar.scene7.com/is/image/Caterpillar/CM20250819-8eb65-c09ee?fmt=WebP&hei=960&wid=960',
 null,0,'ACTIVE'
)
on conflict (sku) do update set
 name=excluded.name,brand=excluded.brand,category=excluded.category,
 machine_model=excluded.machine_model,description=excluded.description,
 image_url=excluded.image_url,price_irr=null,stock=0,status='ACTIVE',
 updated_at=now();
