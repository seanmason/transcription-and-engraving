# 011 - Guarnieri fingering through chord transitions

Date / status: 2026-11-07; applied practice revision, visually reviewed. Fingering and hand division remain candidates for a piano trial.

## Question and hypothesis

Apply experiment 010's research while considering the previous and next chord, held bass notes and the right hand's availability. Replacing awkward 5-4 stretches should not create a different awkward stretch or leave the next gesture unprepared.

## Inputs and controls

Starting revision 55dff83; musical base is the scan-audited master from 009. The before proof is 009 R2. User: intermediate player, comfortable ninth, detailed large fingerings. Keep pitches, written durations, slurs, ties, accents, four-page pagination, staff geometry and shared fonts. Current manually editable input: scores/guarnieri-ponteio-15-fingered.ly. No automatic solver or piano trial is claimed.

## Reproduce

```sh
.tools/venv/bin/python render_guarnieri_fingered.py
.tools/venv/bin/python experiments/011-guarnieri-transition-fingering/check_realization.py
```

The first command compiles the handwritten source; it never generates fingerings. The second checks the stated hand allocation against the preserved 010 pitch inventory. It rewrites realization-check.json. Earlier 010 screening is now pinned to 009 R2 so it remains reproducible after the new hand-transfer notation. Its unqualified held-bass assumption is not the realization used here.

## Results and evidence

Reviewed all 156 lower-staff figuration chord events in context; changed 96 of their fingering representations. At 30 events, R-prefixed digits assign one or two notes to the right hand while retaining their staff placement. All such attacks occur after the preceding original RH gesture has ended. [Adjacent RH gestures](right-hand-transitions.md) record the incoming and outgoing notes for every takeover; [changes](changes.json) retain every old/new chord assignment, including unchanged ones.

P labels in bars 32-35 and 51-52 make a pedal-dependent realization explicit. A brief key follows the music on page 4, without an additional explanation page. Written durations remain intact; the MIDI does not model the editorial rolling/pedal realization. At the tied Bb entering 32, catch the already-sounding bass rather than re-striking it.

The original LH chord-level source digits are superseded by blue editorial assignments in this practice realization. They remain intact in the clean source and historical proofs. The black source 2-1 transitions in the closing RH line are retained. R indicates editorial hand division, not a composer marking.

- [R1 source](evidence/r1-source.ly), [R1 PDF](evidence/r1.pdf), [build validation](validation.json).
- [Realization check](realization-check.json): no distinct simultaneously held LH keys share a finger under the stated P realization; ordinary LH finger order is consistent; represented held LH spans do not exceed 14 semitones; represented 5-4 gaps are at most three semitones. These are narrow consistency checks, not measured ergonomic limits or a proof of playability.
- [Dense system](evidence/r1-dense.png), [e rall. clearance](evidence/r1-rall.png), [final chord alignment](evidence/r1-final-chord.png), [hash manifest](evidence-manifest.json).

## Transition review

Finger lists run from low to high. The phrase-by-phrase review below describes editorial reasoning; the associated movement has not been performed at an instrument.

