-- Marine engine directory and explicit marine/land/both application labels.
alter table public.products
  add column if not exists application_type text not null default 'UNVERIFIED'
    check (application_type in ('MARINE','LAND','BOTH','UNVERIFIED')),
  add column if not exists application_evidence text,
  add column if not exists application_source_url text;

alter table public.part_catalog
  add column if not exists application_type text not null default 'UNVERIFIED'
    check (application_type in ('MARINE','LAND','BOTH','UNVERIFIED')),
  add column if not exists application_evidence text,
  add column if not exists application_source_url text;

create index if not exists products_application_type_idx on public.products(application_type, status);
create index if not exists part_catalog_application_type_idx on public.part_catalog(application_type, is_active);

create table if not exists public.cat_marine_engine_models (
  id bigint generated always as identity primary key,
  model_key text not null,
  model_name text not null,
  application_group text not null check (application_group in ('PROPULSION','HIGH_PERFORMANCE','GENERATOR_SET','AUXILIARY')),
  application_type text not null default 'MARINE' check (application_type = 'MARINE'),
  source_url text not null,
  source_name text not null default 'Caterpillar Marine official catalog',
  captured_at timestamptz not null default now(),
  unique(model_key, application_group)
);
create index if not exists cat_marine_engine_models_group_idx on public.cat_marine_engine_models(application_group, model_name);
revoke all on public.cat_marine_engine_models from public, anon, authenticated;
grant select on public.cat_marine_engine_models to service_role;

