#!/usr/bin/env python3
"""Vendor the licensed Wikimedia Commons homepage hero images into assets/."""
from pathlib import Path
from urllib.request import Request, urlopen

ROOT = Path(__file__).resolve().parents[1]
ASSETS = ROOT / "assets"
ASSETS.mkdir(exist_ok=True)

IMAGES = {
    "hero-jackup-rig.jpg": "https://commons.wikimedia.org/wiki/Special:FilePath/Jack-up-rig-in-the-caspian-sea.JPG?width=1600",
    "hero-supply-vessel.jpg": "https://commons.wikimedia.org/wiki/Special:FilePath/OSV_Cape_Cod.jpg?width=1600",
    "hero-cat-3516b.jpg": "https://commons.wikimedia.org/wiki/Special:FilePath/Caterpillar_3516B_-_XQ2000_Power_Module.JPG?width=1600",
}
for filename, url in IMAGES.items():
    target = ASSETS / filename
    req = Request(url, headers={"User-Agent": "AmootMachineAssetVendor/1.0 (website asset migration)"})
    with urlopen(req, timeout=60) as response:
        data = response.read()
    if len(data) < 10_000 or not (data.startswith(b"\xff\xd8\xff") or data.startswith(b"RIFF") or data.startswith(b"\x89PNG")):
        raise RuntimeError(f"Invalid image response for {filename}: {len(data)} bytes")
    target.write_bytes(data)
    print(f"OK {filename}: {len(data)} bytes")

index = ROOT / "index.html"
html = index.read_text(encoding="utf-8")
replacements = {
    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Jack-up-rig-in-the-caspian-sea.JPG/1600px-Jack-up-rig-in-the-caspian-sea.JPG": "./assets/hero-jackup-rig.jpg",
    "https://commons.wikimedia.org/wiki/Special:FilePath/OSV_Cape_Cod.jpg?width=1600": "./assets/hero-supply-vessel.jpg",
    "https://s7d2.scene7.com/is/image/Caterpillar/C831222?wid=1600&hei=1000&fit=constrain&fmt=webp&qlt=82": "./assets/hero-cat-3516b.jpg",
}
for old, new in replacements.items():
    if old not in html:
        raise RuntimeError(f"Expected hero URL not found in index.html: {old}")
    html = html.replace(old, new)
html = html.replace("alt:'Offshore self elevating drilling rig - Iran Khazar'", "alt:'دکل حفاری خودبالابر ایران خزر - دریای خزر'")
html = html.replace("alt:'Offshore supply vessel Cape Cod'", "alt:'کشتی پشتیبانی فراساحلی Cape Cod'")
html = html.replace("alt:'Caterpillar 3516 industrial diesel engine'", "alt:'موتور دیزل ژنراتوری Caterpillar 3516B'")
index.write_text(html, encoding="utf-8")

audit = ROOT / "docs" / "internal-product-image-audit.md"
text = audit.read_text(encoding="utf-8")
text = text.replace(
    "Other slides use source-hosted optimized image variants; these are not yet vendored into the repository because binary downloads were unavailable in this editing session.",
    "All three non-original hero slides are now stored locally under assets/; the homepage no longer requests these hero images from external hosts."
)
text = text.replace(
    "Resized Wikimedia thumbnail used.",
    "Locally vendored as assets/hero-jackup-rig.jpg (resized Wikimedia file)."
).replace(
    "Wikimedia file delivery with width parameter used.",
    "Locally vendored as assets/hero-supply-vessel.jpg (resized Wikimedia file)."
).replace(
    "official product image delivered as constrained WebP.",
    "Replaced for local hosting with a Wikimedia Commons photograph of a Caterpillar 3516B XQ2000 power module, locally vendored as assets/hero-cat-3516b.jpg."
)
text += """

## Local hero asset attribution (2026-11-24)

- `assets/hero-jackup-rig.jpg` — Iran Khazar jack-up rig, source: [Wikimedia Commons file page](https://commons.wikimedia.org/wiki/File:Jack-up-rig-in-the-caspian-sea.JPG), CC BY-SA 3.0; attribution/source as listed on the Commons page (www.dragonoil.com). Changes: resized for web delivery.
- `assets/hero-supply-vessel.jpg` — OSV Cape Cod, source: [Wikimedia Commons file page](https://commons.wikimedia.org/wiki/File:OSV_Cape_Cod.jpg), CC0 1.0, author GuavaTrain. Changes: resized for web delivery.
- `assets/hero-cat-3516b.jpg` — Caterpillar 3516B XQ2000 power module, source: [Wikimedia Commons file page](https://commons.wikimedia.org/wiki/File:Caterpillar_3516B_-_XQ2000_Power_Module.JPG), CC BY-SA 3.0, author StcudorPrewoP. Changes: resized for web delivery.

The original first-slide image remains local at `assets/hero-excavator.jpg`. Product-SKU photographs sourced from third-party sellers/manufacturer media remain separately documented above and are not included in this hero-image migration.
"""
audit.write_text(text, encoding="utf-8")