| Bars | Arrival, movement and departure considered | Applied decision |
| --- | --- | --- |
| 1-5 | Repeated A/B/E upper shape over held F, then C/D over G; the larger D/A/B/G chord in 2 precedes RH A/E/A. | Upper 3-2-1 over bass 5; preserve that hand position through repeats. At 2/7 take G with R2, preparing the next thumb A. At 4/7 use LH 5-2-1 on D/A/C# rather than putting the lower fifth on 5-3. |
| 6-8 | F remains held as the upper shape moves to C/D/G. At the end of 6, D appears in both LH layers. F/G remains common across the next chromatic chord change. | Take G with R1 then release/move the thumb to G#; do not demand finger legato between those separate gestures. Both notated D4s in 6 use finger 5. Keep 4/3 on common F/G in 7-8. At 8's ending, R2 on D descends to thumb C. |
| 9-14 | Lower thirds, fifths and repeated upper notes require different solutions; tied basses remain available on 5. | Use upper 3-2-1 over the lower major-third gap in 9/11/13. R2 A to thumb G in 9; R2 G to thumb G in 11 gives an explicit repeated-note finger change. At 12 use R2 G to thumb F. At 13 use R2 G# to thumb A. At 14 the right thumb moves F to G after release. |
| 15-20 | Chromatic bass changes and retained upper notes lead into a lower register. | Keep close bass/inner-note shapes on 5-4 where appropriate. In 16, R2 G leads to thumb F, then R1 D moves to thumb Eb after release. In 17/19 the lower major thirds use 5-3. R2 Eb in 18 leads down to thumb D. In 20 retain 4 where the bass-to-inner distance is small. |
| 21-23 | No independent bass in 21-22; quartal LH shapes ascend through changing clefs. The bass returns in 23. | Keep 5-3-1 for the moving quartal shapes. In 23 retain full D/F/B/E = 5-4-2-1 rather than pushing the F-B tritone onto 3-2; the existing minor third on 5-4 is not the earlier major-third problem. |
| 24-28 | Several bass/upper combinations exceed a ninth. The right hand is free at the intervening LH attack and then resumes its original gesture. | Transfer the top note at the marked events. R2 on repeated E, C, A or Eb is followed by thumb 1, with rearticulation. At 26/7 take A4/D5 with R1/R3; LH holds G3/E4 with 5/1, then RH relocates to D#5/A#5/D#6. This is a deliberate shift, not a request to hold the preceding RH fifth while reaching the octave chord. |
| 29-31 | The former lower fifths and the G/Gb overlap need different solutions. | Transfer the top notes in 29/1, 30/1 and 31. At 30 hold G3 with 4, Cb4/Eb4 with 2/1 and give Ab4 to R2. This reserves 5 for the following lower Gb3; C4/F4 then use 2/1 while G remains on 4. The bass Gb eighth is subsequently rearticulated with 5. R2-to-thumb transitions resume the original RH gestures. |
| 32-35 | Sustained bass lies far below moving upper chords; keeping it physically held defeats any static fingering. The Bb entering 32 is tied. | P means sustain the bass with pedal and move the LH between upper 5-3-1 shapes. Catch the tied bass without a new attack; roll newly attacked wide combinations as required. Change pedal with harmony rather than holding one pedal through all four bars. This is a practical editorial realization with a timing/sonority tradeoff. |
| 36-46 | Reprise has the same opening and subsequent shapes, including G/G# and A/G RH transitions. | Mirror the corresponding earlier choices, including R2-to-thumb G at 46. This avoids relearning equivalent material. |
| 47-50 | G bass supports changing B/C or A/B inner shapes, with upper thumb motion. | Use upper 3-2-1 for B/C/E and B/C/G over G, keeping the inner fingers stable. Retain 4-3-1 on A/B/F and A/Bb/G, where the bass-to-inner distance is close; 50's Ab/B shape is separately retained. |
| 51-53 | Bass sonorities exceed a ninth, then LH quartal groups move upward while RH follows its source 2-1 gestures and closing tie. | Mark P for rolled/pedal-supported bass and relocation, retaining 5-3-1 for upper LH quartal groups. Release earlier notes of a rolled bass rather than stretching 2-1 across its wide upper interval. Keep RH 5 on the tied D; release for the final E octave chord. Retain final LH C/D/G/A = 5-4-2-1 and align its digits to the left for clarity. |

## Accuracy and visual review

Build checks: 53 measures, 106 bar checks, four pages, zero compiler warnings, MIDI byte-identical to a freshly compiled clean master. Existing source-mark qualifications in 009 are unchanged.

Inspected all four pages at a 1400-pixel long edge and enlarged dense-system crops from a 2400-pixel render. Refined P labels from dangling text to compact labels beside bass fingerings. Moved e rall. left of the crossing RH stem. Moved the final four-note LH fingering from a staggered group below to a vertical group at the left. Re-rendered and inspected all pages after the notation changes, then inspected the final page again after clarifying the tied-bass legend. No remaining text/numeral collisions or clipping were apparent in the reviewed renders. Staff-line interruptions behind digits are intentional whiteout.

## Decision and next action

Use this as the current practice edition. Hand redistribution is explicit and held bass conflicts have concrete solutions, rather than implicit pedal assumptions. Start piano testing with 2/7, 6/4, 23, 24/7-26/7, 30, 32-35 and 51-52. These include the remaining widest hand shapes, repeated-note transfers and pedal timing. User feedback may warrant a different allocation; the numeric checks cannot establish comfort at tempo.
