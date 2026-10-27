\version "2.26.0"
\include "styles/common.ily"
\include "styles/lily-classical.ily"
\include "styles/chopin-typography.ily"
\paper {
 paper-height = 190\mm
 top-margin = 13\mm bottom-margin = 12\mm
 system-system-spacing.basic-distance = #23
 system-system-spacing.minimum-distance = #20
 system-system-spacing.padding = #6
 oddFooterMarkup = \markup \fill-line { \fontsize #-3 "Engraving study · recovered transcription · pickup and measures 1–5" }
 evenFooterMarkup = \oddFooterMarkup
}
\header {
 title = \markup \override #'(font-name . "C059") \fontsize #2 "Prelude"
 subtitle = \markup \override #'(font-name . "C059") \fontsize #-1 "Op. 34 No. 16"
 composer = \markup \override #'(font-name . "C059") \fontsize #-1 "Dmitri Shostakovich"
 tagline = ##f
}
upper = {
  \clef treble
  \key bes \minor
  \time 4/4
  \tempo \markup \concat { \override #'(font-name . "Engraving Tempo") "Andantino" " " \fontsize #-4 { \rhythm { 4 } " = 120" } }

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
  \new Staff = "RH" { \upper }
  \new Staff = "LH" { \lower }
 >>
 \layout { indent = 0\mm ragged-last = ##f ragged-right = ##f }
 \midi { \tempo 4 = 120 }
}
