-- Classify generic Cat filter/screen records into the Persian filter hierarchy.
-- Classification uses existing Persian/English part names and descriptions; ambiguous records fall into "other filters".
update public.part_catalog
set technical_group = case
 when lower(coalesce(name,'') || ' ' || coalesce(description,'')) ~ '(water.?fuel|fuel.?water|water separator|جداکننده.*(آب|سوخت)|(آب|سوخت).*جداکننده)' then 'فیلتر و مصرفی - جداکننده آب و سوخت'
 when lower(coalesce(name,'') || ' ' || coalesce(description,'')) ~ '(fuel|سوخت)' then 'فیلتر و مصرفی - فیلتر سوخت'
 when lower(coalesce(name,'') || ' ' || coalesce(description,'')) ~ '(hydraulic|هیدرولیک)' then 'فیلتر و مصرفی - فیلتر هیدرولیک'
 when lower(coalesce(name,'') || ' ' || coalesce(description,'')) ~ '(transmission|gearbox|گیربکس|انتقال قدرت)' then 'فیلتر و مصرفی - فیلتر گیربکس و انتقال قدرت'
 when lower(coalesce(name,'') || ' ' || coalesce(description,'')) ~ '(engine oil|oil filter|روغن موتور)' then 'فیلتر و مصرفی - فیلتر روغن موتور'
 when lower(coalesce(name,'') || ' ' || coalesce(description,'')) ~ '(cabin|cab air|هوای کابین|کابین)' then 'فیلتر و مصرفی - فیلتر هوای کابین'
 when lower(coalesce(name,'') || ' ' || coalesce(description,'')) ~ '(engine air|air cleaner|هوای موتور|فیلتر هوا)' then 'فیلتر و مصرفی - فیلتر هوای موتور'
 when lower(coalesce(name,'') || ' ' || coalesce(description,'')) ~ '(water spray|water filter|فیلتر آب)' then 'فیلتر و مصرفی - فیلتر آب و سیستم پاشش'
 else 'فیلتر و مصرفی - سایر فیلترها'
end,
updated_at=now()
where technical_group in ('FILTER / SCREEN','FILTER / COMPONENT');