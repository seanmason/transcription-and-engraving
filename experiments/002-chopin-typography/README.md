# 002 - Chopin typography and numeral shapes

27 October 2026. Same passage as Henle HN185: Op. 9 No. 1, pickup and measures 1-2, at a common nominal 7 mm staff height.

[Detailed chronological notes](NOTES.txt) · [Current comparison](../../output/pdf/chopin-henle-side-by-side.pdf) · [Structural validation](evidence/validation.json)

## Trials and feedback

1. Initial engine comparison: user found text and number fonts the clearest mismatch.
2. C059 role-based typography: closer, but fingerings lacked elegance.
3. Narrowed C059 bold/italic digits: 88% width; regular weight trial was too light. Superseded.
4. Corrected italic treble 2s to use actual Fingering objects, with the same optical size as other digits. Replaced tempo face with spaced Nimbus Roman Bold.
5. Replaced text-font digits with normalized Emmentaler-20 numerals: open-top 4 and curved foot on 2. User response: “This is looking great!” This is the current direction.

Historical PDFs in `evidence/` are named **before** the next adjustment; they are not current recommendations. Earlier source states were not all saved, so those proofs are visual evidence, not fully reproducible historical builds. The current recipes and exports are preserved.

Canonical musical generator: `chopin_study.py`; it regenerates the MusicXML/native exports. Edit that script for persistent transcription changes. `styles/chopin-typography.ily` and the two active font recipes define current typography. `fonts/fingering/build_c059_trial.py` is the superseded trial recipe.

Validation: 51 pitched notes, eight slurs, exact measure lengths, native-export counts and MuseScore pitch multiset. Counts/multisets do not prove event order or every marking. Four pages visually compared with the reference. Remaining questions include long-curve shape and optical bar-width balance.

Build: `chopin_study.py`, `render_previews.py`, then `compare_chopin.py`, using `.tools/venv/bin/python`. The comparison requires the locally cached Henle preview (see setup).
