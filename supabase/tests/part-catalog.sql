-- Caterpillar part-catalog seed and normalization checks.
do $$
declare
  v_count integer;
begin
  select count(*) into v_count from public.part_catalog;
  if v_count < 200 then
    raise exception 'Expected at least 200 Caterpillar reference rows, found %', v_count;
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
    where part_number = '359-4020'
      and engine_models @> array['C15']::text[]
  ) then
    raise exception 'Expanded C15 reference set is missing';
  end if;

  if not exists (
    select 1 from public.part_catalog
    where part_number = '392-0217'
      and engine_models @> array['3512CB']::text[]
      and verification_status = 'REFERENCE'
  ) then
    raise exception '3512CB supplier reference is missing or incorrectly verified';
  end if;

  if exists (
    select part_number from public.part_catalog
    group by part_number having count(*) > 1
  ) then
    raise exception 'Duplicate Caterpillar part numbers found';
  end if;
end $$;
