-- Add two official Cat fuel filter references.
-- Empty engine_models for 264-7727 is intentional: Cat does not publish fitment on its page.
insert into public.part_catalog
 (part_number,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status)
values
('264-7727','فیلتر سوخت فوق‌العاده پربازده Cat 264-7727',
 'Cat Ultra High Efficiency Fuel Filter. Official Cat page describes a one-piece can design with non-metallic nylon center tube, proprietary media, acrylic beads, spiral roving and molded end caps. Material specification lists Nitrile/NBR/HNBR/XNBR rubber and PTFE plastic; efficiency field says Advanced High Efficiency. Cat page does not currently publish compatible models or dimensions for this part.',
 ARRAY[]::text[],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/264-7727',
 'Official Cat product page confirms Ultra High Efficiency Fuel Filter, construction and materials. Compatible models and dimensions are not published in the retrieved page; no fitment inferred. No price or stock imported.',
 'REFERENCE'),
('081-4662','فیلتر سوخت استاندارد موتور Cat 081-4662',
 'Cat Standard Efficiency Engine Fuel Filter. Official compatible model classes: PS-300 and PF-300 pneumatic compactors; CB-524, CB-523, CB-522, CB-521, CB-525B, CB-523B and CB-525 vibratory compactors. Cat page states specifications are not yet available.',
 ARRAY['PS-300','PF-300','CB-524','CB-523','CB-522','CB-521','CB-525B','CB-523B','CB-525'],
 'فیلتر و مصرفی - فیلتر سوخت',
 'Cat Parts Store (official)',
 'https://parts.cat.com/en/catcorp/product/081-4662',
 'Official Cat page confirms Standard Efficiency Fuel Filter and compatible pneumatic/vibratory compactor model classes. Specifications not yet published. No price or stock imported. Verify exact serial number and arrangement.',
 'REFERENCE')
on conflict (part_number) do update set
 name=excluded.name,description=excluded.description,engine_models=excluded.engine_models,
 technical_group=excluded.technical_group,source_name=excluded.source_name,
 source_url=excluded.source_url,source_note=excluded.source_note,
 verification_status='REFERENCE',updated_at=now()
where public.part_catalog.source_url is distinct from excluded.source_url
   or public.part_catalog.name is distinct from excluded.name
   or public.part_catalog.description is distinct from excluded.description
   or public.part_catalog.engine_models is distinct from excluded.engine_models
   or public.part_catalog.technical_group is distinct from excluded.technical_group
   or public.part_catalog.source_note is distinct from excluded.source_note;