-- Normalize all filter families as children of the Filters category.
-- Source counts are derived from active Caterpillar part references already stored in Amoot.
WITH mapped AS (
 SELECT CASE
  WHEN technical_group ILIKE '%aftertreatment%' OR technical_group ILIKE '%diesel particulate%' OR technical_group ILIKE '%dpf%' THEN 'filters-aftertreatment'
  WHEN technical_group ILIKE '%cabin%' OR technical_group ILIKE '%cab air%' OR technical_group ILIKE '%air conditioning%' THEN 'filters-cabin-ventilation'
  WHEN technical_group ILIKE '%water separator%' OR technical_group ILIKE '%fuel filter%' OR technical_group ILIKE '%fuel_filter%' OR technical_group ILIKE '%fuel filters%' OR technical_group ILIKE '%fuel screen%' OR technical_group ILIKE '%فیلتر سوخت%' OR technical_group ILIKE '%جداکننده آب%' THEN 'filters-fuel-water'
  WHEN technical_group ILIKE '%hydraulic%' OR technical_group ILIKE '%transmission%' OR technical_group ILIKE '%هیدرولیک%' OR technical_group ILIKE '%گیربکس%' THEN 'filters-hydraulic-transmission'
  WHEN technical_group ILIKE '%air filter%' OR technical_group ILIKE '%engine air%' OR technical_group ILIKE '%pre-cleaner%' OR technical_group ILIKE '%precleaner%' OR technical_group ILIKE '%breather%' OR technical_group ILIKE '%فیلتر هوای موتور%' OR technical_group ILIKE '%فیلتر هوا%' THEN 'filters-air'
  WHEN technical_group ILIKE '%cooling system water%' OR technical_group ILIKE '%water spray%' OR technical_group ILIKE '%فیلتر آب%' OR technical_group ILIKE '%water pump filter%' THEN 'filters-cooling-water'
  WHEN technical_group ILIKE '%oil filter%' OR technical_group ILIKE '%engine_oil_filter%' OR technical_group ILIKE '%lube%' OR technical_group ILIKE '%روغن%' THEN 'filters-engine-oil'
  ELSE 'filters-components-other'
 END AS category_key
 FROM public.part_catalog
 WHERE is_active AND (
  technical_group ILIKE '%filter%' OR technical_group ILIKE '%فیلتر%' OR
  technical_group ILIKE '%separator%' OR technical_group ILIKE '%strainer%' OR
  technical_group ILIKE '%breather%'
 )
), counts AS (
 SELECT category_key, count(*)::integer AS source_count FROM mapped GROUP BY category_key
), labels(category_key,name,sort_order) AS (
 VALUES
 ('filters-engine-oil','فیلتر روغن موتور و روانکاری',1),
 ('filters-fuel-water','فیلتر سوخت و جداکننده آب',2),
 ('filters-air','فیلتر هوای موتور و تنفسی',3),
 ('filters-hydraulic-transmission','فیلتر هیدرولیک و انتقال قدرت',4),
 ('filters-cabin-ventilation','فیلتر کابین و تهویه',5),
 ('filters-aftertreatment','فیلتر DPF و پس‌پالایش',6),
 ('filters-cooling-water','فیلتر آب و خنک‌کاری',7),
 ('filters-components-other','قطعات مجموعه فیلتر و سایر فیلترها',8)
)
INSERT INTO public.cat_part_categories
 (category_key,name,parent_key,source_url,source_count,is_active,source_name,captured_at,updated_at)
SELECT l.category_key,l.name,'filters-and-fluids-filters',
 'https://parts.cat.com/en/catcorp/category/filters-and-fluids-filters',
 coalesce(c.source_count,0),true,'Amoot storefront taxonomy mapped from Cat Parts Store',now(),now()
FROM labels l LEFT JOIN counts c USING(category_key)
ON CONFLICT(category_key) DO UPDATE SET
 name=excluded.name,parent_key=excluded.parent_key,source_count=excluded.source_count,
 source_url=excluded.source_url,is_active=true,source_name=excluded.source_name,updated_at=now();
