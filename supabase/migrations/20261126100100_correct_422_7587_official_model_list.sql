-- Keep the 422-7587 reference aligned with the current official Cat Parts Store model list.
-- This is public catalog evidence, not a serial-specific fitment approval.
update public.part_catalog
set engine_models = array[
  'C32','C32B','C32 MARINE','C27','3512','3512B','3512C','3516C',
  'AD63','789G','777G','D10T2','D11T','6040','990K'
]::text[],
compatible_models = array[
  'AD63','SR500','SR4B','DE1400','C175-20','C175-16','DE1250','C175-16GENSET',
  'C27','C32','D1500','C32B','DE1500','DE1250S','C32 MARINE','C32 INDUSTRIAL',
  'C32B INDUSTRIAL','C27 INDUSTRIAL','3512B','3512','3512C','3516C',
  '844','854','854K','844K','789G','777G','777','775','789D','773','793F',
  '798 AC','796 AC','785D','794 AC','789','785','793','798','24','RC20',
  '990K','990','993','992','993K','992K','6040 FS','6030 T4','6020B','6030 T2',
  '6015B','6020','6015','D10T2','D10','D11','D10N','D10R','D10T','D11R','D11T',
  'MD6250','MD6310','C32B MARINE','TH48-E70','CX35-P800'
]::text[],
verification_status = 'REFERENCE',
application_type = 'UNVERIFIED',
application_evidence = 'Cat Parts Store official public listing: Secondary Fuel Filter, Ultra High Efficiency. Compatible model listing includes Engine 3512B, Petroleum Engine 3512 and 3512C/3516C, plus C32/C32B/C27 and equipment models. Exact serial/arrangement compatibility still requires Cat SIS/dealer verification.',
source_name = 'Cat Parts Store (official)',
source_url = 'https://parts.cat.com/en/catcorp/product/422-7587',
application_source_url = 'https://parts.cat.com/en/catcorp/product/422-7587',
source_accessed_at = now(),
updated_at = now()
where part_number = '422-7587';
