# 008 - Guarnieri practice fingering

7 November 2026. Status: reviewed visually; provisional, awaiting piano trial. Not an accepted performance edition.

## Question and hypothesis

Can consistent fingering clarify the interlocking voices for an intermediate player who comfortably reaches a ninth? The user requested detailed fingering throughout. Repeated RH gestures use thumb then 2-5; LH choices must account for the independent bass, not just the upper chord.

## Inputs and controls

Base: [experiment 007](../007-guarnieri-ponteio-15/README.md), source at commit 4f33852. Same 53 bars, pitches, rhythms, articulation, tempo and font assets. The source's unresolved musical readings remain unresolved. Opening photograph crop was inspected again; no comprehensive new transcription audit was performed.

New [editable practice source](../../scores/guarnieri-ponteio-15-fingered.ly) is separate from the clean master. Fingering was entered using explicit LH choices by measure and recurring RH patterns, then revised in the editable source. Temporary entry scripts are not supported generators; edit this source directly. No automatic global fingering solver or physical piano testing is claimed.

## Reproduce

```sh
.tools/venv/bin/python render_guarnieri_fingered.py
```

The builder compiles the practice source and freshly compiles the clean source to a temporary location, then compares their MIDI byte-for-byte. It checks 106 bar checks, compiler warnings and five PDF pages, and creates previews. It never regenerates or overwrites either source. Requires the established LilyPond/font setup and pypdf/Poppler used elsewhere in this repository.

Output: [practice PDF](../../output/pdf/guarnieri-ponteio-15-fingered.pdf). Page 1 contains the guide; four music pages follow, covering bars 1-14, 15-27, 28-41 and 42-53.

## Fingering reasoning and exceptions

- RH repeated low note / upper pair: 1 then 2-5. This supports the octave outline; move between gestures rather than retaining the first note. Octave triads use 1-3-5. Black-key thumb notes require a deeper hand position.
- LH bass generally 5, upper clusters generally 4-3-1 or 4-2-1. Tied bass continuations repeat the number for explicit guidance, not rearticulation.
- Bars 2/37: source digit 2 is retained on the highest LH note, with 5-4 below; 5-4-1 is the suggested alternative if 5-4-2 feels strained. The simultaneously written bass-to-top span exceeds a ninth. The guide explicitly proposes rolled/pedal-assisted execution, not impossible finger sustain.
- Bars 12 and 23-28 also contain upper chords using 5 while the bass sounds: release the bass to pedal before changing position. This is a proposed realization, not an authenticated composer pedal instruction.
- Bar 30: D4 bass lies inside Bb3/Db4/Gb4. Revised combined ascending order to 5/4/3/1, with bass finger 3, avoiding a reversed hand/finger assignment.
- Closing RH source 2-1 transitions retained; use 1-5 on the sixth and retain 5 over the E tie. Closing bass sonorities, as currently transcribed, require rolling and relocation. These bars should not be drilled before pitch verification.
- Existing chord-level 2s are interpreted as highest-note fingerings; this attachment is editorial and still needs source confirmation. Existing digits are black; proposed digits dark blue.

## Results and evidence

An initial disposable layout put all chord fingerings above the beams. It separated LH digits too far from their notes and crowded the opening tempo. Revised LH digits to the left of noteheads, kept RH digits above, and raised the opening tempo. Expanded from four to five music pages, with three systems per page and additional staff separation. Shared styles unchanged.

[R1 source](evidence/r1-source.ly) and [R1 PDF](evidence/r1.pdf) preserve the final named practice proof. All six pages inspected after the placement revisions at a 1400-pixel long edge. No page clipping or tempo/fingering collision observed. Dense LH digits remain small at the established font size and should be assessed in print.

[Validation](validation.json): six pages, 106 bar checks, no compiler warnings, MIDI byte-identical to a fresh compilation of the base. This establishes that fingering did not change the encoded music. It does not establish musical accuracy, comfortable transitions at tempo, or pedal clarity.

## Decision and next action

Retain the separate, fully fingered practice edition and its explicit execution guide. Resolve the substantive musical queue (19-20, 24-35, 51-53) before calling these fingerings reliable for performance. The general pattern assignments are candidates for piano trial, not certified optimal choices. User feedback on actual transitions remains necessary.

Notation reference used: [LilyPond 2.26 fingering instructions](https://lilypond.org/doc/v2.26/Documentation/notation/inside-the-staff.html). The documentation supports digit placement only; it does not substantiate the musical fingering decisions.

## R2 - larger digits following user feedback

The user found the digits too small. Increased the score-local Fingering.font-size from the inherited -3.6 to 0, about 52% larger linearly. Both editorial and existing digits retain the accepted Engraving Fingering face. Shared styles remain unchanged. [R2 source](evidence/r2-source.ly) and [R2 PDF](evidence/r2.pdf) preserve this revision. Inspected all five music pages; no new note/accidental collisions or clipping observed. Six pages, zero compiler warnings, MIDI identical to freshly compiled base. The guide is unchanged.

## R3 - four systems per page

User requested less empty space. Replaced the three-system pagination with four systems on each full music page and three on the final page; the final page remains ragged-bottom rather than spreading its systems. Larger size-0 fingerings, staff size and staff separation are unchanged. Five PDF pages total including the guide. [R3 source](evidence/r3-source.ly) and [R3 PDF](evidence/r3.pdf) preserve the revised layout. Inspected all four music pages: inter-system digits remain separated, and no new collisions or clipping observed. Warning-free build; MIDI identical to the freshly compiled base. Updated the builder page-count assertion. Musical/fingering uncertainties remain unchanged.

## R4 - tighter grand-staff spacing

User requested reducing the excessive bass/treble gap and a visual check. Reduced Staff VerticalAxisGroup basic/minimum distances from 23/21 to 17/15 staff spaces, aligned StaffGrouper settings, and set intra-staff stretchability to 0 so page justification does not inflate this gap. Retained four systems on full pages, size-0 fingerings, and the guide.

Inspected every music page. The first compact proof exposed crowding at a tempo and hairpins near LH digits. Raised hairpins locally in bars 12, 37 and 49; moved a tempo above the treble staff and offset it clear of the first fingering stack. Re-rendered and inspected the affected pages after corrections. A discarded rehearsal-mark implementation added a MIDI marker and failed byte equality; final text-script placement preserves MIDI exactly. Final build: five pages, zero warnings, MIDI byte-identical to the clean base. [R4 source](evidence/r4-source.ly), [R4 PDF](evidence/r4.pdf). No new page clipping or expression/fingering collisions observed in the final proof. Musical uncertainties unchanged.
