-- Remove all previously seeded/demo sellable products.
-- Preserve referenced historical order rows by deactivating those SKUs; delete unreferenced samples.
update public.products p
set status='INACTIVE', updated_at=now()
where p.sku in (
 '321-8076','7T-3205','221-8307','1R-0716','320-6690',
 'HPU-042','HCV-315','HPP-220','PNC-032','FRL-01','SV-24V'
)
and exists (select 1 from public.order_items oi where oi.product_id=p.id);

delete from public.products p
where p.sku in (
 '321-8076','7T-3205','221-8307','1R-0716','320-6690',
 'HPU-042','HCV-315','HPP-220','PNC-032','FRL-01','SV-24V'
)
and not exists (select 1 from public.order_items oi where oi.product_id=p.id);

-- Verified Parker hydraulic products and SMC pneumatic products.
-- Prices are intentionally NULL and stock is zero pending supplier confirmation.
insert into public.products
 (sku,name,brand,category,machine_model,description,image_url,price_irr,stock,status)
values
(
 '3349111411',
 'پمپ دنده‌ای هیدرولیک Parker PGP511، کد 3349111411',
 'Parker',
 'قطعات هیدرولیک',
 'مدارهای هیدرولیک ماشین‌آلات متحرک و صنعتی',
 'پمپ دنده‌ای خارجی Parker سری PGP511؛ شماره سفارش رسمی 3349111411. کد پیکربندی: PGP511M0060CA1H2NJ7J5B1B1؛ جابجایی 6 cm³/rev، چرخش ساعتگرد (CW)، فلنج SAE-A و شفت هزارخار 9 دندانه. اطلاعات شماره سفارش و پیکربندی از کاتالوگ رسمی Parker، HY30-3301/UK استخراج شده است. تصویر نمایش‌داده‌شده تصویر مرجع سری PGP511 است و ممکن است جزئیات ظاهری نسخه نهایی متفاوت باشد. تطبیق پورت، شفت، جهت چرخش و جابجایی با پمپ فعلی قبل از سفارش الزامی است. منبع فنی: https://www.parker.com/content/dam/Parker-com/Literature/PMDE/Catalogs/Gear_Units/Distribution/HY30-3301-UK.pdf',
 'https://media.rs-online.com/f_auto/R1254326-01.jpg',
 null,0,'ACTIVE'
),
(
 'D1VW001CNJW',
 'شیر کنترل جهت هیدرولیک Parker D1VW001CNJW',
 'Parker',
 'قطعات هیدرولیک',
 'سیستم‌های هیدرولیک صنعتی و ماشین‌آلات متحرک',
 'شیر کنترل جهت برقی Parker سری D1VW؛ پیکربندی 4/3 راهه با قرقره نوع 001. خانواده D1VW از شیرهای مستقیم‌کار با کنترل سلونوئیدی و الگوی نصب NFPA D03/CETOP 3 است؛ محدوده فشار و دبی به پیکربندی و نسخه شیر وابسته است و باید از دیتاشیت همان کد نهایی بررسی شود. این شماره مدل در کاتالوگ ParkerStore آمده است. پیش از سفارش، ولتاژ بوبین، نوع قرقره، آب‌بندی و اتصال الکتریکی را با قطعه موجود تطبیق دهید. منبع رسمی: https://www.parker.com/content/dam/parker/msg/hydraulic-valve-systems-division/PDF-files/catalogs/Cat_MSG14-2500_Industrial_Hydraulic_Valves.pdf',
 'https://images.wiautomation.com/public/images/landing/anticipa/product/23_01_2025_18_12_25_D1VW001CNJW_Parker.png',
 null,0,'ACTIVE'
),
(
 'CDQ2B32-25DZ',
 'سیلندر پنوماتیک کامپکت SMC CDQ2B32-25DZ',
 'SMC',
 'قطعات پنوماتیک',
 'تجهیزات اتوماسیون صنعتی و ماشین‌آلات',
 'سیلندر کامپکت سری CQ2-Z، دوطرفه و تک‌میله؛ قطر داخلی 32 میلی‌متر و کورس استاندارد 25 میلی‌متر. دارای آهنربای داخلی، نصب از نوع سوراخ‌دار (Through-hole)، رزوه پورت Rc/Metric و بدون سنسور اتوسوئیچ در همین پیکربندی. نوع و ابعاد نصب را با نمونه فعلی تطبیق دهید. منبع و مشخصات رسمی: https://www.smcworld.com/webcatalog/s3s/en-jp/detail/?partNumber=CDQ2B32-25DZ',
 'https://3sapi.smcworld.com/ProductImg/L/CQ2Z.jpg',
 null,0,'ACTIVE'
),
(
 'SY5120-5LZ-01N',
 'شیر برقی پنوماتیک ۵/۲ SMC SY5120-5LZ-01N',
 'SMC',
 'قطعات پنوماتیک',
 'مدارهای کنترل پنوماتیک و اتوماسیون',
 'شیر برقی 5 پورت سری SY5000، تک‌بوبین و دو وضعیت (2-position single)، ولتاژ 24V DC، کانکتور L با سیم 300 میلی‌متری، چراغ نشانگر و مدار محافظ surge، تحریک دستی فشاری-چرخشی و پورت A/B سایز 1/8 با رزوه NPT. مصرف 0.1 وات در حالت مدار صرفه‌جویی انرژی. پیکربندی رزوه و کانکتور را قبل از سفارش بررسی کنید. منبع و مشخصات رسمی: https://www.smcworld.com/webcatalog/s3s/en-jp/detail/?partNumber=SY5120-5LZ-01N',
 'https://3sapi.smcworld.com/ProductImg/L/SY-20.jpg',
 null,0,'ACTIVE'
),
(
 'AC30A-03-D',
 'واحد مراقبت هوای فشرده SMC AC30A-03-D',
 'SMC',
 'قطعات پنوماتیک',
 'شبکه هوای فشرده و تجهیزات اتوماسیون',
 'مجموعه فیلتر، رگلاتور و روغن‌زن (FRL) سری AC20A-D تا AC40A-D؛ سایز بدنه 30، اتصال Rc سایز 3/8، محدوده تنظیم فشار 0.05 تا 0.85 MPa، بدون تخلیه خودکار و بدون گیج فشار در این پیکربندی، کاسه پلی‌کربنات و مسیر جریان از چپ به راست. برای انتخاب نسخه دارای گیج، تخلیه اتوماتیک یا فشار تنظیمی متفاوت، پسوند مدل باید جداگانه تعیین شود. منبع و مشخصات رسمی: https://www.smcworld.com/webcatalog/s3s/en-jp/detail/?partNumber=AC30A-03-D',
 'https://3sapi.smcworld.com/ProductImg/L/AC20A-AC40A-D.jpg',
 null,0,'ACTIVE'
)
on conflict (sku) do update set
 name=excluded.name,brand=excluded.brand,category=excluded.category,
 machine_model=excluded.machine_model,description=excluded.description,
 image_url=excluded.image_url,price_irr=null,stock=0,status='ACTIVE',
 updated_at=now();
