\version "2.26.0"
\include "styles/common.ily"
\include "styles/lily-classical.ily"
\include "styles/chopin-typography.ily"
\header {
 title = \markup \override #'(font-name . "C059") \fontsize #2 "Elfin Dance"
 composer = \markup \override #'(font-name . "C059") "Edvard Grieg"
 tagline = ##f
}
\paper {
 page-count = #2
 systems-per-page = #6
 print-page-number = ##t
 oddFooterMarkup = \markup \fill-line { "" \fromproperty #'page:page-number-string }
 evenFooterMarkup = \oddFooterMarkup
 ragged-bottom = ##f
 ragged-last-bottom = ##f
 system-system-spacing.basic-distance = #16
 system-system-spacing.minimum-distance = #12
 system-system-spacing.padding = #2
}
\layout {
 \context { \PianoStaff
  \override StaffGrouper.staff-staff-spacing.basic-distance = #9
  \override StaffGrouper.staff-staff-spacing.minimum-distance = #8
  \override StaffGrouper.staff-staff-spacing.padding = #1
 }
 \context { \Staff
  \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #9
  \override VerticalAxisGroup.staff-staff-spacing.minimum-distance = #8
  \override VerticalAxisGroup.staff-staff-spacing.padding = #1
 }
}
fz = #(make-dynamic-script "fz")

rh = {
 \clef treble \key e \minor \time 3/4
 \set fingeringOrientations = #'(up)
 \tempo \markup \override #'(font-name . "Engraving Tempo") "Allegro"
 % Measure 1
 <b'-2 e''-5>4-.\pp <b' e''>4-. <c'' e''>4-. | \barNumberCheck #2
 % Measure 2
 <b' e''>4-. <b' e''>4-. g'8-1([ a'8] | \barNumberCheck #3
 % Measure 3
 b'8[ c'' b'-1 e''-4 d'' c''] | \barNumberCheck #4
 % Measure 4
 a'8[ c''-2 e''-3 fis''!] g''4)-. | \barNumberCheck #5
 % Measure 5
 <d''-1 fis''-2 b''-5>4-. <d'' fis'' b''>4-. <d'' g'' b''>4-. | \barNumberCheck #6
 % Measure 6
 <d'' fis'' b''>4-. <d'' fis'' b''>4-. b'8-1([ cis''8] | \barNumberCheck #7 \break
 % Measure 7
 d''8[ fis''\< <b' d''> fis'' <ais'-1 cis''-2> fis''] | \barNumberCheck #8
 % Measure 8
 <b'-1 dis''-3>8\!\fz[ fis'' <b' dis''> fis'' <b' dis''> fis'']) | \barNumberCheck #9
 % Measure 9
 <b'-2 e''-5>4-.\pp <b' e''>4-. <c'' e''>4-. | \barNumberCheck #10
 % Measure 10
 <b' e''>4-. <b' e''>4-. g'8-1([ a'8] | \barNumberCheck #11
 % Measure 11
 b'8[ c'' b'-1 e''-4 d'' c''] | \barNumberCheck #12
 % Measure 12
 a'8[ c''-2 e''-3 fis''!] g''4)-. | \barNumberCheck #13 \break
 % Measure 13
 <d''-1 fis''-2 b''-5>4-. <d'' fis'' b''>4-. <d'' g'' b''>4-. | \barNumberCheck #14
 % Measure 14
 <d'' fis'' b''>4-. <d'' fis'' b''>4-. b'8-1([ cis''8] | \barNumberCheck #15
 % Measure 15
 d''8[ fis''\< <b' d''> fis'' <ais'-1 cis''-2> fis''] | \barNumberCheck #16
 % Measure 16
 <b'-1 dis''-3>8\!\fz[ fis'' <b' dis''> fis'' <b' dis''> fis'']) | \barNumberCheck #17
 % Measure 17
 b4-5-.\f b4-. fis4-2-. | \barNumberCheck #18
 % Measure 18
 b4-. b4-. e'8-1(\pp[ fis'8] | \barNumberCheck #19 \break
 % Measure 19
 g'8[ ais' g' ais' fis' ais'] | \barNumberCheck #20
 % Measure 20
 e'8[ ais' e' ais']) r4 | \barNumberCheck #21
 % Measure 21
 b4-5-.\f b4-. fis4-2-. | \barNumberCheck #22
 % Measure 22
 b4-. b4-. e'8-1(\pp[ fis'8] | \barNumberCheck #23
 % Measure 23
 g'8[ bes' g' bes' fis' bes'] | \barNumberCheck #24
 % Measure 24
 e'8[ bes' e' bes']) g'8-1([ a'8] | \barNumberCheck #25 \break
 % Measure 25
 bes'8[_\markup\italic "cresc." cis'' bes' cis'' a' cis''] | \barNumberCheck #26
 % Measure 26
 g'8[ cis'' g' cis'']) ais'8-2([ b'!8-1] | \barNumberCheck #27
 % Measure 27
 c''!8-3\f[ d'' c'' d'' b'!-1 d''] | \barNumberCheck #28
 % Measure 28
 ais'8-2\>[ d'' ais' d'' ais' d''])\! | \barNumberCheck #29
 % Measure 29
 b'8-1(\pp[ e''-4 b' e'' b' e'']) | \barNumberCheck #30
 % Measure 30
 b'8([ dis'' b' dis'' b' dis''-4]) | \barNumberCheck #31 \break
 % Measure 31
 <b'-2 e''-5>4-. <b' e''>4-. <c'' e''>4-. | \barNumberCheck #32
 % Measure 32
 <b' e''>4-. <b' e''>4-. g'8-1([ a'8] | \barNumberCheck #33
 % Measure 33
 b'8[ c'' b'-1 e''-4 d'' c''] | \barNumberCheck #34
 % Measure 34
 a'8[ c''-2 e''-3 fis''!] g''4)-. | \barNumberCheck #35
 % Measure 35
 <d''-1 fis''-2 b''-5>4-. <d'' fis'' b''>4-. <d'' g'' b''>4-. | \barNumberCheck #36
 % Measure 36
 <d'' fis'' b''>4-. <d'' fis'' b''>4-. b'8-1([ cis''8] | \barNumberCheck #37 \pageBreak
 % Measure 37
 d''8[ fis''\< <b' d''> fis'' <ais'-1 cis''-2> fis''] | \barNumberCheck #38
 % Measure 38
 <b'-1 dis''-3>8\!\fz[ fis'' <b' dis''> fis'' <b' dis''> fis'']) | \barNumberCheck #39
 % Measure 39
 b4-5-.\f b4-. fis4-2-. | \barNumberCheck #40
 % Measure 40
 b4-. b4-. e'8-1(\pp[ fis'8] | \barNumberCheck #41
 % Measure 41
 g'8[ ais' g' ais' fis' ais'] | \barNumberCheck #42
 % Measure 42
 e'8[ ais' e' ais']) r4 | \barNumberCheck #43 \break
 % Measure 43
 b4-5-.\f b4-. fis4-2-. | \barNumberCheck #44
 % Measure 44
 b4-. b4-. e'8-1(\pp[ fis'8] | \barNumberCheck #45
 % Measure 45
 g'8[ bes' g' bes' fis' bes'] | \barNumberCheck #46
 % Measure 46
 e'8[ bes' e' bes']) g'8-1([ a'8] | \barNumberCheck #47
 % Measure 47
 bes'8[_\markup\italic "cresc." cis'' bes' cis'' a' cis''] | \barNumberCheck #48
 % Measure 48
 g'8[ cis'' g' cis'']) ais'8-2([ b'!8-1] | \barNumberCheck #49 \break
 % Measure 49
 c''!8-3\f[ d'' c'' d'' b'!-1 d''] | \barNumberCheck #50
 % Measure 50
 ais'8-2\>[ d'' ais' d'' ais' d''])\! | \barNumberCheck #51
 % Measure 51
 b'8-1(\pp[ e''-4 b' e'' b' e'']) | \barNumberCheck #52
 % Measure 52
 b'8([ dis'' b' dis'' b' dis''-4]) | \barNumberCheck #53
 % Measure 53
 <b'-2 e''-5>4-.\pp <b' e''>4-. <c'' e''>4-. | \barNumberCheck #54
 % Measure 54
 <b' e''>4-. <b' e''>4-. g'8-1([ a'8] | \barNumberCheck #55 \break
 % Measure 55
 b'8[ c'' b'-1 e''-4 d'' c''] | \barNumberCheck #56
 % Measure 56
 a'8[ c''-2 e''-3 fis''!] g''4)-. | \barNumberCheck #57
 % Measure 57
 <d''-1 fis''-2 b''-5>4-. <d'' fis'' b''>4-. <d'' g'' b''>4-. | \barNumberCheck #58
 % Measure 58
 <d'' fis'' b''>4-. <d'' fis'' b''>4-. b'8-1([ cis''8] | \barNumberCheck #59
 % Measure 59
 d''8[ fis''\< <b' d''> fis'' <ais'-1 cis''-2> fis''] | \barNumberCheck #60
 % Measure 60
 <b'-1 dis''-3>8\!\fz[ fis'' <b' dis''> fis'' <b' dis''> fis'']) | \barNumberCheck #61 \break
 % Measure 61
 <b'-2 e''-5>4-.\pp <b' e''>4-. <c'' e''>4-. | \barNumberCheck #62
 % Measure 62
 <b' e''>4-. <b' e''>4-. g'8-1([ a'8] | \barNumberCheck #63
 % Measure 63
 b'8[ c'' b'-1 e''-4 d'' c''] | \barNumberCheck #64
 % Measure 64
 a'8[ c''-2 e''-3 fis''!] g''4)-. | \barNumberCheck #65
 % Measure 65
 r8 gis'8-1([ a'-2 c''] e''4)-. | \barNumberCheck #66
 % Measure 66
 r8 e'8-1([ f'!-2 a'] c''4-3)-. | \barNumberCheck #67 \break
 % Measure 67
 r8 cisis'8-1([ dis'-2 fis'-3] b'4)-. | \barNumberCheck #68
 % Measure 68
 <e g e'>4-.\ppp <e g e'>4-. <e c' e'>4-. | \barNumberCheck #69
 % Measure 69
 <e g e'>4-. <e g e'>4-. <fis g e'>4-. | \barNumberCheck #70
 % Measure 70
 <e g e'>4-. r4 r4 | \barNumberCheck #71
 % Measure 71
 \slurUp \grace { b'16-1([ dis''-2] } <g' e''>4)-. r4 r4 | \barNumberCheck #72
 % Measure 72
 \slurUp \grace { b''16([ dis'''-4] } <g'' e'''>4)-. r4 r4 | \barNumberCheck #73
 \bar "|."
}

lh = {
 \clef treble \key e \minor \time 3/4
 \set fingeringOrientations = #'(down)
 % Measure 1
 <e'_3 g'_1>4-. <e' g'>4-. <c' g'>4-. | \barNumberCheck #2
 % Measure 2
 <e' g'>4-. <e' g'>4-. r4 | \barNumberCheck #3
 % Measure 3
 <e'_4 g'_2>4-. <e' g'>4-. <d' g'>4-. | \barNumberCheck #4
 % Measure 4
 <e' g'>4-. r4 r4 | \barNumberCheck #5
 % Measure 5
 b'4_1-. b'4-. g'4-. | \barNumberCheck #6
 % Measure 6
 b'4-. b'4-. r4 | \barNumberCheck #7
 % Measure 7
 fis'4_1( d'8[ e'] fis'4) | \barNumberCheck #8
 % Measure 8
 fis'2_2( b4) | \barNumberCheck #9
 % Measure 9
 <e'_3 g'_1>4-. <e' g'>4-. <c' g'>4-. | \barNumberCheck #10
 % Measure 10
 <e' g'>4-. <e' g'>4-. r4 | \barNumberCheck #11
 % Measure 11
 <e'_4 g'_2>4-. <e' g'>4-. <d' g'>4-. | \barNumberCheck #12
 % Measure 12
 <e' g'>4-. r4 r4 | \barNumberCheck #13
 % Measure 13
 b'4_1-. b'4-. g'4-. | \barNumberCheck #14
 % Measure 14
 b'4-. b'4-. r4 | \barNumberCheck #15
 % Measure 15
 fis'4_1( d'8[ e'] fis'4) | \barNumberCheck #16
 % Measure 16
 fis'2_2( b4) | \barNumberCheck #17
 % Measure 17
 \clef bass b,4_1-. b,4-. fis,4_4-. | \barNumberCheck #18
 % Measure 18
 b,4-. b,4-. r4 | \barNumberCheck #19
 % Measure 19
 <e_5 cis'_1>4-. <e cis'>4-. <fis_4 cis'>4-. | \barNumberCheck #20
 % Measure 20
 <g_3 cis'>4-. <g cis'>4-. r4 | \barNumberCheck #21
 % Measure 21
 b,4_1-. b,4-. fis,4_4-. | \barNumberCheck #22
 % Measure 22
 b,4-. b,4-. r4 | \barNumberCheck #23
 % Measure 23
 <e_5 cis'_1>4-. <e cis'>4-. <fis_4 cis'>4-. | \barNumberCheck #24
 % Measure 24
 <g cis'>4-. <g cis'>4-. r4 | \barNumberCheck #25
 % Measure 25
 <g_5 e'_1>4-. <g e'>4-. <a_4 e'>4-. | \barNumberCheck #26
 % Measure 26
 <bes e'>4-. <bes e'>4-. r4 \clef treble | \barNumberCheck #27
 % Measure 27
 <bes_5 g'_1>4-. <e' g'>4-. <d' g'>4-. | \barNumberCheck #28
 % Measure 28
 <c'_4 fis'>4-. <c' fis'>4-. <c' fis'>4-. | \barNumberCheck #29
 % Measure 29
 <b_5 fis'_1>4-. <b fis'>4-. <b fis'>4-. | \barNumberCheck #30
 % Measure 30
 <b fis'>4-. <b fis'>4-. <b fis'>4-. | \barNumberCheck #31
 % Measure 31
 <e'_3 g'_1>4-. <e' g'>4-. <c' g'>4-. | \barNumberCheck #32
 % Measure 32
 <e' g'>4-. <e' g'>4-. r4 | \barNumberCheck #33
 % Measure 33
 <e'_4 g'_2>4-. <e' g'>4-. <d' g'>4-. | \barNumberCheck #34
 % Measure 34
 <e' g'>4-. r4 r4 | \barNumberCheck #35
 % Measure 35
 b'4_1-. b'4-. g'4-. | \barNumberCheck #36
 % Measure 36
 b'4-. b'4-. r4 | \barNumberCheck #37
 % Measure 37
 fis'4_1( d'8[ e'] fis'4) | \barNumberCheck #38
 % Measure 38
 fis'2_2( b4) | \barNumberCheck #39
 % Measure 39
 \clef bass b,4_1-. b,4-. fis,4_4-. | \barNumberCheck #40
 % Measure 40
 b,4-. b,4-. r4 | \barNumberCheck #41
 % Measure 41
 <e_5 cis'_1>4-. <e cis'>4-. <fis_4 cis'>4-. | \barNumberCheck #42
 % Measure 42
 <g_3 cis'>4-. <g cis'>4-. r4 | \barNumberCheck #43
 % Measure 43
 b,4_1-. b,4-. fis,4_4-. | \barNumberCheck #44
 % Measure 44
 b,4-. b,4-. r4 | \barNumberCheck #45
 % Measure 45
 <e_5 cis'_1>4-. <e cis'>4-. <fis_4 cis'>4-. | \barNumberCheck #46
 % Measure 46
 <g cis'>4-. <g cis'>4-. r4 | \barNumberCheck #47
 % Measure 47
 <g_5 e'_1>4-. <g e'>4-. <a_4 e'>4-. | \barNumberCheck #48
 % Measure 48
 <bes e'>4-. <bes e'>4-. r4 \clef treble | \barNumberCheck #49
 % Measure 49
 <bes_5 g'_1>4-. <e'_2 g'>4-. <d' g'>4-. | \barNumberCheck #50
 % Measure 50
 <c'_4 fis'>4-. <c' fis'>4-. <c' fis'>4-. | \barNumberCheck #51
 % Measure 51
 <b_5 fis'_1>4-. <b fis'>4-. <b fis'>4-. | \barNumberCheck #52
 % Measure 52
 <b fis'>4-. <b fis'>4-. <b fis'>4-. | \barNumberCheck #53
 % Measure 53
 <e'_3 g'_1>4-. <e' g'>4-. <c' g'>4-. | \barNumberCheck #54
 % Measure 54
 <e' g'>4-. <e' g'>4-. r4 | \barNumberCheck #55
 % Measure 55
 <e'_4 g'_2>4-. <e' g'>4-. <d' g'>4-. | \barNumberCheck #56
 % Measure 56
 <e' g'>4-. r4 r4 | \barNumberCheck #57
 % Measure 57
 b'4_1-. b'4-. g'4-. | \barNumberCheck #58
 % Measure 58
 b'4-. b'4-. r4 | \barNumberCheck #59
 % Measure 59
 fis'4_1( d'8[ e'] fis'4) | \barNumberCheck #60
 % Measure 60
 fis'2_2( b4) | \barNumberCheck #61
 % Measure 61
 <e'_3 g'_1>4-. <e' g'>4-. <c' g'>4-. | \barNumberCheck #62
 % Measure 62
 <e' g'>4-. <e' g'>4-. r4 | \barNumberCheck #63
 % Measure 63
 <e'_4 g'_2>4-. <e' g'>4-. <d' g'>4-. | \barNumberCheck #64
 % Measure 64
 <e' g'>4-. r4 r4 | \barNumberCheck #65
 % Measure 65
 <c'_2 e'_1>4-. r4 r4 \clef bass | \barNumberCheck #66
 % Measure 66
 <a_4 c'_2>4-. r4 r4 | \barNumberCheck #67
 % Measure 67
 <c_5 fis_2 a_1>4-. r4 r4 | \barNumberCheck #68
 % Measure 68
 <e,_5 b,_2 e_1>4-. <e, b, e>4-. <e, a, e>4-. | \barNumberCheck #69
 % Measure 69
 <e, b, e>4-. <e, b, e>4-. <e, c e>4-. | \barNumberCheck #70
 % Measure 70
 <e, b, e>4-. r4 r4 | \barNumberCheck #71
 % Measure 71
 <e b>4-. r4 r4 \clef treble | \barNumberCheck #72
 % Measure 72
 <e' b'>4-. r4 r4 | \barNumberCheck #73
 \bar "|."
}
\score {
 \new PianoStaff << \new Staff = "RH" \rh \new Staff = "LH" \lh >>
 \layout { }
 \midi { \tempo 4 = 144 }
}
