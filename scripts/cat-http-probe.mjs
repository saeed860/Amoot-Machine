const url = "https://parts.cat.com/en/catcorp/product/20R-6518";
const response = await fetch(url, { headers: { "user-agent": "Mozilla/5.0 (compatible; AmootMachineCatalog/1.0)", "accept": "text/html,application/xhtml+xml" }, signal: AbortSignal.timeout(25000) });
const html = await response.text();
console.log(JSON.stringify({ status: response.status, contentType: response.headers.get("content-type"), length: html.length, title: html.match(/<title[^>]*>([\s\S]*?)<\/title>/i)?.[1]?.replace(/<[^>]+>/g," ").trim(), hasPart: html.includes("20R-6518"), hasDescription: html.includes("Description for part number"), hasCompatible: html.includes("Compatible Models for part number"), prefix: html.slice(0,250) }, null, 2));
