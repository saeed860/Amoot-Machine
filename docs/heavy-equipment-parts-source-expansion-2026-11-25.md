# Heavy-equipment parts source expansion — 25 Nov 2026

This source register supports the Amoot Machine parts catalogue. It separates OEM evidence from reseller discovery and cross-reference leads.

## A — OEM / machine manufacturer
- [Caterpillar Parts Store](https://parts.cat.com/): exact part pages, descriptions and equipment/serial-oriented search.
- [Cat Parts Cross Reference](https://parts.cat.com/en/catcorp/cat-parts-cross-reference): official CAT lookup for competitor filter numbers. Public page describes air, engine oil, hydraulic/transmission and fuel filter groups.
- [Cat Shop by Category](https://parts.cat.com/en/catcorp/shop-all-categories): official taxonomy for category normalization.
- [Cat Parts Reference Guides](https://www.cat.com/en_US/support/maintenance/parts-reference-guides.html): free machine-family guides with common wear and maintenance part numbers.
- [Cat SIS2GO](https://www.cat.com/sis2go): Cat-authored parts and service information tied to equipment and serial number; some information requires subscription.

## B — Manufacturer / specialist filter catalogue
- [SF-Filter cross-reference](https://www.sf-filter.com/en/cross-reference-list): provider states nearly 900,000 OEM/aftermarket identifiers and describes technical checks for dimensions, thread, seal, filtration efficiency and pressure-valve settings.
- [SF-Filter Caterpillar machine catalogue](https://www.sf-filter.com/en/products/filters-for-mobile/construction-machines?brandname=caterpillar): machine/model/type-based filter discovery.
- [Donaldson filter cross-reference PDF](https://dcngli4g50fhp.cloudfront.net/userfiles/ad/donaldson/documents/donaldson_p552006_catalog.pdf): multi-brand cross-reference tables; located PDF is dated/old and is candidate evidence only.

## C — Independent reseller / inventory discovery
- [Off Road Equipment popular CAT parts](https://offroadeq.com/parts): public index states 500 frequently searched CAT part numbers. Seller describes a mix of genuine surplus OEM and aftermarket parts and states it is not an authorized Caterpillar dealer.
- [Off Road Equipment search](https://www.offroadeq.com/search): visible search and batch-import page; shopping requires login.

## Identifier roles
- CAT_OEM — CAT number supported by a CAT source.
- AFTERMARKET_MPN — manufacturer's own aftermarket number.
- INTERCHANGE — claimed equivalent/cross-reference, with source and direction.
- SELLER_SKU — seller's stock/listing code.
- SUPERSESSION — explicit replacement relationship, never inferred.
- KIT / COMPONENT — kit or included component, distinct from assembly.

## Verification states
OEM_CONFIRMED; MANUFACTURER_CROSSREF; SELLER_LISTED; INDEPENDENT_CANDIDATE; NEEDS_SERIAL_VERIFICATION; CONFLICTING_EVIDENCE.

A filter cross-reference alone does not establish machine fitment. Compare dimensions, thread, seal, filtration rating/efficiency, bypass valve and anti-drainback specifications where applicable. For machine fitment, retain exact model, serial range and arrangement whenever provided.

## Checkpoint
- Repository: saeed860/Amoot-Machine.
- Existing discovery data: data/cat-part-number-discovery-offroadeq.txt, data/cat-part-number-discovery-independent-suppliers.txt and data/cat-official-part-numbers.txt.
- Existing catalog data and source register remain the system of record; do not duplicate the public 500-row Off Road index.
- This source expansion records source metadata only. It does not add unverified source-only candidates to the public product catalogue.
- Pending: inspect individual Off Road filter listings and cross-check them with CAT's official cross-reference and current filter-manufacturer sources. Authenticated Off Road inventory/pricing remains pending normal user sign-in.
