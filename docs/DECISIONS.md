# Current decisions

Recorded 27 October 2026. These are working preferences, not claims of a finished house style.

| Area | Current direction | Reason / evidence |
| --- | --- | --- |
| Engine | LilyPond is the primary next-step candidate; retain MuseScore and Verovio comparisons | User approved the refined typography and full-score result; configurability was sufficient for these tests |
| Music symbols | Native renderer fonts | Text-font changes do not replace musical glyphs |
| Fingerings | `Engraving Fingering`, derived from Emmentaler-20 | Open-top 4 and curved foot of 2 addressed the specific user feedback |
| Finger metrics | Digits normalized to 700 units tall; width factor 0.88; italic shear 0.10; LilyPond size -3.6 | Equalized optical size; earlier italic 2 markup had the wrong base size |
| Tempo words | `Engraving Tempo`, Nimbus Roman Bold with +60 units advance per glyph | Finer serif shapes and more open spacing than previous trial |
| Expression text | C059 italic; smaller separate metronome numerals | Restrained hierarchy close to the reference impression |
| Tuplets | C059 Bold Italic, LilyPond size -2 | Distinguish rhythmic indications from upright fingerings |
| Page geometry | 235 x 310 mm; about 7 mm staff height | Reference-inspired test format; staff dimensions are chosen values, not asserted Henle measurements |
| Editing | Keep semantic corrections separate from renderer/style adaptations | Importers can lose accidentals/slurs or move endpoints; good appearance is not proof of accuracy |

Henle's proprietary fonts were neither obtained nor traced. The typography is an adaptation of free fonts. The C059-derived digit trial and default Nimbus fingerings are historical alternatives, not the current recipe.

Retain manually controlled line breaks while testing typography. Native pagination, page turns, cross-staff writing and broader repertoire remain open tests. Do not describe these results as a general scan-to-score pipeline: no OMR pipeline has been implemented.
