# 009 - Guarnieri: full audit against the clearer scan

Date / status: 2026-11-07; manually reviewed working edition, with one unresolved printed dot and one less-certain articulation reading. Not independently certified.

## Question and hypothesis

Does the new scan resolve the errors and uncertain readings in the photograph-based transcription? Audit all 53 measures rather than limiting attention to the old review queue. Engraving quality must not disguise a wrong pitch or register.

## Inputs and controls

- User-supplied **Guarnieri Ponteio No 15.pdf**, three pages, printed 11-13, plate RB-0132. Ignored local cache: `references/guarnieri-ponteio-15-hq.pdf`.
- SHA-256: `3058f5c71ca38964007bfaf0c98b9e279154991131bb1414097a57636413eff0`. Full provenance in `references/manifest.json`; raw scan is not committed.
- Starting repository revision: `73a7fdc`; clean experiment 007 R5 and practice experiment 008 R8. These are historical evidence, not current musical authority.
- Editable masters: `scores/guarnieri-ponteio-15.ly` and `scores/guarnieri-ponteio-15-fingered.ly`.
- LilyPond 2.26.0, accepted Engraving Fingering / Engraving Tempo / C059 fonts, existing page geometry and four-page pagination retained. No shared style edits. The styles/fonts at `73a7fdc` reproduce this proof's shared styling.

## Reproduce

Run from repository root:

```sh
.tools/venv/bin/python render_guarnieri_ponteio_15.py
.tools/venv/bin/python render_guarnieri_fingered.py
```

These compile existing handwritten masters; they do not regenerate musical content. Current outputs retain the established paths under `output/pdf/`. The full scan is required for source comparison, not for rendering.

## Results and evidence

The old transcription contained many substantive errors. Corrections affect musical content in **39 measures**, including the added bar 39 articulation. Most concern ledger-line pitches/registers or accidentals assigned to the wrong chord member. The last RH chord of bar 19 is **Bb3/F4/Bb4**, superseding the prior targeted A3 reading. Bar 20's prior repair was retained.

- [Complete measure audit](measure-audit.md): all 53 bars, source locations, adopted readings and qualifications.
- [Final event inventory](event-inventory.json): explicit LilyPond events from both musical layers. This is extracted from the reviewed master, not independent ground truth.
- R1 clean: [source](evidence/r1-clean.ly), [PDF](evidence/r1-clean.pdf), [validation](validation-clean.json).
- R1 practice: [source](evidence/r1-fingered.ly), [PDF](evidence/r1-fingered.pdf), [validation](validation-fingered.json).
- Selected source excerpts: [bar 30](evidence/source-m30.png), [ending](evidence/source-m52-53.png). Credit: the user's supplied scan of the RB-0132 edition; copyright remains with the respective owners. Entire source pages stay out of Git.

## Accuracy and visual review

1. Read both staves and bass layer of every measure against enlarged scan systems. Count ledger lines rather than extrapolating their spacing. Check clef changes independently.
2. Check accidental scope across the whole staff, including both LH voices. This corrected initially proposed naturals in 12, 14, 18, 26 and 27. In 30, the LH Gb3 affects the subsequent bass eighth: G3 half to Gb3 eighth is a slur, not a tie.
3. Compare the reprise separately, check source accents and expression, and inspect the closing 8va. In 52 the written D6 ties to the D6 in A5/D6 under 8va; sounding pitches are D7 and A6/D7.
4. Compare the new clean render with the scan, then inspect all four pages of both editions. Correct clean-edition expression collisions locally. Retain the large readable digits and compact practice layout. Adjust affected fingerings where a corrected simultaneous bass needs finger 5; no piano trial was performed.
5. Build checks: 53 bars, 218 quarter beats, 106 explicit bar checks, four pages, zero compiler warnings. Fingered MIDI is byte-identical to a freshly compiled clean master. Nine additional [critical-event checks](validation-critical-events.json) confirm the encoded bar 19 chord, bar 30 bass change and closing registers/tie. These checks demonstrate structural consistency and synchronization, not proof of source accuracy.

**Source-mark limits:** a dot beside the upper G5 in bar 32 is unresolved and omitted from the working rhythm; [crop](evidence/source-m32-dot.png). The isolated dot under the second LH chord in 39 is read as staccato and included; [crop](evidence/source-m39-dot.png). Its interpretation is less secure than the surrounding pitches. Source bracketed 2s remain in their existing representation; hand-redistribution intent and editorial fingering ergonomics are not independently established.

## Decision and next action

Use this scan-audited pair as the current working editions. Supersede the broad photograph-era pitch queue with the specific qualifications above. Seek another authoritative source for the bar 32 dot and a pianist's trial for detailed fingering; do not turn successful compilation into a claim of perfect accuracy. Preserve older proofs unchanged so that further corrections can be traced.

## R2: fingered delivery and layout review

2026-11-07. Rebuilt the detailed practice edition for delivery after the scan audit. Retained all existing large fingerings and musical corrections. Added top-system clearance for the high fingerings on continuation pages; moved bar 34 e rall. above its beam after the spacing change. Inspected all four final page renders for clipping, fingering/accidental readability, expression marks and the ending. No further overlaps were apparent at review scale. Four pages, zero compiler warnings, 106 bar checks and MIDI byte-identical to the freshly compiled clean master. Fingering is still not piano-tested; R1 transcription qualifications remain.

Preserved [source](evidence/r2-fingered.ly), [PDF](evidence/r2-fingered.pdf) and [validation](validation-r2-fingered.json).
