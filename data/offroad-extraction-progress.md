# Amoot Machine — Catalog extraction checkpoint
Date: 2026-11-25

## Target
Build a 5,000-identifier heavy-equipment parts reference catalog. A catalog reference is not automatically a saleable product. Price, condition, stock, compatibility, and OEM authenticity are only published when supported by source evidence.

## Live database counts
- `part_catalog` rows: 3,862
- Active references: 3,834
- Inactive references: 28
- Active references with an image URL: 611
- Active references sourced from Cat Parts Store: 3,351
- Remaining to 5,000 total reference rows: 1,138

## Off Road Equipment candidate batch
- Original snapshot file: `data/offroad-batch-import-cat-1532.txt`
- Original rows: 1,532
- Duplicate normalized identifiers removed: 4 (10R-1503, 10R-6211, 10R-7172, 0R-9942)
- Unique identifiers retained: 1,528
- Already present in `part_catalog`: 983
- Not yet present: 545

The Off Road Equipment public popular-parts index contains 500 unique raw identifiers. Its brand field is blank and the seller describes mixed genuine-surplus and aftermarket inventory. Treat those rows as independent-seller candidates only, not proof of Cat OEM status, new condition, stock, price, or machine compatibility.

## Latest official Cat verification batch
Ten previously missing identifiers were checked against official Cat Parts Store pages and inserted as `REFERENCE` rows:
- 096-5028 — Air Filter Service Indicator; BOTH marine and land groups
- 0R-3652 — Cat Reman Alternator; Cat page explicitly says Marine Approved: No
- 0R-2741 — Cat Reman Connecting Rod; application remains UNVERIFIED
- 100-4838 — M6 hex flange bolt
- 100-4841 — M6 hex flange bolt
- 100-6668 — bucket cutting edge
- 101-0745 — 600 mm windshield wiper blade
- 101-3895 — M8 hex flange bolt
- 103-1912 — M10 x 1.5 creep-resistant turbocharger stud; no image assigned
- 106-8916 — M6 hex flange bolt; machine application remains UNVERIFIED

Nine of these ten references have official Cat image URLs. No prices or stock were invented. The 0R-3652 Cat page contains a title/specification discrepancy (55 A in the title versus 52 A in the rated-output specification), retained in the source note.

## Quality rules
- Preserve the exact displayed part number and punctuation; normalized identifiers are for matching only.
- Keep inactive/discontinued references out of storefront search. In particular, 7T-9307 and 7T-9309 are marked discontinued by Cat and remain inactive.
- Do not promote independent reseller candidates to Cat OEM references without an official manufacturer cross-check.
- Do not infer fitment, price, stock, condition, or supersession.
- Keep source URL and access evidence for every verified record.
