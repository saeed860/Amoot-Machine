-- C280 marine lubrication and exhaust references from Cat Parts Store.
insert into public.part_catalog
(brand,part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models,application_type,application_evidence,application_source_url)
values
('Caterpillar','221-0129','PUMP-ENGINE PRELUBRICATION','Engine prelubrication pump. Official Cat Compatible Models lists Marine Engine C280-16, C280-12, C280-6 and C280-8, as well as Gen Set Engine 3606/3608/3612/3616 and Petroleum Engine C280-12.',ARRAY['C280-16','C280-12','C280-6','C280-8']::text[],'موتورهای دریایی - روغن‌کاری و پیش‌روغن‌کاری','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/221-0129','Marine Engine models copied from official Compatible Models; page does not list a serial-specific fitment.','REFERENCE',null,'{}'::jsonb,ARRAY['C280-16','C280-12','C280-6','C280-8']::text[],'BOTH','Official Compatible Models lists Marine Engine C280 family and Gen Set Engine/Petroleum Engine applications.','https://parts.cat.com/en/catcorp/product/221-0129'),
('Caterpillar','127-2441','KIT-EXHAUST','Exhaust kit including exhaust manifold, bellows and adapter gaskets. Official Cat Compatible Models lists Marine Engine C280-16/C280-08/C280-12/C280-6/C280-8 and Gen Set Engine, Industrial Engine and Petroleum Engine applications.',ARRAY['C280-16','C280-08','C280-12','C280-6','C280-8']::text[],'موتورهای دریایی - سیستم اگزوز و کیت آب‌بندی','Cat Parts Store (official)','https://parts.cat.com/en/catcorp/product/127-2441','Contents and marine engine model names copied from official public page.','REFERENCE',null,'{}'::jsonb,ARRAY['C280-16','C280-08','C280-12','C280-6','C280-8']::text[],'BOTH','Official Compatible Models lists Marine Engine C280 family and Gen Set, Industrial and Petroleum Engine applications.','https://parts.cat.com/en/catcorp/product/127-2441')
on conflict (part_number) do nothing;

update public.part_catalog
set technical_group=case when part_number='221-0129' then 'موتورهای دریایی - روغن‌کاری و پیش‌روغن‌کاری'
                         else 'موتورهای دریایی - سیستم اگزوز و کیت آب‌بندی' end,
 application_type='BOTH',
 application_evidence='Official Cat Compatible Models lists Marine Engine and other non-marine engine applications.',
 application_source_url='https://parts.cat.com/en/catcorp/product/'||part_number,
 updated_at=now()
where part_number in ('221-0129','127-2441');
