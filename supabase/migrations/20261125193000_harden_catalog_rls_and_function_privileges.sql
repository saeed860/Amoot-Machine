-- Defense-in-depth for internal catalog and operational tables.
-- These tables are accessed by trusted server-side service_role only; no anon/authenticated grants exist.
ALTER TABLE public.part_catalog ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cat_part_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cat_marine_engine_models ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.kpart_catalog_evidence ENABLE ROW LEVEL SECURITY;

-- Trigger-only function: prevent direct RPC execution by API roles.
REVOKE ALL ON FUNCTION public.handle_new_auth_user() FROM PUBLIC;
REVOKE ALL ON FUNCTION public.handle_new_auth_user() FROM anon;
REVOKE ALL ON FUNCTION public.handle_new_auth_user() FROM authenticated;

-- Pin the trigger helper to pg_catalog to remove mutable search_path.
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = pg_catalog
AS $function$
BEGIN
  NEW.updated_at = pg_catalog.now();
  RETURN NEW;
END;
$function$;

-- Cover foreign keys used by joins and delete/update checks.
CREATE INDEX IF NOT EXISTS inventory_movements_actor_profile_id_idx
  ON public.inventory_movements (actor_profile_id);
CREATE INDEX IF NOT EXISTS inventory_movements_product_id_idx
  ON public.inventory_movements (product_id);
CREATE INDEX IF NOT EXISTS inventory_receipt_items_product_id_idx
  ON public.inventory_receipt_items (product_id);
CREATE INDEX IF NOT EXISTS inventory_receipts_received_by_idx
  ON public.inventory_receipts (received_by);
CREATE INDEX IF NOT EXISTS quotes_user_id_idx
  ON public.quotes (user_id);
