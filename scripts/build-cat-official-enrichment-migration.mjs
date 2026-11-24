import { readFile, readdir, writeFile } from "node:fs/promises";
import path from "node:path";

const data = JSON.parse(await readFile("artifacts/cat-official-enrichment.json", "utf8"));
const rows = (data.records ?? []).filter(r => r.status === "OK" && (r.description || r.name || r.compatible_models?.length || Object.keys(r.specifications ?? {}).length || r.image_url));
if (rows.length < 250) throw new Error("Insufficient official Cat detail records to build migration: " + rows.length);
const q = value => "'" + String(value ?? "").replace(/'/g, "''") + "'";
const arr = values => "ARRAY[" + (values ?? []).map(q).join(",") + "]::text[]";
const sqlRows = rows.map(r => {
  const name = r.name || r.part_number;
  const desc = r.description || null;
  const models = [...new Set((r.compatible_models ?? []).filter(Boolean))];
  const specs = r.specifications ?? {};
  const image = r.image_url || null;
  return `(${q(r.part_number)},${q(name)},${desc === null ? "NULL" : q(desc)},${arr(models)},${arr(models)},${q(JSON.stringify(specs))}::jsonb,${image === null ? "NULL" : q(image)})`;
});
const sql = `-- Enrich existing official Cat part references from their public Cat Parts Store product pages.
-- No prices, inventory, serial-number fitment, or OEM_VERIFIED status are inferred.
with captured(part_number,name,description,engine_models,compatible_models,specifications,image_url) as (
  values
  ${sqlRows.join(",\n  ")}
)
update public.part_catalog as p
set
  name = case when c.name <> '' then c.name else p.name end,
  description = coalesce(nullif(c.description,''), p.description),
  engine_models = case when cardinality(c.engine_models)>0 then c.engine_models else p.engine_models end,
  compatible_models = case when cardinality(c.compatible_models)>0 then c.compatible_models else p.compatible_models end,
  specifications = coalesce(p.specifications,'{}'::jsonb) || c.specifications,
  image_url = coalesce(p.image_url, c.image_url),
  updated_at = now()
from captured c
where p.part_number = c.part_number
  and p.source_name = 'Cat Parts Store (official)';

-- Keep every captured item as REFERENCE: Cat itself requires equipment selection for fitment confirmation.
`;
const files = (await readdir("supabase/migrations")).filter(f => f.endsWith("_cat_official_product_detail_enrichment.sql"));
if (files.length !== 1) throw new Error("Expected exactly one generated Cat enrichment migration, found: " + files.length);
await writeFile(path.join("supabase/migrations", files[0]), sql, "utf8");
console.log(JSON.stringify({ migration: files[0], rows: rows.length, descriptions: rows.filter(r=>r.description).length, models: rows.filter(r=>r.compatible_models?.length).length, specs: rows.filter(r=>Object.keys(r.specifications??{}).length).length, images: rows.filter(r=>r.image_url).length }, null, 2));
