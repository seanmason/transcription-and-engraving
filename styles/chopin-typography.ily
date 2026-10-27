% Henle-inspired text roles. Music symbols retain each engine's native font.
\paper { property-defaults.fonts.serif = "C059" }
\layout {
 \context { \Score
  \override MetronomeMark.font-size = #1
  \override TupletNumber.font-name = "C059 Bold Italic"
  \override TupletNumber.font-size = #-2
 }
 \context { \Voice
  \override TextScript.font-series = #'medium
  \override TextScript.font-size = #0
  \override Fingering.font-name = "Engraving Fingering"
  \override Fingering.font-size = #-3.6
 }
}
