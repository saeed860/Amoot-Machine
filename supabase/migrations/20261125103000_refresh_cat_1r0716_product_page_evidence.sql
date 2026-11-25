-- Refresh 1R-0716 with its exact Cat Parts Store product page and compatible-model evidence.
update public.part_catalog
set
  name='فیلتر روغن موتور استاندارد Cat 1R-0716',
  description='Cat Standard Efficiency Engine Lube Oil Filter; spin-on; diameter 5.346 in; length 12.177 in; flow Out-to-In. Cat compatible-model list explicitly includes Marine Engine classes (including 3516, 3196, C12/C18, 3406B/C/E, 3408B/C, C32/C32B and others) and non-marine machine/engine classes. CAT publication separately lists 1R-1808 as the approved upgrade option for 1R-0716.',
  engine_models=ARRAY['3516','3196','C12','C-12','C18','3408B','3408C','3406B','3406C','3406E','3306B','C32B','C32','3176C','3176B','C30','3412C','3304','3412E','3306','3412D','3304B','C15','C-15','C16','C-16','C9','C-9'],
  technical_group='فیلتر و مصرفی - فیلتر روغن موتور',
  source_name='Cat Parts Store (official); Caterpillar technical publications; Off Road Equipment public popular-parts index',
  source_url='https://parts.cat.com/in/catcorp/product/1R-0716',
  source_note='Exact Cat Parts Store product page identifies Brand: Cat, 1R-0716 Engine Lube Oil Filter, Standard Efficiency, spin-on, 5.346 in diameter, 12.177 in length, Out-to-In flow. Its Compatible Models list explicitly includes a Marine Engine group (3516, 3196, C-12, C18, C12, 3408B/C, 3406B/C/E, 3306B, C32B, 3176C/B, C30, C32, C32 MARINE, 3412C, 3304, 3412E/D and others) and non-marine equipment classes. Caterpillar publication https://s7d2.scene7.com/is/content/Caterpillar/CM20150415-45165-44935 states 1R-1808 is the approved upgrade option for equipment using 1R-0716. Model-class evidence only; verify full serial number and Arrangement before fitment.',
  verification_status='REFERENCE',
  application_type='BOTH',
  application_evidence='Exact Cat Parts Store Compatible Models lists Marine Engine and multiple non-marine machine/engine groups.',
  application_source_url='https://parts.cat.com/in/catcorp/product/1R-0716',
  compatible_models=ARRAY['3516','3196','C12','C-12','C18','3408B','3408C','3406B','3406C','3406E','3306B','C32B','C32','3176C','3176B','C30','3412C','3304','3412E','3306','3412D','3304B','C15','C-15','C16','C-16','C9','C-9'],
  source_accessed_at=now(),
  updated_at=now()
where part_number='1R-0716';
