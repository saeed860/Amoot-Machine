-- Publish verified Cat Parts Store items as actual Amoot sellable product records.
-- Price and stock remain unset/zero until Amoot confirms supplier availability and pricing.
insert into public.products
  (sku,name,brand,category,machine_model,description,image_url,price_irr,stock,status)
values
  (
    'CAT-1L-9049',
    'فنر فشاری سوپاپ Cat 1L-9049 | Compression Spring',
    'Caterpillar',
    'قطعات موتور',
    '3512, 3516, C15, C18, C9, 3406, 3408',
    'قطعه اصلی Caterpillar؛ شرح رسمی: Compression Spring for Valves. کاربرد: ذخیره انرژی مکانیکی و کمک به بسته‌شدن کامل سوپاپ‌ها. جنس اعلام‌شده در کاتالوگ: Carbon Steel. مدل‌های سازگار اعلام‌شده در صفحه رسمی Cat شامل 3512، 3516، C15، C18، C9، 3406 و 3408 و برخی زیرمدل‌هاست. تطبیق نهایی با شماره سریال و پیکربندی دستگاه پیش از سفارش الزامی است. قیمت و موجودی: استعلام از آموت ماشین.',
    'https://caterpillar.scene7.com/is/image/Caterpillar/CM20250801-8a653-d9c3b',
    null,0,'ACTIVE'
  ),
  (
    'CAT-0S-1571',
    'پیچ سرشش‌گوش Cat 0S-1571 | Cap Screw',
    'Caterpillar',
    'پیچ و اتصالات موتور',
    '3512, 3516, C15, C18, C9, 3406, 3408',
    'قطعه اصلی Caterpillar؛ شرح رسمی: Cap Screw. مشخصات اعلام‌شده: طول 1.75 اینچ، سر Hex Head، رزوه 3/8-16، طول Grip برابر 0.75 اینچ، پوشش Zinc Phosphate + Oil، جنس Carbon Steel / Alloy Zinc. صفحه رسمی Cat مدل‌های 3512، 3516، C15، C18، C9، 3406 و 3408 و زیرمدل‌های مرتبط را در فهرست سازگاری آورده است. تطبیق نهایی با شماره سریال و پیکربندی دستگاه پیش از سفارش الزامی است. قیمت و موجودی: استعلام از آموت ماشین.',
    'https://caterpillar.scene7.com/is/image/Caterpillar/CM20190108-55109-21299',
    null,0,'ACTIVE'
  )
on conflict (sku) do update set
  name=excluded.name,
  brand=excluded.brand,
  category=excluded.category,
  machine_model=excluded.machine_model,
  description=excluded.description,
  image_url=excluded.image_url,
  price_irr=null,
  stock=0,
  status='ACTIVE',
  updated_at=now();
