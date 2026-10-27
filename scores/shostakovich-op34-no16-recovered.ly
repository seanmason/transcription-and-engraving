\version "2.24.4"
#(set-global-staff-size 19)

\header {
  title = "Prelude"
  subtitle = "Op.34 No.16 - first two systems"
  composer = "Dmitri Shostakovich"
  tagline = \markup { \small "MiniMax transcription - for review" }
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 18\mm
  left-margin = 18\mm
  right-margin = 18\mm
  print-page-number = ##f
}

upper = {
  \clef treble
  \key bes \minor
  \time 4/4
  \tempo "Andantino" 4 = 120

  \partial 2
  <a'! c'' f'' a''!>2(\p |
  <bes' des'' f'' bes''>4) r4 r4
  bes'8.-2[ des''16-3-.] |
  f''2-5~
  \tuplet 3/2 {
    f''8_\markup \italic "marcato"[ ees'' des'']
  }
  \tuplet 3/2 {
    c''8[ des'' c'']
  } |
  \break

  \barNumberCheck #3
  bes'2( a'8) r8
  des''8.-.\finger "1"[ ees''16-.\finger "2"] |
  \barNumberCheck #4
  ees''2\finger "4"(
  \tuplet 3/2 {
    a''8 g''! a''
  }
  \tuplet 3/2 {
    bes''8 a'' g''
  } |
  \barNumberCheck #5
  ees''2( des''8) r8 g''4\finger "5" |
  \barNumberCheck #6
}

lower = {
  \clef bass
  \key bes \minor
  \time 4/4

  \partial 2
  r4 <f, f>4( |
  <bes,, bes,>4)_\finger "5"
  \clef treble
  <des'-3 f'-1>8.-.[
    <des' f'>16-.]
  <des' f'>4-. <des' f'>4-. |
  <des' f'>4-.
  <des' f'>8.-.[
    <des' f'>16-.]
  <des' f'>4-. <des' ees'>4-. |

  \barNumberCheck #3
  <f' aes'>4.-.
  <f' aes'>8.-.[
    <g' bes'>16-.]
  <g' bes'>8-. <g' bes'>4-. |
  \barNumberCheck #4
  <f' aes'>4.-.
  <f' aes'>8.-.[
    <g' bes'>16-.]
  <g' bes'>8-. <f' g'>4-. |
  \barNumberCheck #5
  <f' aes'>4.-.
  <f' aes'>8.-.[
    <g' bes'>16-.]
  <g' bes'>8-. <f' g'>8-. r8
  \clef bass |
  \barNumberCheck #6
}

\score {
  \new PianoStaff <<
    \new Staff = "RH" {
      \set Staff.midiInstrument = "acoustic grand"
      \upper
    }
    \new Staff = "LH" {
      \set Staff.midiInstrument = "acoustic grand"
      \lower
    }
  >>

  \layout {
    indent = #0
    line-width = 170\mm
    spacing-increment = #1.15
    ragged-last = ##f
    ragged-right = ##f
  }

  \midi {
  }
}
