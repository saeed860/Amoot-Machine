-- Amoot Machine: initial Supabase schema.
-- Apply only after reviewing in the Supabase SQL editor or via the documented CI migration.
create extension if not exists pgcrypto;

create type public.user_role as enum ('CUSTOMER','ADMIN','OPERATOR');
create type public.product_status as enum ('ACTIVE','INACTIVE','ARCHIVED');
create type public.order_status as enum ('PENDING','CONFIRMED','PROCESSING','SHIPPED','DELIVERED','CANCELLED');
create type public.quote_status as enum ('NEW','CONTACTED','CLOSED');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  identifier text unique,
  display_name text not null default '',
  role public.user_role not null default 'CUSTOMER',
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.addresses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  title text,
  recipient text not null,
  phone text not null,
  province text not null,
  city text not null,
  postal_code text,
  address_line text not null,
  created_at timestamptz not null default now()
);
create index addresses_user_id_idx on public.addresses(user_id);

create table public.products (
  id uuid primary key default gen_random_uuid(),
  sku text not null unique,
  name text not null,
  brand text,
  category text not null,
  machine_model text,
  description text,
  image_url text,
  price_irr bigint check (price_irr is null or price_irr >= 0),
  stock integer not null default 0 check (stock >= 0),
  status public.product_status not null default 'ACTIVE',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index products_category_status_idx on public.products(category,status);
create index products_brand_idx on public.products(brand);
create index products_machine_model_idx on public.products(machine_model);

create table public.orders (
  id uuid primary key default gen_random_uuid(),
  order_number text not null unique,
  user_id uuid not null references public.profiles(id) on delete restrict,
  status public.order_status not null default 'PENDING',
  payment_status text not null default 'UNPAID',
  total_irr bigint not null check (total_irr >= 0),
  recipient text not null,
  phone text not null,
  province text not null,
  city text not null,
  postal_code text,
  address_line text not null,
  notes text,
  idempotency_key text unique,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index orders_user_created_idx on public.orders(user_id,created_at desc);
create index orders_status_created_idx on public.orders(status,created_at desc);

create table public.order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete restrict,
  product_id uuid not null references public.products(id) on delete restrict,
  sku_snapshot text not null,
  name_snapshot text not null,
  quantity integer not null check (quantity between 1 and 100),
  unit_price_irr bigint not null check (unit_price_irr > 0),
  line_total_irr bigint not null check (line_total_irr > 0)
);
create index order_items_order_id_idx on public.order_items(order_id);
create index order_items_product_id_idx on public.order_items(product_id);

create table public.quotes (
  id uuid primary key default gen_random_uuid(),
  quote_number text not null unique,
  user_id uuid references public.profiles(id) on delete set null,
  name text not null,
  phone text not null,
  product_sku text,
  machine_model text,
  message text not null,
  status public.quote_status not null default 'NEW',
  created_at timestamptz not null default now()
);
create index quotes_status_created_idx on public.quotes(status,created_at desc);
create index quotes_phone_idx on public.quotes(phone);

create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end;
$$;
create trigger profiles_set_updated_at before update on public.profiles
for each row execute function public.set_updated_at();
create trigger products_set_updated_at before update on public.products
for each row execute function public.set_updated_at();
create trigger orders_set_updated_at before update on public.orders
for each row execute function public.set_updated_at();

-- Auth users receive a customer profile. Admin/operator roles are assigned out-of-band only.
create or replace function public.handle_new_auth_user()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  insert into public.profiles(id, identifier, display_name)
  values (
    new.id,
    lower(coalesce(new.email, new.phone, new.raw_user_meta_data->>'identifier', new.id::text)),
    coalesce(new.raw_user_meta_data->>'display_name', '')
  )
  on conflict (id) do nothing;
  return new;
end;
$$;
create trigger on_auth_user_created after insert on auth.users
for each row execute function public.handle_new_auth_user();

alter table public.profiles enable row level security;
alter table public.addresses enable row level security;
alter table public.products enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;
alter table public.quotes enable row level security;

create policy "profiles read own" on public.profiles for select to authenticated using (id = (select auth.uid()));
create policy "profiles update own basic fields" on public.profiles for update to authenticated
using (id = (select auth.uid())) with check (id = (select auth.uid()) and role = 'CUSTOMER' and is_active = true);
create policy "addresses own access" on public.addresses for all to authenticated
using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy "active products are public" on public.products for select to anon, authenticated using (status = 'ACTIVE');
create policy "customers read own orders" on public.orders for select to authenticated using (user_id = (select auth.uid()));
create policy "customers read own order items" on public.order_items for select to authenticated
using (exists (select 1 from public.orders o where o.id = order_id and o.user_id = (select auth.uid())));
create policy "customers submit quotes" on public.quotes for insert to anon, authenticated
with check (user_id is null or user_id = (select auth.uid()));
create policy "customers read own quotes" on public.quotes for select to authenticated using (user_id = (select auth.uid()));

-- No direct client writes to products, orders, order_items, or quote status.
revoke insert, update, delete on public.products from anon, authenticated;
revoke insert, update, delete on public.orders from anon, authenticated;
revoke insert, update, delete on public.order_items from anon, authenticated;
revoke update, delete on public.quotes from anon, authenticated;

-- Initial catalog, matching the existing repository seed data.
insert into public.products(sku,name,brand,category,machine_model,description,price_irr,stock,image_url) values
('321-8076','دینام کاترپیلار','Caterpillar','قطعات برقی','ماشین‌آلات CAT','شماره فنی و سازگاری باید پیش از سفارش بررسی شود.',32000000,5,'/assets/product-alternator.jpg'),
('7T-3205','رولیک زیربندی','Caterpillar','قطعات زیربندی','بیل مکانیکی','مشخصات فنی را پیش از خرید تطبیق دهید.',12800000,8,'/assets/product-roller.jpg'),
('221-8307','پمپ هیدرولیک','Caterpillar','قطعات هیدرولیک','ماشین‌آلات سنگین','شماره فنی نهایی باید بررسی شود.',75000000,2,'/assets/product-pump.jpg'),
('1R-0716','فیلتر هوای موتور','Caterpillar','فیلتر و مصرفی','320D','مشخصات را پیش از خرید تطبیق دهید.',3200000,20,'/assets/product-filter.jpg'),
('320-6690','استارت کاترپیلار','Caterpillar','قطعات برقی','ماشین‌آلات CAT','سازگاری با مدل دستگاه بررسی شود.',48500000,4,'/assets/product-starter.jpg'),
('HPU-042','پمپ هیدرولیک پیستونی','Parker','قطعات هیدرولیک','ماشین‌آلات راهسازی و صنعتی','تطبیق کد فنی، دبی و فشار کاری پیش از سفارش ضروری است.',null,3,'/assets/product-pump.jpg'),
('HCV-315','شیر کنترل جهت هیدرولیک','Danfoss','قطعات هیدرولیک','سیستم‌های هیدرولیک صنعتی','مشخصات پورت و فشار کاری باید بررسی شود.',null,4,'/assets/product-pump.jpg'),
('HPP-220','یونیت پاورپک هیدرولیک','Industrial','قطعات هیدرولیک','تجهیزات صنعتی و ماشین‌آلات','ظرفیت مخزن، توان موتور و فشار کاری بر اساس سفارش تعیین می‌شود.',null,1,'/assets/product-pump.jpg'),
('PNC-032','جک پنوماتیک دوطرفه','Parker','قطعات پنوماتیک','خطوط اتوماسیون و ماشین‌آلات صنعتی','قطر پیستون، کورس و نوع نصب باید تطبیق داده شود.',null,8,'/assets/product-pump.jpg'),
('FRL-01','واحد مراقبت پنوماتیک FRL','Norgren','قطعات پنوماتیک','سیستم هوای فشرده','سایز اتصال باید بررسی شود.',null,6,'/assets/product-filter.jpg'),
('SV-24V','شیر برقی پنوماتیک','SMC','قطعات پنوماتیک','مدارهای کنترل پنوماتیک','ولتاژ بوبین، تعداد راه و سایز پورت باید با سیستم هماهنگ شود.',null,10,'/assets/product-pump.jpg')
on conflict (sku) do nothing;
