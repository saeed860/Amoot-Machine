-- Keep K-Part evidence restricted to the official K-Part host while allowing its root and subdomains.
alter table public.kpart_catalog_evidence
  drop constraint if exists kpart_catalog_evidence_source_url_check;

alter table public.kpart_catalog_evidence
  add constraint kpart_catalog_evidence_source_url_check
  check (source_url ~ '^https://([^/]+\.)?k-part\.com(/|$)');
