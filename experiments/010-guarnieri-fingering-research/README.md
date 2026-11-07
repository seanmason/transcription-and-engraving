# 010 - Guarnieri fingering research and span review

Date / status: 2026-11-07; research synthesis and diagnostic review completed. Candidate fingerings await keyboard trial. No new score proof or score edits in this experiment.

## Question and hypothesis

The user reports awkward gaps between fingers 5 and 4, especially in four-note chords. Does the practice edition overuse 5 for bass plus 4-3-1 for the upper chord? Combining the voices should expose awkward internal stretches that an overall ninth-reach criterion misses.

## Inputs and controls

Current practice source at Git revision 8b4473e, corresponding to experiment 009 R2; source hash recorded in span-audit.json. Audited pitches remain authoritative subject to 009's documented source-mark qualifications. User: intermediate, comfortable ninth, detailed large fingerings requested. No new hand measurements or piano trial. Engraving/fonts/layout unchanged.

## Reproduce

```sh
.tools/venv/bin/python experiments/010-guarnieri-fingering-research/audit_spans.py
```

The score-specific script reads the existing master and rewrites only span-audit.json. It is not a general LilyPond parser or fingering solver. It combines the notated bass with each LH figuration attack, conservatively assuming the bass remains finger-held. It checks bar durations between layers and selected known pitch/flag cases. It does not model pedal, RH fingerings, key depth, or neighbouring movements. The standalone final bass chord is checked manually in the synthesis, not counted as a figuration attack.

## Results and evidence

- [Knowledge base and concrete alternatives](../../docs/PIANO_FINGERING.md): six linked sources, distinctions between evidence and proposed applications, seven comparison cases and the exceptional-passage queue.
- [Diagnostic data](span-audit.json): 156 LH figuration attacks; 87 trigger at least one review flag under the held-bass assumption. Categories overlap: 75 have a 5-4 span of at least four semitones, 24 exceed a major ninth overall, 13 reuse a finger for distinct sounding pitches, and 13 violate conventional descending LH finger order. These are repeated **review flags, not counts of proven unplayable chords**. Earlier pedal-release assumptions resolve some static flags, but are not evident from the digits alone.
- The opening F3/A3/B3/E4 is a concrete case for comparing 5-3-2-1 with the old 5-4-3-1. The final C5/D5/G5/A5 is a counterexample: its 5-4 whole tone is reasonable, and a blanket replacement is unwarranted.
- Source-reading limits: the Parncutt paper, Logan proceedings, Spanswick article, Henle editor comment and Yamaha article were opened. Jacobs was available only as a public abstract. The blocked Pianist article and unavailable Piano Magazine PDF were not used as substantive evidence. No full third-party articles copied into Git.

## Accuracy and visual review

Manually checked representative source events at bars 1, 6, 12, 19, 23, 30-35, 51-53 against the current LilyPond master. This is an ergonomic reappraisal, not another scan transcription audit. The script asserts opening pitches F3/A3/B3/E4 and its four-semitone 5-4 gap, absent bass in 21-22, the bar 30 inverted ordering, and final LH pitches C5/D5/G5/A5. Equal per-bar durations are checked for all 53 measures. No PDF changed, so no new visual proof is claimed. The current PDF retains the earlier fingerings; do not confuse researched alternatives with an applied revision.

## Decision and next action

Reject the blanket bass-5/upper-4-3-1 policy. Prefer testing 5-3-2-1 where it relieves the lower major third without introducing another awkward interval. Retain 4 where the shape warrants it. For fifths between 5 and 4, duplicated fingers and spans beyond a ninth, develop a complete hand-division or pedal/roll plan before updating digits. Keep the user's reported awkwardness as evidence; computer checks do not supersede it. Apply selected candidates in a separately preserved score revision, with explicit execution guidance for exceptional passages and a new visual review.
