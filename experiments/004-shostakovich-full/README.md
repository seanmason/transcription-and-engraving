# 004 - Fresh complete Shostakovich transcription

27 October 2026. Op. 34 No. 16, two-page user-supplied scan (printed pages 166-167). Freshly transcribed, not extended from the recovered excerpt.

[Current PDF](../../output/pdf/shostakovich-op34-no16-reengraved.pdf) · [Editable master](../../scores/shostakovich-op34-no16-new.ly) · [Review audit](NOTES.txt) · [Validation](evidence/validation.json)

Scope: half-bar pickup + 31 complete measures, both hands. Established classical geometry, custom fingering/tempo fonts, C059 text; five systems per page following the source breaks.

The initial render and three subsequent intermediate PDFs are preserved in `evidence/`. The current output contains the final additional corrections: bar 13's numeral is a tuplet indication, and the ending's octave-down line covers both final bass notes. Intermediate PDFs contain superseded readings; their exact source states were not saved. Do not treat them as alternate accurate editions.

Review covered pitch and key-signature accidentals, clefs/registers, ties/slurs, polyphony in bars 23-24, fingering placement, courtesy accidentals, articulations, pedaling, and page layout. See the audit for all five passes.

Checks: 32 bar-boundary assertions per hand, no LilyPond warnings, two PDF pages, both MIDI tracks 126 quarter beats, balanced note-on/off events. These are structural checks, not independent musical certification. User feedback after delivery: “Well done.”

Build: `.tools/venv/bin/python render_shostakovich_full.py`. This needs no scan at render time. The source is a handwritten LilyPond master; edit it directly. The full supplied scan is retained locally as `references/shostakovich-op34-no16-scan.pdf`, with its hash recorded in the reference manifest.
