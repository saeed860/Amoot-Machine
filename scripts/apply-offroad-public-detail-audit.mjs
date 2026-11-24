import { readFile, writeFile } from "node:fs/promises";

const audit = JSON.parse(await readFile("artifacts/offroad-500-detail-audit.json", "utf8"));
const source = await readFile("offroad-catalog.js", "utf8");
const indexBlock = source.match(/const offRoadCatalogText = `([\s\S]*?)`;/)?.[1];
if (!indexBlock) throw new Error("Off Road public index block not found");
const indexRows = indexBlock.trim().split(/\r?\n/).map(line => {
  const [sku, ...desc] = line.split("|");
  return [sku.trim(), desc.join("|").trim()];
}).filter(x => x[0]);
const descriptions = new Map(indexRows.map(([sku, desc]) => [sku.replace(/[^A-Z0-9]/gi, "").toUpperCase(), desc]));

const records = audit.records ?? [];
const valid = records.filter(r => r.status === "PRICE_FOUND" && Number(r.oemListPriceUsd) > 0);
if (records.length !== 500 || valid.length < 400) throw new Error(`Unexpected Off Road audit totals: records=${records.length}, valid=${valid.length}`);
const details = valid.map(r => {
  const sku = String(r.sku).toUpperCase();
  const escaped = sku.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const descMatch = r.text.match(new RegExp("(?:^|\\s)" + escaped + "(?:,|\\s+)(.*?)\\s+Weight Per Unit:", "i"));
  const description = (descMatch?.[1] || descriptions.get(sku.replace(/[^A-Z0-9]/g, "")) || "").trim();
  const weightMatch = r.text.match(/Weight Per Unit:\s*([\d,.]+)\s*lbs/i);
  const weight = weightMatch ? Number(weightMatch[1].replace(/,/g, "")) : null;
  const alternatives = [...r.text.matchAll(/Part Variant:\s*([A-Z0-9-]+)\s*,\s*([^,]+?)(?=\s+Weight Per Unit:)/gi)]
    .map(m => ({ sku: m[1].trim().toUpperCase(), name: m[2].trim() }))
    .filter(x => x.sku && x.sku.replace(/[^A-Z0-9]/g, "") !== sku.replace(/[^A-Z0-9]/g, ""));
  const oem = Number(r.oemListPriceUsd);
  const amoot = Math.round((oem * 1.65 + Number.EPSILON) * 100) / 100;
  return { sku, description, weight, alternatives, oem, amoot, url: r.url };
});
const normalized = new Set();
for (const d of details) {
  const key = d.sku.replace(/[^A-Z0-9]/g, "");
  if (normalized.has(key)) throw new Error("Duplicate Off Road part number: " + d.sku);
  normalized.add(key);
}
const publicDetails = details.map(d => [d.sku, d.description, d.weight, d.amoot, d.alternatives.map(x => [x.sku, x.name])]);
const block = "const offRoadPublicDetails=" + JSON.stringify(publicDetails) + ";\n";
let updated = source;
const existing = /const offRoadPublicDetails=\[[\s\S]*?\];\n/;
if (existing.test(updated)) updated = updated.replace(existing, block);
else {
  const anchor = "const verifiedPartImages={";
  if (!updated.includes(anchor)) throw new Error("Image map insertion point not found");
  updated = updated.replace(anchor, block + anchor);
}
const oldDescription = "const description=name.join('|').trim();";
const newDescription = "const detail=offRoadPublicDetails.find(x=>x[0]===sku.trim().replace(/[^A-Z0-9]/g,''));\n    const description=detail?.[1]||name.join('|').trim();";
if (updated.includes(oldDescription)) updated = updated.replace(oldDescription, newDescription);
else if (!updated.includes(newDescription)) throw new Error("Could not patch Off Road description mapping");
const oldPrice = "priceReference:price?{amootAmount:price[2],amootCurrency:'USD'}:null";
const newPrice = "priceReference:detail?{amootAmount:detail[3],amootCurrency:'USD'}:price?{amootAmount:price[2],amootCurrency:'USD'}:null,\n      weightPerUnitLbs:detail?.[2]??null,alternativePartNumbers:detail?.[4]||[]";
if (updated.includes(oldPrice)) updated = updated.replace(oldPrice, newPrice);
else if (!updated.includes(newPrice)) throw new Error("Could not patch Off Road price mapping");
await writeFile("offroad-catalog.js", updated, "utf8");

