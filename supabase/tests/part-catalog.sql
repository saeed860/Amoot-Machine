-- Caterpillar part-catalog seed and normalization checks.
do $$
declare
  v_count integer;
begin
  select count(*) into v_count from public.part_catalog;
  if v_count < 394 then
    raise exception 'Expected at least 394 Caterpillar reference rows, found %', v_count;
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '6L-4964'
      and part_number_normalized = '6L4964'
      and engine_models @> array['3406','3408']::text[]
  ) then
    raise exception '3406/3408 reference or normalized part-number lookup failed';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '567-5857'
      and engine_models @> array['C15']::text[]
  ) then
    raise exception 'C15 water pump reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '227-1200'
      and engine_models @> array['C9']::text[]
  ) then
    raise exception 'Expanded C9 reference set is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '359-4020'
      and engine_models @> array['C15']::text[]
  ) then
    raise exception 'Expanded C15 reference set is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '515-9373'
      and engine_models @> array['3512','3516']::text[]
  ) then
    raise exception 'Expanded 3500 family reference set is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '236-0957'
      and engine_models @> array['C9']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'New C9 directory reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '540-6824'
      and engine_models @> array['C18']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'New C18 directory reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '422-7587'
      and engine_models @> array['3512','3516']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'New 3500 family directory reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '227-1200'
      and engine_models @> array['C9']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'C9 page-2 reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '10R-7231'
      and engine_models @> array['C18']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'C18 page-5 reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '422-7587'
      and engine_models @> array['3508']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception '3508 combined-family reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '243-1552'
      and engine_models @> array['C9']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'C9 page-3 reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '10R-7230'
      and engine_models @> array['C9']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'C9 page-4 reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '237-9312'
      and engine_models @> array['C9']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'C9 page-6 reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '1W-4191'
      and engine_models @> array['3508','3512','3516']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception '3500 page-3 family reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '328-5926'
      and engine_models @> array['3508','3512','3516']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception '3500 page-1 family reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '219-2350'
      and engine_models @> array['3508','3512','3516']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception '3500 page-2 family reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number_normalized = '3920217'
      and part_number = '392-0217'
  ) then
    raise exception 'Normalized exact part-number lookup for 392-0217 failed';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number_normalized ilike '%3920217%'
  ) then
    raise exception 'Normalized partial part-number lookup for 392-0217 failed';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '392-0217'
      and engine_models @> array['3512B','3516B','3508B']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'Official Cat 392-0217 model listing is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '392-0205'
      and engine_models @> array['3512C','3516C']::text[]
      and source_name = 'Cat Parts Store (official)'
  ) then
    raise exception 'Official Cat C-series injector reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '392-0214'
      and engine_models @> array['3512B','3516B']::text[]
      and source_name = 'Cat Parts Store (official)'
  ) then
    raise exception 'Official Cat B-series injector reference is missing';
  end if;

  if exists (
    select 1 from public.part_catalog
    where part_number = '392-0217'
      and engine_models && array['3512CB','3516CB']::text[]
  ) then
    raise exception '392-0217 must not claim CB-specific fitment';
  end if;



  if (select count(*) from public.part_catalog where engine_models @> array['C9']::text[]) < 125 then
    raise exception 'Expected at least 125 C9/C9.3 references';
  end if;
  if (select count(*) from public.part_catalog where engine_models @> array['C15']::text[]) < 142 then
    raise exception 'Expected at least 142 C15 references';
  end if;
  if (select count(*) from public.part_catalog where engine_models @> array['C18']::text[]) < 144 then
    raise exception 'Expected at least 144 C18 references';
  end if;
  if (select count(*) from public.part_catalog where engine_models && array['3406','3408']::text[]) < 14 then
    raise exception 'Expected at least 14 combined 3406/3408 references';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '030-7946'
      and engine_models @> array['C9']::text[]
  ) or not exists (
    select 1 from public.part_catalog
    where part_number = '464-0329'
      and engine_models @> array['C9']::text[]
  ) or not exists (
    select 1 from public.part_catalog
    where part_number = '457-6112'
      and engine_models @> array['C9']::text[]
  ) then
    raise exception 'C9/C9.3 directory model associations are incomplete';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '453-2315'
      and engine_models @> array['C18']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'C18 page-5 gasket reference is missing (row=%)', (select json_build_object('part_number',part_number,'engine_models',engine_models,'verification_status',verification_status,'source_name',source_name) from public.part_catalog where part_number='453-2315');
  end if;

  if exists (
    select 1 from public.part_catalog
    where part_number = '343-5527'
      and engine_models @> array['C15']::text[]
  ) then
    raise exception '343-5527 must not be tagged as a C15 directory fitment';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '447-8618'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['C15','C18','3512C','3516C']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception 'Official Cat 447-8618 public reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '397-4971'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3512C','3516C']::text[]
  ) then
    raise exception 'Official Cat 397-4971 model listing is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '375-4809'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3512C','3516C']::text[]
  ) then
    raise exception 'Official Cat 375-4809 model listing is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '127-2176'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3512C','3516C']::text[]
  ) then
    raise exception 'Official Cat 127-2176 model listing is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '397-5051'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3406','3408']::text[]
  ) then
    raise exception 'Official Cat 397-5051 3406/3408 reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '338-3454'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['C9','C15','C18']::text[]
  ) then
    raise exception 'Official Cat 338-3454 C9/C15/C18 reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '8N-8836'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3406','3408']::text[]
  ) then
    raise exception 'Official Cat 8N-8836 3406/3408 reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '1L-5011'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['C9','C15','C18']::text[]
  ) then
    raise exception 'Official Cat 1L-5011 C-series reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '095-0670'
      and name = 'M12-1.75 x 45mm Hex Socket Head Bolt'
      and engine_models @> array['C9','C9.3','C15','C18']::text[]
  ) then
    raise exception 'Official Cat 095-0670 exact description or model associations are missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '397-5051'
      and name = 'Throttle Control Rod'
      and source_note ilike '%discontinued%'
  ) then
    raise exception 'Official Cat 397-5051 description/discontinued status is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '392-0222'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3512C','3516C']::text[]
  ) then
    raise exception 'Official Cat 392-0222 injector reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '392-0221'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3512B','3512C','3516C']::text[]
  ) then
    raise exception 'Official Cat 392-0221 injector reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '392-0216'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3512B','3512C','3516C']::text[]
  ) then
    raise exception 'Official Cat 392-0216 injector reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '392-0220'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3508','3512','3516']::text[]
  ) then
    raise exception 'Official Cat 392-0220 injector reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '7C-0877'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3508','3512','3516']::text[]
  ) then
    raise exception 'Official Cat 7C-0877 injector reference is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '100-3878'
      and source_name = 'Cat Parts Store (official)'
      and engine_models @> array['3512C','3516C']::text[]
  ) then
    raise exception 'Official Cat 100-3878 injector spring reference is missing';
  end if;

  if not exists (select 1 from pg_constraint where conname = 'part_catalog_oem_verified_evidence_check') then
    raise exception 'Cat SIS evidence constraint is missing';
  end if;

  if exists (
    select part_number from public.part_catalog
    group by part_number having count(*) > 1
  ) then
    raise exception 'Duplicate Caterpillar part numbers found';
  end if;
end $$;
