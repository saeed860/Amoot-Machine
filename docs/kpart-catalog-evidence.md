# K-Part third-party evidence workflow

K-Part is used as a **candidate discovery and diagram cross-reference source**, not as an OEM authority. Its catalog is navigated by machine model, serial prefix, assembly/group and illustrated parts list. The interactive catalog is client-rendered, so the browser's readable page text is not a reliable bulk-export interface.

## Data separation

- Raw K-Part rows are stored in `public.kpart_catalog_evidence`, never directly in `public.part_catalog`.
- Every row is scoped to the exact machine model and serial prefix selected in K-Part.
- Keep the assembly/group name, diagram reference and quantity from the visible parts table.
- A K-Part row starts as `CANDIDATE`; it is not OEM verified, not sellable inventory, and does not establish current price or stock.
- Never infer marine/land application from the model family alone. Application labels continue to require explicit evidence.
- Do not remove the serial prefix when searching or comparing a record. A different prefix is a different applicability scope.

## Admin import

Use `POST /api/admin/kpart/import` with the admin bearer token. Maximum 500 rows per request.

Example body:

```json
{
  "items": [
    {
      "partNumber": "189-4994",
      "name": "BATTERY & WIRING GP",
      "modelName": "M325B",
      "serialPrefix": "BGN",
      "groupName": "Battery and Wiring Group",
      "diagramRef": "1",
      "quantity": 1,
      "sourceUrl": "https://k-part.com/chat?catalog_brand=cat&catalog_model=m325b-bgn",
      "sourceNote": "Transcribed from the selected group table; verify the selected prefix and diagram before promotion."
    }
  ]
}
```

The route accepts only HTTPS URLs hosted on `k-part.com`, checks required scope fields, and upserts by part number + model + prefix + group + diagram. It deliberately returns `promotedToPartCatalog: false`.

## Review and promotion

1. Open the exact K-Part model/prefix and group.
2. Match the table's diagram reference to the drawing; capture the exact part number, description and quantity.
3. Check the same part number in the official Cat Parts Store and, when serial-specific fitment is required, Cat SIS/SIS2GO with the full serial number and Arrangement.
4. Only after that review may a curated record be entered into `part_catalog`; keep its source attribution and exact evidence. K-Part alone must never set `OEM_VERIFIED`.
5. If Cat and K-Part disagree, keep the K-Part row as candidate and do not promote it.

## Current limitation

The public K-Part landing pages and example catalog pages are readable, but the interactive parts table is client-rendered and was not extractable through the current text-only browsing path. Therefore no K-Part part rows have been invented or bulk-imported. This implementation prepares a safe intake path; actual rows must be transcribed from the rendered diagram/table.
