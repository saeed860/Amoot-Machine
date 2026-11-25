update public.part_catalog set
 verification_status='REFERENCE',
 application_type='MARINE',
 engine_models=ARRAY['C18']::text[],
 compatible_models=ARRAY['C18','C18 MARINE']::text[],
 source_name='Cat Parts Store',
 source_accessed_at=now(),
 application_evidence=case part_number
 when '161-4113' then 'Cat Parts Store explicitly lists C18 under MARINE ENGINE; engine oil gear pump.'
when '20R-4330' then 'Cat Parts Store explicitly lists C18 under MARINE ENGINE; Cat Reman one-section gear pump.'
when '258-9978' then 'Cat Parts Store explicitly lists C18 under MARINE ENGINE; engine oil filter tube line assembly.'
when '448-4452' then 'Cat Parts Store explicitly lists C18 under MARINE ENGINE; fuel transfer pump kit.'
when '524-3157' then 'Cat Parts Store explicitly lists C18 under MARINE ENGINE; water pump body.'
when '6I-4575' then 'Cat Parts Store explicitly lists C18 under MARINE ENGINE; 34-tooth engine oil pump drive gear.'
 else application_evidence end,
 application_source_url=source_url,
 source_note=coalesce(source_note,'') || ' Cat Parts Store explicitly lists C18 under MARINE ENGINE. This is model-family evidence only; confirm exact serial prefix and arrangement in Cat SIS.',
 updated_at=now()
where part_number in ('161-4113','20R-4330','258-9978','448-4452','524-3157','6I-4575');