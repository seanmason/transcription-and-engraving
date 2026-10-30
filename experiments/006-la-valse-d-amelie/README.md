# 006 - La Valse d'Amelie

Date: 30 October 2026. Status: manually reviewed, awaiting user review.

## Question and hypothesis

Can the accepted engraving style carry a longer score with a sustained melody over eighth-note figuration, changing accompaniment textures, and many similar but nonidentical repetitions? Keep the accepted typography and approximately 7 mm staves, preserve the overlapping durations, and improve page flow without shrinking the music.

## Inputs and controls

- User-supplied `La Valse d'Amelie.pdf`: five scanned pages, no machine-readable notation. The scan identifies the title but does not show an arranger or publisher attribution. Yann Tiersen's composer credit and the accented title typography are editorial metadata.
- Original cached locally as `references/la-valse-d-amelie-scan.pdf`; hash and size in [the manifest](../../references/manifest.json). The full scan is not tracked.
- Manual transcription, not OMR or a downloaded MIDI/MusicXML arrangement. The scan, rather than a different published arrangement, is the source of this transcription.
- [Canonical editable master](../../scores/la-valse-d-amelie.ly): 136 measures, no pickup; 2/4 in measures 1-32 and 129-136, 3/4 in measures 33-128. Printed quarter-note tempos: 100, 150, 100.
- LilyPond 2.26.0, 235 x 310 mm paper, accepted Emmentaler-derived Engraving Fingering, C059 text and tuplets. No verbal tempo mark is present, so the Engraving Tempo face is available through the established setup but not used in this PDF.
- Shared styles unchanged from repository base `d1e3cfd`. Score-local spacing and voice settings live in the master. Font recipes and upstream notices unchanged.

## Reproduce

```sh
.tools/venv/bin/python render_la_valse_d_amelie.py
```

The [builder](../../render_la_valse_d_amelie.py) compiles the master, performs structural and selected pitch/duration checks, and renders all pages for inspection. It never regenerates the handwritten source. Outputs are [PDF](../../output/pdf/la-valse-d-amelie-reengraved.pdf) and [MIDI](../../output/pdf/la-valse-d-amelie-reengraved.midi), with disposable logs and PNGs under `logs/` and `tmp/pdfs/`. Original scan is not required to rebuild.

Historical proofs can be rebuilt with the same shared styles, for example:

```sh
.tools/lilypond-2.26.0/bin/lilypond -I . -o tmp/pdfs/amelie-r1 experiments/006-la-valse-d-amelie/evidence/r1-source.ly
```

## Results and evidence

| Round | Evidence | Findings and changes |
| --- | --- | --- |
| R1 | [PDF](evidence/r1.pdf), [source](evidence/r1-source.ly) | Complete initial transcription. Seven pages, sparse systems and an isolated coda. Review found that the final variation needed the D/A bass cycle throughout, rather than inheriting the earlier F/C cycle. Rechecked closing melody, upper-register dotted-quarter pitches, and printed fingerings. |
| R2 | [PDF](evidence/r2.pdf), [source](evidence/r2-source.ly) | Corrected bass in measures 105-112 and 121-128; corrected first upper note of measures 122/126 to C6; corrected closing B4-A4 and the tie into measure 136. Removed inherited extra fingerings and restored printed ones. Merged coincident black heads and reflowed systems. A forced five-page count failed: automatic extra page breaks left the last page compressed. Rejected; warnings retained in the review record. |
| R3 | [PDF](evidence/r3.pdf), [source](evidence/r3-source.ly) | Removed forced page count, explicitly prohibited page breaks inside chosen page groups. Five pages, no warnings or compressed systems. Set fingering placement after voice-direction commands and inside implicit left-hand voices. Inspected all five pages. |
| R4 | [Current PDF](../../output/pdf/la-valse-d-amelie-reengraved.pdf), [master](../../scores/la-valse-d-amelie.ly) | Balanced the octave-introduction systems at 6/5/5 bars; restored the descending 3-2-1 fingering in measure 48. Rebuilt, ran checks, and inspected every final page at 150 dpi. This is the delivered candidate. |

The page groups are 1-32, 33-64, 65-96, 97-116, and 117-136, with 5/6/6/5/5 systems. The final coda occupies two systems on page 5. Page boundaries follow phrase/section boundaries, but practical page-turn convenience has not been tested at the piano.

## Accuracy and visual review

The five source pages were inspected as whole pages and system crops. Enlarged local crops were used for staff-relative pitch readings, including the introduction's chords, similar waltz variations, and the ending. The scan is warped: comparing note height against a distant horizontal staff baseline is unreliable.

Review attention included:

- Dotted rhythms and eighth-note triplets in the introduction; cross-bar and within-bar ties; melody octaves in measures 17-32 and 81-96.
- The distinction between D5 and E5 at the start of the dotted-quarter variants, and C5/B4/G4 in the later low-register phrases.
- Independent sustained melody and eighth-note figuration in measures 33-64 and 97-128. Different black/white heads remain visible; coincident black heads merge while retaining separate durations.
- The D/A accompaniment cycle across all 32 measures of the upper-register variation. It does not follow the earlier F/C cycle when the melody changes.
- Measures 122/126 begin C6 and move to B5. The final melody returns to B4, tied into measure 136, then A4. The final bass sonority is C3-E3-B3, retained as printed.
- Printed dynamics, hairpins, fingerings, phrase marks and two final fermatas. No pedal markings were added. Fingerings are repositioned for legibility; their font recipe is unchanged.

[Validation snapshot](validation.json): zero compiler warnings; 136 explicit bar checks in each of three notated voice streams; 368 quarter-note beats per hand; 57 selected hand/measure attack-pitch checks; the entire final 32-bar bass-cycle comparison; six sustained-melody duration checks; exact MIDI tempo and meter transitions. MIDI has 520 right-hand and 644 left-hand attacks. Tied continuations do not count as new attacks. Initial test expectations for measures 18 and 130 were corrected to account for ties; the notation itself did not change for those test corrections.

The final PDF was checked page by page for clipped content, collisions, overfull systems, typography, voice separation, hairpins, slurs and ending placement. `pdffonts` confirmed embedded C059, Emmentaler and Engraving Fingering fonts.

These checks are not independent certification of every pitch or marking. No second human proofreader or independent transcription was used, and no performed/audio review is claimed. No unresolved illegible pitch has been flagged in the supplied scan; subtle source errors or transcription omissions may still remain. The scan's edition/arranger provenance is unknown.

## Decision and next action

Retain this five-page candidate and its explicit voices. Keep shared style changes separate from score-local spacing. Explicit page-break constraints worked better than forcing a total page count after LilyPond had chosen extra page breaks. User approval and a piano-side reading remain pending.
