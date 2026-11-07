# 007 — Guarnieri, Ponteio No. 15

Date: 7 November 2026. **Status: working proof; musical accuracy unresolved. Not an accepted or performance-ready edition.**

## Question and hypothesis

Can the accepted typography support Guarnieri's continuous cross-staff figuration, independent bass, changing meters and clefs, and dense chromatic chords? Preserve the musical layering and increase inter-staff space before shrinking the staff size or flattening the hand distribution.

## Inputs and controls

- Three user-supplied photographs, printed pages 11–13, titled *Ponteio No. 15*, dedicated *a Guilherme Fontainha*, marked *Incisivo* (half note = 120). The composer attribution comes from the user. The printed plate is RB–0132; the publisher has not been independently identified.
- Attachment order is reversed: Photo 3 = p. 11, Photo 2 = p. 12, Photo 1 = p. 13. Originals cached locally as `references/guarnieri-ponteio-15-p11.jpg` through `p13.jpg`; hashes and original names are in [the manifest](../../references/manifest.json). Raw photographs are untracked.
- [Editable working master](../../scores/guarnieri-ponteio-15.ly): 53 measures. Meter changes are encoded explicitly; cross-staff figuration and independent bass are separate voices. Musical source entry was manual, using disposable scaffolding for repeated notation syntax; there is no supported generator for this master.
- LilyPond 2.26.0; 235 × 310 mm paper; established approximately 7 mm staves, Engraving Fingering, Engraving Tempo, C059 text. Shared styles and font recipes unchanged from repository base `aaa294c`.
- Page/system breaks and beam/spacing adjustments are score-local. Current page groups: 1–14, 15–27, 28–41, 42–53.

## Reproduce

```sh
.tools/venv/bin/python render_guarnieri_ponteio_15.py
```

The [builder](../../render_guarnieri_ponteio_15.py) compiles the handwritten master, checks bar structure, MIDI duration, meter and tempo, and renders all four pages at 150 dpi. It never generates or replaces the notation source. Outputs: [PDF](../../output/pdf/guarnieri-ponteio-15-reengraved.pdf), [MIDI](../../output/pdf/guarnieri-ponteio-15-reengraved.midi), disposable previews/logs. MIDI is a checking aid; it does not perform the written rallentando or expressive timing.

The photographs are not required to rebuild. Historical proofs can be rebuilt with the existing shared styles:

```sh
.tools/lilypond-2.26.0/bin/lilypond -I . -o tmp/pdfs/guarnieri-r1 experiments/007-guarnieri-ponteio-15/evidence/r1-source.ly
```

## Results and evidence

| Round | Evidence | Observations and action |
| --- | --- | --- |
| R1 | [PDF](evidence/r1.pdf), [source](evidence/r1-source.ly) | Full initial draft, three pages. Unresolved pitches, slur warnings and cross-staff beam-slope warnings. Retained solely as historical evidence. |
| R2 | [PDF](evidence/r2.pdf), [source](evidence/r2-source.ly) | Corrections to accidental carry and the closing register; added expression stream. Fixed beam positions made some stems too short and beams intersect notes. Rejected. |
| R3 | Disposable layout test, not a retained named source/PDF pair | Increased effective Staff VerticalAxisGroup spacing and flattened beam slopes. Beam warnings disappeared, but three pages compressed. No exact reproducibility claim for this disposable test. |
| R4 | [PDF](evidence/r4.pdf), [source](evidence/r4-source.ly) | Four pages, warning-free. Inspected all pages. Dynamics and hairpins still needed separation from beams. |
| Current | [PDF](../../output/pdf/guarnieri-ponteio-15-reengraved.pdf), [source](../../scores/guarnieri-ponteio-15.ly) | Revised opening accents, m. 50 figuration, closing slur endpoints/fermata, and expression offsets. Retains four pages and accepted typography. Musical uncertainties below remain open. |

All retained proof files contain the source state corresponding to that PDF. Earlier proofs contain known mistakes and must not replace the current master.

## Accuracy and visual review

Whole photographs, system crops, and enlarged local passages were inspected. Temporary red-channel/background-normalized crops improved visibility through the yellow background pattern. Experimental staff-grid and notehead labels were **unreliable**: warped lines, ledgers, clef changes and yellow rules caused wrong pitch labels. These were reading aids only, not a validated OMR system or independent proofreader; their labels must not be reused as ground truth.

Corrections made during review include accidental carry in measures 12, 16–18; the low/right-hand ledger passage; parts of measures 21–25 and 29; the closing bass register, treble-clef transfers, octave span and final sonorities; and the reprise in measure 50. These are changes made, not a claim that every resulting pitch is verified.

### Open musical review queue

| Measures | Scope | What remains to establish |
| --- | --- | --- |
| 19–20 | Both hands | Targeted rereading completed in R5; corrected pitches, accidental carry and C3 cross-bar tie. See [review](bars-19-20-review.md); awaiting user comparison, not independently verified. |
| 24–31 | Both hands | Recheck complete chord spellings against local staff lines, especially m. 25 last RH chord and LH last two attacks, m. 27 high register, m. 29 final LH chord (currently B-flat3/E-flat4/A4), and the bass-clef transition at m. 30. |
| 32–35 | Both hands | Confirm every note and accidental in the chromatic rallentando, including cancellations that remain active across repeated pitches within a bar. The layout is settled; pitch confidence is not. |
| 51–53 | Both hands | Closing register was substantially revised using local staff-line readings. Independently confirm the LH whole-note sonorities and the precise start of the 8va, rather than relying on the MIDI range check. |
| Throughout | Bass phrasing/markings | Verify whether same-pitch curves are ties and different-pitch curves are slurs; check courtesy accidentals, accents and fingering attachment. Some cautionary parentheses/dashed text details are not faithfully reproduced. |

The remainder has been visually compared during entry/revision, but no independent pitch-by-pitch audit or audio/performance review is claimed. The uncertainty is substantive; do not promote this file to an authoritative transcription merely because it looks clean or compiles.

[Validation snapshot](validation.json): 106 explicit bar checks, 53 measures, 218 quarter-note beats in each MIDI staff track, exact encoded meter transitions and half-note tempo 120, four PDF pages, zero compiler warnings. The latest four pages were inspected at 150 dpi after the final expression-offset changes; embedded fonts were checked with `pdffonts`. Final visual review covered page bounds, beam/stem clearance, expression placement, closing slurs, and fermatas.

These are **structural checks only**. They do not establish pitch accuracy, tie/slur fidelity, or completeness of expression markings.

## Decision and next action

Retain the four-page geometry and cross-staff voice structure as a useful engraving experiment. Staff-level VerticalAxisGroup settings matter: changing only the PianoStaff StaffGrouper did not provide the required effective spacing in this setup. Flat forced beam coordinates were inferior to sufficient staff separation plus automatic horizontal beams.

Complete the open musical review queue before calling this a finished edition. A second reading against clearer, straight-on details of printed page 12 would be especially valuable. User approval is pending. Do not describe the current proof as accepted, fully accurate, or ready for performance.

## R5 - bars 19-20 correction

At user request, reread only bars 19-20 against enlarged original/normalized photographs. Corrected both hands and the bass tie; see the [note-by-note review](bars-19-20-review.md). [R5 source](evidence/r5-source.ly), [R5 PDF](evidence/r5.pdf). Updated clean and fingered editions together. Four pages and zero warnings; encoding/onset checks described in the review. Other musical uncertainties remain open.
