# Reproducing the experiments

The existing harness targets Linux x86-64. Tested tools: LilyPond 2.26.0, MuseScore Studio 4.7.6, Verovio 6.3.0; Python 3.12.15. Python packages are pinned in `requirements.lock`. The portable executables and Python environment are not committed.

## Setup

Install Python 3 with venv support, Fontconfig, Poppler (`pdftoppm`), URW Base35 fonts (C059 and Nimbus Roman), and DejaVu fonts. On Debian/Ubuntu the relevant packages are `python3-venv fontconfig poppler-utils fonts-urw-base35 fonts-dejavu-core`. MuseScore also needs its normal Linux/Qt shared-library dependencies; the headless harness sets `QT_QPA_PLATFORM=offscreen`.

```sh
python3 -m venv .tools/venv
.tools/venv/bin/python -m pip install -r requirements.lock
python3 scripts/fetch_tools.py
```

The fetcher uses the pinned official download URLs in `references/sources.json`. It downloads LilyPond and MuseScore and extracts them into the paths the scripts expect. It does not install OS packages. Downloads are version-pinned; upstream archive checksums were not independently pinned in the original experiment.

The font builders install the two derived font families into `~/.local/share/fonts/music-engraving` and refresh Fontconfig. Upstream notices are stored with the recipes.

## Full Shostakovich (current result)

```sh
.tools/venv/bin/python render_shostakovich_full.py
```

Needs LilyPond, Python packages, URW fonts and Poppler; MuseScore and the original scan are not required. Writes the PDF/MIDI in `output/pdf/`, previews in `tmp/pdfs/`, and validation/logs in `logs/`. Handwritten master: `scores/shostakovich-op34-no16-new.ly`.

## Initial engine comparison

```sh
./rebuild.sh
```

Uses all three engines. Preserves existing fixture MusicXML; pass `--regenerate-fixtures` only to intentionally reset it. Persistent presets live in `styles/`, and overrides in `overrides/`.

## Chopin same-passage comparison

```sh
python3 scripts/fetch_reference.py
.tools/venv/bin/python chopin_study.py
.tools/venv/bin/python render_previews.py
.tools/venv/bin/python compare_chopin.py
```

The fetcher caches the official preview locally. The study regenerates its MusicXML and native exports, so persistent musical changes belong in `chopin_study.py`. The final step requires cached reference imagery and produces the credited side-by-side PDF and structural validation.

`render_shostakovich.py` rebuilds only the superseded recovered five-measure excerpt. Its documented inherited slur warning is not a failure of the fresh complete-score build.

## Evidence and repeatability

Historical proofs are retained selectively. Some pre-repository source states were overwritten; these cannot be reconstructed exactly from their PDFs. Current sources, styles, font recipes, validation snapshots and tool versions are committed. Future experiments should preserve the source commit for every named proof.

PDF metadata can vary between builds; visual/music equivalence is more useful than byte identity across rebuilds. Validation snapshots record the output hashes from the reviewed build. New builds write fresh validation under `logs/`; promote that report into the relevant experiment after reviewing the new render.

## Repository migration verification (27 October 2026)

Checked a separate clean Git checkout with the existing pinned `.tools` runtime attached, with no pre-existing `tmp/` or `logs/` cache:

- Full Shostakovich build: all structural assertions passed; both rendered PNG pages were byte-identical to the reviewed originals.
- Original lyrical/dense comparison: all four treatments rebuilt, including previews and the presentation PDF; current-fixture diagnostic check passed.
- Chopin: fetched the official preview, rebuilt all four treatments and the side-by-side PDF; 51-note/eight-slur structural checks passed.
- Python compilation and repository Markdown-link checks passed.

This verifies the tracked source/build layout with the existing runtime. It does not constitute a fresh operating-system dependency installation test or independent musical proofreading.

## Elfin Dance

```sh
.tools/venv/bin/python render_elfin_dance.py
```

Handwritten master: `scores/elfin-dance.ly`. Uses the same LilyPond/fonts/Poppler setup as Shostakovich; no scan required at render time. See experiment 005 for proof history and validation limits.
