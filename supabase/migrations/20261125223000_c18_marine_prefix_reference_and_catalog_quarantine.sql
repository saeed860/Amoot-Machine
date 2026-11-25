-- C18 marine serial-prefix directory. Third-party evidence only; deliberately non-exhaustive.
-- Do not use this table as an OEM fitment decision. Confirm full serial, arrangement and Cat SIS effectivity.
CREATE TABLE IF NOT EXISTS public.engine_serial_prefix_reference (
  engine_model text NOT NULL,
  serial_prefix text NOT NULL,
  application_type text NOT NULL,
  evidence_level text NOT NULL DEFAULT 'THIRD_PARTY_REFERENCE',
  verification_status text NOT NULL DEFAULT 'REFERENCE_ONLY',
  source_name text NOT NULL,
  source_url text NOT NULL,
  source_note text NOT NULL,
  is_exhaustive boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT engine_serial_prefix_reference_pk PRIMARY KEY (engine_model, serial_prefix, application_type),
  CONSTRAINT engine_serial_prefix_reference_model_check CHECK (engine_model ~ '^[A-Z0-9.]+$'),
  CONSTRAINT engine_serial_prefix_reference_prefix_check CHECK (serial_prefix ~ '^[A-Z0-9]{3}$'),
  CONSTRAINT engine_serial_prefix_reference_application_check CHECK (application_type IN ('MARINE','GENERATOR','INDUSTRIAL','LAND')),
  CONSTRAINT engine_serial_prefix_reference_level_check CHECK (evidence_level IN ('OFFICIAL','THIRD_PARTY_REFERENCE')),
  CONSTRAINT engine_serial_prefix_reference_status_check CHECK (verification_status IN ('REFERENCE_ONLY','VERIFIED'))
);
ALTER TABLE public.engine_serial_prefix_reference ENABLE ROW LEVEL SECURITY;

INSERT INTO public.engine_serial_prefix_reference
(engine_model, serial_prefix, application_type, evidence_level, verification_status, source_name, source_url, source_note, is_exhaustive)
VALUES
('C18','C1J','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','Caterpillar C18 Marine Engine Kits reference PDF','https://www.powergenenterprises.com/pub/media/productattach/custom/upload/E4544-Caterpillar-C18-Engine-Build_Sheet.pdf','Listed as C18 Marine Engine serial prefix in independent marine engine reference material. Not an OEM Cat SIS fitment confirmation.',false),
('C18','CKH','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed for C18 marine engine kits; compression-ratio grouping varies by engine build.',false),
('C18','CYN','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed for C18 marine engine kits; compression-ratio grouping varies by engine build.',false),
('C18','GEN','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed in third-party C18 marine kit reference; verify against OEM serial record.',false),
('C18','GES','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed for C18 marine engine kits; verify against OEM serial record.',false),
('C18','J2K','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed in third-party C18 marine kit reference; verify against OEM serial record.',false),
('C18','JKH','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed in third-party C18 marine kit reference; verify against OEM serial record.',false),
('C18','JKX','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','Interstate-McBee Caterpillar Custom Gasket Set Catalogue','https://interstate-mcbee.com/wp-content/uploads/2019/03/interstate-mcbee-caterpillar-custom-gasket-set-catalog.pdf','Listed in independent C18 marine gasket-set catalog; verify against OEM serial record.',false),
('C18','KDT','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','Interstate-McBee Caterpillar Custom Gasket Set Catalogue','https://interstate-mcbee.com/wp-content/uploads/2019/03/interstate-mcbee-caterpillar-custom-gasket-set-catalog.pdf','Listed in independent C18 marine gasket-set catalog; verify against OEM serial record.',false),
('C18','KJT','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed for C18 marine engine kits; compression-ratio grouping varies by engine build.',false),
('C18','NAX','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed for C18 marine engine kits; compression-ratio grouping varies by engine build.',false),
('C18','NAY','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed for C18 marine engine kits; compression-ratio grouping varies by engine build.',false),
('C18','PLE','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed in third-party C18 marine kit reference; verify against OEM serial record.',false),
('C18','T2P','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed for C18 marine engine kits; compression-ratio grouping varies by engine build.',false),
('C18','WKB','MARINE','THIRD_PARTY_REFERENCE','REFERENCE_ONLY','C18 Marine Engine Kits reference PDF','https://cisp.cachefly.net/assets/articles/attachments/94571_product-overview-2025.pdf','Listed in third-party C18 marine kit reference; verify against OEM serial record.',false)
ON CONFLICT (engine_model, serial_prefix, application_type) DO UPDATE
SET evidence_level=EXCLUDED.evidence_level,
    verification_status=EXCLUDED.verification_status,
    source_name=EXCLUDED.source_name,
    source_url=EXCLUDED.source_url,
    source_note=EXCLUDED.source_note,
    is_exhaustive=EXCLUDED.is_exhaustive,
    updated_at=now();

UPDATE public.part_catalog
SET verification_status='NEEDS_SERIAL_CHECK',
    is_active=false,
    source_note=concat_ws(E'\n', nullif(source_note,''), 'C18 marine family reference only. The public Cat compatibility list does not establish serial-prefix/arrangement effectivity. Keep non-active until exact engine serial number, arrangement and Cat SIS effectivity are confirmed. Prefix directory is a non-exhaustive third-party reference only.'),
    application_evidence='Cat public model-family compatibility reference only; exact serial prefix and arrangement not confirmed.',
    application_source_url='https://parts.cat.com/en/catcorp/equipment/marine-engine/C18-47/parts-diagram',
    updated_at=now()
WHERE engine_models @> ARRAY['C18']::text[]
  AND application_type='MARINE';

UPDATE public.products p
SET status='INACTIVE'::public.product_status,
    updated_at=now()
FROM public.part_catalog c
WHERE regexp_replace(p.sku,'^CAT-','')=c.part_number
  AND c.engine_models @> ARRAY['C18']::text[]
  AND c.application_type='MARINE'
  AND p.status='ACTIVE'::public.product_status;
