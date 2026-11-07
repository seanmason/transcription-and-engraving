% Transcription audited against the user's higher-quality scan, printed pages 11–13.
% Editable master; current scan audit/provenance in experiment 009 (007/008 historical).
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
 ragged-bottom = ##f ragged-last-bottom = ##t
 system-system-spacing.basic-distance = #22
 system-system-spacing.minimum-distance = #18
 system-system-spacing.padding = #3
}
\layout {
 \context { \PianoStaff
  \override StaffGrouper.staff-staff-spacing.basic-distance = #20
  \override StaffGrouper.staff-staff-spacing.minimum-distance = #18
  \override StaffGrouper.staff-staff-spacing.padding = #3
 }
 \context { \Staff
  \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #17
  \override VerticalAxisGroup.staff-staff-spacing.minimum-distance = #16
  \override VerticalAxisGroup.staff-staff-spacing.padding = #2
  \override TimeSignature.style = #'numbered
  \override TimeSignature.break-visibility = #end-of-line-invisible
  \override NoteCollision.merge-differently-dotted = ##t
 }
 \context { \Voice
  \override Beam.auto-knee-gap = #0
  \override Beam.damping = #+inf.0
  \override Fingering.direction = #UP
 }
}
up = { \change Staff = "RH" \stemDown }
down = { \change Staff = "LH" \stemUp }
figuration = {
 \time 2/2 \clef treble \autoBeamOff
 \override TextScript.font-name = "C059 Italic"
 \override Script.direction = #DOWN
 \tempo \markup \override #'(font-name . "Engraving Tempo") "Incisivo" 2 = 120
 % Measure 1
 \down <a b e'>8[^> \up e'8(_> \up <b' e''>8)_> \down <a b e'>8]^> \up e'8[(_> \up <b' e''>8)_> \down <c' d'>8^> \up <dis' ais' dis''>8]_>  | \barNumberCheck #2
 % Measure 2
 \down <a b e'>8[^> \up e'8(_> \up <b' e''>8)_> \down <a b e'>8]^> \up e'8[(_> \up <b' e''>8)_> \down <a b g'>8-2^> \up <a' e'' a''>8]_>  | \barNumberCheck #3
 % Measure 3
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <d' a' d''>8]  | \barNumberCheck #4
 \break \noPageBreak
 % Measure 4
 \down <a b>8[ \up b8( \up <f' b'>8) \down <a b>8] \up b8[( \up <f' b'>8) \down <a cis'>8 \up <d' a' d''>8]  | \barNumberCheck #5
 % Measure 5
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <dis' ais' dis''>8]  | \barNumberCheck #6
 % Measure 6
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <c' d' g'>8] \up gis'8[( \up <dis'' gis''>8) \down \clef treble <d' e' a'>8 \up <ais' e'' ais''>8]  | \barNumberCheck #7
 % Measure 7
 \down <f' g' b'>8[ \up b'8( \up <f'' b''>8) \down <f' g' ais'>8] \up b'8[( \up <f'' b''>8) \down <fes' ges' c''>8 \up <d'' aes'' d'''>8]  | \barNumberCheck #8
 \break \noPageBreak
 % Measure 8
 \down <f'! g'! b'>8[ \up b'8( \up <f'' b''>8) \down <f' g' ais'>8] \up b'8[( \up <f'' b''>8) \down <e' aes' d''>8-2 \up <c'' g'' c'''>8]  | \barNumberCheck #9
 % Measure 9
 \down <f' g' b'>8[ \up b'8( \up <f'' b''>8) \down <f' g' c''>8] \up b'8[( \up <f'' b''>8) \down <e' f' a'>8 \up <g' d'' g''>8]  | \barNumberCheck #10
 % Measure 10
 \down <c' d' f'>8[ \up f'8( \up <c'' f''>8) \down <c' d' e'>8] \up f'8[( \up <c'' f''>8) \down <c' d' g'>8 \up <f' c'' f''>8]  | \barNumberCheck #11
 % Measure 11
 \down <b c' e'>8[ \up e'8( \up <b' e''>8) \down <c' d' g'>8] \up g'8[( \up <d'' g''>8) \down <a c' e'>8 \up <e' b' e''>8]  | \barNumberCheck #12
 \break \noPageBreak
 % Measure 12
 \time 3/2 \down \clef bass <bes c' ees'>8[ \up ees'8( \up <bes' ees''>8) \down <bes c' e'!>8] \up f'8[( \up <c'' f''>8) \down <c' d' g'>8-2 \up f'8]( \up <c'' f''>8[) \down <bes c' d'>8 \up ees'8( \up <bes' ees''>8])  | \barNumberCheck #13
 % Measure 13
 \time 2/2 \down <b! c' e'>8[ \up e'!8( \up <b'! e''!>8) \down <c' d' gis'>8] \up a'8[( \up <e'' a''>8) \down <bes c' g'!>8 \up <e' b' e''>8]  | \barNumberCheck #14
 % Measure 14
 \down <aes c' ees'>8[ \up ees'8( \up <bes' ees''>8) \down <aes c' d'>8] \up ees'8[( \up <bes' ees''>8) \down <c' ees' f'>8 \up <g' d'' g''>8]  | \barNumberCheck #15
 \pageBreak
 % Measure 15
 \down <aes c' ees'>8[ \up f'8( \up <c'' f''>8) \down <b c' aes'>8] \up g'8[( \up <d'' g''>8) \down <g c' f'>8 \up <ees' bes' ees''>8]  | \barNumberCheck #16
 % Measure 16
 \down <aes c' d'>8[ \up d'8( \up <aes' d''>8) \down <bes c' g'>8] \up f'8[( \up <c'' f''>8) \down <aes c' d'>8 \up <ees' bes' ees''>8]  | \barNumberCheck #17
 % Measure 17
 \down <g aes c'>8[ \up c'8( \up <g' c''>8) \down <g aes ees'>8] \up d'8[( \up <aes' d''>8) \down <g aes c'>8 \up <bes f' bes'>8]  | \barNumberCheck #18
 \break \noPageBreak
 % Measure 18
 \time 3/2 \down <f aes c'>8[ \up d'8( \up <aes' d''>8) \down <g aes ees'>8] \up f'8[( \up <c'' f''>8) \down <g aes ees'>8-2 \up d'8]( \up <aes' d''>8[) \down <f aes c'>8 \up b!8( \up <e'! b'!>8])  | \barNumberCheck #19
 % Measure 19
 \time 2/2 \down <f g bes>8[ \up bes8( \up <f' bes'>8) \down <f g c'>8] \up g8[( \up <d' g'>8) \down <des f aes>8 \up <bes f' bes'>8]  | \barNumberCheck #20
 % Measure 20
 \down <d f aes>8[ \up aes8( \up <ees' aes'>8) \down <des e g>8] \up g8[( \up <c' g'>8) \down <aes, des ees>8 \up <f c' f'>8]  | \barNumberCheck #21
 \break \noPageBreak
 % Measure 21
 \down <d, g, c>8_>[ \up e8( \up < b e'>8) \down <a, d g>8_>] \up b8[( \up <fis' b'>8) \down <e a d'>8_> \up <cis' gis' cis''>8]  | \barNumberCheck #22
 % Measure 22
 \time 3/2 \down <d g! b!>8_>[ \up e'8( \up <b' e''>8) \down <g c' f'>8_>] \up a'8[( \up <e'' a''>8) \down \clef treble <c' f' b'>8_> \up c''8]( \up <g'' c'''>8[) \down <e' a' d''>8_> \up dis''8( \up <ais'' dis'''>8])  | \barNumberCheck #23
 % Measure 23
 \time 2/2 \down <f' b' e''>8[ \up e''8( \up <b'' e'''>8) \down <f' b' e''>8] \up e''8[( \up <b'' e'''>8) \down <g' a' d''>8 \up <dis'' ais'' dis'''>8]  | \barNumberCheck #24
 \break \noPageBreak
 % Measure 24
 \down <f' b' e''>8[ \up e''8( \up <b'' e'''>8) \down <f' b' e''>8] \up e''8[( \up <b'' e'''>8) \down <a' d''? g''>8-2 \up <a'' e''' a'''>8]  | \barNumberCheck #25
 % Measure 25
 \down <g' e''>8[ \up e''8( \up <b'' e'''>8) \down <d' e' a'>8] \up b'8[( \up <f'' b''>8) \down <d' g' c''>8-2 \up <c'' g'' c'''>8]  | \barNumberCheck #26
 % Measure 26
 \down <ees' g' a'>8[ \up a'8( \up <e''? a''>8) \down <ees' g' b'>8] \up c''8[( \up <g'' c'''>8) \down <e'? a' d''>8-2 \up <dis'' ais'' dis'''>8]  | \barNumberCheck #27
 % Measure 27
 \down <f' b' e''>8[ \up e''8( \up <b'' e'''>8) \down <f' b' dis''>8] \up e''8[( \up <a'' e'''>8) \down <a' dis'' g''>8-2 \up <a'' e''' a'''>8]  | \barNumberCheck #28
 \pageBreak
 % Measure 28
 \down <f' b' e''>8[ \up e''8( \up <b'' e'''>8) \down <f' a' cis''>8] \up d''8[( \up <a'' d'''>8) \down <f' aes' ees''>8-2 \up <ees'' bes'' ees'''>8]  | \barNumberCheck #29
 % Measure 29
 \down <f' aes' ces''>8[ \up c''8( \up <g'' c'''>8) \down <c' ees' aes'>8] \up g'8[( \up <d'' g''>8) \down <ces' ees' aes'>8 \up <bes' es'' bes''>8]  | \barNumberCheck #30
 % Measure 30
 \down \clef bass <ces' ees' aes'>8[ \up aes'8( \up <ees'' aes''>8) \down <ges c'! f'>8] \up des'8[( \up <aes' des''>8) \down <fes aes ees'>8-2 \up <f' c'' f''>8]  | \barNumberCheck #31
 % Measure 31
 \down <f! aes c'!>8[ \up d'!8( \up <aes' d''!>8) \down <e! g b!>8] \up c'8[( \up <g' c''>8) \down <ees a d'>8 \up <ees' bes' ees''>8]  | \barNumberCheck #32
 \break \noPageBreak
 % Measure 32
 \time 3/2 \down <f aes c'>8[ \up ees'8( \up <bes' ees''>8) \down <g c' f'>8] \up g'8[( \up <d'' g''>8) \down <bes ees' aes'>8 \up g'8]( \up <d'' g''>8[) \down <g c' f'>8 \up ees'8( \up <bes' ees''>8])  | \barNumberCheck #33
 % Measure 33
 \time 2/2 \down <f! aes d'!>8[ \up e'!8( \up <bes' e''!>8) \down <a! d' g'>8] \up f'8[( \up <c'' f''>8) \down <f bes ees'>8 \up <e' bes' e''>8]  | \barNumberCheck #34
 % Measure 34
 \time 3/4 \down <fes aes d'>8[ \up e'!8( \up <bes' e''!>8) \down <aes d' g'>8] \up f'8[( \up <c'' f''>8])  | \barNumberCheck #35
 % Measure 35
 \down <ges bes e'>8[ \up e'8( \up <bes' e''>8) \down <aes d' g'>8] \up f'8[( \up <c'' f''>8])  | \barNumberCheck #36
 \break \noPageBreak
 % Measure 36
 \time 2/2 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <dis' ais' dis''>8]  | \barNumberCheck #37
 % Measure 37
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <a b g'>8-2 \up <a' e'' a''>8]  | \barNumberCheck #38
 % Measure 38
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <d' a' d''>8]  | \barNumberCheck #39
 \break \noPageBreak
 % Measure 39
 \down <a b>8[ \up b8( \up <f' b'>8) \down <a b>8-.] \up b8[( \up <f' b'>8) \down <a cis'>8 \up <d' a' d''>8]  | \barNumberCheck #40
 % Measure 40
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <a b e'>8] \up e'8[( \up <b' e''>8) \down <c' d'>8 \up <dis' ais' dis''>8]  | \barNumberCheck #41
 % Measure 41
 \down <a b e'>8[ \up e'8( \up <b' e''>8) \down <c' d' g'>8] \up gis'8[( \up <dis'' gis''>8) \down \clef treble <d' e' a'>8 \up <ais' e'' ais''>8]  | \barNumberCheck #42
 \pageBreak
 % Measure 42
 \down <f' g' b'>8[ \up b'8( \up <f'' b''>8) \down <f' g' ais'>8] \up b'8[( \up <f'' b''>8) \down <fes' ges' c''>8 \up <d'' aes'' d'''>8]  | \barNumberCheck #43
 % Measure 43
 \down <f'! g'! b'>8[ \up b'8( \up <f'' b''>8) \down <f' g' ais'>8] \up b'8[( \up <f'' b''>8) \down <e' aes' d''>8-2 \up <c'' g'' c'''>8]  | \barNumberCheck #44
 % Measure 44
 \down <f' g' b'>8[ \up b'8( \up <f'' b''>8) \down <f' g' c''>8] \up b'8[( \up <f'' b''>8) \down <e' f' a'>8 \up <g' d'' g''>8]  | \barNumberCheck #45
 % Measure 45
 \down <c' d' f'>8[ \up f'8( \up <c'' f''>8) \down <c' d' e'>8] \up f'8[( \up <c'' f''>8) \down <c' d' g'>8 \up <f' c'' f''>8]  | \barNumberCheck #46
 \break \noPageBreak
 % Measure 46
 \down <b c' e'>8[ \up e'8( \up <b' e''>8) \down <c' d' g'>8] \up g'8[( \up <d'' g''>8) \down <a c' e'>8 \up <e' b' e''>8]  | \barNumberCheck #47
 % Measure 47
 \down <b c' e'!>8[ \up e'8( \up <b' e''>8) \down <b c' g'>8] \up a'8[( \up <e'' a''>8) \down <b c' g'>8 \up <e' b' e''>8]  | \barNumberCheck #48
 % Measure 48
 \down \clef bass <a b f'>8[ \up f'8( \up <c'' f''>8) \down <a bes g'>8] \up g'8[( \up <d'' g''>8) \down <a b! f'>8 \up <dis' ais' dis''>8]  | \barNumberCheck #49
 % Measure 49
 \down <b c' e'>8[ \up e'8( \up <b' e''>8) \down <b c' g'>8] \up a'8[( \up <e'' a''>8) \down <b c' g'>8 \up <e' b' e''>8]  | \barNumberCheck #50
 \break \noPageBreak
 % Measure 50
 \down <a b f'>8[ \up f'8( \up <c'' f''>8) \down <aes b! g'>8] \up g'8[( \up <d'' g''>8) \down <a! b f'>8 \up <d' a' d''>8]  | \barNumberCheck #51
 % Measure 51
 \up b8-2([ c'8-1 <e' c''>8) \down <a d' g'>8] \up a'8[( <e'' a''>8) \down \clef treble <b e' ais'>8 \up b'8-2(] | \barNumberCheck #52
 % Measure 52
 \up c''8-1[ <e'' c'''>8) \down <a' d'' g''>8 \up a''8(] <e''' a'''>8[) \down <cis'' fis'' b''>8 \up \ottava #1 d''''8~ <a''' d''''>8] | \barNumberCheck #53
 % Measure 53
 \up <e''' b''' e''''>1->^\fermata \ottava #0 | \barNumberCheck #54
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
 ees'2.) d'4->~ | \barNumberCheck #8
 % Measure 8
 d'2. c'4->( | \barNumberCheck #9
 % Measure 9
 des'2.) b!4->( | \barNumberCheck #10
 % Measure 10
 a2.) aes4->( | \barNumberCheck #11
 % Measure 11
 g2)~ g8 g4.->~ | \barNumberCheck #12
 % Measure 12
 \time 3/2 \clef bass g2.-> f4.-> fis4.-> | \barNumberCheck #13
 % Measure 13
 \time 2/2 g2->~ g8 g4.->~ | \barNumberCheck #14
 % Measure 14
 g2~ g8 g4.->~ | \barNumberCheck #15
 % Measure 15
 g2~ g8 f4.->~ | \barNumberCheck #16
 % Measure 16
 f2~ f8 ees4.->~ | \barNumberCheck #17
 % Measure 17
 ees2~ ees8 ees4.->~ | \barNumberCheck #18
 % Measure 18
 \time 3/2 ees2. d2.-> | \barNumberCheck #19
 % Measure 19
 \time 2/2 des2->( c8) c4.->~ | \barNumberCheck #20
 % Measure 20
 c2~ c8 f,4.-> | \barNumberCheck #21
 % Measure 21
 s1 | \barNumberCheck #22
 % Measure 22
 \time 3/2 s1. | \barNumberCheck #23
 % Measure 23
 \time 2/2 d'2->~ d'8 e'4.->( | \barNumberCheck #24
 % Measure 24
 d'2)~ d'8 des'4.->( | \barNumberCheck #25
 % Measure 25
 c'2)~ c'8 a4.->( | \barNumberCheck #26
 % Measure 26
 bes2)~ bes8 g4.->( | \barNumberCheck #27
 % Measure 27
 d'2)~ d'8 e'4.->( | \barNumberCheck #28
 % Measure 28
 d'2)~ d'8 c'4.->( | \barNumberCheck #29
 % Measure 29
 bes2)~ bes8 aes4.->( | \barNumberCheck #30
 % Measure 30
 \clef bass g2)( ges8) ces4.->( | \barNumberCheck #31
 % Measure 31
 bes,2)~ bes,8 bes,4.->~ | \barNumberCheck #32
 % Measure 32
 \time 3/2 bes,1.-> | \barNumberCheck #33
 % Measure 33
 \time 2/2 bes,1-> | \barNumberCheck #34
 % Measure 34
 \time 3/4 b,2.-> | \barNumberCheck #35
 % Measure 35
 c2.-> | \barNumberCheck #36
 % Measure 36
 \time 2/2 f2.-> g4->( | \barNumberCheck #37
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
 ees'2.) d'4->~ | \barNumberCheck #43
 % Measure 43
 d'2. c'4->( | \barNumberCheck #44
 % Measure 44
 des'2.) b!4->( | \barNumberCheck #45
 % Measure 45
 a2.) aes4->( | \barNumberCheck #46
 % Measure 46
 g2)~ g8 g4.->~ | \barNumberCheck #47
 % Measure 47
 g2~ g8 g4.->~ | \barNumberCheck #48
 % Measure 48
 \clef bass g2~ g8 g4.->~ | \barNumberCheck #49
 % Measure 49
 g2~ g8 g4.->~ | \barNumberCheck #50
 % Measure 50
 g2~ g8 g4.->( | \barNumberCheck #51
 % Measure 51
 <c, g, e>1->) | \barNumberCheck #52
 % Measure 52
 <f c' a'!>1-> | \barNumberCheck #53
 % Measure 53
 <c''! d'' g'' a''>1->^\fermata | \barNumberCheck #54
}
expression = {
 \override DynamicTextSpanner.extra-offset = #'(0 . -2.5)
 \override Hairpin.extra-offset = #'(0 . -1.2)
 \override DynamicText.extra-offset = #'(-3 . -0.6)
 \override TextScript.extra-offset = #'(0 . -1)

 % Measure 1
 s1\f |
 % Measure 2
 s1 |
 % Measure 3
 \once \override TextScript.extra-offset = #'(2 . -2.3) s4^\markup \italic "simili" s4\> s2\! |
 % Measure 4
 s1 |
 % Measure 5
 s1 |
 % Measure 6
 s1 |
 % Measure 7
 s4 s2\< s4\! |
 % Measure 8
 s4 s2\> s4\! |
 % Measure 9
 s1 |
 % Measure 10
 \override Hairpin.extra-offset = #'(0 . -3)
 s4 s2\< s4\> |
 % Measure 11
 s4 s4\! s2 |
 % Measure 12
 \override Hairpin.extra-offset = #'(0 . -1.2)
 s8 s2\< s8\! s8 s2\> s8\! |
 % Measure 13
 s1 |
 % Measure 14
 s1 |
 % Measure 15
 s1 |
 % Measure 16
 s1 |
 % Measure 17
 s1 |
 % Measure 18
 s1. |
 % Measure 19
 \override Hairpin.extra-offset = #'(0 . -3)
 s2. s4\< |
 % Measure 20
 s2 s2\! |
 % Measure 21
 \override Hairpin.extra-offset = #'(0 . -1.2)
 s2.\f s4-\tweak extra-offset #'(3 . -2) ^\markup \italic "dim." |
 % Measure 22
 s2 s1\> |
 % Measure 23
 s1\!\p |
 % Measure 24
 s4 s2\< s4\! |
 % Measure 25
 s4 s4\> s2\! |
 % Measure 26
 s1 |
 % Measure 27
 s2 s4\< s4\> |
 % Measure 28
 s4 s4\! s2 |
 % Measure 29
 s1 |
 % Measure 30
 s1 |
 % Measure 31
 s1 |
 % Measure 32
 s8 s2\< s8\! s8 s2\> s8\! |
 % Measure 33
 \once \override DynamicTextSpanner.extra-offset = #'(1.8 . -1.2) s2. s4\cresc |
 % Measure 34
 s2.-\tweak extra-offset #'(2 . -2) ^\markup \italic "e rall." |
 % Measure 35
 s2.\!\< |
 % Measure 36
 \once \override TextScript.extra-offset = #'(0 . 2) s1\!\f^\markup \italic "a tempo" |
 % Measure 37
 s4 s2\< s4\> |
 % Measure 38
 s4 s4\! s2 |
 % Measure 39
 s1 |
 % Measure 40
 s1 |
 % Measure 41
 s1 |
 % Measure 42
 s4 s2\< s4\! |
 % Measure 43
 s4 s4\> s2\! |
 % Measure 44
 s1 |
 % Measure 45
 s1 |
 % Measure 46
 s1 |
 % Measure 47
 \override Hairpin.extra-offset = #'(0 . -3)
 s8 s4\< s8\! s4\> s4\! |
 % Measure 48
 \override Hairpin.extra-offset = #'(0 . -1.2)
 s1 |
 % Measure 49
 s8 s4\< s8\! s4\> s4\! |
 % Measure 50
 s1 |
 % Measure 51
 s2 s2\cresc |
 % Measure 52
 s1\< |
 % Measure 53
 \once \override DynamicText.extra-offset = #'(0 . 0) s1\!\ff |
}
\score {
 \new PianoStaff <<
  \new Staff = "RH" { \new Voice = "figure" \figuration }
  \new Dynamics \expression
  \new Staff = "LH" { \new Voice = "bass" \bassLine }
 >>
 \layout { }
 \midi { }
}
