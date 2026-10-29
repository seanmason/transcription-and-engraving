# Transcription and engraving laboratory

An ongoing study of beautiful, reproducible solo-piano engraving from scanned scores. The visual reference is Henle Urtext; the tools and fonts are open source or free. Automation should preserve room for deliberate manual refinement.

**Current working direction:** LilyPond 2.26.0 with tuned classical geometry, C059 expression text, custom Emmentaler-derived fingering numerals, and a Nimbus Roman-derived tempo face. This is a Henle-inspired approximation, not Henle's proprietary typeface or an exact match.

## Start here

- [Experiment index](experiments/README.md): what we tried, what worked, and what was superseded.
- [Current decisions](docs/DECISIONS.md): the accepted typography and why.
- [Setup and build](docs/REPRODUCING.md): tool versions, commands, and source-of-truth rules.
- [Next experiments](docs/NEXT.md): unresolved questions and proposed tests.
- [Workflow and review](docs/WORKFLOW.md): separate musical accuracy from visual quality.

## Results to inspect

| Result | Scope | Status |
| --- | --- | --- |
| [Four-engine comparison](output/pdf/engraving-comparison.pdf) | Original lyrical and dense piano studies | Initial screen: LilyPond default/tuned, MuseScore Leland, Verovio Leipzig |
| [Chopin alongside Henle](output/pdf/chopin-henle-side-by-side.pdf) | Op. 9 No. 1, pickup and measures 1-2 | Current typography comparison; short reference excerpt credited in PDF |
| [Shostakovich complete](output/pdf/shostakovich-op34-no16-reengraved.pdf) | Op. 34 No. 16, pickup and 31 measures | Fresh transcription, five review passes; user response: “Well done” |
| [Elfin Dance complete](output/pdf/elfin-dance-reengraved.pdf) | Grieg, 72 measures | Fresh transcription, four proof rounds; awaiting user review |

The earlier [Shostakovich recovery](experiments/003-shostakovich-recovery/README.md) is incomplete and superseded. It must not be treated as the complete score.

## Repository layout

```text
experiments/   numbered studies, historical notes, selected revision proofs, validation
styles/        shared renderer presets; changes affect subsequent renders
fonts/         reproducible font recipes, built fonts, upstream license notices
scores/        canonical inputs and inspectable native exports (see build guide)
overrides/     persistent score-specific LilyPond refinements
manual/        independent native masters for manual finishing
references/    source URLs and hashes; full scans/previews are local cache files
docs/          decisions, workflow, reproduction, next experiments
output/        current presentation PDFs, MIDI checking aids, comparison images
scripts/       setup and provenance utilities
*.py           existing renderer adapters and comparison builders
```

The build scripts remain at the root to retain their working relative paths. `.tools/`, `tmp/`, and `logs/` are disposable local directories. Selected historical evidence is explicitly preserved in `experiments/` instead of committing every intermediate file.

## Accuracy and provenance

Engraving quality does not establish musical accuracy. The Shostakovich and Elfin Dance scores have been manually compared with their supplied scans and pass per-bar duration and MIDI-structure checks; they are not independently certified. See each study's review notes for limitations. Original full scans and Henle preview pages remain local; URLs, file hashes, and relevant comparison excerpts preserve the research context.

Third-party fonts retain their own licenses in `fonts/`. Reference editions and underlying compositions retain their respective rights. This repository does not assign a blanket license to third-party material.
