-- Normalize existing Cat engine oil filter groups.
update public.part_catalog
set technical_group='فیلتر و مصرفی - فیلتر روغن موتور', updated_at=now()
where part_number in ('1R-0726','172-1018');
