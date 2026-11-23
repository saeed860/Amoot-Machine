-- Ensure marine application labels are applied even when a part number already existed.
update public.part_catalog
set application_type=case when part_number='141-7015' then 'MARINE' else 'BOTH' end,
    application_evidence=case when part_number='141-7015'
      then 'Official Cat Compatible Models lists Marine Engine and Marine Auxiliary applications.'
      else 'Official Cat Compatible Models lists Marine Engine and/or Marine Auxiliary and also generator, industrial, petroleum or other non-marine applications.'
    end,
    application_source_url='https://parts.cat.com/en/catcorp/product/'||part_number,
    updated_at=now()
where part_number in ('131-5459','151-5565','122-2311','114-3378','4W-8404','7N-8652','310-2365','127-2442','8T-5361','248-2857','221-0132','141-7015','334-2667','485-3715');
