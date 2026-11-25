create table if not exists public.analytics_events (
  id uuid primary key default gen_random_uuid(),
  event_type text not null check (event_type in ('page_view','product_view','search','quote_submitted')),
  session_id uuid not null,
  page_path text not null default '/',
  product_sku text,
  product_name text,
  search_query text,
  result_count integer check (result_count is null or result_count >= 0),
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists analytics_events_created_at_idx on public.analytics_events (created_at desc);
create index if not exists analytics_events_type_created_idx on public.analytics_events (event_type, created_at desc);
create index if not exists analytics_events_product_created_idx on public.analytics_events (product_sku, created_at desc) where event_type = 'product_view';
create index if not exists analytics_events_search_created_idx on public.analytics_events (created_at desc) where event_type = 'search';

alter table public.analytics_events enable row level security;
revoke all on table public.analytics_events from anon, authenticated;
grant all on table public.analytics_events to service_role;

comment on table public.analytics_events is 'Privacy-minimized storefront analytics events. Writes and reads are mediated by the store-api Edge Function.';
comment on column public.analytics_events.session_id is 'Random first-party browser session UUID; not a user identity.';
comment on column public.analytics_events.metadata is 'Allow-listed non-PII event metadata only.';
