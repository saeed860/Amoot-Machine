import { readFile, mkdir, writeFile, rename } from "node:fs/promises";
import { chromium } from "playwright";

const allPartNumbers = (await readFile("data/cat-official-part-numbers.txt", "utf8"))
  .split(/\r?\n/).map(x => x.trim()).filter(Boolean);
if (!allPartNumbers.length || new Set(allPartNumbers).size !== allPartNumbers.length) {
  throw new Error(`Expected a non-empty unique official Cat part-number list; found ${allPartNumbers.length} rows and ${new Set(allPartNumbers).size} unique`);
}
const batchStart = Math.max(0, Number.parseInt(process.env.CAT_BATCH_START || "0", 10) || 0);
const batchSize = Math.max(1, Math.min(150, Number.parseInt(process.env.CAT_BATCH_SIZE || "100", 10) || 100));
const partNumbers = allPartNumbers.slice(batchStart, batchStart + batchSize);
if (!partNumbers.length) throw new Error(`Empty Cat batch at offset ${batchStart}`);
const checkpointPath = `artifacts/cat-official-enrichment-checkpoint-${batchStart}.json`;
await mkdir("artifacts", { recursive: true });
let checkpoint = [];
try { checkpoint = JSON.parse(await readFile(checkpointPath, "utf8")); } catch {}
const results = new Array(partNumbers.length);
for (const row of checkpoint) {
  const index = partNumbers.indexOf(row?.sku);
  if (index >= 0 && row.status !== "ERROR" && row.status !== "HTTP_ERROR") results[index] = row;
}
const completedFromCheckpoint = results.filter(Boolean).length;
console.log(`Cat batch ${batchStart + 1}-${batchStart + partNumbers.length}/${allPartNumbers.length}; resuming ${completedFromCheckpoint}/${partNumbers.length}`);
const browser = await chromium.launch({ headless: true });
let cursor = 0;
let consecutiveNavigationFailures = 0;
let abortBatch = false;
let saved = 0;
let saveChain = Promise.resolve();
async function saveCheckpoint() {
  const snapshot = results.filter(Boolean);
  const tmp = checkpointPath + ".tmp";
  await writeFile(tmp, JSON.stringify(snapshot));
  await rename(tmp, checkpointPath);
  saved = snapshot.length;
}

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
  const imageMatch = html.match(/https?:\\?\/\\?\/(?:caterpillar|s\\d+d\\d*)\\.scene7\\.com\\?\/is\\?\/image\\?\/Caterpillar\\?\/[^"'\\s<>]+/i)
    || html.match(/https?:\/\/(?:caterpillar|s\d+d\d*)\.scene7\.com\/is\/image\/Caterpillar\/[^"'\s<>]+/i);
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
  page.setDefaultNavigationTimeout(45000);
  while (true) {
    const i = cursor++;
    if (i >= partNumbers.length || abortBatch) break;
    if (results[i]) continue;
    const sku = partNumbers[i];
    const url = "https://parts.cat.com/en/catcorp/product/" + encodeURIComponent(sku);
    let row = { sku, url, status: "ERROR", title: "", description: "", specifications: {}, compatibleModels: [], engineModels: [], imageUrl: null, error: null };
    console.log(`[START] ${i + 1}/${partNumbers.length} ${sku}`);
    try {
      // Do not wait for DOMContentLoaded: Cat's storefront can keep long-running
      // requests open and previously caused every page navigation to time out.
      let response = null;
      let lastError = null;
      for (let attempt = 1; attempt <= 3; attempt++) {
        try {
          console.log(`[NAV] ${sku} attempt ${attempt}/3`);
          response = await page.goto(url, { waitUntil: "commit", timeout: 45000 });
          if (response && response.status() >= 500 && attempt < 3) {
            await page.waitForTimeout(1500 * attempt);
            continue;
          }
          break;
        } catch (e) {
          lastError = e;
          if (attempt < 3) await page.waitForTimeout(2500 * attempt);
        }
      }
      if (!response && lastError) throw lastError;
      consecutiveNavigationFailures = 0;
      row.httpStatus = response?.status() ?? null;
      await page.locator("body").waitFor({ state: "attached", timeout: 10000 });
      // Allow the client-rendered product metadata to hydrate after the initial response.
      await page.waitForTimeout(1800);
      row.title = await page.title();
      const body = await page.locator("body").innerText({ timeout: 10000 });
      const html = await page.content();
      if (i < 3) row.sample = body.slice(0, 2500);
      if (/not found|page not found|no product found/i.test(body) && !body.includes(sku)) row.status = "NOT_FOUND";
      else {
        const parsed = extract(body, html, sku, row.title);
        Object.assign(row, parsed);
        row.status = row.httpStatus === 200 ? "PAGE_OK" : "HTTP_ERROR";
      }
    } catch (e) {
      row.error = e.message;
      if (/page\.goto: Timeout|net::ERR_|ERR_CONNECTION|ERR_TUNNEL|ERR_NAME_NOT_RESOLVED/i.test(row.error)) {
        consecutiveNavigationFailures++;
        if (consecutiveNavigationFailures >= 3) {
          abortBatch = true;
          console.error(`[CIRCUIT BREAKER] ${consecutiveNavigationFailures} consecutive navigation/network failures; stopping batch to avoid 100 identical failures.`);
        }
      }
    }
    results[i] = row;
    saveChain = saveChain.then(saveCheckpoint);
    await saveChain;
    console.log(`[DONE] ${i + 1}/${partNumbers.length} ${sku} status=${row.status} http=${row.httpStatus ?? "n/a"} description=${Boolean(row.description)} specs=${Object.keys(row.specifications).length} models=${row.compatibleModels.length} image=${Boolean(row.imageUrl)} error=${row.error ?? "none"}`);
  }
  await page.close();
}
try { await Promise.all(Array.from({ length: 1 }, () => worker())); }
finally { await browser.close(); }

const enriched = results.filter(r => r.status === "PAGE_OK" && (r.description || Object.keys(r.specifications).length || r.compatibleModels.length || r.imageUrl || r.name));
const statements = enriched.map(updateSql).filter(Boolean);
await mkdir("artifacts", { recursive: true });
const diagnostics = {
  generatedAt: new Date().toISOString(),
  requested: partNumbers.length,
  batchStart, batchSize, totalOfficial: allPartNumbers.length,
  resumed: completedFromCheckpoint,
  checkpointed: results.filter(Boolean).length,
  pageOk: results.filter(x => x.status === "PAGE_OK").length,
  notFound: results.filter(x => x.status === "NOT_FOUND").length,
  errors: results.filter(x => x.status === "ERROR" || x.status === "HTTP_ERROR").length,
  enriched: enriched.length,
  samples: results.slice(0, 8)
};
await writeFile("artifacts/cat-official-enrichment.json", JSON.stringify(diagnostics, null, 2));
console.log("Cat extraction diagnostics", JSON.stringify(diagnostics, null, 2));
if (abortBatch || results.some(x => !x)) throw new Error(`Cat batch stopped incomplete after network failures; no partial SQL migration will be generated. Completed ${results.filter(Boolean).length}/${partNumbers.length}.`);
if (enriched.length < 1) throw new Error(`No official Cat pages yielded metadata in batch: ${batchStart}-${batchStart + partNumbers.length - 1}`);
const stamp = new Date().toISOString().replace(/[-:TZ.]/g, "").slice(0,14);
const migrationPath = `supabase/migrations/${stamp}_enrich_cat_official_page_metadata_batch_${batchStart}.sql`;
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
  batchStart, batchSize, totalOfficial: allPartNumbers.length,
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
