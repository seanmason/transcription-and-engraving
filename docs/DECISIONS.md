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

## Longer-score result (30 October 2026)

Experiment 006 retains the existing fonts and staff size in a five-page La Valse d'Amelie candidate. Score-local voice settings preserve sustained notes alongside eighth-note figuration; coincident black heads merge, while black/white duration distinctions remain. Explicit page groups and `noPageBreak` constraints produced a warning-free layout after a forced page-count trial compressed the final page. This is a reviewed candidate, not a new user-approved style change.

## Cross-staff working proof (7 November 2026)

Experiment 007 retains the accepted typography in a four-page Guarnieri Ponteio No. 15 proof. Score-local Staff VerticalAxisGroup spacing and horizontal automatic beams worked better than forced beam coordinates. The original three-page density compressed the enlarged staff gaps. This is a layout result only: unresolved chord/accidental readings are documented and prevent treating the transcription as finished. No shared style change or user acceptance is implied.

## 2026-11-07: Separate Guarnieri practice fingering

Experiment 008 adds detailed fingering in a separate editable score for the user's comfortable ninth. Keep the clean master unchanged. Blue editorial digits, black existing digits; LH beside notes, RH above. A guide describes pedal-assisted bass releases and rolled spans. This is provisional: underlying transcription uncertainties remain and no piano testing was performed. Do not infer correctness or ergonomic validation from MIDI equality.

Guarnieri practice-edition readability revision: user requested substantially larger fingering. Use score-local size 0 (approximately 52% larger than -3.6), preserving the accepted numeral face and all shared typography defaults. See experiment 008 R2.

Guarnieri practice layout R3: use four systems per full music page, retaining the larger digits. Final page has the remaining three systems without vertical justification. Four music pages plus one guide page; supersedes the overly spacious three-system layout.

Guarnieri practice R4: tighter bass/treble spacing (basic 17, minimum 15 staff spaces, stretchability 0) replaces the over-conservative 23/21 setting. Resolve expression collisions with local offsets, not global extra space. Four-system pagination and larger digits retained; all music pages visually reviewed.

Guarnieri practice R5: user requested more readable digits again. Current score-local fingering size is 1.5, with whiteout behind the numerals to interrupt staff lines locally. Shared typeface and compact page/staff geometry unchanged.

Guarnieri R6: remove the explanatory opening page per user request. Current PDF contains four music pages; retained historical proofs preserve the guide. Added first-page header clearance for the enlarged fingerings.

Guarnieri R7: remove the practice/provisional subtitle at user request. Correct expression placement locally around cross-staff beams and large digits; retain four pages and size-1.5 fingerings. Musical qualification remains in repository documentation rather than the title block.

Guarnieri bars 19-20: targeted rereading corrects several pitch/register and accidental-carry errors, plus the C3 tie across the barline. Apply to both clean and fingered masters; see experiment 007 bars-19-20-review.md. Other uncertain passages remain open.

## 2026-11-07: Guarnieri full scan audit

Experiment 009 supersedes the photograph-based musical queue after comparing every bar with the new scan. Adopt the corrected clean/fingered masters; keep the established typography, four-page layout and large digits. Count actual ledger lines, and apply accidentals across voices within a staff before deciding whether a same-position curve is a tie. Bar 32 has an unresolved dot; bar 39's isolated dot is read as staccato with lower confidence. Record these editorial limits outside the score title. No claim of independent certification or piano-tested fingering.

- 2026-11-07: Guarnieri 009 R2 is the current fingered practice proof: retain large digits/four pages, add continuation-page top clearance and locally clear bar 34 e rall. from its beam. Musical content matches the audited clean edition.
