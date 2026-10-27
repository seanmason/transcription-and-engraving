\version "2.26.0"
\include "styles/common.ily"
\include "styles/lily-classical.ily"
\include "styles/chopin-typography.ily"
\header {
 title = \markup \override #'(font-name . "C059") \fontsize #2 "Prelude"
 subtitle = \markup \override #'(font-name . "C059") \fontsize #-1 "Op. 34, No. 16"
 composer = \markup \override #'(font-name . "C059") \fontsize #-1 "Dmitri Shostakovich"
 tagline = ##f
}
\paper {
 print-page-number = ##t
 oddFooterMarkup = \markup \fill-line { "" \fromproperty #'page:page-number-string }
 evenFooterMarkup = \oddFooterMarkup
 ragged-bottom = ##f
 ragged-last-bottom = ##f
 system-system-spacing.basic-distance = #19
 system-system-spacing.minimum-distance = #17
 system-system-spacing.padding = #4
}
\layout {
 \context { \Score
  pedalSustainStyle = #'bracket
  \override MetronomeMark.padding = #2
 }
 \context { \PianoStaff \override StaffGrouper.staff-staff-spacing.basic-distance = #12 }
}
rh = {
 \set fingeringOrientations = #'(up)
 \clef treble \key bes \minor \time 4/4
 \tempo \markup \concat { \override #'(font-name . "Engraving Tempo") "Andantino" " " \normal-text \fontsize #-4 { "(" \rhythm { 4 } " = 120)" } }
 \partial 2 <a'! c'' f'' a''!>2(\p | \barNumberCheck #1
 
 <bes' des'' f'' bes''>4) r4 r4 bes'8.-2[ des''16-3-.] | \barNumberCheck #2
 f''2-5~ \tuplet 3/2 { f''8_\markup\italic "marcato"[ ees'' des''] } \tuplet 3/2 { c''8[ des'' c''] } | \barNumberCheck #3 \break
 
 bes'2~ bes'8 r8 des''8.-1[ f''16-2] | \barNumberCheck #4
 bes''2-4~ \tuplet 3/2 { bes''8[ a''! bes''] } \tuplet 3/2 { c'''8[ bes'' a''] } | \barNumberCheck #5
 f''2~ f''8 r8 bes''4-5-- | \barNumberCheck #6 \break
 
 ges''4-3-- ees''4-2-- c''8--[ bes''8--_\markup\italic "cresc."] a''!8--[ g''!8--] | \barNumberCheck #7
 g''!4-1-- e''!4-2-- des''!8--[ c'''8--] bes''8--[ aes''!8--] | \barNumberCheck #8
 e'''!2.-5(\mf_\markup\italic "espr. dim." des'''4-3 | \barNumberCheck #9 \break
 
 a''!2)-1~ a''8_\markup\italic "marc."[ bes''8-4] a''8[ g''!8] | \barNumberCheck #10
 a'!4-1\p c''8.-2[ e''!16] a''!4-5 a''4-2 | \barNumberCheck #11
 d'''!2-5 a''!2 | \barNumberCheck #12
 bes''4-4 aes''!8[ ges''8] f''8[ ees''8-3] des''!8[ c''8] | \barNumberCheck #13 \break
 
 bes'2-2~ bes'8 r8 \once \override TupletNumber.direction = #UP \tuplet 3/2 { des''8-1([ f'' aes'']) } | \barNumberCheck #14
 eeses'''8 des'''4.~ \tuplet 3/2 { des'''8[ c''' bes''] } \tuplet 3/2 { a''!8[ bes''-4 c'''] } | \barNumberCheck #15
 bes''4 f''4-2 bes'4-1 <d'!-1 fis'-3>8.[_\markup\italic "cresc." <d' fis'>16(] | \barNumberCheck #16 \pageBreak
 
 <ees' g'!>4)_\markup\italic "espr." <g' bes'>8.-2[ <bes' ees''>16] <ees''-3 ges''!-5>4 <des''! f''!>4 | \barNumberCheck #17
 <c'' ees''>4 <ees'' aes''>8.-2[ <aes'' c'''>16-4] <c''' ees'''>4-5 <b''! d'''!>4 | \barNumberCheck #18
 <bes''! des'''!>4\mf <des''-1 bes''-4>8.[ <f''-2 des'''-5>16] <ees''-1 c'''-5>8[ <des''-1 bes''-4>8] <f''-2 des'''-5>8[ <c''-1 b''!-4>8] | \barNumberCheck #19
 <des''-1 bes''-5>2\> r4 \clef bass \tuplet 3/2 { bes,8-1\!\mf_\markup\italic "marc."[ des-2 f-3] } | \barNumberCheck #20 \break
 
 bes8-5-. f4.~^\markup \override #'(font-name . "Engraving Fingering") \fontsize #-3.6 \combine \concat { "3" \hspace #0.12 "4" } \path #0.10 #'((moveto 0.35 1.55) (curveto 0.7 2.05 1.4 2.05 1.75 1.55))
 \tuplet 3/2 { f8[ ees8-._\markup\italic "dim." des8-.] } \tuplet 3/2 { c8-.[ des8-. c8-.] } | \barNumberCheck #21
 \tuplet 3/2 { bes,8-.\p_\markup\italic "cresc."[ c8-. bes,8-.] }
 \tuplet 3/2 { a,!8-1-.[ c8-2-. e!8-1-.] }
 \tuplet 3/2 { a!8-3-.[ bes8-. a8-.] }
 \tuplet 3/2 { g!8-1-.[ bes8-2-. d'!8-3-.] } \clef treble | \barNumberCheck #22
 \tuplet 3/2 { a'!8-1-.\f[ c''8-2-. e''!8-3-.] } a''!4-5~
 \tuplet 3/2 { a''8[ ges''8-1-> a''8->] } \tuplet 3/2 { b''!8->[ a''8-1-> b''8->] } | \barNumberCheck #23 \break
 
 ces'''4-3->\sf \tuplet 3/2 { bes''8-1[ des'''8-2 f'''8] } aes'''8 r8 g''!8.-5\ff[ e''!16] | \barNumberCheck #24
 g'!4 fis''8.[ d''!16] fis'4 f''!8.[ des''16] | \barNumberCheck #25
 bes'!2_\markup\italic "dim."~ bes'8 r8 f''4-2 | \barNumberCheck #26 \break
 
 bes''2\p~ bes''8 r8 \clef bass ges4-2 | \barNumberCheck #27
 ces'2-5\mp~ \tuplet 3/2 { ces'8[ ges8-2-._\markup\italic "marc." aes8-.] } \tuplet 3/2 { bes8-.[ aes8-. bes8-.] } | \barNumberCheck #28
 ces'!2~ \tuplet 3/2 { ces'8[ ges8-. aes8-.] } \tuplet 3/2 { bes8-.[ aes8-. bes8-.] } \clef treble | \barNumberCheck #29 \break
 
 \tuplet 3/2 { ces'8-1-.[ ees'8-2-. ges'8-.] } ces''2.->\mf_\markup\italic "dim." | \barNumberCheck #30
 r4\p <a'! c''! f'' a''!>4 <bes' des'' f'' bes''>4 \clef bass f,4 | \barNumberCheck #31
 bes,4 r4 r2 \bar "|." \barNumberCheck #32
 
}
lh = {
 \set fingeringOrientations = #'(down)
 \clef bass \key bes \minor \time 4/4
 \partial 2 r4 <f, f>4( | \barNumberCheck #1
 
 <bes,, bes,>4)_5 \clef treble <des'_3 f'_1>8.-.[ <des' f'>16-.] <des' f'>4-. <des' f'>4-. | \barNumberCheck #2
 <des' f'>4-. <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-. <des' ees'>4-. | \barNumberCheck #3
 
 <des' f'>4-. <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-. <des' f'>4-. | \barNumberCheck #4
 <des' f'>4-. <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-. <des' ees'>4-. | \barNumberCheck #5
 <des' f'>4-. <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-. r4 \clef bass | \barNumberCheck #6
 
 bes4_2-- c'4-- a!4-- c'4-- | \barNumberCheck #7
 g!4-- bes!4-- f4-- aes!4-- | \barNumberCheck #8
 e!8_5--[ a!8_3--] c'8_2--[ g'!8--] fes'4(_\markup\italic "espr." ees'4) | \barNumberCheck #9
 
 e'!8_1--[ ees'8_2--] d'!8_3--[ des'8_1--] bes,4-- r4 | \barNumberCheck #10
 r4\sustainOn a,!4 <e! c'>4 a,4\sustainOff | \barNumberCheck #11
 r4\sustainOn a,!4 <d! c'>4 ges,4\sustainOff | \barNumberCheck #12
 r4\sustainOn bes,4 <ees ees'!>4 bes,4\sustainOff \clef treble | \barNumberCheck #13
 
 r4 <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-. <des' f'>4-. | \barNumberCheck #14
 <des' f'>4-. <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-. <des' ees'>4-. | \barNumberCheck #15
 <des' f'>4-. <des' f'>4-. <d'! fis'>4-. r4 \clef bass | \barNumberCheck #16
 
 \after 1 \sustainOff <ees,, ees,>1\sustainOn | \barNumberCheck #17
 <aes,, aes,>2~\sustainOn <aes,, aes,>8\sustainOff[ <bes,, bes,>16 <c, c>16] <d,! d!>8[ <e,! e!>8] | \barNumberCheck #18
 <f, f>4\sustainOn <f bes des'!>4\sustainOff <f, f>4\sustainOn <f a! ees'!>4\sustainOff | \barNumberCheck #19
 <bes,, bes,>4\sustainOn \clef treble <des'_4 f'_2>8.-.\sustainOff[ <des' f'>16-.] <des' f'>4-. <des' f'>4-. | \barNumberCheck #20
 
 <des' f'>4-. <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-. <des' ees'>4-. | \barNumberCheck #21
 <des' f'>4-. r4 r2 \clef bass | \barNumberCheck #22
 <g,,! g,!>4\sustainOn <g! bes d'!>4\sustainOff <f,, f,>4\sustainOn <f a! ees'>4\sustainOff | \barNumberCheck #23
 
 <bes,, bes,>4\sustainOn <f bes des'!>4~ <f bes des'>8\sustainOff r8
 << { \voiceOne <g! b! e'!>4~\sustainOn } \\ { \voiceTwo r4 } >> | \barNumberCheck #24
 << { \voiceOne <g b e'>4 <fis a! d'!>2\sustainOff\sustainOn \after 4 \sustainOff <fis a cis'>4 } \\ { \voiceTwo <b,,! b,!>2 <f,,! f,!>2 } >> \oneVoice | \barNumberCheck #25
 \tuplet 3/2 { r8 <f,,! f,!>8[_\markup\italic "marc." <g,,! g,!>8] } \tuplet 3/2 { <a,,! a,!>8[ <g,, g,>8 <a,, a,>8] } <bes,,! bes,!>2 | \barNumberCheck #26
 
 \tuplet 3/2 { r8 <f,, f,>8[ <g,,! g,!>8] } \tuplet 3/2 { <a,,! a,!>8[ <g,, g,>8 <a,, a,>8] } <bes,, bes,>8 r8 r4 | \barNumberCheck #27
 r4\sustainOn \clef treble <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-.\sustainOff <des' ees'>4-. | \barNumberCheck #28
 r4\sustainOn <des' f'>8.-.[ <des' f'>16-.] <des' f'>4-.\sustainOff <des' ees'>4-. | \barNumberCheck #29
 
 r4 r8 \clef bass aes16_2[_\markup\italic "marc." aes16] aes8[ aes16 aes16] aes16[ aes16 aes16 aes16] | \barNumberCheck #30
 aes4.(\sustainOn ges8\sustainOff f!8[ ges8_1] ees8[ des8] | \barNumberCheck #31
 bes,4) \ottava #-1 f,,4 bes,,,4 \ottava #0 r4 \bar "|." \barNumberCheck #32
 
}
\score {
 \new PianoStaff << \new Staff = "RH" \rh \new Staff = "LH" \lh >>
 \layout { }
 \midi { \tempo 4 = 120 }
}
