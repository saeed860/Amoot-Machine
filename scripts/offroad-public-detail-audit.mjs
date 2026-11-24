import { readFile, mkdir, writeFile } from "node:fs/promises";
import { chromium } from "playwright";

const source = await readFile(new URL("../offroad-catalog.js", import.meta.url), "utf8");
const block = source.match(/const offRoadCatalogText = `([\s\S]*?)`;/)?.[1];
if (!block) throw new Error("Off Road public index seed not found");
const parts = [...new Set(block.trim().split(/\r?\n/).map(line => line.split("|")[0].trim()).filter(Boolean))];
if (parts.length < 450 || parts.length > 550) throw new Error(`Unexpected public index size: ${parts.length}`);

const browser = await chromium.launch({ headless: true });
const results = new Array(parts.length);
let cursor = 0;
async function worker(workerId) {
  const page = await browser.newPage({ viewport: { width: 1365, height: 1000 } });
  page.setDefaultNavigationTimeout(35000);
  while (true) {
    const i = cursor++;
    if (i >= parts.length) break;
    const sku = parts[i];
    const url = `https://offroadeq.com/parts/${sku.replace(/[^A-Za-z0-9]/g, "")}`;
    let row = { sku, url, status: "ERROR", title: "", text: "", oemListPriceUsd: null, supplierPriceVisible: false, inventory: [], error: null };
    try {
      const response = await page.goto(url, { waitUntil: "domcontentloaded", timeout: 35000 });
      row.httpStatus = response?.status() ?? null;
      await page.waitForTimeout(900);
      row.title = await page.title();
      row.text = (await page.locator("body").innerText({ timeout: 10000 })).replace(/\s+/g, " ").trim().slice(0, 12000);
      const priceMatch = row.text.match(/OEM\s+List\s+Price\s*(?:USD|\$)?\s*\$?\s*([\d,]+\.\d{2})/i)
        || row.text.match(/OEM\s+List\s+Price[^\d]{0,40}([\d,]+\.\d{2})/i);
      if (priceMatch) row.oemListPriceUsd = Number(priceMatch[1].replace(/,/g, ""));
      row.supplierPriceVisible = !/login\s+to\s+view/i.test(row.text) && /unit\s+price|our\s+price|your\s+price/i.test(row.text);
      const inventoryPattern = /(\d[\d,]*)\s+(New Genuine Surplus|New Aftermarket|Reman(?:ufactured)?|Used|Call For Pricing)/gi;
      for (const m of row.text.matchAll(inventoryPattern)) row.inventory.push({ quantity: Number(m[1].replace(/,/g, "")), condition: m[2] });
      row.status = row.httpStatus === 200 && row.oemListPriceUsd !== null ? "PRICE_FOUND" : row.httpStatus === 200 ? "PAGE_OK_NO_PRICE" : "HTTP_ERROR";
      if (/not found|no part found|page not found/i.test(row.text)) row.status = "NOT_FOUND";
    } catch (e) { row.error = e.message; }
    results[i] = row;
    if ((i + 1) % 25 === 0) console.log(`progress ${i + 1}/${parts.length}`);
  }
  await page.close();
}
try {
  await Promise.all(Array.from({ length: 5 }, (_, i) => worker(i)));
} finally { await browser.close(); }
await mkdir("artifacts", { recursive: true });
const summary = {
  generatedAt: new Date().toISOString(),
  source: "Off Road Equipment public part detail pages",
  totalPublicIndexParts: parts.length,
  priceFound: results.filter(x => x.status === "PRICE_FOUND").length,
  pageOkNoPrice: results.filter(x => x.status === "PAGE_OK_NO_PRICE").length,
  notFound: results.filter(x => x.status === "NOT_FOUND").length,
  errors: results.filter(x => ["ERROR", "HTTP_ERROR"].includes(x.status)).length,
  supplierPriceVisible: results.filter(x => x.supplierPriceVisible).length,
  records: results
};
await writeFile("artifacts/offroad-500-detail-audit.json", JSON.stringify(summary, null, 2));
console.log(JSON.stringify({ generatedAt: summary.generatedAt, total: summary.totalPublicIndexParts, priceFound: summary.priceFound, pageOkNoPrice: summary.pageOkNoPrice, notFound: summary.notFound, errors: summary.errors, supplierPriceVisible: summary.supplierPriceVisible }, null, 2));
if (summary.errors > Math.ceil(parts.length * 0.15)) throw new Error("Too many failed detail pages; review artifact before import");
