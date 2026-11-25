create table if not exists public.cat_part_cross_references (
 id uuid primary key default gen_random_uuid(),
 cat_part_number text not null,
 alternate_brand text not null,
 alternate_part_number text not null,
 source_name text not null,
 source_url text not null,
 source_note text,
 verification_status text not null default 'UNVERIFIED_SOURCE_ROW',
 source_accessed_at timestamptz not null default now(),
 created_at timestamptz not null default now(),
 unique(cat_part_number,alternate_brand,alternate_part_number,source_name)
);
alter table public.cat_part_cross_references enable row level security;
revoke all on public.cat_part_cross_references from anon, authenticated;

insert into public.part_catalog
 (brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,compatible_models,application_type,application_evidence,application_source_url,specifications)
values
('Caterpillar','1W-8845','Cat Advanced Efficiency Engine Oil Filter','Spin-on engine oil filter, Advanced High Efficiency. Diameter 4.701 in, length 11.268 in, Out-to-In flow, carbon-steel housing.',ARRAY['C-10','C-12','3176B','C11','C13','3176','3196','3176C'],'فیلتر و سرویس - فیلتر روغن موتور','Cat Parts Store (official); Off Road Equipment; SF-Filter cross-reference discovery','https://parts.cat.com/en/catcorp/product/1W-8845','Official Cat page identifies Advanced Efficiency Engine Oil Filter, diameter 4.701 in, length 11.268 in, Out-to-In, Advanced High Efficiency. Compatible-model groups list Truck Engine C-10/C-12/3176B/C11/C13/3176; Industrial Engine C-12/C-10/3196/C11/C13/3176C/3176B; Petroleum Engine C13/C11; Excavator 245/245D/245B; Wheel Loader 924F/960F/962G. No Marine Engine class appears in retrieved page.','REFERENCE',ARRAY['C-10','C-12','3176B','C11','C13','3176','3196','3176C'],'LAND','Official Cat compatible model list contains truck, industrial, petroleum, excavator and wheel loader groups; no Marine Engine category shown.','https://parts.cat.com/en/catcorp/product/1W-8845','{"diameter_in":4.701,"length_in":11.268,"flow_direction":"Out-to-In","material":"Carbon Steel","efficiency":"Advanced High Efficiency","filter_type":"Spin-On"}'::jsonb)
on conflict(part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,source_url=excluded.source_url,
 source_note=excluded.source_note,verification_status='REFERENCE',compatible_models=excluded.compatible_models,
 application_type=excluded.application_type,application_evidence=excluded.application_evidence,
 application_source_url=excluded.application_source_url,specifications=excluded.specifications,updated_at=now();

insert into public.products
 (sku,name,brand,category,machine_model,description,image_url,price_usd,price_irr,stock,status,application_type,application_evidence,application_source_url)
values
('CAT-326-1643','فیلتر جداکننده آب و سوخت Cat 326-1643','Caterpillar','فیلتر و سرویس - جداکننده آب و سوخت','C9، C11، C15، C18، C12.9، C8.7 و ماشین‌آلات منتخب','Cat Advanced High Efficiency Fuel Water Separator؛ قطر 4.264 اینچ، طول 9.087 اینچ، جریان Out-to-In و بدنه فولاد کربنی. CAT کاربرد Marine Engine برای C12.9 و C8.7 را نیز فهرست کرده است. قیمت و موجودی تأییدنشده است.','https://caterpillar.scene7.com/is/image/Caterpillar/CM20180403-40565-34557?fmt=WebP&hei=960&wid=960',NULL,NULL,0,'ACTIVE','BOTH','Cat Parts Store explicitly lists Marine Engine C12.9 and C8.7 plus land, truck, industrial, generator and equipment groups.','https://parts.cat.com/en/catcorp/product/326-1643'),
('CAT-569-8036','کیت فیلتر روغن موتور Cat 569-8036','Caterpillar','فیلتر و سرویس - کیت فیلتر روغن','C3.6، C2.8 و ماشین‌آلات کامپکت منتخب','Cat Lube Filter Element Kit شامل 505-3864 Element Assembly و 6V-8002 O-Ring، هرکدام یک عدد. CAT سازگاری با خانواده‌های ماشین‌آلات و موتورهای صنعتی را فهرست کرده است. قیمت و موجودی تأییدنشده است.','https://caterpillar.scene7.com/is/image/Caterpillar/CM20250806-4e50b-a9661?fmt=WebP&hei=960&wid=960',NULL,NULL,0,'ACTIVE','LAND','Cat Compatible Models list compact track loaders, generators, C3.6/C2.8 industrial engines, backhoe loaders, wheel loaders, telehandlers and compact equipment; no Marine Engine category shown.','https://parts.cat.com/en/catcorp/product/569-8036'),
('CAT-110-6331','فیلتر هوای ثانویه Cat 110-6331','Caterpillar','فیلتر و سرویس - فیلتر هوای موتور','C3.4، C4.4، 3054 و ماشین‌آلات کامپکت منتخب','Cat Secondary Standard Efficiency Engine Air Filter؛ فیلتر هوای ثانویه گرد با ابعاد 3.724 × 3.724 × 13.366 اینچ و مدیای Standard. قیمت و موجودی تأییدنشده است.','https://caterpillar.scene7.com/is/image/Caterpillar/CM20250708-f936e-6d291?fmt=WebP&hei=960&wid=960',NULL,NULL,0,'ACTIVE','LAND','Cat Compatible Models list multi-terrain/compact track loaders, generators, C3.4/C4.4, backhoe loaders, telehandlers, wheel loaders and excavators; no Marine Engine category shown.','https://parts.cat.com/en/catcorp/product/110-6331'),
('CAT-1W-8845','فیلتر روغن موتور Cat 1W-8845','Caterpillar','فیلتر و سرویس - فیلتر روغن موتور','C-10، C-12، C11، C13، 3176 و 3196','Cat Advanced Efficiency Engine Oil Filter؛ قطر 4.701 اینچ، طول 11.268 اینچ، جریان Out-to-In و راندمان Advanced High Efficiency. قیمت و موجودی تأییدنشده است.','https://caterpillar.scene7.com/is/image/Caterpillar/CM20260505-4a250-7b97b?fmt=WebP&hei=960&wid=960',NULL,NULL,0,'ACTIVE','LAND','Cat Compatible Models list truck, industrial, petroleum engine, excavator and wheel loader groups; no Marine Engine category shown.','https://parts.cat.com/en/catcorp/product/1W-8845')
on conflict (sku) do update set
 name=excluded.name,brand=excluded.brand,category=excluded.category,machine_model=excluded.machine_model,
 description=excluded.description,image_url=excluded.image_url,application_type=excluded.application_type,
 application_evidence=excluded.application_evidence,application_source_url=excluded.application_source_url,updated_at=now();

insert into public.cat_part_cross_references
 (cat_part_number,alternate_brand,alternate_part_number,source_name,source_url,source_note,verification_status)
values
('1R-1807','Fleetguard','LF3321','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists LF3321 in Fleetguard column for reference row labelled 1R-1807. Secondary catalog row; confirm dimensions and official maker catalog before treating as direct replacement.','UNVERIFIED_SOURCE_ROW'),
('1R-1807','Baldwin','B7700','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists B7700 in Baldwin column for reference row labelled 1R-1807. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-1807','Donaldson','P551807','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists P551807 in Donaldson column for reference row labelled 1R-1807. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-1808','Fleetguard','LF691A','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists LF691A in Fleetguard column for reference row labelled 1R-1808. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-1808','Baldwin','B7299','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists B7299 in Baldwin column for reference row labelled 1R-1808. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-1808','Donaldson','P551808','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists P551808 in Donaldson column for reference row labelled 1R-1808. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-0716','Fleetguard','LF691','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists LF691 in Fleetguard column for reference row labelled 1R-0716. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-0716','Baldwin','BT523','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists BT523 in Baldwin column for reference row labelled 1R-0716. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-0716','Donaldson','P551808','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists P551808 in Donaldson column for reference row labelled 1R-0716. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-0753','Fleetguard','FF5322','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists FF5322 in Fleetguard column for reference row labelled 1R-0753. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-0753','Baldwin','BF7631','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists BF7631 in Baldwin column for reference row labelled 1R-0753. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW'),
('1R-0753','Donaldson','P551312','IXIN Filters cross-reference index','https://www.ixinfilters.com/en/filter-cross-reference/','Source row lists P551312 in Donaldson column for reference row labelled 1R-0753. Secondary catalog row; verify before fitment.','UNVERIFIED_SOURCE_ROW')
on conflict (cat_part_number,alternate_brand,alternate_part_number,source_name)
do update set source_note=excluded.source_note,source_url=excluded.source_url,
 verification_status=excluded.verification_status,source_accessed_at=now();
