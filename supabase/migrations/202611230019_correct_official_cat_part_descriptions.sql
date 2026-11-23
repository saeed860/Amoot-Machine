-- Correct exact public Cat product descriptions and expose documented C9.3 association.
update public.part_catalog
set name = 'Throttle Control Rod',
    source_note = 'Official Cat Parts Store listing; product is marked discontinued and Cat advises contacting a dealer for replacement options. Compatible-model list includes 3406, 3408, 3512 and 3516 variants shown on the source page; this is not a CB-specific fitment claim.',
    verification_status = 'REFERENCE',
    updated_at = now()
where part_number = '397-5051';

update public.part_catalog
set name = 'M12-1.75 x 45mm Hex Socket Head Bolt',
    engine_models = (
      select array_agg(distinct model order by model)
      from unnest(engine_models || array['C9.3']::text[]) as t(model)
    ),
    source_note = 'Official Cat Parts Store page identifies this as an M12-1.75 x 45mm hex socket head bolt and lists C9, C9.3, C15 and C18 among compatible models. Public reference only; confirm exact application and fastener specification before ordering.',
    verification_status = 'REFERENCE',
    updated_at = now()
where part_number = '095-0670';
