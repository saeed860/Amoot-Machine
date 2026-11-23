-- Complete the explicitly listed C-series model associations for Cat part 095-0670.
update public.part_catalog
set engine_models = (
      select array_agg(distinct model order by model)
      from unnest(engine_models || array['C9','C9.3','C15','C18']::text[]) as t(model)
    ),
    name = 'M12-1.75 x 45mm Hex Socket Head Bolt',
    source_name = 'Cat Parts Store (official)',
    source_url = 'https://parts.cat.com/en/catcorp/product/095-0670',
    source_note = 'Official Cat Parts Store page identifies this as an M12-1.75 x 45mm hex socket head bolt and lists C9, C9.3, C15 and C18 among compatible models. Public reference only; confirm exact application and fastener specification before ordering.',
    verification_status = 'REFERENCE',
    updated_at = now()
where part_number = '095-0670';
