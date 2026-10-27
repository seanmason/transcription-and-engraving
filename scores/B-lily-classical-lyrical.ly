\version "2.26.0"
% automatically converted by musicxml2ly from /home/mason/Documents/ChatGPT/Music Engraving/scores/lyrical.musicxml
\pointAndClickOff


#(set-global-staff-size 19.916929133858268)

\layout {
  \context {
    \Staff
    printKeyCancellation = ##f
  }
  \context {
    \Score
    autoBeaming = ##f
  }
}
PartPOneVoiceOne = \relative g' {
  \clef "treble" \time 3/4 \key bes \major g4. ^1 ^( ^\markup \bold
  "Andante cantabile" _\p _\< bes8 d4 ^5 | % 1
  c4 \! bes4 a4 | % 2
  bes4. _\mf a8 g4 | % 3
  fis2 d4 ) \break | % 4
  d'4 ^( _\mf es4 ^5 d4 | % 5
  c4. bes8 a4 | % 6
  bes4 _\p a4 fis4 | % 7
  g2. ) \bar "|."
}

PartPOneVoiceThree = \relative g, {
  \clef "bass" \time 3/4 \key bes \major g8 ^\=3( [ d'8 bes'8 d,8 g8 d8 \=3) ] | % 1
  f,8 ^\=3( [ c'8 a'8 c,8 f8 c8 \=3) ] | % 2
  es,8 ^\=3( [ bes'8 g'8 bes,8 es8 bes8 \=3) ] | % 3
  d,8 ^\=3( [ a'8 fis'8 a,8 d8 a8 \=3) ] \break | % 4
  bes8 ^\=3( [ f'8 bes8 f8 d'8 f,8 \=3) ] | % 5
  f,8 ^\=3( [ c'8 a'8 c,8 f8 c8 \=3) ] | % 6
  d,8 ^\=3( [ a'8 fis'8 a,8 c'8 a,8 \=3) ] | % 7
  g8 ^\=3( [ d'8 bes'8 d,8 g8 d8 \=3) ] \bar "|."
}


% The score definition
\include "styles/common.ily"
\include "styles/lily-classical.ily"
\include "overrides/lyrical.ily"
\score {
  <<
    \new PianoStaff <<
      \context Staff = "1" <<
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {
          \PartPOneVoiceOne
        }
      >>
      \context Staff = "2" <<
        \override Staff.BarLine.allow-span-bar = ##f
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceThree" {
          \PartPOneVoiceThree
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}

