-- Correct the earlier third-party 3512CB label using the official Cat Parts Store record.
-- Cat lists 392-0217 for 3512B, 3516B and 3508B. It does NOT list 3512CB or 3516CB.
-- Keep status REFERENCE because serial/Arrangement-specific fitment must still be checked.
update public.part_catalog
set name='Injector Group - Cat Fuel Injector',
    engine_models=array['3508B','3512','3512B','3516B']::text[],
    source_name='Cat Parts Store (official)',
    source_url='https://parts.cat.com/en/catcorp/product/392-0217',
    source_note='Official Cat Parts Store compatible-model list includes 3512B, 3516B and 3508B. The 3512 family tag is retained only as a search alias candidate; it does not confirm 3512CB or 3516CB fitment. Verify exact engine serial number and Arrangement.',
    verification_status='REFERENCE',
    updated_at=now()
where part_number='392-0217';
