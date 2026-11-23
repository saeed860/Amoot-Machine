import { readFile } from "node:fs/promises";

const config = await readFile(new URL("../api-config.js", import.meta.url), "utf8");
const extract = (name) => config.split(name)[1]?.match(/['"]([^'"]+)['"]/)?.[1];
const base = extract("AMOOT_API_BASE_URL");
const key = extract("AMOOT_SUPABASE_ANON_KEY");
if (!base || !key) throw new Error("Public API configuration is missing");

const tests = [
  { q: "392-0217", sku: "392-0217", kind: "PART_REFERENCE" },
  { q: "3920217", sku: "392-0217", kind: "PART_REFERENCE" },
  { q: "3512CB", kind: "PART_REFERENCE", any: true },
  { q: "CAT-1L-9049", sku: "CAT-1L-9049", kind: "PRODUCT", category: "قطعات موتور" },
  { q: "CAT-0S-1571", sku: "CAT-0S-1571", kind: "PRODUCT", category: "قطعات موتور" },
  { q: "CAT-202-2785", sku: "CAT-202-2785", kind: "PRODUCT", category: "قطعات برقی" },
  { q: "CAT-7N-7807", sku: "CAT-7N-7807", kind: "PRODUCT", category: "قطعات برقی" },
  { q: "CAT-199-8436", sku: "CAT-199-8436", kind: "PRODUCT", category: "قطعات برقی" },
  { q: "CAT-4N-1114", sku: "CAT-4N-1114", kind: "PRODUCT", category: "قطعات برقی" },
  { q: "CAT-8T-6765", sku: "CAT-8T-6765", kind: "PRODUCT", category: "قطعات موتور" },
  { q: "3349111411", sku: "3349111411", kind: "PRODUCT", category: "قطعات هیدرولیک" },
  { q: "D1VW001CNJW", sku: "D1VW001CNJW", kind: "PRODUCT", category: "قطعات هیدرولیک" },
  { q: "CDQ2B32-25DZ", sku: "CDQ2B32-25DZ", kind: "PRODUCT", category: "قطعات پنوماتیک" },
  { q: "SY5120-5LZ-01N", sku: "SY5120-5LZ-01N", kind: "PRODUCT", category: "قطعات پنوماتیک" },
  { q: "AC30A-03-D", sku: "AC30A-03-D", kind: "PRODUCT", category: "قطعات پنوماتیک" },
  { q: "CAT-20R-2510", sku: "CAT-20R-2510", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-20R-5367", sku: "CAT-20R-5367", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-30R-0084", sku: "CAT-30R-0084", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-10R-9954", sku: "CAT-10R-9954", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-5N-4504", sku: "CAT-5N-4504", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-7W-0009", sku: "CAT-7W-0009", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-9X-3406", sku: "CAT-9X-3406", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات برقی" },
  { q: "CAT-260-3406", sku: "CAT-260-3406", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  ...["3512","3516","C15","C18","C9","3406","3408"].map(q => ({ q, kind: "PRODUCT", any: true, modelQuery: true })),
  { q: "CAT-20R-4278", sku: "CAT-20R-4278", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-10R-9063", sku: "CAT-10R-9063", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-20R-0043", sku: "CAT-20R-0043", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-20R-3958", sku: "CAT-20R-3958", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-0R-8200", sku: "CAT-0R-8200", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "CAT-593-5344", sku: "CAT-593-5344", kind: "PRODUCT", imageRequired: true, sourceRequired: true, category: "قطعات موتور" },
  { q: "20R-2510", sku: "CAT-20R-2510", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "20R-5367", sku: "CAT-20R-5367", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "30R-0084", sku: "CAT-30R-0084", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "10R-9954", sku: "CAT-10R-9954", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "5N-4504", sku: "CAT-5N-4504", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "7W-0009", sku: "CAT-7W-0009", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "9X-3406", sku: "CAT-9X-3406", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "260-3406", sku: "CAT-260-3406", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "20R-4278", sku: "CAT-20R-4278", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "10R-9063", sku: "CAT-10R-9063", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "20R-0043", sku: "CAT-20R-0043", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "20R-3958", sku: "CAT-20R-3958", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "0R-8200", sku: "CAT-0R-8200", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  { q: "593-5344", sku: "CAT-593-5344", kind: "PRODUCT", imageRequired: true, sourceRequired: true },
  ...["321-8076","7T-3205","221-8307","1R-0716","320-6690","HPU-042","HCV-315","HPP-220","PNC-032","FRL-01","SV-24V"].map(q => ({q, absent:true})),
  { q: "CAT-1L-9049", sku: "CAT-1L-9049", kind: "PRODUCT", filterCategory: "قطعات موتور" },
  { q: "CAT-202-2785", sku: "CAT-202-2785", kind: "PRODUCT", filterCategory: "قطعات برقی" },
];
let failed = false;
for (const test of tests) {
  const url = new URL(base + "/api/products");
  url.searchParams.set("q", test.q);
  if (test.filterCategory) url.searchParams.set("category", test.filterCategory);
  const response = await fetch(url, { headers: { apikey: key } });
  const body = await response.json().catch(() => ({}));
  const items = Array.isArray(body.items) ? body.items : [];
  const normSku = v => String(v || "").replace(/[^A-Z0-9]/gi, "").toUpperCase();
  const found = items.find(x => normSku(x.sku) === normSku(test.sku) && x.kind === test.kind && (!test.filterCategory || x.category === test.filterCategory));
  const exists = items.some(x => normSku(x.sku) === normSku(test.q) && x.kind === "PRODUCT");
  const modelMatched = !test.modelQuery || items.some(x => x.kind === "PRODUCT" && (normSku(x.machineModel).includes(normSku(test.q)) || normSku(x.description).includes(normSku(test.q))));
  const ok = response.ok && (test.absent ? !exists : (test.any ? items.some(x => x.kind === test.kind) : Boolean(found))) && modelMatched && (!test.category || found?.category === test.category) && (!test.imageRequired || Boolean(found?.imageUrl)) && (!test.sourceRequired || String(found?.description || "").includes("parts.cat.com"));
  failed ||= !ok;
  process.stdout.write(JSON.stringify({
    query: test.q, http: response.status, kind: test.kind || "ABSENT",
    found: Boolean(found) || Boolean(test.any && items.some(x => x.kind === test.kind)), absent: test.absent ? !exists : undefined,
    category: found?.category || null,
    image: found?.imageUrl ? "present" : "missing",
    priceIrr: found?.priceIrr ?? null, stock: found?.stock ?? null,
    pass: ok, apiError: body.error?.code || null
  }) + "\n");
}
if (failed) process.exit(1);
