# 005 - Elfin Dance: full transcription and engraving

29 October 2026. Edvard Grieg, *Elfin Dance*. Fresh manual transcription of the user-supplied two-page scan, 72 measures in 3/4. No OMR or external score was used.

[Current PDF](../../output/pdf/elfin-dance-reengraved.pdf) · [Editable master](../../scores/elfin-dance.ly) · [Validation](evidence/validation.json) · [Review notes](NOTES.txt)

## Question and controls

Can the established typography and classical geometry handle a longer, compact dance with repeated phrases, chromatic passages and grace notes? Keep the accepted fonts and approximately 7 mm staff height; refine only score-local spacing. Shared styles and the Shostakovich master are unchanged.

The handwritten LilyPond file is the canonical master. Every measure is expanded and numbered explicitly, making differences between returning phrases editable. The scan's handwritten numbers and pencil annotations are omitted; printed musical markings and fingerings are transcribed. A redundant initial bass-to-treble clef change is simplified to the sounding treble clef.

## Reproduce

```sh
.tools/venv/bin/python render_elfin_dance.py
```

Requires the existing LilyPond/Python/font/Poppler setup. Outputs a two-page PDF, MIDI audition file, rendered page proofs and validation. The MIDI setting of quarter = 144 is editorial; only **Allegro** is printed, as in the source. Grace-note playback timing is supplied by LilyPond, not specified by the scan.

## Iterations and result

- **r1:** Complete draft, bar-duration checks passed. Automatic pagination produced four sparse pages; coda readings needed correction.
- **r2:** Corrected coda voicing/registers and removed an added pp at bar 31. Forced six systems per page, but page-compression warnings remained.
- **r3:** Adjusted only local staff/system spacing; retained staff size and achieved two pages without warnings. Reviewed repeated passages and small markings.
- **r4/final:** A staff-relative pitch check corrected the rising main phrase in bars 3-4 and all four later appearances. Moved the final grace-note slurs above their groups. Rebuilt and inspected both final pages.

The first three proofs and their exact LilyPond sources are in `evidence/`. They are **superseded drafts with known errors**, not alternate editions. Shared dependency hashes are recorded in `evidence/provenance.json`; these files were unchanged during the experiment. Current final source and PDF are tracked in Git.

## Validation and limitations

72 bar-boundary assertions per hand, two pages, zero compiler warnings, balanced MIDI note-on/off events, and 216 quarter-note beats per hand. Nineteen selected measure/hand pitch inventories check corrected or chromatically sensitive passages; additional comparisons check the recurring phrases and the final grace-note pitch sequence.

Both pages and enlarged passages were visually compared with the scan. These checks are performed by the same transcription workflow, not by an independent musical reviewer. Structural checks do not certify every pitch, fingering, or articulation. The result is ready for user review; no user approval has yet been recorded.

The raw scan remains local as `references/elfin-dance-scan.pdf`; its hash is in the reference manifest. Future corrections should cite measure and hand, then update this audit and the selected regression checks where appropriate.
