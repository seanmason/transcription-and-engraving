\version "2.26.0"
\include "styles/common.ily"
\include "styles/lily-classical.ily"
\include "styles/chopin-typography.ily"
\header {
 title = \markup \override #'(font-name . "C059") \fontsize #2 "La Valse d'Amélie"
 composer = \markup \override #'(font-name . "C059") "Yann Tiersen"
 tagline = ##f
}
\paper {
 print-page-number = ##t
 oddFooterMarkup = \markup \fill-line { "" \fromproperty #'page:page-number-string }
 evenFooterMarkup = \oddFooterMarkup
 ragged-bottom = ##f
 ragged-last-bottom = ##f
 system-system-spacing.basic-distance = #17
 system-system-spacing.minimum-distance = #13
 system-system-spacing.padding = #3
}
\layout {
 \context { \PianoStaff
  \override StaffGrouper.staff-staff-spacing.basic-distance = #10
  \override StaffGrouper.staff-staff-spacing.minimum-distance = #9
  \override StaffGrouper.staff-staff-spacing.padding = #2
 }
 \context { \Staff
  \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #10
  \override VerticalAxisGroup.staff-staff-spacing.minimum-distance = #9
  \override VerticalAxisGroup.staff-staff-spacing.padding = #2
 }
}

melody = {
 \clef treble \time 2/4
 \set fingeringOrientations = #'(up)
 \tempo 4 = 100
 % Measure 1
 d''2-4(~ | \barNumberCheck #2
 % Measure 2
 d''4~ d''8.[ d''16] | \barNumberCheck #3
 % Measure 3
 b'2-2) | \barNumberCheck #4
 % Measure 4
 b'4 a'4 | \barNumberCheck #5
 % Measure 5
 d''2-4(~ | \barNumberCheck #6
 % Measure 6
 \tuplet 3/2 { d''8[ e''-5 d''] } \tuplet 3/2 { c''8[ b' d''] } | \barNumberCheck #7 \break
 % Measure 7
 b'2-2)~ | \barNumberCheck #8
 % Measure 8
 b'4 a'4( | \barNumberCheck #9
 % Measure 9
 c''2-4~ | \barNumberCheck #10
 % Measure 10
 c''4~ c''8.[ c''16]) | \barNumberCheck #11
 % Measure 11
 e'2-1~ | \barNumberCheck #12
 % Measure 12
 e'2 | \barNumberCheck #13
 % Measure 13
 c''2-4(~ | \barNumberCheck #14 \break
 % Measure 14
 \tuplet 3/2 { c''8[ d''-5 c''] } \tuplet 3/2 { b'8[ c'' b'-3] } | \barNumberCheck #15
 % Measure 15
 e'2-1)~ | \barNumberCheck #16
 % Measure 16
 e'2 | \barNumberCheck #17
 % Measure 17
 <d''-1 d'''-5>2(~ | \barNumberCheck #18
 % Measure 18
 <d'' d'''>4~ <d'' d'''>8[ <c'' c'''>8] | \barNumberCheck #19
 % Measure 19
 <b' b''>2)~ | \barNumberCheck #20
 % Measure 20
 <b' b''>4 <a' a''>4( | \barNumberCheck #21 \break
 % Measure 21
 <d'' d'''>2~ | \barNumberCheck #22
 % Measure 22
 \tuplet 3/2 { <d'' d'''>8[ e''-4 d''] } \tuplet 3/2 { c''8[ b'-1 c''-2] } | \barNumberCheck #23
 % Measure 23
 <b' b''>2)~ | \barNumberCheck #24
 % Measure 24
 <b' b''>4 <a' a''>4 | \barNumberCheck #25
 % Measure 25
 <c'' c'''>2(~ | \barNumberCheck #26
 % Measure 26
 <c'' c'''>4~ <c'' c'''>8[ <c'' c'''>8] | \barNumberCheck #27
 % Measure 27
 <e' e''>2)~ | \barNumberCheck #28 \break
 % Measure 28
 <e' e''>2 | \barNumberCheck #29
 % Measure 29
 <c'' c'''>2(~ | \barNumberCheck #30
 % Measure 30
 \tuplet 3/2 { <c'' c'''>8[ d''-4 c''] } \tuplet 3/2 { b'8[ c'' b'-2] } | \barNumberCheck #31
 % Measure 31
 <e' e''>2)~ | \barNumberCheck #32
 % Measure 32
 <e' e''>2 \bar "||" | \barNumberCheck #33 \pageBreak
 \time 3/4
 \tempo 4 = 150
 \voiceOne \slurUp
 % Measure 33
 d''2.(-5 | \barNumberCheck #34
 % Measure 34
 d''4.-5 c''4.-5) | \barNumberCheck #35 \break
 % Measure 35
 b'2.(-5 | \barNumberCheck #36
 % Measure 36
 a'2.-5) | \barNumberCheck #37
 % Measure 37
 d''2.(-5 | \barNumberCheck #38
 % Measure 38
 d''4.-5 c''4.-5 | \barNumberCheck #39
 % Measure 39
 b'2.-5 | \barNumberCheck #40 \break
 % Measure 40
 a'2.-5) | \barNumberCheck #41
 % Measure 41
 c''2.(-5 | \barNumberCheck #42
 % Measure 42
 c''2.-5 | \barNumberCheck #43
 % Measure 43
 c''2.-5) | \barNumberCheck #44
 \oneVoice
 % Measure 44
 e'8-3[ d' c'] e'[ d' c'] | \barNumberCheck #45 \break
 \voiceOne
 % Measure 45
 c''2.(-5 | \barNumberCheck #46
 % Measure 46
 c''2. | \barNumberCheck #47
 % Measure 47
 c''2.-5) | \barNumberCheck #48
 \oneVoice
 % Measure 48
 e'8-3[ d' c'] e'[ d' c'] | \barNumberCheck #49
 \voiceOne
 % Measure 49
 d''2.(-5 | \barNumberCheck #50 \break
 % Measure 50
 e''4.-5 c''4.-5 | \barNumberCheck #51
 % Measure 51
 b'2.-5 | \barNumberCheck #52
 % Measure 52
 a'2.-5) | \barNumberCheck #53
 % Measure 53
 d''2.(-5 | \barNumberCheck #54
 % Measure 54
 e''4.-5 c''4.-5 | \barNumberCheck #55 \break
 % Measure 55
 b'2.-5 | \barNumberCheck #56
 % Measure 56
 a'2.-5) | \barNumberCheck #57
 % Measure 57
 c''2.(-5 | \barNumberCheck #58
 % Measure 58
 c''4.-5 b'4.-5 | \barNumberCheck #59
 % Measure 59
 g'2.-4) | \barNumberCheck #60 \break
 \oneVoice
 % Measure 60
 e'8-3[ d' c'] e'[ d' c'] | \barNumberCheck #61
 \voiceOne
 % Measure 61
 c''2.(-5 | \barNumberCheck #62
 % Measure 62
 c''4.-5 b'4.-5 | \barNumberCheck #63
 % Measure 63
 g'2.-4) | \barNumberCheck #64
 \oneVoice
 % Measure 64
 e'8-3[ d' c'] e'[ d' c'] | \barNumberCheck #65 \pageBreak
 \oneVoice \slurNeutral
 % Measure 65
 d''2.-2(~ | \barNumberCheck #66
 % Measure 66
 d''8[ e''-3] f''-4[ e''] g''[ f''] | \barNumberCheck #67
 % Measure 67
 a'2.-1)~ | \barNumberCheck #68
 % Measure 68
 a'4 b'4.-2( c''8-1 | \barNumberCheck #69
 % Measure 69
 d''2.-2~ | \barNumberCheck #70
 % Measure 70
 d''8[ e''] f''[ e''] g''[ f''] | \barNumberCheck #71 \break
 % Measure 71
 a'2.-1)~ | \barNumberCheck #72
 % Measure 72
 a'4. g'8-2~ g'4( | \barNumberCheck #73
 % Measure 73
 a'2.-3~ | \barNumberCheck #74
 % Measure 74
 a'8[ b'-4] c''-5[ b'] d''[ c''] | \barNumberCheck #75
 % Measure 75
 e'2.-1)~ | \barNumberCheck #76
 % Measure 76
 e'4 f'4.-2( g'8-1 | \barNumberCheck #77 \break
 % Measure 77
 a'2.-2~ | \barNumberCheck #78
 % Measure 78
 a'8[ b'-3] c''-4[ b'] d''[ c''] | \barNumberCheck #79
 % Measure 79
 e'2.-1)~ | \barNumberCheck #80
 % Measure 80
 e'2. | \barNumberCheck #81
 % Measure 81
 <d''-1 d'''-5>2.(~ | \barNumberCheck #82
 % Measure 82
 <d'' d'''>4 <c'' c'''>2 | \barNumberCheck #83 \break
 % Measure 83
 <b' b''>2.) | \barNumberCheck #84
 % Measure 84
 <a' a''>2.( | \barNumberCheck #85
 % Measure 85
 <d'' d'''>2.~ | \barNumberCheck #86
 % Measure 86
 <d'' d'''>8[ e''-4] d''[ c''] b'[ d''] | \barNumberCheck #87
 % Measure 87
 <b' b''>2.) | \barNumberCheck #88
 % Measure 88
 <a' a''>2.( | \barNumberCheck #89 \break
 % Measure 89
 <c'' c'''>2.~ | \barNumberCheck #90
 % Measure 90
 <c'' c'''>4. <c'' c'''>8~ <c'' c'''>4 | \barNumberCheck #91
 % Measure 91
 <e' e''>2.)~ | \barNumberCheck #92
 % Measure 92
 <e' e''>2. | \barNumberCheck #93
 % Measure 93
 <c'' c'''>2.(~ | \barNumberCheck #94
 % Measure 94
 <c'' c'''>8[ d''-4] c''[ b'] c''[ b'-2] | \barNumberCheck #95 \break
 % Measure 95
 <e' e''>2.)~ | \barNumberCheck #96
 % Measure 96
 <e' e''>2. | \barNumberCheck #97 \pageBreak
 \voiceOne \slurUp
 % Measure 97
 d'''2.(-5 | \barNumberCheck #98
 % Measure 98
 d'''4.-5 c'''4.-5 | \barNumberCheck #99
 % Measure 99
 b''2.-5 | \barNumberCheck #100 \break
 % Measure 100
 a''2.-5) | \barNumberCheck #101
 % Measure 101
 d'''2.( | \barNumberCheck #102
 % Measure 102
 d'''4.-5 c'''4.-5 | \barNumberCheck #103
 % Measure 103
 b''2.-5 | \barNumberCheck #104
 % Measure 104
 a''2.) | \barNumberCheck #105 \break
 % Measure 105
 c'''2.(-5 | \barNumberCheck #106
 % Measure 106
 b''2. | \barNumberCheck #107
 % Measure 107
 c'''2.-5) | \barNumberCheck #108
 \oneVoice
 % Measure 108
 e''8-3[ d'' c''] e''[ d'' c''] | \barNumberCheck #109
 \voiceOne
 % Measure 109
 c'''2.(-5 | \barNumberCheck #110 \break
 % Measure 110
 b''2. | \barNumberCheck #111
 % Measure 111
 c'''2.-5) | \barNumberCheck #112
 \oneVoice
 % Measure 112
 e''8-3[ d'' c''] e''[ d'' c''] | \barNumberCheck #113
 \voiceOne
 % Measure 113
 d'''2.(-5 | \barNumberCheck #114
 % Measure 114
 d'''4.-5 c'''4.-5 | \barNumberCheck #115 \break
 % Measure 115
 b''2.-5 | \barNumberCheck #116
 % Measure 116
 a''2.-5) | \barNumberCheck #117
 % Measure 117
 d'''2.(-5 | \barNumberCheck #118
 % Measure 118
 d'''4.-5 c'''4.-5 | \barNumberCheck #119
 % Measure 119
 b''2.-5 | \barNumberCheck #120 \break
 % Measure 120
 a''2.-5) | \barNumberCheck #121
 % Measure 121
 c'''2.(-5 | \barNumberCheck #122
 % Measure 122
 b''4.-5 b''4.-5 | \barNumberCheck #123
 % Measure 123
 g''2.-4) | \barNumberCheck #124
 \oneVoice
 % Measure 124
 e''8-3[ d'' c''] e''[ d'' c''] | \barNumberCheck #125 \break
 \voiceOne
 % Measure 125
 c'''2.(-5 | \barNumberCheck #126
 % Measure 126
 b''4.-5 b''4.-5 | \barNumberCheck #127
 % Measure 127
 g''2.-4) | \barNumberCheck #128
 \oneVoice
 % Measure 128
 e''8-3[ d'' c''] e''[ d'' c''] | \barNumberCheck #129 \pageBreak
 \time 2/4
 \tempo 4 = 100
 \oneVoice \slurNeutral
 % Measure 129
 d''2-4(~ | \barNumberCheck #130 \break
 % Measure 130
 d''4~ d''8[ c''8]) | \barNumberCheck #131
 % Measure 131
 b'2~ | \barNumberCheck #132
 % Measure 132
 b'4 a'4( | \barNumberCheck #133
 % Measure 133
 d''2-4~ | \barNumberCheck #134
 % Measure 134
 \tuplet 3/2 { d''8[ e'' d''] } \tuplet 3/2 { c''8[ b' c''] } | \barNumberCheck #135
 % Measure 135
 g'2-2 | \barNumberCheck #136
 % Measure 136
 g'4 f'4_\fermata) \bar "|." | \barNumberCheck #137
}

figuration = {
 \clef treble \time 2/4
 \set fingeringOrientations = #'(up)
 \voiceTwo
 % Measure 1
 s2 | \barNumberCheck #2
 % Measure 2
 s2 | \barNumberCheck #3
 % Measure 3
 s2 | \barNumberCheck #4
 % Measure 4
 s2 | \barNumberCheck #5
 % Measure 5
 s2 | \barNumberCheck #6
 % Measure 6
 s2 | \barNumberCheck #7
 % Measure 7
 s2 | \barNumberCheck #8
 % Measure 8
 s2 | \barNumberCheck #9
 % Measure 9
 s2 | \barNumberCheck #10
 % Measure 10
 s2 | \barNumberCheck #11
 % Measure 11
 s2 | \barNumberCheck #12
 % Measure 12
 s2 | \barNumberCheck #13
 % Measure 13
 s2 | \barNumberCheck #14
 % Measure 14
 s2 | \barNumberCheck #15
 % Measure 15
 s2 | \barNumberCheck #16
 % Measure 16
 s2 | \barNumberCheck #17
 % Measure 17
 s2 | \barNumberCheck #18
 % Measure 18
 s2 | \barNumberCheck #19
 % Measure 19
 s2 | \barNumberCheck #20
 % Measure 20
 s2 | \barNumberCheck #21
 % Measure 21
 s2 | \barNumberCheck #22
 % Measure 22
 s2 | \barNumberCheck #23
 % Measure 23
 s2 | \barNumberCheck #24
 % Measure 24
 s2 | \barNumberCheck #25
 % Measure 25
 s2 | \barNumberCheck #26
 % Measure 26
 s2 | \barNumberCheck #27
 % Measure 27
 s2 | \barNumberCheck #28
 % Measure 28
 s2 | \barNumberCheck #29
 % Measure 29
 s2 | \barNumberCheck #30
 % Measure 30
 s2 | \barNumberCheck #31
 % Measure 31
 s2 | \barNumberCheck #32
 % Measure 32
 s2 | \barNumberCheck #33
 \time 3/4
 % Measure 33
 d''8[ e'-1] f'-2[ e'] f'[ e'] | \barNumberCheck #34
 % Measure 34
 d''8[ e'] f'[ c''] e'[ f'] | \barNumberCheck #35
 % Measure 35
 b'8[ d'-1] e'-2[ d'] e'[ d'] | \barNumberCheck #36
 % Measure 36
 a'8[ c'-1] d'-2[ e'-3] d'[ c'] | \barNumberCheck #37
 % Measure 37
 d''8[ e'] f'[ e'] f'[ e'] | \barNumberCheck #38
 % Measure 38
 d''8[ e'] f'[ c''] e'[ f'] | \barNumberCheck #39
 % Measure 39
 b'8[ d'-1] e'[ d'] e'[ d'] | \barNumberCheck #40
 % Measure 40
 a'8[ c'-1] d'[ e'] d'[ c'] | \barNumberCheck #41
 % Measure 41
 c''8[ e'-1] f'-2[ e'] f'[ e'] | \barNumberCheck #42
 % Measure 42
 c''8[ e'-1] f'-2[ e'] f'-2[ d'-1] | \barNumberCheck #43
 % Measure 43
 c''8[ d'-1] e'-2[ d'] e'[ d'-1] | \barNumberCheck #44
 % Measure 44
 s2. | \barNumberCheck #45
 % Measure 45
 c''8[ e'] f'[ e'] f'[ e'] | \barNumberCheck #46
 % Measure 46
 c''8[ e'] f'[ e'] f'-2[ d'-1] | \barNumberCheck #47
 % Measure 47
 c''8[ d'] e'[ d'] e'-2[ d'-1] | \barNumberCheck #48
 % Measure 48
 s2. | \barNumberCheck #49
 % Measure 49
 d''8[ e'] f'[ e'] f'[ e'] | \barNumberCheck #50
 % Measure 50
 e''8[ e'] f'[ c''] e'-1[ f'-2] | \barNumberCheck #51
 % Measure 51
 b'8[ d'] e'[ d'] e'[ d'] | \barNumberCheck #52
 % Measure 52
 a'8[ c'-1] d'[ e'-3] d'[ c'] | \barNumberCheck #53
 % Measure 53
 d''8[ e'] f'[ e'] f'[ e'] | \barNumberCheck #54
 % Measure 54
 e''8[ e'] f'[ c''] e'[ f'] | \barNumberCheck #55
 % Measure 55
 b'8[ d'] e'[ d'] e'[ d'] | \barNumberCheck #56
 % Measure 56
 a'8[ c'] d'[ e'] d'[ c'] | \barNumberCheck #57
 % Measure 57
 c''8[ e'] f'[ e'] f'[ e'] | \barNumberCheck #58
 % Measure 58
 c''8[ e'] f'[ b'] e'[ f'] | \barNumberCheck #59
 % Measure 59
 g'8[ d'-1] e'-2[ d'] e'[ d'-1] | \barNumberCheck #60
 % Measure 60
 s2. | \barNumberCheck #61
 % Measure 61
 c''8[ e'] f'[ e'] f'[ e'] | \barNumberCheck #62
 % Measure 62
 c''8[ e'] f'[ b'] e'[ f'] | \barNumberCheck #63
 % Measure 63
 g'8[ d'-1] e'-2[ d'] e'[ d'-1] | \barNumberCheck #64
 % Measure 64
 s2. | \barNumberCheck #65
 % Measure 65
 s2. | \barNumberCheck #66
 % Measure 66
 s2. | \barNumberCheck #67
 % Measure 67
 s2. | \barNumberCheck #68
 % Measure 68
 s2. | \barNumberCheck #69
 % Measure 69
 s2. | \barNumberCheck #70
 % Measure 70
 s2. | \barNumberCheck #71
 % Measure 71
 s2. | \barNumberCheck #72
 % Measure 72
 s2. | \barNumberCheck #73
 % Measure 73
 s2. | \barNumberCheck #74
 % Measure 74
 s2. | \barNumberCheck #75
 % Measure 75
 s2. | \barNumberCheck #76
 % Measure 76
 s2. | \barNumberCheck #77
 % Measure 77
 s2. | \barNumberCheck #78
 % Measure 78
 s2. | \barNumberCheck #79
 % Measure 79
 s2. | \barNumberCheck #80
 % Measure 80
 s2. | \barNumberCheck #81
 % Measure 81
 s2. | \barNumberCheck #82
 % Measure 82
 s2. | \barNumberCheck #83
 % Measure 83
 s2. | \barNumberCheck #84
 % Measure 84
 s2. | \barNumberCheck #85
 % Measure 85
 s2. | \barNumberCheck #86
 % Measure 86
 s2. | \barNumberCheck #87
 % Measure 87
 s2. | \barNumberCheck #88
 % Measure 88
 s2. | \barNumberCheck #89
 % Measure 89
 s2. | \barNumberCheck #90
 % Measure 90
 s2. | \barNumberCheck #91
 % Measure 91
 s2. | \barNumberCheck #92
 % Measure 92
 s2. | \barNumberCheck #93
 % Measure 93
 s2. | \barNumberCheck #94
 % Measure 94
 s2. | \barNumberCheck #95
 % Measure 95
 s2. | \barNumberCheck #96
 % Measure 96
 s2. | \barNumberCheck #97
 % Measure 97
 d'''8[ e''-1] f''[ e''] f''[ e''] | \barNumberCheck #98
 % Measure 98
 d'''8[ e''] f''[ c'''] e''[ f''] | \barNumberCheck #99
 % Measure 99
 b''8[ d''-1] e''[ d''] e''[ d''] | \barNumberCheck #100
 % Measure 100
 a''8[ c''-1] d''[ e''] d''[ c''] | \barNumberCheck #101
 % Measure 101
 d'''8[ e''] f''[ e''] f''[ e''] | \barNumberCheck #102
 % Measure 102
 d'''8[ e''] f''[ c'''] e''[ f''] | \barNumberCheck #103
 % Measure 103
 b''8[ d''] e''[ d''] e''[ d''] | \barNumberCheck #104
 % Measure 104
 a''8[ c''] d''[ e''] d''[ c''-1] | \barNumberCheck #105
 % Measure 105
 c'''8[ e''-1] f''[ e''] f''[ e''] | \barNumberCheck #106
 % Measure 106
 b''8[ d''] e''[ d''] e''-2[ c''-1] | \barNumberCheck #107
 % Measure 107
 c'''8[ d''] e''[ d''] e''[ d''-1] | \barNumberCheck #108
 % Measure 108
 s2. | \barNumberCheck #109
 % Measure 109
 c'''8[ e''] f''[ e''] f''[ e''] | \barNumberCheck #110
 % Measure 110
 b''8[ d''] e''[ d''] e''-2[ c''-1] | \barNumberCheck #111
 % Measure 111
 c'''8[ d''] e''[ d''] e''[ d''-1] | \barNumberCheck #112
 % Measure 112
 s2. | \barNumberCheck #113
 % Measure 113
 d'''8[ e''] f''[ e''] f''[ e''] | \barNumberCheck #114
 % Measure 114
 d'''8[ e''] f''[ c'''] e''[ f''] | \barNumberCheck #115
 % Measure 115
 b''8[ d''] e''[ d''] e''[ d''] | \barNumberCheck #116
 % Measure 116
 a''8[ c''] d''[ e''] d''[ c''] | \barNumberCheck #117
 % Measure 117
 d'''8[ e''] f''[ e''] f''[ e''] | \barNumberCheck #118
 % Measure 118
 d'''8[ e''] f''[ c'''] e''[ f''] | \barNumberCheck #119
 % Measure 119
 b''8[ d''] e''[ d''] e''[ d''] | \barNumberCheck #120
 % Measure 120
 a''8[ c''-1] d''[ e''] d''[ c''] | \barNumberCheck #121
 % Measure 121
 c'''8[ e''-1] f''[ e''] f''[ e''] | \barNumberCheck #122
 % Measure 122
 b''8[ e''] f''[ b''] e''[ f''] | \barNumberCheck #123
 % Measure 123
 g''8[ d''] e''-2[ d''] e''[ d''-1] | \barNumberCheck #124
 % Measure 124
 s2. | \barNumberCheck #125
 % Measure 125
 c'''8[ e''] f''[ e''] f''[ e''] | \barNumberCheck #126
 % Measure 126
 b''8[ e''] f''[ b''] e''[ f''] | \barNumberCheck #127
 % Measure 127
 g''8[ d''] e''-2[ d''] e''[ d''-1] | \barNumberCheck #128
 % Measure 128
 s2. | \barNumberCheck #129
 \time 2/4
 % Measure 129
 s2 | \barNumberCheck #130
 % Measure 130
 s2 | \barNumberCheck #131
 % Measure 131
 s2 | \barNumberCheck #132
 % Measure 132
 s2 | \barNumberCheck #133
 % Measure 133
 s2 | \barNumberCheck #134
 % Measure 134
 s2 | \barNumberCheck #135
 % Measure 135
 s2 | \barNumberCheck #136
 % Measure 136
 s2 | \barNumberCheck #137
}

left = {
 \clef bass \time 2/4
 \set fingeringOrientations = #'(down)
 % Measure 1
 d2-5 | \barNumberCheck #2
 % Measure 2
 <f-4 a-2 d'-1>2 | \barNumberCheck #3
 % Measure 3
 a,2-5 | \barNumberCheck #4
 % Measure 4
 <c-4 e-2 b-1>2 | \barNumberCheck #5
 % Measure 5
 d2 | \barNumberCheck #6
 % Measure 6
 <f a d'>2 | \barNumberCheck #7
 % Measure 7
 a,2 | \barNumberCheck #8
 % Measure 8
 <c e b>2 | \barNumberCheck #9
 % Measure 9
 f2-3 | \barNumberCheck #10
 % Measure 10
 <a-2 c'-1>2 | \barNumberCheck #11
 % Measure 11
 c2-5 | \barNumberCheck #12
 % Measure 12
 <e-3 g-2 b-1>2 | \barNumberCheck #13
 % Measure 13
 f2-3 | \barNumberCheck #14
 % Measure 14
 <a c'>2 | \barNumberCheck #15
 % Measure 15
 c2 | \barNumberCheck #16
 % Measure 16
 <e g b>2 | \barNumberCheck #17
 % Measure 17
 d2-5 | \barNumberCheck #18
 % Measure 18
 <f-4 a-2 d'-1>2 | \barNumberCheck #19
 % Measure 19
 a,2-5 | \barNumberCheck #20
 % Measure 20
 <c-4 e-2 b-1>2 | \barNumberCheck #21
 % Measure 21
 d2 | \barNumberCheck #22
 % Measure 22
 <f a d'>2 | \barNumberCheck #23
 % Measure 23
 a,2 | \barNumberCheck #24
 % Measure 24
 <c e b>2 | \barNumberCheck #25
 % Measure 25
 f2-3 | \barNumberCheck #26
 % Measure 26
 <a-2 c'-1>2 | \barNumberCheck #27
 % Measure 27
 c2-5 | \barNumberCheck #28
 % Measure 28
 <e-3 g-2 b-1>2 | \barNumberCheck #29
 % Measure 29
 f2-3 | \barNumberCheck #30
 % Measure 30
 <a c'>2 | \barNumberCheck #31
 % Measure 31
 c2 | \barNumberCheck #32
 % Measure 32
 <e g b>2 | \barNumberCheck #33
 \time 3/4
 % Measure 33
 << { r4 <f a d'>4 <f a d'>4 } \\ { d2. } >> | \barNumberCheck #34
 % Measure 34
 << { r4 <f a d'>4 <f a d'>4 } \\ { d2. } >> | \barNumberCheck #35
 % Measure 35
 << { r4 <c e a>4 <c e a>4 } \\ { a,2. } >> | \barNumberCheck #36
 % Measure 36
 << { r4 <e a>4 <e a>4 } \\ { c2. } >> | \barNumberCheck #37
 % Measure 37
 << { r4 <f a d'>4 <f a d'>4 } \\ { d2. } >> | \barNumberCheck #38
 % Measure 38
 << { r4 <f a d'>4 <f a d'>4 } \\ { d2. } >> | \barNumberCheck #39
 % Measure 39
 << { r4 <c e a>4 <c e a>4 } \\ { a,2. } >> | \barNumberCheck #40
 % Measure 40
 << { r4 <e a>4 <e a>4 } \\ { c2. } >> | \barNumberCheck #41
 % Measure 41
 << { r4 <a c'>4 <a c'>4 } \\ { f2. } >> | \barNumberCheck #42
 % Measure 42
 << { r4 <a c'>4 <a c'>4 } \\ { f2. } >> | \barNumberCheck #43
 % Measure 43
 << { r4 <e g>4 <e g>4 } \\ { c2. } >> | \barNumberCheck #44
 % Measure 44
 << { r4 <e g>4 <e g>4 } \\ { c2. } >> | \barNumberCheck #45
 % Measure 45
 << { r4 <a c'>4 <a c'>4 } \\ { f2. } >> | \barNumberCheck #46
 % Measure 46
 << { r4 <a c'>4 <a c'>4 } \\ { f2. } >> | \barNumberCheck #47
 % Measure 47
 << { r4 <e g>4 <e g>4 } \\ { c2. } >> | \barNumberCheck #48
 % Measure 48
 << { r4 <e g>4 <e g>4 } \\ { c2. } >> | \barNumberCheck #49
 % Measure 49
 << { r4 <f a d'>4 <f a d'>4 } \\ { d2. } >> | \barNumberCheck #50
 % Measure 50
 << { r4 <f a d'>4 <f a d'>4 } \\ { d2. } >> | \barNumberCheck #51
 % Measure 51
 << { r4 <c e a>4 <c e a>4 } \\ { a,2. } >> | \barNumberCheck #52
 % Measure 52
 << { r4 <e a>4 <e a>4 } \\ { c2. } >> | \barNumberCheck #53
 % Measure 53
 << { r4 <f a d'>4 <f a d'>4 } \\ { d2. } >> | \barNumberCheck #54
 % Measure 54
 << { r4 <f a d'>4 <f a d'>4 } \\ { d2. } >> | \barNumberCheck #55
 % Measure 55
 << { r4 <c e a>4 <c e a>4 } \\ { a,2. } >> | \barNumberCheck #56
 % Measure 56
 << { r4 <e a>4 <e a>4 } \\ { c2. } >> | \barNumberCheck #57
 % Measure 57
 << { r4 <a c'>4 <a c'>4 } \\ { f2. } >> | \barNumberCheck #58
 % Measure 58
 << { r4 <a c'>4 <a c'>4 } \\ { f2. } >> | \barNumberCheck #59
 % Measure 59
 << { r4 <e g>4 <e g>4 } \\ { c2. } >> | \barNumberCheck #60
 % Measure 60
 << { r4 <e g>4 <e g>4 } \\ { c2. } >> | \barNumberCheck #61
 % Measure 61
 << { r4 <a c'>4 <a c'>4 } \\ { f2. } >> | \barNumberCheck #62
 % Measure 62
 << { r4 <a c'>4 <a c'>4 } \\ { f2. } >> | \barNumberCheck #63
 % Measure 63
 << { r4 <e g>4 <e g>4 } \\ { c2. } >> | \barNumberCheck #64
 % Measure 64
 << { r4 <e g>4 <e g>4 } \\ { c2. } >> | \barNumberCheck #65
 % Measure 65
 d8-5[ a-2] d'-1[ e'-3] f'-2[ a'-1] | \barNumberCheck #66
 % Measure 66
 f'8[ e'-3] d'-1[ a] d-5[ a-1] | \barNumberCheck #67
 % Measure 67
 a,8[ e] a[ b] c'[ e'] | \barNumberCheck #68
 % Measure 68
 c'8[ b-3] a-1[ e] a,-5[ e-2] | \barNumberCheck #69
 % Measure 69
 d8-5[ a] d'[ e'] f'[ a'] | \barNumberCheck #70
 % Measure 70
 f'8[ e'] d'[ a] d[ a] | \barNumberCheck #71
 % Measure 71
 a,8[ e] a[ b] c'[ e'] | \barNumberCheck #72
 % Measure 72
 c'8[ b] a-1[ e] a,-5[ e-1] | \barNumberCheck #73
 % Measure 73
 f,8-5[ c] f[ g-3] a[ c'] | \barNumberCheck #74
 % Measure 74
 a8[ g] f-1[ c] f,[ c-1] | \barNumberCheck #75
 % Measure 75
 c,8-5[ g,] c[ d-3] e[ g] | \barNumberCheck #76
 % Measure 76
 e8[ d] c-1[ g,] c,[ g,-2] | \barNumberCheck #77
 % Measure 77
 f,8-5[ c] f[ g-3] a[ c'] | \barNumberCheck #78
 % Measure 78
 a8[ g] f[ c] f,[ c-1] | \barNumberCheck #79
 % Measure 79
 c,8[ g,] c[ d-3] e[ g] | \barNumberCheck #80
 % Measure 80
 e8[ d] c[ g,] c,-5[ g,-2] | \barNumberCheck #81
 % Measure 81
 d8-5[ a-2] d'-1[ e'-3] f'-2[ a'-1] | \barNumberCheck #82
 % Measure 82
 f'8[ e'-3] d'-1[ a] d-5[ a-1] | \barNumberCheck #83
 % Measure 83
 a,8[ e] a[ b] c'[ e'] | \barNumberCheck #84
 % Measure 84
 c'8[ b-3] a-1[ e] a,-5[ e-2] | \barNumberCheck #85
 % Measure 85
 d8-5[ a] d'[ e'] f'[ a'] | \barNumberCheck #86
 % Measure 86
 f'8[ e'] d'[ a] d[ a] | \barNumberCheck #87
 % Measure 87
 a,8[ e] a[ b] c'[ e'] | \barNumberCheck #88
 % Measure 88
 c'8[ b] a-1[ e] a,-5[ e-1] | \barNumberCheck #89
 % Measure 89
 f,8-5[ c] f[ g-3] a[ c'] | \barNumberCheck #90
 % Measure 90
 a8[ g] f-1[ c] f,[ c-1] | \barNumberCheck #91
 % Measure 91
 c,8-5[ g,] c[ d-3] e[ g] | \barNumberCheck #92
 % Measure 92
 e8[ d] c-1[ g,] c,[ g,-2] | \barNumberCheck #93
 % Measure 93
 f,8-5[ c] f[ g-3] a[ c'] | \barNumberCheck #94
 % Measure 94
 a8[ g] f[ c] f,[ c-1] | \barNumberCheck #95
 % Measure 95
 c,8[ g,] c[ d-3] e[ g] | \barNumberCheck #96
 % Measure 96
 e8[ d] c[ g,] c,-5[ g,-2] | \barNumberCheck #97
 % Measure 97
 d8-5[ a-2] d'-1[ e'-3] f'-2[ a'-1] | \barNumberCheck #98
 % Measure 98
 f'8[ e'-3] d'-1[ a] d-5[ a-1] | \barNumberCheck #99
 % Measure 99
 a,8[ e] a[ b] c'[ e'] | \barNumberCheck #100
 % Measure 100
 c'8[ b-3] a-1[ e] a,-5[ e-2] | \barNumberCheck #101
 % Measure 101
 d8-5[ a] d'[ e'] f'[ a'] | \barNumberCheck #102
 % Measure 102
 f'8[ e'] d'[ a] d[ a] | \barNumberCheck #103
 % Measure 103
 a,8[ e] a[ b] c'[ e'] | \barNumberCheck #104
 % Measure 104
 c'8[ b] a-1[ e] a,-5[ e-1] | \barNumberCheck #105
 % Measure 105
 f,8-5[ c] f[ g-3] a[ c'] | \barNumberCheck #106
 % Measure 106
 a8[ g] f-1[ c] f,[ c-1] | \barNumberCheck #107
 % Measure 107
 c,8-5[ g,] c[ d-3] e[ g] | \barNumberCheck #108
 % Measure 108
 e8[ d] c-1[ g,] c,[ g,-2] | \barNumberCheck #109
 % Measure 109
 f,8-5[ c] f[ g-3] a[ c'] | \barNumberCheck #110
 % Measure 110
 a8[ g] f[ c] f,[ c-1] | \barNumberCheck #111
 % Measure 111
 c,8[ g,] c[ d-3] e[ g] | \barNumberCheck #112
 % Measure 112
 e8[ d] c[ g,] c,-5[ g,-2] | \barNumberCheck #113
 % Measure 113
 d8-5[ a-2] d'-1[ e'-3] f'-2[ a'-1] | \barNumberCheck #114
 % Measure 114
 f'8[ e'-3] d'-1[ a] d-5[ a-1] | \barNumberCheck #115
 % Measure 115
 a,8[ e] a[ b] c'[ e'] | \barNumberCheck #116
 % Measure 116
 c'8[ b-3] a-1[ e] a,-5[ e-2] | \barNumberCheck #117
 % Measure 117
 d8-5[ a] d'[ e'] f'[ a'] | \barNumberCheck #118
 % Measure 118
 f'8[ e'] d'[ a] d[ a] | \barNumberCheck #119
 % Measure 119
 a,8[ e] a[ b] c'[ e'] | \barNumberCheck #120
 % Measure 120
 c'8[ b] a-1[ e] a,-5[ e-1] | \barNumberCheck #121
 % Measure 121
 f,8-5[ c] f[ g-3] a[ c'] | \barNumberCheck #122
 % Measure 122
 a8[ g] f-1[ c] f,[ c-1] | \barNumberCheck #123
 % Measure 123
 c,8-5[ g,] c[ d-3] e[ g] | \barNumberCheck #124
 % Measure 124
 e8[ d] c-1[ g,] c,[ g,-2] | \barNumberCheck #125
 % Measure 125
 f,8-5[ c] f[ g-3] a[ c'] | \barNumberCheck #126
 % Measure 126
 a8[ g] f[ c] f,[ c-1] | \barNumberCheck #127
 % Measure 127
 c,8[ g,] c[ d-3] e[ g] | \barNumberCheck #128
 % Measure 128
 e8[ d] c[ g,] c,-5[ g,-2] | \barNumberCheck #129
 \time 2/4
 % Measure 129
 d2-5 | \barNumberCheck #130
 % Measure 130
 <f-4 a-2 d'-1>2 | \barNumberCheck #131
 % Measure 131
 a,2-5 | \barNumberCheck #132
 % Measure 132
 <c-4 e-2 b-1>2 | \barNumberCheck #133
 % Measure 133
 d2 | \barNumberCheck #134
 % Measure 134
 <f a d'>2 | \barNumberCheck #135
 % Measure 135
 a,2 | \barNumberCheck #136
 % Measure 136
 <c e b>2^\fermata | \barNumberCheck #137
}

dynamics = {
 \time 2/4
 % Measure 1
 s2\mp |
 % Measure 2
 s2 |
 % Measure 3
 s2 |
 % Measure 4
 s2 |
 % Measure 5
 s2 |
 % Measure 6
 s2\< |
 % Measure 7
 s2\! |
 % Measure 8
 s2 |
 % Measure 9
 s2\mp |
 % Measure 10
 s2 |
 % Measure 11
 s2 |
 % Measure 12
 s2 |
 % Measure 13
 s2 |
 % Measure 14
 s2\< |
 % Measure 15
 s2\!\> |
 % Measure 16
 s2\! |
 % Measure 17
 s2\p |
 % Measure 18
 s2\< |
 % Measure 19
 s2 |
 % Measure 20
 s2 |
 % Measure 21
 s2\!\mf |
 % Measure 22
 s2\< |
 % Measure 23
 s2\! |
 % Measure 24
 s2\> |
 % Measure 25
 s2\!\p |
 % Measure 26
 s2 |
 % Measure 27
 s2 |
 % Measure 28
 s2 |
 % Measure 29
 s2 |
 % Measure 30
 s2\< |
 % Measure 31
 s2\!\> |
 % Measure 32
 s2\! |
 \time 3/4
 % Measure 33
 s2.\p |
 % Measure 34
 s2.\< |
 % Measure 35
 s2.\! |
 % Measure 36
 s2.\> |
 % Measure 37
 s2.\! |
 % Measure 38
 s2.\< |
 % Measure 39
 s2.\! |
 % Measure 40
 s2.\> |
 % Measure 41
 s2.\! |
 % Measure 42
 s2. |
 % Measure 43
 s2.\< |
 % Measure 44
 s2.\!\> |
 % Measure 45
 s2.\! |
 % Measure 46
 s2. |
 % Measure 47
 s2.\< |
 % Measure 48
 s2.\!\> |
 % Measure 49
 s2.\!\mf |
 % Measure 50
 s2. |
 % Measure 51
 s2. |
 % Measure 52
 s2.\< |
 % Measure 53
 s2.\!\mf |
 % Measure 54
 s2. |
 % Measure 55
 s2. |
 % Measure 56
 s2.\> |
 % Measure 57
 s2.\!\mf |
 % Measure 58
 s2. |
 % Measure 59
 s2.\< |
 % Measure 60
 s2.\!\> |
 % Measure 61
 s2.\!\mf |
 % Measure 62
 s2. |
 % Measure 63
 s2.\< |
 % Measure 64
 s2.\!\> |
 % Measure 65
 s2.\!\f |
 % Measure 66
 s2.\< |
 % Measure 67
 s2. |
 % Measure 68
 s2.\! |
 % Measure 69
 s2. |
 % Measure 70
 s2. |
 % Measure 71
 s2. |
 % Measure 72
 s2. |
 % Measure 73
 s2.\f |
 % Measure 74
 s2.\< |
 % Measure 75
 s2. |
 % Measure 76
 s2.\! |
 % Measure 77
 s2. |
 % Measure 78
 s2. |
 % Measure 79
 s2. |
 % Measure 80
 s2.\> |
 % Measure 81
 s2.\!\f |
 % Measure 82
 s2. |
 % Measure 83
 s2. |
 % Measure 84
 s2. |
 % Measure 85
 s2.\f |
 % Measure 86
 s2.\< |
 % Measure 87
 s2.\! |
 % Measure 88
 s2. |
 % Measure 89
 s2.\f |
 % Measure 90
 s2. |
 % Measure 91
 s2. |
 % Measure 92
 s2. |
 % Measure 93
 s2. |
 % Measure 94
 s2.\< |
 % Measure 95
 s2.\! |
 % Measure 96
 s2.\> |
 % Measure 97
 s2.\!\pp |
 % Measure 98
 s2. |
 % Measure 99
 s2.\< |
 % Measure 100
 s2.\!\> |
 % Measure 101
 s2.\!\mp |
 % Measure 102
 s2. |
 % Measure 103
 s2.\< |
 % Measure 104
 s2.\!\> |
 % Measure 105
 s2.\!\p |
 % Measure 106
 s2. |
 % Measure 107
 s2.\< |
 % Measure 108
 s2.\!\> |
 % Measure 109
 s2.\!\p |
 % Measure 110
 s2. |
 % Measure 111
 s2.\< |
 % Measure 112
 s2.\!\> |
 % Measure 113
 s2.\!\p |
 % Measure 114
 s2. |
 % Measure 115
 s2.\< |
 % Measure 116
 s2.\!\> |
 % Measure 117
 s2.\!\p |
 % Measure 118
 s2. |
 % Measure 119
 s2.\< |
 % Measure 120
 s2.\!\> |
 % Measure 121
 s2.\!\mp |
 % Measure 122
 s2. |
 % Measure 123
 s2.\< |
 % Measure 124
 s2.\!\> |
 % Measure 125
 s2.\!\mp |
 % Measure 126
 s2. |
 % Measure 127
 s2.\< |
 % Measure 128
 s2.\!\> |
 \time 2/4
 % Measure 129
 s2\!\pp |
 % Measure 130
 s2 |
 % Measure 131
 s2 |
 % Measure 132
 s2 |
 % Measure 133
 s2 |
 % Measure 134
 s2\> |
 % Measure 135
 s2 |
 % Measure 136
 s2\!\pp |
}

\score {
 \new PianoStaff <<
  \new Staff = "RH" <<
   \new Voice = "melody" { \melody }
   \new Voice = "figuration" { \figuration }
  >>
  \new Dynamics { \dynamics }
  \new Staff = "LH" { \left }
 >>
 \layout { }
 \midi { }
}
