-- Correct the 392-0221 fitment array to include Cat's listed 3512B Marine Auxiliary application.
update public.part_catalog
set engine_models = ARRAY['3516C','3512C','3512B']::text[],
    compatible_models = ARRAY['3516C','3512C','3512B']::text[],
    source_note = 'Official Cat Compatible Models list includes Generator Set 3516C/3512C, Marine Auxiliary 3512C/3516C/3512B, Marine Engine 3512C/3516C and Industrial Engine 3516C.',
    updated_at = now()
where part_number = '392-0221'
  and source_name = 'Cat Parts Store (official)';
