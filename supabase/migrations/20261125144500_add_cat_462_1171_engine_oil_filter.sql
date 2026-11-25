-- Add CAT 462-1171 official engine oil filter reference.
-- Fitment and technical specifications are transcribed from the official CAT product page.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,compatible_models,technical_group,source_name,source_url,source_note,verification_status,is_active,specifications,application_type,application_evidence,application_source_url,source_accessed_at)
select
'CAT','462-1171','فیلتر روغن موتور CAT 462-1171',
'فیلتر روغن موتور استاندارد کاترپیلار برای فیلتراسیون روغن و حفاظت از سیستم روانکاری.',
ARRAY[]::text[],
ARRAY['LC51XX','LC30XX','LC31XX','IT38H','613G','R1300G II','MH3022','MH3024','120M','120 GC','120M 2','140','12M','120','140 GC','527','D5R LGP','D6K2 XL','D6K2 LGP','D5R2','D6N OEM','D5R XL','D6N XL','D6N','D6K','D6K LGP','D4','D5','D6K XL','D6N LGP','D6K2','555D','535D','545D','525D','AP-655D','AP1055','AP655','AP-1000E','AP-1000F','BG1055E','AP600','AP555F','AP500F','AP-1055F','AP-1055E','AP655F','BG600D','AP-600D','BG655D','BG1000E','AP655F L','AP600F','AP1000','C7.1','PL61','M318F','CS-56','CS78B','CS-56B','CS-68B','CS-78B','CS-79B','CP74B','CS-76','CS-74','CS68B','CS56B','CS-74B','CS-64','CS79B','CP-56B','CP-68B','CP-64','CP-56','CP-74B','CP76B','CS74B','CS14','CP-76','CP-74','CP68B','CP56B','C7.1DE200E','C6.6','DE200E0','DE200GC','C7.1DE150E0','XQP150','C7.1DE200E','DE165GC','C7.1DE150E','DE220GC','C7.1 GEN','C7.1 GEN S','C6.6DE150E','XQ230','XQP200','DE150GC','C3.6','963','953','963D','963K','953D','953K','815K','815','CP12','CP14','CP16','CP17','CS20','CS12','CS16','CS19','814K','814','816K','816','962','928H','928HZ','950K','962L','962K','950M','950L','962M','926','924','930','938','966F','930H','930K','930M','950','966F II','962M Z','950M Z','950GC','814K','924HZ','950 GC','924H','924K','938H','938K','938M','926M','TL642','TL943','TH357','TL1055','TL1255','TH408','TH3510','C4.4','MX35','C2.8','TR16-C7.1','M322D MH','MH3026','MH3024','M318D','M322','M320','M318F','M320F','M324D2 MH','M322D2','M322F','M322D','M316D','M320D2','2570C','2570D','2470C','573C','573D','563C','563D','2670C','553C','2670D']::text[],
'فیلتر و مصرفی - فیلتر روغن موتور','Cat Parts Store (official)',
'https://parts.cat.com/en/catcorp/product/462-1171',
'CAT مدل‌های متعدد را در گروه‌های ماشین‌آلات، موتور و ژنراتور فهرست کرده است. قطر 3.661 اینچ، طول 7.874 اینچ، Carbon Steel، Spin-On، جریان Out-to-In. وضعیت efficiency در داده‌های رسمی صفحه و دسته‌بندی یکسان نیست؛ مقدار صفحه محصول بدون تفسیر اضافه ثبت شده است.',
'REFERENCE',true,
'{"diameter_in":3.661,"length_in":7.874,"material":"Carbon Steel","filter_type":"Spin-On","flow_direction":"Out-to-In","efficiency_category":"Advanced High Efficiency"}'::jsonb,
'UNVERIFIED',
'Official CAT compatible models listed on product page; full list stored in compatible_models.',
'https://parts.cat.com/en/catcorp/product/462-1171',now()
where not exists (
 select 1 from public.part_catalog p
 where regexp_replace(upper(p.part_number),'[^A-Z0-9]','','g')='4621171'
);
