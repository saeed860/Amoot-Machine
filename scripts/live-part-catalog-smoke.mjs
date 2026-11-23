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
];
let failed = false;
for (const test of tests) {
  const url = new URL(base + "/api/products");
  url.searchParams.set("q", test.q);
  const response = await fetch(url, { headers: { apikey: key } });
  const body = await response.json().catch(() => ({}));
  const items = Array.isArray(body.items) ? body.items : [];
  const found = items.find(x => String(x.sku || "").replace(/[^A-Z0-9]/gi, "").toUpperCase() === String(test.sku || "").replace(/[^A-Z0-9]/gi, "").toUpperCase() && x.kind === test.kind);
  const ok = response.ok && (test.any ? items.some(x => x.kind === test.kind) : Boolean(found)) && (!test.category || found?.category === test.category);
  failed ||= !ok;
  process.stdout.write(JSON.stringify({
    query: test.q, http: response.status, kind: test.kind,
    found: Boolean(found) || Boolean(test.any && items.some(x => x.kind === test.kind)),
    category: found?.category || null,
    image: found?.imageUrl ? "present" : "missing",
    priceIrr: found?.priceIrr ?? null, stock: found?.stock ?? null,
    pass: ok, apiError: body.error?.code || null
  }) + "\n");
}
if (failed) process.exit(1);
