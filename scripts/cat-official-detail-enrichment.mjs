import { readFile, mkdir, writeFile } from "node:fs/promises";
import { chromium } from "playwright";

const input = JSON.parse(await readFile("scripts/cat-official-enrichment-input.json", "utf8"));
const records = input.records ?? [];
if (records.length < 500 || records.some(x => !x.part_number || !x.source_url?.startsWith("https://parts.cat.com/"))) {
  throw new Error("Invalid official Cat enrichment input");
}
const browser = await chromium.launch({ headless: true });
const output = new Array(records.length);
let cursor = 0;
const clean = s => String(s ?? "").replace(/\s+/g, " ").trim();
const modelTokens = text => [...new Set((text.match(/\b[A-Z][A-Z0-9.-]*\d[A-Z0-9.-]*\b/g) ?? []).map(x => x.toUpperCase()))];
const keyFor = s => clean(s).toLowerCase().replace(/[^a-z0-9]+/g, "_").replace(/^_|_$/g, "").slice(0, 48);

async function worker() {
  const page = await browser.newPage({ viewport: { width: 1440, height: 1100 } });
  page.setDefaultNavigationTimeout(35000);
  while (true) {
    const i = cursor++;
    if (i >= records.length) break;
    const item = records[i];
    const row = { part_number: item.part_number, source_url: item.source_url, status: "ERROR", name: null, description: null, engine_models: [], compatible_models: [], specifications: {}, image_url: null, http_status: null, error: null };
    try {
      const response = await page.goto(item.source_url, { waitUntil: "domcontentloaded", timeout: 35000 });
      row.http_status = response?.status() ?? null;
      await page.waitForTimeout(700);
      const body = await page.locator("body").innerText({ timeout: 10000 });
      const h1 = clean(await page.locator("h1").first().textContent().catch(() => ""));
      if (h1) row.name = clean(h1.replace(new RegExp("^" + item.part_number.replace(/[.*+?^${}()|[\]\\]/g, "\\$&") + ":?\\s*", "i"), ""));
      const descHeading = body.indexOf("Description for part number");
      const specHeading = body.indexOf("Specifications for part number", Math.max(0, descHeading));
      const modelHeading = body.indexOf("Compatible Models for part number", Math.max(0, specHeading));
      if (descHeading >= 0) {
        const end = specHeading > descHeading ? specHeading : body.indexOf("Compare Alternate Parts", descHeading);
        const section = body.slice(descHeading, end > descHeading ? end : descHeading + 5000);
        const match = section.match(/Description:\s*([\s\S]*?)(?=\nAttributes:|\nView More|\nWarning:|$)/i);
        if (match) row.description = clean(match[1]).slice(0, 5000);
      }
      if (specHeading >= 0) {
        const specEnd = modelHeading > specHeading ? modelHeading : body.indexOf("Compare Alternate Parts", specHeading);
        const lines = body.slice(specHeading, specEnd > specHeading ? specEnd : specHeading + 5000).split(/\r?\n/).map(clean).filter(Boolean);
        for (let j = 1; j < lines.length - 1; j++) {
          const label = lines[j];
          const next = lines[j + 1];
          if (!label || !next || /^(USMetric|View More|Specifications|Description:|Attributes:|Warning:)/i.test(label) || /^(View More|Compare Alternate Parts)$/i.test(next)) continue;
          if (label.length > 72 || next.length > 120 || /^(https?:|Sign in|Check Price)$/i.test(next)) continue;
          const m = label.match(/^(.+?)\s*\(([^()]+)\)$/);
          const rawKey = m ? m[1] : label;
          const unit = m ? m[2] : "";
          const key = keyFor(rawKey);
          if (!key || row.specifications[key]) continue;
          if (/^[A-Z][A-Z0-9 .&/-]+$/.test(label) && !m && next.length > 70) continue;
          row.specifications[key] = { value: next, unit };
          j++;
        }
      }
      if (modelHeading >= 0) {
        const end = body.indexOf("Compare Alternate Parts", modelHeading);
        const section = body.slice(modelHeading, end > modelHeading ? end : modelHeading + 9000);
        const models = modelTokens(section);
        row.engine_models = models;
        row.compatible_models = models;
      }
      row.image_url = await page.locator('img[src*="scene7"],img[src*="caterpillar.scene7"]').evaluateAll(xs => {
        const values = xs.map(x => x.currentSrc || x.src).filter(Boolean);
        return values.find(x => /caterpillar\.scene7\.com\/is\/image\/Caterpillar\//i.test(x)) || null;
      }).catch(() => null);
      row.status = row.http_status === 200 ? "OK" : "HTTP_ERROR";
      if (/part not found|page not found/i.test(body.slice(0, 2500))) row.status = "NOT_FOUND";
    } catch (e) { row.error = e.message; }
    output[i] = row;
    if ((i + 1) % 50 === 0) console.log(`progress ${i + 1}/${records.length}`);
  }
  await page.close();
}
try { await Promise.all(Array.from({ length: 6 }, worker)); }
finally { await browser.close(); }
await mkdir("artifacts", { recursive: true });
const result = {
  generated_at: new Date().toISOString(),
  source: "Cat Parts Store official public product pages",
  input_count: records.length,
  successful_pages: output.filter(x => x.status === "OK").length,
  descriptions: output.filter(x => x.description).length,
  compatible_model_sets: output.filter(x => x.compatible_models.length).length,
  specifications: output.filter(x => Object.keys(x.specifications).length).length,
  images: output.filter(x => x.image_url).length,
  errors: output.filter(x => x.status === "ERROR" || x.status === "HTTP_ERROR").length,
  records: output
};
await writeFile("artifacts/cat-official-enrichment.json", JSON.stringify(result, null, 2));
console.log(JSON.stringify({ input: result.input_count, ok: result.successful_pages, descriptions: result.descriptions, models: result.compatible_model_sets, specs: result.specifications, images: result.images, errors: result.errors }, null, 2));
if (result.successful_pages < Math.floor(records.length * 0.65)) throw new Error("Too many official Cat product pages failed; inspect the artifact before importing");