let search = await readFile("search.js", "utf8");
const oldLocal = 'offRoadCatalog:true,priceReference:p.priceReference}));';
const newLocal = 'offRoadCatalog:true,priceReference:p.priceReference,alternativePartNumbers:p.alternativePartNumbers||[],specifications:p.weightPerUnitLbs?{weight:{value:p.weightPerUnitLbs,unit:"lb"}}:{}}));';
if (search.includes(oldLocal)) search = search.replace(oldLocal, newLocal);
else if (!search.includes(newLocal)) throw new Error("Could not add Off Road weight/alternative data to search mapping");
const oldLabels = 'const specLabels={length:"طول",height:"ارتفاع",width:"عرض",weight:"وزن",diameter:"قطر",thread:"رزوه",voltage:"ولتاژ",material:"جنس"};';
const newLabels = 'const specLabels={length:"طول",height:"ارتفاع",width:"عرض",weight:"وزن هر واحد",diameter:"قطر",thread:"رزوه",voltage:"ولتاژ",material:"جنس"};';
if (search.includes(oldLabels)) search = search.replace(oldLabels, newLabels);
else if (!search.includes(newLabels)) throw new Error("Specification labels anchor missing");
const oldSpecs = 'const specs=Object.entries(p.specifications||{}).filter(([k,v])=>v&&typeof v==="object"&&v.value!=null).map(([k,v])=>\'<div><small>\'+esc(specLabels[k]||k)+\'</small><b>\'+esc(v.value+" "+(v.unit||""))+\'</b></div>\').join("");';
const newSpecs = 'const specs=Object.entries(p.specifications||{}).filter(([k,v])=>v&&typeof v==="object"&&v.value!=null).map(([k,v])=>\'<div><small>\'+esc(specLabels[k]||k)+\'</small><b>\'+esc(v.value+" "+(v.unit||""))+\'</b></div>\').join("")+(p.alternativePartNumbers?.length?\'<div class="part-alternatives"><small>شماره‌های جایگزین ثبت‌شده در منبع (نیازمند تأیید فنی)</small><b>\'+p.alternativePartNumbers.map(x=>esc(x.sku)).join("، ")+\'</b></div>\':"");';
if (search.includes(oldSpecs)) search = search.replace(oldSpecs, newSpecs);
else if (!search.includes(newSpecs)) throw new Error("Could not add alternative part numbers to result card");
const oldLocalSearch = 'const local=offRoadLocal.filter(p=>queries.some(q=>norm(p.sku)===norm(q)||norm(p.description).includes(norm(q))||norm(p.name).includes(norm(q))));';
const newLocalSearch = 'const local=offRoadLocal.filter(p=>queries.some(q=>norm(p.sku)===norm(q)||p.alternativePartNumbers.some(x=>norm(x.sku)===norm(q))||norm(p.description).includes(norm(q))||norm(p.name).includes(norm(q))));';
if (search.includes(oldLocalSearch)) search = search.replace(oldLocalSearch, newLocalSearch);
else if (!search.includes(newLocalSearch)) throw new Error("Could not add alternative part-number search");
await writeFile("search.js", search, "utf8");

const auditPath = "docs/internal-offroad-price-audit.md";
let auditDoc = await readFile(auditPath, "utf8");
const marker = "## Off Road public detail audit — 2026-11-24";
if (auditDoc.includes(marker)) auditDoc = auditDoc.slice(0, auditDoc.indexOf(marker)).trimEnd();
const zero = records.filter(r => r.status === "PRICE_FOUND" && Number(r.oemListPriceUsd) === 0);
const noPrice = records.filter(r => r.status === "PAGE_OK_NO_PRICE");
const renderErrors = records.filter(r => r.status === "PAGE_RENDER_ERROR");
const notFound = records.filter(r => r.status === "NOT_FOUND");
const lines = [
  "",
  marker,
  "",
  `Public index records reviewed: **${records.length}**; valid positive OEM List Prices: **${valid.length}**; zero/invalid prices: **${zero.length}**; pages without a usable price: **${noPrice.length}**; transient page-render errors: **${renderErrors.length}**; part pages not found: **${notFound.length}**; supplier unit prices visible without login: **${records.filter(r => r.supplierPriceVisible).length}**.`,
  "",
  "For each valid row below, the Amoot reference is the public OEM List Price × 1.65, rounded to two decimals. The source page does not expose the actual supplier unit price; these values are therefore OEM-list-based provisional references, not Off Road acquisition costs. Only the final Amoot amount is used in the public catalog.",
  "",
  "| پارت‌نامبر | شرح Off Road | وزن واحد (lb) | OEM List USD | مرجع آموت USD | شماره‌های جایگزین | صفحه منبع |",
  "|---|---|---:|---:|---:|---|---|",
  ...details.map(d => `| ${d.sku} | ${d.description.replace(/\|/g,"/")} | ${d.weight ?? "—"} | ${d.oem.toFixed(2)} | ${d.amoot.toFixed(2)} | ${d.alternatives.map(x=>x.sku).join(", ") || "—"} | [Off Road](${d.url}) |`),
  "",
  "### Rows not assigned an Off Road-derived price",
  "",
  `- Zero/invalid OEM List Price: ${zero.map(r => r.sku).join(", ") || "none"}`,
  `- Public page without usable price: ${noPrice.map(r => r.sku).join(", ") || "none"}`,
  `- Part page not found: ${notFound.map(r => r.sku).join(", ") || "none"}`,
  "- These rows retain a previously source-documented independent seller reference where one exists; no price was inferred from a related/alternative part number.",
  "",
  "Alternative part numbers are copied as supplier-listed cross-references only; they are not represented as confirmed interchangeable fitment. Weight is the source's per-unit shipping weight, not a technical dimension or machine fitment confirmation.",
  "",
  "The original 505-row independent-seller price audit above is preserved as a separate source layer. Exact Off Road matches now take precedence in the public Amoot catalog only where a positive OEM List Price was captured."
];
auditDoc += "\n" + lines.join("\n") + "\n";
await writeFile(auditPath, auditDoc, "utf8");

console.log(JSON.stringify({
  publicIndex: records.length,
  validOffRoadOemPrices: valid.length,
  zeroPrices: zero.length,
  noPrice: noPrice.length,
  notFound: notFound.length,
  renderErrors: renderErrors.length,
  supplierPricesVisible: records.filter(r => r.supplierPriceVisible).length,
  catalogDetails: details.length,
  alternativeReferences: details.reduce((n,d)=>n+d.alternatives.length,0),
  priceFormulaMismatches: details.filter(d => Math.abs(d.amoot - Math.round(d.oem * 1.65 * 100) / 100) > 0.001).length
}, null, 2));
