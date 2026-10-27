\paper { property-defaults.fonts.serif = "Nimbus Roman" }
\layout {
 \context { \Score
  \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  \override SpacingSpanner.spacing-increment = #1.15
  \override SpacingSpanner.shortest-duration-space = #2.2
  \override BarNumber.font-size = #-2
  \override BarNumber.font-series = #'medium
 }
 \context { \Staff
  \override StaffSymbol.thickness = #0.85
  \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #11.5
  \override VerticalAxisGroup.staff-staff-spacing.minimum-distance = #10
  \override VerticalAxisGroup.staff-staff-spacing.padding = #2
 }
 \context { \Voice
  \override Stem.thickness = #1.05
  \override Beam.beam-thickness = #0.48
  \override Slur.thickness = #1.6
  \override Slur.height-limit = #2.8
  \override Slur.ratio = #0.3
  \override Tie.thickness = #1.1
  \override Hairpin.thickness = #1.0
  \override Hairpin.height = #0.55
  \override Fingering.font-size = #-3
  \override Fingering.font-name = "Nimbus Roman"
  \override DynamicText.font-size = #-0.5
 }
}
