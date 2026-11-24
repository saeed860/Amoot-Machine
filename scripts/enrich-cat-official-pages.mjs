import { readFile, mkdir, writeFile } from "node:fs/promises";
import { chromium } from "playwright";

const partNumbers = (await readFile("data/cat-official-part-numbers.txt", "utf8"))
  .split(/\r?\n/).map(x => x.trim()).filter(Boolean);
if (partNumbers.length !== 787 || new Set(partNumbers).size !== partNumbers.length) {
  throw new Error(`Expected 787 unique official Cat part numbers; found ${partNumbers.length}`);
}
const browser = await chromium.launch({ headless: true });
const results = new Array(partNumbers.length);
let cursor = 0;

const clean = value => String(value ?? "").replace(/\u00a0/g, " ").replace(/\s+/g, " ").trim();
const sql = value => "'" + String(value ?? "").replace(/'/g, "''") + "'";
const keyOf = value => clean(value).toLowerCase().replace(/[^a-z0-9]+/g, "_").replace(/^_|_$/g, "");
const engineLike = value => /^(?:C\d{1,2}[A-Z0-9]*|G\d{4}[A-Z0-9]*|(?:32|33|34|35|36)\d{2}[A-Z0-9]*|D\d{3}[A-Z0-9]*|SR\d+[A-Z0-9]*|XQC\d+|PP\d+|PM\d+|CG\d+|TH\d+-E\d+|SP[A-Z0-9]+)$/i.test(value);

function extract(pageText, html, sku, title) {
  const text = String(pageText || "").replace(/\r/g, "");
  const descStart = text.search(/Description for part number\s+/i);
  let description = "";
  if (descStart >= 0) {
    const sub = text.slice(descStart);
    const m = sub.match(/Description:\s*([\s\S]*?)(?=\n\s*Attributes:|\n\s*Specifications for part number|\n\s*Compatible Models for part number|\n\s*Find Parts)/i);
    if (m) description = clean(m[1].split("\n").map(x => x.replace(/^\s*[•*·-]\s*/, "")).filter(Boolean).join(" "));
  }
  const specStart = text.search(/Specifications for part number\s+/i);
  let specifications = {};
  if (specStart >= 0) {
    const sub = text.slice(specStart);
    const end = sub.search(/Compatible Models for part number|Find Parts|Support\n/i);
    const section = end >= 0 ? sub.slice(0, end) : sub.slice(0, 5000);
    for (const m of section.matchAll(/^\s*([A-Za-z][A-Za-z0-9 /-]{1,55}?)\s*\(([^)]+)\)\s*:\s*([^\n]+)\s*$/gm)) {
      const key = keyOf(m[1]);
      const unit = clean(m[2]);
      const raw = clean(m[3]);
      if (!key || !raw) continue;
      const numeric = raw.match(/^(-?\d+(?:\.\d+)?)$/);
      specifications[key] = { value: numeric ? Number(numeric[1]) : raw, unit };
    }
  }
  const compatibleStart = text.search(/Compatible Models for part number\s+/i);
  let compatibleModels = [];
  if (compatibleStart >= 0) {
    const sub = text.slice(compatibleStart);
    const end = sub.search(/\n\s*Find Parts|\n\s*Support\n/i);
    const section = end >= 0 ? sub.slice(0, end) : sub.slice(0, 14000);
    const candidates = section.match(/\b[A-Z0-9][A-Z0-9-]{1,15}\b/g) || [];
    const partKey = sku.toUpperCase().replace(/[^A-Z0-9]/g, "");
    compatibleModels = [...new Set(candidates.map(x => x.toUpperCase()).filter(x =>
      /[0-9]/.test(x) && x.replace(/[^A-Z0-9]/g, "") !== partKey &&
      !/^(?:US|CAT|VIEW|MORE|PART|FIND|SIS|GEN|SET|KIT)$/.test(x)
    ))].slice(0, 250);
  }
  const engineModels = compatibleModels.filter(engineLike);
  const imageMatch = html.match(/https?:\\?\/\\?\/caterpillar\\.scene7\\.com\\?\/is\\?\/image\\?\/Caterpillar\\?\/[^"'\\s<>]+/i)
    || html.match(/https?:\/\/caterpillar\.scene7\.com\/is\/image\/Caterpillar\/[^"'\s<>]+/i);
  const imageUrl = imageMatch ? imageMatch[0].replace(/\\u0026|&amp;/g, "&").replace(/\\\//g, "/") : null;
  let name = "";
  const titleMatch = String(title || "").match(/^\s*([A-Z0-9-]+):\s*(.*?)\s*(?:\||$)/i);
  if (titleMatch && titleMatch[1].replace(/[^A-Z0-9]/gi, "") === sku.replace(/[^A-Z0-9]/gi, "")) name = clean(titleMatch[2]);
  return { description, specifications, compatibleModels, engineModels, imageUrl, name };
}

function updateSql(row) {
  const sets = [];
  if (row.name) sets.push(`name = CASE WHEN length(coalesce(name,'')) < length(${sql(row.name)}) THEN ${sql(row.name)} ELSE name END`);
  if (row.description) sets.push(`description = CASE WHEN length(coalesce(description,'')) < length(${sql(row.description)}) THEN ${sql(row.description)} ELSE description END`);
  if (row.compatibleModels.length) {
    const values = row.compatibleModels.map(sql).join(",");
    sets.push(`compatible_models = ARRAY(SELECT DISTINCT x FROM unnest(coalesce(compatible_models,'{}'::text[]) || ARRAY[${values}]::text[]) AS t(x))`);
  }
  if (row.engineModels.length) {
    const values = row.engineModels.map(sql).join(",");
    sets.push(`engine_models = ARRAY(SELECT DISTINCT x FROM unnest(coalesce(engine_models,'{}'::text[]) || ARRAY[${values}]::text[]) AS t(x))`);
  }
  if (Object.keys(row.specifications).length) sets.push(`specifications = coalesce(specifications,'{}'::jsonb) || ${sql(JSON.stringify(row.specifications))}::jsonb`);
  if (row.imageUrl) sets.push(`image_url = coalesce(image_url,${sql(row.imageUrl)})`);
  if (!sets.length) return "";
  sets.push("source_accessed_at = now()", "updated_at = now()");
  return `UPDATE public.part_catalog SET\n  ${sets.join(",\n  ")}\nWHERE source_name = 'Cat Parts Store (official)' AND part_number = ${sql(row.sku)};\n`;
}

async function worker() {
  const page = await browser.newPage({ viewport: { width: 1365, height: 1000 } });
  page.setDefaultNavigationTimeout(18000);
  while (true) {
    const i = cursor++;
    if (i >= partNumbers.length) break;
    const sku = partNumbers[i];
    const url = "https://parts.cat.com/en/catcorp/product/" + encodeURIComponent(sku);
    let row = { sku, url, status: "ERROR", title: "", description: "", specifications: {}, compatibleModels: [], engineModels: [], imageUrl: null, error: null };
    try {
      let response = await page.goto(url, { waitUntil: "domcontentloaded", timeout: 18000 });
      if (!response || response.status() >= 500) {
        await page.waitForTimeout(500);
        response = await page.goto(url, { waitUntil: "domcontentloaded", timeout: 18000 });
      }
      row.httpStatus = response?.status() ?? null;
      await page.waitForTimeout(350);
      row.title = await page.title();
      const body = await page.locator("body").innerText({ timeout: 10000 });
      const html = await page.content();
      if (/not found|page not found|no product found/i.test(body) && !body.includes(sku)) row.status = "NOT_FOUND";
      else {
        const parsed = extract(body, html, sku, row.title);
        Object.assign(row, parsed);
        row.status = row.httpStatus === 200 ? "PAGE_OK" : "HTTP_ERROR";
      }
    } catch (e) { row.error = e.message; }
    results[i] = row;
    if ((i + 1) % 50 === 0) console.log(`Cat official page progress ${i + 1}/${partNumbers.length}`);
  }
  await page.close();
}
try { await Promise.all(Array.from({ length: 6 }, () => worker())); }
finally { await browser.close(); }

const enriched = results.filter(r => r.status === "PAGE_OK" && (r.description || Object.keys(r.specifications).length || r.compatibleModels.length || r.imageUrl || r.name));
const statements = enriched.map(updateSql).filter(Boolean);
if (enriched.length < 250) throw new Error(`Too few official Cat pages yielded metadata: ${enriched.length}/${partNumbers.length}`);
await mkdir("artifacts", { recursive: true });
const stamp = new Date().toISOString().replace(/[-:TZ.]/g, "").slice(0,14);
const migrationPath = `supabase/migrations/${stamp}_enrich_cat_official_page_metadata.sql`;
const migration = [
  "-- Enrich official Cat Parts Store references with publicly visible descriptions, specs, models and product images.",
  "-- No price or guaranteed fitment is inferred; compatible models are manufacturer page associations.",
  "BEGIN;",
  ...statements,
  "COMMIT;",
  ""
].join("\n");
await writeFile(migrationPath, migration, "utf8");
const summary = {
  generatedAt: new Date().toISOString(),
  source: "Cat Parts Store public product pages",
  requested: partNumbers.length,
  pageOk: results.filter(x => x.status === "PAGE_OK").length,
  notFound: results.filter(x => x.status === "NOT_FOUND").length,
  errors: results.filter(x => x.status === "ERROR" || x.status === "HTTP_ERROR").length,
  withDescription: enriched.filter(x => x.description).length,
  withSpecifications: enriched.filter(x => Object.keys(x.specifications).length).length,
  withCompatibleModels: enriched.filter(x => x.compatibleModels.length).length,
  withEngineModels: enriched.filter(x => x.engineModels.length).length,
  withImage: enriched.filter(x => x.imageUrl).length,
  totalCompatibleModelLinks: enriched.reduce((n,x)=>n+x.compatibleModels.length,0),
  totalSqlUpdates: statements.length,
  migrationPath,
  records: results
};
await writeFile("artifacts/cat-official-enrichment.json", JSON.stringify(summary, null, 2));
console.log(JSON.stringify({ ...summary, records: undefined }, null, 2));
