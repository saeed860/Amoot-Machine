import { readFile } from "node:fs/promises";

const config = await readFile(new URL("../api-config.js", import.meta.url), "utf8");
const extract = (name) => config.split(name)[1]?.match(/['"]([^'"]+)['"]/)?.[1];
const base = extract("AMOOT_API_BASE_URL");
const key = extract("AMOOT_SUPABASE_ANON_KEY");
if (!base || !key) throw new Error("Public API configuration is missing");

// Verify the deployed function against the live Supabase endpoint.\nconst tests = [
  { q: "392-0217", expected: "392-0217" },
  { q: "3920217", expected: "392-0217" },
  { q: "3512CB", expectedAny: true },
];
let failed = false;
for (const test of tests) {
  const url = new URL(base + "/api/products");
  url.searchParams.set("q", test.q);
  const response = await fetch(url, { headers: { apikey: key } });
  const body = await response.json().catch(() => ({}));
  const items = Array.isArray(body.items) ? body.items : [];
  const refs = items.filter(x => x.kind === "PART_REFERENCE");
  const found = test.expected ? refs.some(x => String(x.sku).replace(/[^A-Z0-9]/gi, "").toUpperCase() === test.expected.replace(/[^A-Z0-9]/gi, "").toUpperCase()) : refs.length > 0;
  const hasOemImage = test.q !== "392-0217" || refs.some(x => String(x.sku).replace(/[^A-Z0-9]/gi, "").toUpperCase() === "3920217" && String(x.imageUrl || "").includes("caterpillar.scene7.com"));
  const hasSpecs = test.q !== "392-0217" || refs.some(x => String(x.sku).replace(/[^A-Z0-9]/gi, "").toUpperCase() === "3920217" && Number(x.specifications?.length?.value) === 14.8 && Number(x.specifications?.height?.value) === 3);
  const ok = response.ok && found && hasOemImage && hasSpecs;
  failed ||= !ok;
  process.stdout.write(JSON.stringify({
    query: test.q,
    http: response.status,
    totalItems: items.length,
    partReferences: refs.length,
    samplePartNumbers: refs.slice(0, 5).map(x => x.sku),
    expected: test.expected || "at least one family reference",
    oemImage: hasOemImage,\n    specifications: hasSpecs,\n    pass: ok,
    apiError: body.error?.code || null, debug: body.error?.debug || null
  }) + "\n");
}
if (failed) process.exit(1);
