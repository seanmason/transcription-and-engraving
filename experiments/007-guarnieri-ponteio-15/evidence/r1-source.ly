% Manual transcription from the user's photographs, printed pages 11–13.
% Canonical editable master; review/provenance in experiment 007.
\version "2.26.0"
\include "styles/common.ily"
\include "styles/lily-classical.ily"
\include "styles/chopin-typography.ily"
\header {
 title = \markup \override #'(font-name . "C059") \fontsize #2 "Ponteio No. 15"
 composer = \markup \override #'(font-name . "C059") "M. Camargo Guarnieri"
 dedication = \markup \italic "a Guilherme Fontainha"
 tagline = ##f
}
\paper {
 print-page-number = ##t
 oddFooterMarkup = \markup \fill-line { "" \fromproperty #'page:page-number-string }
 evenFooterMarkup = \oddFooterMarkup
 ragged-bottom = ##f ragged-last-bottom = ##f
 system-system-spacing.basic-distance = #22
 system-system-spacing.minimum-distance = #18
 system-system-spacing.padding = #3
}
\layout {
 \context { \PianoStaff
  \override StaffGrouper.staff-staff-spacing.basic-distance = #16
  \override StaffGrouper.staff-staff-spacing.minimum-distance = #14
  \override StaffGrouper.staff-staff-spacing.padding = #3
 }
 \context { \Staff
  \override TimeSignature.style = #'numbered
  \override TimeSignature.break-visibility = #end-of-line-invisible
  \override NoteCollision.merge-differently-dotted = ##t
 }
 \context { \Voice
  \override Beam.auto-knee-gap = #2
  \override Fingering.direction = #UP
 }
}
up = { \change Staff = "RH" \stemDown }
down = { \change Staff = "LH" \stemUp }
figuration = {
 \time 2/2 \clef treble \autoBeamOff
 \override TextScript.font-name = "C059 Italic"
 \tempo \markup \override #'(font-name . "Engraving Tempo") "Incisivo" 2 = 120
 % Measure 1
 \down <a b e'>8[->\f \up e'8(-> \up <b' e''>8)-> \down <a b e'>8]-> \up e'8[(-> \up <b' e''>8)-> \down <c' d'>8-> \up <dis' ais' dis''>8]->  | \barNumberCheck #2
 % Measure 2
 \down <a b e'>8[-> \up e'8(-> \up <b' e''>8)-> \down <a b e'>8]-> \up e'8[(-> \up <b' e''>8)-> \down <a b g'>8->-2 \up <a' e'' a''>8]->  | \barNumberCheck #3
 % Measure 3
 \down <a b e'>8[^\markup \italic "simili" \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <d' a' d''>8]  | \barNumberCheck #4
 \break \noPageBreak
 % Measure 4
 \down <a b>8[ \up b8( \up <f' b'>8) \down <a b>8] \up b8[( \up <f' b'>8) \down <a cis'>8 \up <d' a' d''>8]  | \barNumberCheck #5
 % Measure 5
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <dis' ais' dis''>8]  | \barNumberCheck #6
 % Measure 6
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <c' d' g'>8] \up gis'8[( \up <dis'' gis''>8) \down \clef treble <d' e' a'>8 \up <ais' e'' ais''>8]  | \barNumberCheck #7
 % Measure 7
 \down <f' g' b'>8[ \up b'8( \up <f'' c'''>8) \down <fis' g' a'>8] \up b'8[( \up <f'' c'''>8) \down <f' ges' ces''>8 \up <d'' aes'' d'''>8]  | \barNumberCheck #8
 \break \noPageBreak
 % Measure 8
 \down <f'! g'! b'>8[ \up b'8( \up <f'' b''>8) \down <fis' g' a'>8] \up b'8[( \up <f'' b''>8) \down <e' aes' des''>8-2 \up <c'' g'' c'''>8]  | \barNumberCheck #9
 % Measure 9
 \down <f' ges' b'>8[ \up b'8( \up <f'' b''>8) \down <f' g' c''>8] \up b'8[( \up <f'' b''>8) \down <d' e' a'>8 \up <g' d'' g''>8]  | \barNumberCheck #10
 % Measure 10
 \down <b d' f'>8[ \up f'8( \up <c'' f''>8) \down <c' d' e'>8] \up f'8[( \up <c'' f''>8) \down <b c' g'>8 \up <f' c'' f''>8]  | \barNumberCheck #11
 % Measure 11
 \down <b c' e'>8[ \up e'8( \up <b' e''>8) \down <b c' g'>8] \up g'8[( \up <d'' g''>8) \down <g b e'>8 \up <e' b' e''>8]  | \barNumberCheck #12
 \break \noPageBreak
 % Measure 12
 \time 3/2 \down \clef bass <bes c' ees'>8[ \up ees'8( \up <bes' ees''>8) \down <a b e'!>8] \up f'8[( \up <c'' f''>8) \down <b c' g'>8-2 \up f'8]( \up <c'' f''>8[) \down <a b d'>8 \up e'8( \up <b' e''>8])  | \barNumberCheck #13
 % Measure 13
 \time 2/2 \down <b! c' e'>8[ \up e'!8( \up <b'! e''!>8) \down <b c' gis'>8] \up a'8[( \up <e'' a''>8) \down <a b g'!>8 \up <e' b' e''>8]  | \barNumberCheck #14
 % Measure 14
 \down <aes c' ees'>8[ \up ees'8( \up <bes' ees''>8) \down <a c' d'>8] \up ees'8[( \up <bes' ees''>8) \down <c' d' g'>8 \up <g' d'' g''>8]  | \barNumberCheck #15
 \break \noPageBreak
 % Measure 15
 \down <aes c' ees'>8[ \up g'8( \up <c'' g''>8) \down <b c' aes'>8] \up g'8[( \up <d'' g''>8) \down <g c' f'>8 \up <ees' bes' ees''>8]  | \barNumberCheck #16
 % Measure 16
 \down <g bes c'>8[ \up d'8( \up <aes' d''>8) \down <bes c' g'>8] \up f'8[( \up <c'' f''>8) \down <g b c'>8 \up <ees' bes' ees''>8]  | \barNumberCheck #17
 % Measure 17
 \down <g aes c'>8[ \up c'8( \up <g' c''>8) \down <g a ees'>8] \up d'8[( \up <a'! d''>8) \down <f g c'>8 \up <bes f' bes'>8]  | \barNumberCheck #18
 \pageBreak
 % Measure 18
 \time 3/2 \down <f aes c'>8[ \up d'8( \up <aes' d''>8) \down <a b ees'>8] \up f'8[( \up <c'' f''>8) \down <a b e'>8-2 \up d'8]( \up <b' e''>8[) \down <g b d'>8 \up b!8( \up <f'! b'!>8])  | \barNumberCheck #19
 % Measure 19
 \time 2/2 \down <f g bes>8[ \up bes8( \up <f' bes'>8) \down <f g d'>8] \up g8[( \up <d' g'>8) \down <d f aes>8 \up <a f' b'>8]  | \barNumberCheck #20
 % Measure 20
 \down <d f aes>8[ \up ges8( \up <c' ges'>8) \down <ees f a>8] \up e8[( \up <c' f'>8) \down <aes, ees fes>8 \up <f c' f'>8]  | \barNumberCheck #21
 \break \noPageBreak
 % Measure 21
 \down <d, g, c>8[\f \up e8( \up < b e'>8) \down <e g c'>8] \up b8[( \up <fis' b'>8) \down <a d' g'>8 \up <dis fis' dis''>8]  | \barNumberCheck #22
 % Measure 22
 \time 3/2 \down <d g! c'!>8[ \up e'8( \up <b' e''>8) \down <a c' g'>8] \up a'8[( \up <e'' a''>8) \down \clef treble <c' f' b'>8 \up d''8]( \up <a'' d'''>8[) \down <e' g' c''>8 \up eis''8( \up <cis''' fis'''>8])  | \barNumberCheck #23
 % Measure 23
 \time 2/2 \down <e' a' e''>8[\p \up e''8( \up <c''' f'''>8) \down <e' a' e''>8] \up e''8[( \up <c''' f'''>8) \down <f' g' d''>8 \up <dis'' ais'' dis'''>8]  | \barNumberCheck #24
 \break \noPageBreak
 % Measure 24
 \down <f' b' f''>8[ \up f''8( \up <c''' f'''>8) \down <f' b' f''>8] \up f''8[( \up <c''' f'''>8) \down <a' d''! g''>8-2 \up <a'' e''' a'''>8]  | \barNumberCheck #25
 % Measure 25
 \down <g' e''>8[ \up e''8( \up <b'' e'''>8) \down <d' e' b'>8] \up b'8[( \up <f'' b''>8) \down <e' g' c''>8-2 \up <a' e'' c'''>8]  | \barNumberCheck #26
 % Measure 26
 \down <f' aes' b'>8[ \up a'8( \up <d''! g''>8) \down <f' a' c''>8] \up c''8[( \up <g'' c'''>8) \down <f'! b' e''>8-2 \up <dis'' ais'' dis'''>8]  | \barNumberCheck #27
 % Measure 27
 \down <g' c'' f''>8[ \up f''8( \up <c''' f'''>8) \down <g' b' dis''>8] \up f''8[( \up <b'' f'''>8) \down <c'' e'' a''>8-2 \up <b'' f''' b'''>8]  | \barNumberCheck #28
 \break \noPageBreak
 % Measure 28
 \down <f' b' f''>8[ \up f''8( \up <c''' f'''>8) \down <f' a' cis''>8] \up e''8[( \up <b'' e'''>8) \down <f' aes' es''>8-2 \up <f'' ces''' fes'''>8]  | \barNumberCheck #29
 % Measure 29
 \down <f' aes' ces''>8[ \up d''8( \up <a'' d'''>8) \down <b ees' aes'>8] \up a'8[( \up <e'' a''>8) \down <e' ges' ces''>8 \up <bes' es'' bes''>8]  | \barNumberCheck #30
 % Measure 30
 \down \clef bass <bes des' ges'>8[ \up ges'8( \up <des'' ges''>8) \down <a ces' f'>8] \up bes8[( \up <ges' ces''>8) \down <ges bes fes'>8-2 \up <f' c'' f''>8]  | \barNumberCheck #31
 % Measure 31
 \down <e! ges b!>8[ \up c'!8( \up <ges' c''!>8) \down <e! g c'!>8] \up b8[( \up <f' b'>8) \down <ees g c'>8 \up <ees' bes' ees''>8]  | \barNumberCheck #32
 \break \noPageBreak
 % Measure 32
 \time 3/2 \down <c ees g>8[ \up ees'8( \up <bes' ees''>8) \down < c e a>8] \up g'8[( \up <d'' g''>8) \down <ees ges ces'>8 \up f'8]( \up <c'' f''>8[) \down <a, d g>8 \up d'8( \up <a' d''>8])  | \barNumberCheck #33
 % Measure 33
 \time 2/2 \down <e! ges c'!>8[ \up f'!8( \up <des'' f''!>8) \down <f! b e'>8] \up f'8[( \up <c'' f''>8) \down <c aes des'>8 \up <c' aes' c''>8]  | \barNumberCheck #34
 % Measure 34
 \time 3/4 \down <f aes ces' f'>8[ \up e'!8( \up <bes' e''!>8) \down <aes c' g'>8] \up e'8[( \up <c'' e''>8])  | \barNumberCheck #35
 \pageBreak
 % Measure 35
 \down <aes ces' ees'>8[ \up g'8( \up <ces'' ees''>8) \down <bes d' g'>8] \up a'8[( \up <d'' f''>8])  | \barNumberCheck #36
 % Measure 36
 \time 2/2 \down <a b e'>8[\f^\markup \italic "a tempo" \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <dis' ais' dis''>8]  | \barNumberCheck #37
 % Measure 37
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <a b g'>8-2 \up <a' e'' a''>8]  | \barNumberCheck #38
 % Measure 38
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <d' a' d''>8]  | \barNumberCheck #39
 \break \noPageBreak
 % Measure 39
 \down <a b>8[ \up b8( \up <f' b'>8) \down <a b>8] \up b8[( \up <f' b'>8) \down <a cis'>8 \up <d' a' d''>8]  | \barNumberCheck #40
 % Measure 40
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <dis' ais' dis''>8]  | \barNumberCheck #41
 % Measure 41
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <c' d' g'>8] \up gis'8[( \up <dis'' gis''>8) \down \clef treble <d' e' a'>8 \up <ais' e'' ais''>8]  | \barNumberCheck #42
 \break \noPageBreak
 % Measure 42
 \down <f' g' b'>8[ \up b'8( \up <f'' c'''>8) \down <fis' g' a'>8] \up b'8[( \up <f'' c'''>8) \down <f' ges' ces''>8 \up <d'' aes'' d'''>8]  | \barNumberCheck #43
 % Measure 43
 \down <f'! g'! b'>8[ \up b'8( \up <f'' b''>8) \down <fis' g' a'>8] \up b'8[( \up <f'' b''>8) \down <e' aes' des''>8-2 \up <c'' g'' c'''>8]  | \barNumberCheck #44
 % Measure 44
 \down <f' ges' b'>8[ \up b'8( \up <f'' b''>8) \down <f' g' c''>8] \up b'8[( \up <f'' b''>8) \down <d' e' a'>8 \up <g' d'' g''>8]  | \barNumberCheck #45
 % Measure 45
 \down <b d' f'>8[ \up f'8( \up <c'' f''>8) \down <c' d' e'>8] \up f'8[( \up <c'' f''>8) \down <b c' g'>8 \up <f' c'' f''>8]  | \barNumberCheck #46
 \break \noPageBreak
 % Measure 46
 \down <b c' e'>8[ \up e'8( \up <b' e''>8) \down <b c' g'>8] \up g'8[( \up <d'' g''>8) \down <g b e'>8 \up <e' b' e''>8]  | \barNumberCheck #47
 % Measure 47
 \down <a c' e'!>8[ \up e'8( \up <b' e''>8) \down <a b g'>8] \up a'8[( \up <e'' a''>8) \down <a b g'>8 \up <e' b' e''>8]  | \barNumberCheck #48
 % Measure 48
 \down \clef bass <a b e'>8[ \up f'8( \up <c'' f''>8) \down <a bes g'>8] \up g'8[( \up <d'' g''>8) \down <a b! f'>8 \up <dis' ais' dis''>8]  | \barNumberCheck #49
 % Measure 49
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b g'>8] \up a'8[( \up <e'' a''>8) \down <a b g'>8 \up <e' b' e''>8]  | \barNumberCheck #50
 \break \noPageBreak
 % Measure 50
 \down <a b g'>8[ \up f'8( \up <c'' f''>8) \down <a bes! g'>8] \up g'8[( \up <d'' g''>8) \down <a! b f'>8 \up <d' a' d''>8]  | \barNumberCheck #51
 % Measure 51
 \up b8-2([ c'8-1 <e' b'>8 \down <g b d'>8] \up g'8[ <e'' g''>8) \down \clef treble <c' fis' a'>8 \up a'8-2(]) | \barNumberCheck #52
 % Measure 52
 \up b'8-1[ <e'' b''>8) \down <g' b' e''>8 \up g''8(] <c''' g'''>8[ \down <b' dis'' g''>8 \up \ottava #1 e'''8~ <b'' e'''>8]) | \barNumberCheck #53
 % Measure 53
 \up <a' d'' f''>1\fermata \ottava #0 | \barNumberCheck #54
 \bar "|."

}
bassLine = {
 \clef bass \time 2/2 \voiceTwo \slurDown \tieDown
 % Measure 1
 f2.-> g4->( | \barNumberCheck #2
 % Measure 2
 f2.) d4->( | \barNumberCheck #3
 % Measure 3
 f2.) g4->( | \barNumberCheck #4
 % Measure 4
 f2.) d4->( | \barNumberCheck #5
 % Measure 5
 f2.) g4->( | \barNumberCheck #6
 % Measure 6
 f2.) \clef treble d'4->( | \barNumberCheck #7
 % Measure 7
 ees'2.) d'4->( | \barNumberCheck #8
 % Measure 8
 d'2.) c'4->( | \barNumberCheck #9
 % Measure 9
 des'2.) a!4->( | \barNumberCheck #10
 % Measure 10
 g2.) ges4->( | \barNumberCheck #11
 % Measure 11
 f2)( f8) f4.->( | \barNumberCheck #12
 % Measure 12
 \time 3/2 \clef bass g2.) f4.-> fis4.-> | \barNumberCheck #13
 % Measure 13
 \time 2/2 g2->~ g8 g4.->~ | \barNumberCheck #14
 % Measure 14
 g2~ g8 g4.->~ | \barNumberCheck #15
 % Measure 15
 g2~ g8 f4.->( | \barNumberCheck #16
 % Measure 16
 f2)~ f8 ees4.->~ | \barNumberCheck #17
 % Measure 17
 ees2~ ees8 ees4.->~ | \barNumberCheck #18
 % Measure 18
 \time 3/2 ees2. e2.-> | \barNumberCheck #19
 % Measure 19
 \time 2/2 ees2->( c8) c4.->( | \barNumberCheck #20
 % Measure 20
 c2)~ c8 f,4.->( | \barNumberCheck #21
 % Measure 21
 s1 | \barNumberCheck #22
 % Measure 22
 \time 3/2 s1. | \barNumberCheck #23
 % Measure 23
 \time 2/2 d'2->~ d'8 e'4.->( | \barNumberCheck #24
 % Measure 24
 e'2)~ e'8 ees'4.->( | \barNumberCheck #25
 % Measure 25
 c'2)~ c'8 a4.->( | \barNumberCheck #26
 % Measure 26
 des'2)~ des'8 a4.->( | \barNumberCheck #27
 % Measure 27
 e'2)~ e'8 f'4.->( | \barNumberCheck #28
 % Measure 28
 e'2)~ e'8 d'4.->( | \barNumberCheck #29
 % Measure 29
 bes2)~ bes8 aes4.->( | \barNumberCheck #30
 % Measure 30
 \clef bass d'2)~ d'8 ges4.->( | \barNumberCheck #31
 % Measure 31
 bes,2)~ bes,8 bes,4.->~ | \barNumberCheck #32
 % Measure 32
 \time 3/2 bes,1.-> | \barNumberCheck #33
 % Measure 33
 \time 2/2 des1-> | \barNumberCheck #34
 % Measure 34
 \time 3/4 b,2.-> | \barNumberCheck #35
 % Measure 35
 c2.-> | \barNumberCheck #36
 % Measure 36
 \time 2/2 a2.-> g4->( | \barNumberCheck #37
 % Measure 37
 f2.) d4->( | \barNumberCheck #38
 % Measure 38
 f2.) g4->( | \barNumberCheck #39
 % Measure 39
 f2.) d4->( | \barNumberCheck #40
 % Measure 40
 f2.) g4->( | \barNumberCheck #41
 % Measure 41
 f2.) \clef treble d'4->( | \barNumberCheck #42
 % Measure 42
 ees'2.) d'4->( | \barNumberCheck #43
 % Measure 43
 d'2.) c'4->( | \barNumberCheck #44
 % Measure 44
 des'2.) a!4->( | \barNumberCheck #45
 % Measure 45
 g2.) ges4->( | \barNumberCheck #46
 % Measure 46
 f2)( f8) f4.->( | \barNumberCheck #47
 % Measure 47
 e2)( f8) f4.->( | \barNumberCheck #48
 % Measure 48
 \clef bass g2)~ g8 g4.->~ | \barNumberCheck #49
 % Measure 49
 g2~ g8 g4.->~ | \barNumberCheck #50
 % Measure 50
 g2~ g8 g4.->( | \barNumberCheck #51
 % Measure 51
 <b, e g>1->) | \barNumberCheck #52
 % Measure 52
 <a, d a'!>1-> | \barNumberCheck #53
 % Measure 53
 <d'! e' a' b'>1->\fermata | \barNumberCheck #54
}
\score {
 \new PianoStaff <<
  \new Staff = "RH" { \new Voice = "figure" \figuration }
  \new Staff = "LH" { \new Voice = "bass" \bassLine }
 >>
 \layout { }
 \midi { }
}
