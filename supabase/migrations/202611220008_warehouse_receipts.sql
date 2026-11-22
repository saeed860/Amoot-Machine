-- Controlled warehouse receiving: receipt header + lines + stock update in one transaction.
create table public.inventory_receipts (
  id uuid primary key default gen_random_uuid(),
  receipt_number text not null unique,
  supplier text,
  document_number text,
  note text,
  received_by uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now()
);
create table public.inventory_receipt_items (
  id uuid primary key default gen_random_uuid(),
  receipt_id uuid not null references public.inventory_receipts(id) on delete restrict,
  product_id uuid not null references public.products(id) on delete restrict,
  sku text not null,
  product_name text not null,
  quantity integer not null check (quantity > 0),
  created_at timestamptz not null default now()
);
create index inventory_receipts_created_idx on public.inventory_receipts(created_at desc);
create index inventory_receipt_items_receipt_idx on public.inventory_receipt_items(receipt_id);
alter table public.inventory_receipts enable row level security;
alter table public.inventory_receipt_items enable row level security;
revoke all on public.inventory_receipts, public.inventory_receipt_items from anon, authenticated;
grant select, insert on public.inventory_receipts, public.inventory_receipt_items to service_role;

create or replace function public.amoot_receive_inventory(
  p_receipt_number text,
  p_supplier text,
  p_document_number text,
  p_note text,
  p_actor uuid,
  p_items jsonb
)
returns table(receipt_number text, line_count integer)
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_receipt_id uuid;
  v_item record;
  v_product public.products%rowtype;
  v_count integer := 0;
begin
  if length(coalesce(p_receipt_number,'')) < 5 or length(p_receipt_number) > 80 then
    raise exception 'INVALID_RECEIPT';
  end if;
  if jsonb_typeof(p_items) <> 'array' or jsonb_array_length(p_items) < 1 or jsonb_array_length(p_items) > 100 then
    raise exception 'INVALID_RECEIPT_ITEMS';
  end if;
  if exists (
    select 1 from (
      select btrim(value->>'sku') sku, sum((value->>'quantity')::integer) qty
      from jsonb_array_elements(p_items) group by btrim(value->>'sku')
    ) x where x.sku = '' or x.qty <= 0 or x.qty > 1000000
  ) then raise exception 'INVALID_RECEIPT_ITEMS'; end if;
  if exists (
    select 1 from (
      select btrim(value->>'sku') sku from jsonb_array_elements(p_items)
      group by btrim(value->>'sku') having count(*) > 1
    ) x
  ) then raise exception 'DUPLICATE_RECEIPT_SKU'; end if;

  insert into public.inventory_receipts(receipt_number,supplier,document_number,note,received_by)
  values(p_receipt_number,nullif(left(btrim(coalesce(p_supplier,'')),160),''),nullif(left(btrim(coalesce(p_document_number,'')),100),''),
    nullif(left(btrim(coalesce(p_note,'')),1000),''),p_actor)
  returning id into v_receipt_id;

  perform set_config('amoot.inventory_reason','IN',true);
  perform set_config('amoot.inventory_reference',p_receipt_number,true);
  perform set_config('amoot.inventory_actor',coalesce(p_actor::text,''),true);

  for v_item in
    select btrim(value->>'sku') sku, (value->>'quantity')::integer qty
    from jsonb_array_elements(p_items) order by btrim(value->>'sku')
  loop
    select * into v_product from public.products p where p.sku=v_item.sku for update;
    if not found then raise exception 'PRODUCT_NOT_FOUND'; end if;
    if v_product.stock + v_item.qty > 10000000 then raise exception 'STOCK_LIMIT_EXCEEDED'; end if;
    update public.products set stock=stock+v_item.qty where id=v_product.id;
    insert into public.inventory_receipt_items(receipt_id,product_id,sku,product_name,quantity)
    values(v_receipt_id,v_product.id,v_product.sku,v_product.name,v_item.qty);
    v_count := v_count + 1;
  end loop;
  return query select p_receipt_number,v_count;
end;
$$;
revoke all on function public.amoot_receive_inventory(text,text,text,text,uuid,jsonb) from public,anon,authenticated;
grant execute on function public.amoot_receive_inventory(text,text,text,text,uuid,jsonb) to service_role;
