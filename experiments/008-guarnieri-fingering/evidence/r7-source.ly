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
 markup-system-spacing.basic-distance = #24
 markup-system-spacing.minimum-distance = #20
 markup-system-spacing.padding = #8
 oddFooterMarkup = \markup \fill-line { "" \fromproperty #'page:page-number-string }
 evenFooterMarkup = \oddFooterMarkup
 ragged-bottom = ##f ragged-last-bottom = ##t
 system-system-spacing.basic-distance = #22
 system-system-spacing.minimum-distance = #18
 system-system-spacing.padding = #3
}
\layout {
 \context { \PianoStaff
  \override StaffGrouper.staff-staff-spacing.basic-distance = #17
  \override StaffGrouper.staff-staff-spacing.minimum-distance = #15
  \override StaffGrouper.staff-staff-spacing.padding = #3
 }
 \context { \Staff
  \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #17
  \override VerticalAxisGroup.staff-staff-spacing.minimum-distance = #15
  \override VerticalAxisGroup.staff-staff-spacing.padding = #2
  \override VerticalAxisGroup.staff-staff-spacing.stretchability = #0
  \override TimeSignature.style = #'numbered
  \override TimeSignature.break-visibility = #end-of-line-invisible
  \override NoteCollision.merge-differently-dotted = ##t
 }
 \context { \Voice
  \override Beam.auto-knee-gap = #0
  \override Beam.damping = #+inf.0
  \override Fingering.direction = #UP
  \override Fingering.color = #(rgb-color 0.12 0.30 0.43)
  \override Fingering.padding = #0.6
  \override Fingering.font-size = #1.5
  \override Fingering.whiteout = ##t
  \override Fingering.layer = #3
 }
}
up = { \change Staff = "RH" \stemDown \set fingeringOrientations = #'(up) }
down = { \change Staff = "LH" \stemUp \set fingeringOrientations = #'(left) }
figuration = {
 \time 2/2 \clef treble \autoBeamOff
 \set fingeringOrientations = #'(up)
 \override TextScript.font-name = "C059 Italic"
 \override Script.direction = #DOWN
 \once \override Score.MetronomeMark.extra-offset = #'(0 . 4)
 \tempo \markup \override #'(font-name . "Engraving Tempo") "Incisivo" 2 = 120
 % Measure 1
 \down <a-4 b-3 e'-1>8[^> \up e'8-1(_> \up <b'-2 e''-5>8)_> \down <a-4 b-3 e'-1>8]^> \up e'8-1[(_> \up <b'-2 e''-5>8)_> \down <c'-2 d'-1>8^> \up <dis'-1 ais'-3 dis''-5>8]_>  | \barNumberCheck #2
 % Measure 2
 \down <a-4 b-3 e'-1>8[^> \up e'8-1(_> \up <b'-2 e''-5>8)_> \down <a-4 b-3 e'-1>8]^> \up e'8-1[(_> \up <b'-2 e''-5>8)_> \down <a-5 b-4 g'-\tweak color #black -2>8^> \up <a'-1 e''-3 a''-5>8]_>  | \barNumberCheck #3
 % Measure 3
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-4 b-3 e'-1>8] \up e'8-1[( \up <b'-2 e''-5>8) \down <c'-2 d'-1>8 \up <d'-1 a'-3 d''-5>8]  | \barNumberCheck #4
 \break \noPageBreak
 % Measure 4
 \down <a-3 b-2>8[ \up b8-1( \up <f'-2 b'-5>8) \down <a-3 b-2>8] \up b8-1[( \up <f'-2 b'-5>8) \down <a-3 cis'-1>8 \up <d'-1 a'-3 d''-5>8]  | \barNumberCheck #5
 % Measure 5
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-4 b-3 e'-1>8] \up e'8-1[( \up <b'-2 e''-5>8) \down <c'-2 d'-1>8 \up <dis'-1 ais'-3 dis''-5>8]  | \barNumberCheck #6
 % Measure 6
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <c'-4 d'-3 g'-1>8] \up gis'8-1[( \up <dis''-2 gis''-5>8) \down \clef treble <d'-4 e'-3 a'-1>8 \up <ais'-1 e''-3 ais''-5>8]  | \barNumberCheck #7
 % Measure 7
 \down <f'-4 g'-3 b'-1>8[ \up b'8-1( \up <f''-2 c'''-5>8) \down <fis'-3 g'-2 a'-1>8] \up b'8-1[( \up <f''-2 c'''-5>8) \down <f'-4 ges'-3 ces''-1>8 \up <d''-1 aes''-3 d'''-5>8]  | \barNumberCheck #8
 \break \noPageBreak
 % Measure 8
 \down <f'!-4 g'!-3 b'-1>8[ \up b'8-1( \up <f''-2 b''-5>8) \down <fis'-3 g'-2 a'-1>8] \up b'8-1[( \up <f''-2 b''-5>8) \down <e'-4 aes'-3 des''-\tweak color #black -2>8 \up <c''-1 g''-3 c'''-5>8]  | \barNumberCheck #9
 % Measure 9
 \down <f'-4 ges'-3 b'-1>8[ \up b'8-1( \up <f''-2 b''-5>8) \down <f'-4 g'-3 c''-1>8] \up b'8-1[( \up <f''-2 b''-5>8) \down <d'-4 e'-3 a'-1>8 \up <g'-1 d''-3 g''-5>8]  | \barNumberCheck #10
 % Measure 10
 \down <b-4 d'-2 f'-1>8[ \up f'8-1( \up <c''-2 f''-5>8) \down <c'-3 d'-2 e'-1>8] \up f'8-1[( \up <c''-2 f''-5>8) \down <b-4 c'-3 g'-1>8 \up <f'-1 c''-3 f''-5>8]  | \barNumberCheck #11
 % Measure 11
 \down <b-4 c'-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <b-4 c'-3 g'-1>8] \up g'8-1[( \up <d''-2 g''-5>8) \down <g-4 b-2 e'-1>8 \up <e'-1 b'-3 e''-5>8]  | \barNumberCheck #12
 \break \noPageBreak
 % Measure 12
 \time 3/2 \down \clef bass <bes-4 c'-3 ees'-1>8[ \up ees'8-1( \up <bes'-2 ees''-5>8) \down <a-4 b-3 e'!-1>8] \up f'8-1[( \up <c''-2 f''-5>8) \down <b-5 c'-4 g'-\tweak color #black -2>8 \up f'8-1]( \up <c''-2 f''-5>8[) \down <a-4 b-3 d'-1>8 \up ees'8-1( \up <bes'-2 ees''-5>8])  | \barNumberCheck #13
 % Measure 13
 \time 2/2 \down <b!-4 c'-3 e'-1>8[ \up e'!8-1( \up <b'!-2 e''!-5>8) \down <b-4 c'-3 gis'-1>8] \up a'8-1[( \up <e''-2 a''-5>8) \down <a-4 b-3 g'!-1>8 \up <e'-1 b'-3 e''-5>8]  | \barNumberCheck #14
 % Measure 14
 \down <aes-4 c'-3 ees'-1>8[ \up ees'8-1( \up <bes'-2 ees''-5>8) \down <a-4 c'-2 d'-1>8] \up ees'8-1[( \up <bes'-2 ees''-5>8) \down <c'-4 d'-3 g'-1>8 \up <g'-1 d''-3 g''-5>8]  | \barNumberCheck #15
 \pageBreak
 % Measure 15
 \down <aes-4 c'-3 ees'-1>8[ \up g'8-1( \up <c''-2 g''-5>8) \down <b-4 c'-3 aes'-1>8] \up g'8-1[( \up <d''-2 g''-5>8) \down <g-4 c'-2 f'-1>8 \up <ees'-1 bes'-3 ees''-5>8]  | \barNumberCheck #16
 % Measure 16
 \down <g-4 bes-2 c'-1>8[ \up d'8-1( \up <aes'-2 d''-5>8) \down <bes-4 c'-3 g'-1>8] \up f'8-1[( \up <c''-2 f''-5>8) \down <g-4 bes-2 c'-1>8 \up <ees'-1 bes'-3 ees''-5>8]  | \barNumberCheck #17
 % Measure 17
 \down <g-4 aes-3 c'-1>8[ \up c'8-1( \up <g'-2 c''-5>8) \down <g-4 aes-3 ees'-1>8] \up d'8-1[( \up <a'!-2 d''-5>8) \down <f-4 g-3 c'-1>8 \up <bes-1 f'-3 bes'-5>8]  | \barNumberCheck #18
 \break \noPageBreak
 % Measure 18
 \time 3/2 \down <f-4 aes-3 c'-1>8[ \up d'8-1( \up <aes'-2 d''-5>8) \down <a-4 b-3 ees'-1>8] \up f'8-1[( \up <c''-2 f''-5>8) \down <a-4 b-3 ees'-\tweak color #black -2>8 \up d'8-1]( \up <b'-2 e''-5>8[) \down <g-4 b-2 d'-1>8 \up b!8-1( \up <f'!-2 b'!-5>8])  | \barNumberCheck #19
 % Measure 19
 \time 2/2 \down <f-4 g-3 bes-1>8[ \up bes8-1( \up <f'-2 bes'-5>8) \down <f-4 g-3 d'-1>8] \up g8-1[( \up <d'-2 g'-5>8) \down <d-4 f-2 aes-1>8 \up <b-1 f'-3 b'-5>8]  | \barNumberCheck #20
 % Measure 20
 \down <d-4 f-2 aes-1>8[ \up ges8-1( \up <c'-2 ges'-5>8) \down <ees-4 f-3 a-1>8] \up e8-1[( \up <c'-2 f'-5>8) \down <aes,-4 ees-2 fes-1>8 \up <f-1 c'-3 f'-5>8]  | \barNumberCheck #21
 \break \noPageBreak
 % Measure 21
 \down <d,-5 g,-3 c-1>8[ \up e8-1( \up <b-2 e'-5>8) \down <e-5 g-3 c'-1>8] \up b8-1[( \up <fis'-2 b'-5>8) \down <a-5 d'-3 g'-1>8 \up <dis'-1 ais'-3 dis''-5>8]  | \barNumberCheck #22
 % Measure 22
 \time 3/2 \down <d-5 g!-3 c'!-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-5 d'-3 g'-1>8] \up a'8-1[( \up <e''-2 a''-5>8) \down \clef treble <c'-5 f'-3 b'-1>8 \up d''8-1]( \up <a''-2 d'''-5>8[) \down <e'-5 a'-3 d''-1>8 \up dis''8-1( \up <ais''-2 dis'''-5>8])  | \barNumberCheck #23
 % Measure 23
 \time 2/2 \down <e'-5 a'-3 e''-1>8[ \up e''8-1( \up <b''-2 e'''-5>8) \down <e'-5 a'-3 e''-1>8] \up e''8-1[( \up <b''-2 e'''-5>8) \down <f'-4 g'-3 d''-1>8 \up <dis''-1 ais''-3 dis'''-5>8]  | \barNumberCheck #24
 \break \noPageBreak
 % Measure 24
 \down <f'-5 b'-3 f''-1>8[ \up e''8-1( \up <b''-2 e'''-5>8) \down <f'-5 b'-3 f''-1>8] \up e''8-1[( \up <b''-2 e'''-5>8) \down <a'-5 d''!-3 g''-\tweak color #black -2>8 \up <a''-1 e'''-3 a'''-5>8]  | \barNumberCheck #25
 % Measure 25
 \down <g'-3 e''-1>8[ \up e''8-1( \up <b''-2 e'''-5>8) \down <d'-4 e'-3 a'-1>8] \up b'8-1[( \up <f''-2 b''-5>8) \down <d'-5 g'-3 c''-\tweak color #black -2>8 \up <c''-1 g''-3 c'''-5>8]  | \barNumberCheck #26
 % Measure 26
 \down <f'-4 aes'-3 b'-1>8[ \up a'8-1( \up <d''!-2 g''-5>8) \down <f'-4 a'-2 c''-1>8] \up c''8-1[( \up <g''-2 c'''-5>8) \down <f'!-5 b'-3 e''-\tweak color #black -2>8 \up <dis''-1 ais''-3 dis'''-5>8]  | \barNumberCheck #27
 % Measure 27
 \down <g'-4 c''-3 f''-1>8[ \up f''8-1( \up <c'''-2 f'''-5>8) \down <g'-4 b'-2 dis''-1>8] \up f''8-1[( \up <b''-2 f'''-5>8) \down <c''-5 e''-3 a''-\tweak color #black -2>8 \up <b''-1 f'''-3 b'''-5>8]  | \barNumberCheck #28
 \pageBreak
 % Measure 28
 \down <f'-5 b'-3 f''-1>8[ \up f''8-1( \up <c'''-2 f'''-5>8) \down <f'-4 a'-2 cis''-1>8] \up e''8-1[( \up <b''-2 e'''-5>8) \down <f'-5 aes'-3 es''-\tweak color #black -2>8 \up <f''-1 ces'''-3 fes'''-5>8]  | \barNumberCheck #29
 % Measure 29
 \down <f'-4 aes'-2 ces''-1>8[ \up c''8-1( \up <g''-2 c'''-5>8) \down <c'-4 ees'-2 bes'-1>8] \up g'8-1[( \up <d''-2 g''-5>8) \down <bes-4 ees'-2 a'-1>8 \up <bes'-1 es''-3 bes''-5>8]  | \barNumberCheck #30
 % Measure 30
 \down \clef bass <bes-5 des'-4 ges'-1>8[ \up ges'8-1( \up <des''-2 ges''-5>8) \down <a-4 ces'-3 f'-1>8] \up bes8-1[( \up <ges'-2 ces''-5>8) \down <ges-4 bes-3 fes'-\tweak color #black -2>8 \up <f'-1 c''-3 f''-5>8]  | \barNumberCheck #31
 % Measure 31
 \down <e!-4 ges-2 b!-1>8[ \up c'!8-1( \up <ges'-2 c''!-5>8) \down <e!-4 g-2 c'!-1>8] \up b8-1[( \up <f'-2 b'-5>8) \down <ees-4 g-2 c'-1>8 \up <ees'-1 bes'-3 ees''-5>8]  | \barNumberCheck #32
 \break \noPageBreak
 % Measure 32
 \time 3/2 \down <c-4 ees-2 g-1>8[ \up ees'8-1( \up <bes'-2 ees''-5>8) \down <c-4 e-2 a-1>8] \up g'8-1[( \up <d''-2 g''-5>8) \down <ees-4 ges-2 ces'-1>8 \up f'8-1]( \up <c''-2 f''-5>8[) \down <a,-5 d-3 g-1>8 \up d'8-1( \up <a'-2 d''-5>8])  | \barNumberCheck #33
 % Measure 33
 \time 2/2 \down <e!-4 ges-2 c'!-1>8[ \up f'!8-1( \up <des''-2 f''!-5>8) \down <f!-4 b-2 e'-1>8] \up f'8-1[( \up <c''-2 f''-5>8) \down <c-4 aes-2 des'-1>8 \up <c'-1 aes'-3 c''-5>8]  | \barNumberCheck #34
 % Measure 34
 \time 3/4 \down <f-5 aes-4 ces'-3 f'-1>8[ \up e'!8-1( \up <bes'-2 e''!-5>8) \down <aes-4 c'-2 g'-1>8] \up e'8-1[( \up <c''-2 e''-5>8])  | \barNumberCheck #35
 % Measure 35
 \down <aes-4 ces'-2 ees'-1>8[ \up g'8-1( \up <ces''-2 ees''-5>8) \down <bes-4 d'-2 g'-1>8] \up a'8-1[( \up <d''-2 f''-5>8])  | \barNumberCheck #36
 \break \noPageBreak
 % Measure 36
 \time 2/2 \down <a-5 b-3 e'-1>8[ \up e'8-1(-\tweak extra-offset #'(-5.5 . 3) ^\markup \italic "a tempo" \up <b'-2 e''-5>8) \down <a-5 b-3 e'-1>8] \up e'8-1[( \up <b'-2 e''-5>8) \down <c'-2 d'-1>8 \up <dis'-1 ais'-3 dis''-5>8]  | \barNumberCheck #37
 % Measure 37
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-4 b-3 e'-1>8] \up e'8-1[( \up <b'-2 e''-5>8) \down <a-5 b-4 g'-\tweak color #black -2>8 \up <a'-1 e''-3 a''-5>8]  | \barNumberCheck #38
 % Measure 38
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-4 b-3 e'-1>8] \up e'8-1[( \up <b'-2 e''-5>8) \down <c'-2 d'-1>8 \up <d'-1 a'-3 d''-5>8]  | \barNumberCheck #39
 \break \noPageBreak
 % Measure 39
 \down <a-3 b-2>8[ \up b8-1( \up <f'-2 b'-5>8) \down <a-3 b-2>8] \up b8-1[( \up <f'-2 b'-5>8) \down <a-3 cis'-1>8 \up <d'-1 a'-3 d''-5>8]  | \barNumberCheck #40
 % Measure 40
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-4 b-3 e'-1>8] \up e'8-1[( \up <b'-2 e''-5>8) \down <c'-2 d'-1>8 \up <dis'-1 ais'-3 dis''-5>8]  | \barNumberCheck #41
 % Measure 41
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <c'-4 d'-3 g'-1>8] \up gis'8-1[( \up <dis''-2 gis''-5>8) \down \clef treble <d'-4 e'-3 a'-1>8 \up <ais'-1 e''-3 ais''-5>8]  | \barNumberCheck #42
 \pageBreak
 % Measure 42
 \down <f'-4 g'-3 b'-1>8[ \up b'8-1( \up <f''-2 c'''-5>8) \down <fis'-3 g'-2 a'-1>8] \up b'8-1[( \up <f''-2 c'''-5>8) \down <f'-4 ges'-3 ces''-1>8 \up <d''-1 aes''-3 d'''-5>8]  | \barNumberCheck #43
 % Measure 43
 \down <f'!-4 g'!-3 b'-1>8[ \up b'8-1( \up <f''-2 b''-5>8) \down <fis'-3 g'-2 a'-1>8] \up b'8-1[( \up <f''-2 b''-5>8) \down <e'-4 aes'-3 des''-\tweak color #black -2>8 \up <c''-1 g''-3 c'''-5>8]  | \barNumberCheck #44
 % Measure 44
 \down <f'-4 ges'-3 b'-1>8[ \up b'8-1( \up <f''-2 b''-5>8) \down <f'-4 g'-3 c''-1>8] \up b'8-1[( \up <f''-2 b''-5>8) \down <d'-4 e'-3 a'-1>8 \up <g'-1 d''-3 g''-5>8]  | \barNumberCheck #45
 % Measure 45
 \down <b-4 d'-2 f'-1>8[ \up f'8-1( \up <c''-2 f''-5>8) \down <c'-3 d'-2 e'-1>8] \up f'8-1[( \up <c''-2 f''-5>8) \down <b-4 c'-3 g'-1>8 \up <f'-1 c''-3 f''-5>8]  | \barNumberCheck #46
 \break \noPageBreak
 % Measure 46
 \down <b-4 c'-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <b-4 c'-3 g'-1>8] \up g'8-1[( \up <d''-2 g''-5>8) \down <g-4 b-2 e'-1>8 \up <e'-1 b'-3 e''-5>8]  | \barNumberCheck #47
 % Measure 47
 \down <a-4 c'-2 e'!-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-4 b-3 g'-1>8] \up a'8-1[( \up <e''-2 a''-5>8) \down <a-4 b-3 g'-1>8 \up <e'-1 b'-3 e''-5>8]  | \barNumberCheck #48
 % Measure 48
 \down \clef bass <a-4 b-3 e'-1>8[ \up f'8-1( \up <c''-2 f''-5>8) \down <a-4 bes-3 g'-1>8] \up g'8-1[( \up <d''-2 g''-5>8) \down <a-4 b!-3 f'-1>8 \up <dis'-1 ais'-3 dis''-5>8]  | \barNumberCheck #49
 % Measure 49
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-4 b-3 g'-1>8] \up a'8-1[( \up <e''-2 a''-5>8) \down <a-4 b-3 g'-1>8 \up <e'-1 b'-3 e''-5>8]  | \barNumberCheck #50
 \break \noPageBreak
 % Measure 50
 \down <a-4 b-3 e'-1>8[ \up e'8-1( \up <b'-2 e''-5>8) \down <a-4 bes!-3 g'-1>8] \up e'8-1[( \up <b'-2 e''-5>8) \down <a!-4 b-3 f'-1>8 \up <d'-1 a'-3 d''-5>8]  | \barNumberCheck #51
 % Measure 51
 \up b8-\tweak color #black -2([ c'8-\tweak color #black -1 <e'-1 c''-5>8) \down <a-5 d'-3 g'-1>8] \up a'8-1[( <e''-2 a''-5>8) \down \clef treble <b-5 e'-3 ais'-1>8 \up b'8-\tweak color #black -2(] | \barNumberCheck #52
 % Measure 52
 \up c''8-\tweak color #black -1[ <e''-1 c'''-5>8) \down <a'-5 d''-3 g''-1>8 \up a''8-1(] <e'''-2 b'''-5>8[) \down <cis''-5 fis''-2 c'''-1>8 \up \ottava #1 e''''8-5~ <b'''-2 e''''-5>8] | \barNumberCheck #53
 % Measure 53
 \up <e'''-1 b'''-3 e''''-5>1->^\fermata \ottava #0 | \barNumberCheck #54
 \bar "|."

}
bassLine = {
 \clef bass \time 2/2 \voiceTwo \slurDown \tieDown
 \override Fingering.direction = #DOWN
 \set fingeringOrientations = #'(down)
 % Measure 1
 f2.-5-> g4-5->( | \barNumberCheck #2
 % Measure 2
 f2.-5) d4-5->( | \barNumberCheck #3
 % Measure 3
 f2.-5) g4-5->( | \barNumberCheck #4
 % Measure 4
 f2.-5) d4-5->( | \barNumberCheck #5
 % Measure 5
 f2.-5) g4-5->( | \barNumberCheck #6
 % Measure 6
 f2.-5) \clef treble d'4-5->( | \barNumberCheck #7
 % Measure 7
 ees'2.-5) d'4-5->( | \barNumberCheck #8
 % Measure 8
 d'2.-5) c'4-5->( | \barNumberCheck #9
 % Measure 9
 des'2.-5) a!4-5->( | \barNumberCheck #10
 % Measure 10
 g2.-5) ges4-5->( | \barNumberCheck #11
 % Measure 11
 f2-5)( f8-5) f4.-5->( | \barNumberCheck #12
 % Measure 12
 \time 3/2 \clef bass g2.-5) f4.-5-> fis4.-5-> | \barNumberCheck #13
 % Measure 13
 \time 2/2 g2-5->~ g8-5 g4.-5->~ | \barNumberCheck #14
 % Measure 14
 g2-5~ g8-5 g4.-5->~ | \barNumberCheck #15
 % Measure 15
 g2-5~ g8-5 f4.-5->( | \barNumberCheck #16
 % Measure 16
 f2-5)~ f8-5 ees4.-5->~ | \barNumberCheck #17
 % Measure 17
 ees2-5~ ees8-5 ees4.-5->~ | \barNumberCheck #18
 % Measure 18
 \time 3/2 ees2.-5 e2.-5-> | \barNumberCheck #19
 % Measure 19
 \time 2/2 ees2-5->( c8-5) c4.-5->( | \barNumberCheck #20
 % Measure 20
 c2-5)~ c8-5 f,4.-5-> | \barNumberCheck #21
 % Measure 21
 s1 | \barNumberCheck #22
 % Measure 22
 \time 3/2 s1. | \barNumberCheck #23
 % Measure 23
 \time 2/2 d'2-5->~ d'8-5 e'4.-5->( | \barNumberCheck #24
 % Measure 24
 e'2-5)~ e'8-5 ees'4.-5->( | \barNumberCheck #25
 % Measure 25
 c'2-5)~ c'8-5 a4.-5->( | \barNumberCheck #26
 % Measure 26
 des'2-5)~ des'8-5 a4.-5->( | \barNumberCheck #27
 % Measure 27
 e'2-5)~ e'8-5 f'4.-5->( | \barNumberCheck #28
 % Measure 28
 e'2-5)~ e'8-5 d'4.-5->( | \barNumberCheck #29
 % Measure 29
 bes2-5)~ bes8-5 aes4.-5->( | \barNumberCheck #30
 % Measure 30
 \clef bass d'2-3)~ d'8-3 ges4.-5->( | \barNumberCheck #31
 % Measure 31
 bes,2-5)~ bes,8-5 bes,4.-5->~ | \barNumberCheck #32
 % Measure 32
 \time 3/2 bes,1.-5-> | \barNumberCheck #33
 % Measure 33
 \time 2/2 des1-5-> | \barNumberCheck #34
 % Measure 34
 \time 3/4 b,2.-5-> | \barNumberCheck #35
 % Measure 35
 c2.-5-> | \barNumberCheck #36
 % Measure 36
 \time 2/2 a2.-5-> g4-5->( | \barNumberCheck #37
 % Measure 37
 f2.-5) d4-5->( | \barNumberCheck #38
 % Measure 38
 f2.-5) g4-5->( | \barNumberCheck #39
 % Measure 39
 f2.-5) d4-5->( | \barNumberCheck #40
 % Measure 40
 f2.-5) g4-5->( | \barNumberCheck #41
 % Measure 41
 f2.-5) \clef treble d'4-5->( | \barNumberCheck #42
 % Measure 42
 ees'2.-5) d'4-5->( | \barNumberCheck #43
 % Measure 43
 d'2.-5) c'4-5->( | \barNumberCheck #44
 % Measure 44
 des'2.-5) a!4-5->( | \barNumberCheck #45
 % Measure 45
 g2.-5) ges4-5->( | \barNumberCheck #46
 % Measure 46
 f2-5)( f8-5) f4.-5->( | \barNumberCheck #47
 % Measure 47
 e2-5)( f8-5) f4.-5->( | \barNumberCheck #48
 % Measure 48
 \clef bass g2-5)~ g8-5 g4.-5->~ | \barNumberCheck #49
 % Measure 49
 g2-5~ g8-5 g4.-5->~ | \barNumberCheck #50
 % Measure 50
 g2-5~ g8-5 g4.-5->( | \barNumberCheck #51
 % Measure 51
 <c,-5 g,-2 e-1>1->) | \barNumberCheck #52
 % Measure 52
 <f-5 c'-2 a'!-1>1-> | \barNumberCheck #53
 % Measure 53
 <c''!-5 d''-4 g''-2 a''-1>1->^\fermata | \barNumberCheck #54
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
 s4-\tweak extra-offset #'(2 . -2.3) ^\markup \italic "simili" s4\> s2\! |
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
 \override Hairpin.extra-offset = #'(0 . -0.3)
 
 s8 s2\< s8\! s8 s2\> s8\! |
 % Measure 13
 \override Hairpin.extra-offset = #'(0 . -1.2)
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
 \once \override DynamicTextSpanner.extra-offset = #'(1.8 . -1.2)
 s2. s4\cresc |
 % Measure 34
 s2.^\markup \italic "e rall." |
 % Measure 35
 s2. |
 % Measure 36
 s1\!\f |
 % Measure 37
 \override Hairpin.extra-offset = #'(0 . -0.3)
 s4 s2\< s4\> |
 % Measure 38
 \override Hairpin.extra-offset = #'(0 . -1.2)
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
 \override Hairpin.extra-offset = #'(0 . -0.3)
 s8 s4\< s8\! s4\> s4\! |
 % Measure 50
 \override Hairpin.extra-offset = #'(0 . -1.2)
 s1 |
 % Measure 51
 s2 s2\cresc |
 % Measure 52
 s1\< |
 % Measure 53
 \once \override DynamicText.extra-offset = #'(0 . 0)
 s1\!\ff |
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