insert into public.cat_marine_engine_models(model_key,model_name,application_group,source_url) values
('C7.1','C7.1','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C9.3','C9.3','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C12','C12','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C18','C18','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C32','C32','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C32B','C32B','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('3406C','3406C','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('3512C','3512C','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('3512E','3512E','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('3516C','3516C','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('3516E','3516E','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('3516E HIGH OUTPUT','3516E High Output','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C280-6','C280-6','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C280-8','C280-8','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C280-12','C280-12','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C280-16','C280-16','PROPULSION','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/commercial-propulsion-engines/'),
('C7.1','C7.1','HIGH_PERFORMANCE','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/high-performance-propulsion-and-maneuvering-solutions/'),
('C12','C12','HIGH_PERFORMANCE','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/high-performance-propulsion-and-maneuvering-solutions/'),
('C18','C18','HIGH_PERFORMANCE','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/high-performance-propulsion-and-maneuvering-solutions/'),
('C32','C32','HIGH_PERFORMANCE','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/high-performance-propulsion-and-maneuvering-solutions/'),
('C32B TWIN TURBO','C32B Twin Turbo','HIGH_PERFORMANCE','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/high-performance-propulsion-and-maneuvering-solutions/'),
('C32B SEQUENTIAL TURBO','C32B Sequential Turbo','HIGH_PERFORMANCE','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/high-performance-propulsion-and-maneuvering-solutions/'),
('3516E HIGH OUTPUT','3516E High Output','HIGH_PERFORMANCE','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/high-performance-propulsion-and-maneuvering-solutions/'),
('C1.5','C1.5','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C2.2','C2.2','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C2.2B GENSET','C2.2B Genset','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C4.4','C4.4','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C4.4 ELECTRONIC','C4.4 (Electronic)','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C7.1','C7.1','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C9.3','C9.3','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C18','C18','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C32','C32','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('3512C','3512C','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C280-6','C280-6','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C280-8','C280-8','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C280-12','C280-12','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C280-16','C280-16','GENERATOR_SET','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/marine-generator-sets/'),
('C4.4 ELECTRONIC','C4.4 (Electronic)','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/'),
('C7.1 ELECTRONIC','C7.1 (Electronic)','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/'),
('C9.3 AUXILIARY','C9.3 Auxiliary Engine','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/'),
('C18','C18','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/'),
('C32','C32','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/'),
('C32B','C32B','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/'),
('3512E','3512E','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/'),
('3516E','3516E','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/'),
('C280','C280','AUXILIARY','https://www.cat.com/en_US/products/new/power-systems/marine-power-systems/')
on conflict(model_key,application_group) do update set model_name=excluded.model_name,source_url=excluded.source_url;

-- Classification only where Cat's public product description or compatible-model section supports it.
update public.products set application_type='MARINE',
 application_evidence='Cat product page explicitly identifies Marine Propulsion application for 3516B.',
 application_source_url='https://parts.cat.com/en/catcorp/product/10R-9954',
 category='موتورهای دریایی - قطعات پیشران', updated_at=now()
where sku='CAT-10R-9954';

update public.products set application_type='MARINE',
 application_evidence='Cat product page explicitly identifies Marine Propulsion and Marine Engine 3512B.',
 application_source_url='https://parts.cat.com/en/catcorp/product/20R-0043',
 category='موتورهای دریایی - قطعات پیشران', updated_at=now()
where sku='CAT-20R-0043';

update public.products set application_type='BOTH',
 application_evidence='Cat Compatible Models lists Marine Engine 3406B as well as truck, generator-set and industrial 3406B applications.',
 application_source_url='https://parts.cat.com/en/catcorp/product/7W-0009', updated_at=now()
where sku='CAT-7W-0009';

update public.products set application_type='BOTH',
 application_evidence='Cat page describes a seawater-pump port plate and lists Marine Auxiliary and generator-set/engine applications.',
 application_source_url='https://parts.cat.com/en/catcorp/product/5N-4504',
 category='موتورهای دریایی - خنک‌کاری و آب دریا', updated_at=now()
where sku='CAT-5N-4504';

update public.products set application_type='LAND',
 application_evidence='Cat page lists only off-highway machine applications for this reman engine configuration.',
 application_source_url='https://parts.cat.com/en/catcorp/product/20R-2510', updated_at=now()
where sku='CAT-20R-2510';

update public.products set application_type='LAND',
 application_evidence='Cat page lists D6T track-type tractor configurations for this reman engine.',
 application_source_url='https://parts.cat.com/en/catcorp/product/20R-5367', updated_at=now()
where sku='CAT-20R-5367';

update public.products set application_type='LAND',
 application_evidence='Cat page lists 988K wheel-loader application for this reman engine configuration.',
 application_source_url='https://parts.cat.com/en/catcorp/product/30R-0084', updated_at=now()
where sku='CAT-30R-0084';

update public.products set application_type='LAND',
 application_evidence='Cat product description identifies an electric-power natural-gas conversion kit for 3516B power modules; no marine use is stated.',
 application_source_url='https://parts.cat.com/en/catcorp/product/593-5344', updated_at=now()
where sku='CAT-593-5344';

update public.products set application_type='LAND',
 application_evidence='Cat product description identifies industrial engine applications; no marine model is listed on the checked public page.',
 application_source_url='https://parts.cat.com/en/catcorp/product/0R-8200', updated_at=now()
where sku='CAT-0R-8200';

update public.products set application_type='LAND',
 application_evidence='Cat product page lists G-series generator-set/gas-engine applications; marine fitment is not stated.',
 application_source_url='https://parts.cat.com/en/catcorp/product/9X-3406', updated_at=now()
where sku='CAT-9X-3406';

update public.products set application_type='LAND',
 application_evidence='Cat page lists G3516B/C generator-set applications; marine fitment is not stated.',
 application_source_url='https://parts.cat.com/en/catcorp/product/260-3406', updated_at=now()
where sku='CAT-260-3406';

update public.products set application_type='LAND',
 application_evidence='Cat product page describes 3406B reman short-block and listed non-marine applications only.',
 application_source_url='https://parts.cat.com/en/catcorp/product/20R-3958', updated_at=now()
where sku='CAT-20R-3958';

-- These existing general engine fasteners are retained as unverified for application type.
