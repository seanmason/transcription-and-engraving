\version "2.26.0"
% automatically converted by musicxml2ly from /home/mason/Documents/ChatGPT/Music Engraving/scores/chopin-op9-no1-opening.musicxml
\pointAndClickOff

%% additional definitions required by the score:
D = \tweak Stem.direction #DOWN \etc
U = \tweak Stem.direction #UP \etc



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
PartPOneVoiceOne = \relative bes'' {
  \clef "treble" \time 6/4 \key des \major \partial 2. \tweak direction #UP
  \tempo \markup \normal-text \concat { \override #'(font-name . "Engraving Tempo") Larghetto " " \normal-text
    \fontsize #-4 { \rhythm { 4 } \char ##x2009 = \char ##x2009 116 } }
  \D bes8 -\tweak font-name #"Engraving Fingering Italic" ^2 ^( [ _\markup { \dynamic p \italic "espress." } \D c8 \D des8 \D a8 \D bes8 ^4
  \D ges8 ] \bar "|"
  \after 1*0  _\< \D f4 -. \D f4 ^3 -. \D f4 -. \after 1*0 \! \D f4 ) \after 1*0
  _\> \D ges8 ^( [ \D f8 \D es8 \D c8 ) ] \bar "|" % 1
  \after 1*0  \! \after 1*0 _\> \D des2 -\tweak font-name #"Engraving Fingering Italic" ^2 ^( \after 1*0 \! \D bes4 ) \tweak
  TupletBracket.stencil ##f \tweak TupletBracket.direction #DOWN \tuplet 11/6 {
    \after 1*0  _\< \D bes'8 ^( [ \D c8 \D des8 \D a8 \D bes8 ^4 \D a8 \D gis8
    \D a8 \D c8 \D bes8 \after 1*0 \! \D ges8 ) ] }
  \bar "|"
}

PartPOneVoiceTwo = \relative bes, {
  \clef "bass" \time 6/4 \key des \major \partial 2. r2 r4 \bar "|"
  \after 1*0  \sustainOn \D bes8 ^\=2( [ \D f'8 _3 \D des'8 \D bes8 _2 \D f'8
  \after 1*0 <> \sustainOff \D f,8 _3 \=2) ] \after 1*0 \sustainOn \D bes,8
  ^\=2( [ \D f'8 \D es'8 \D a,8 \D f'8 \after 1*0 <> \sustainOff \D f,8 \=2) ]
  \bar "|" % 1
  \D bes,8 ^\=2( [ \D f'8 \D des'8 \D bes8 \D f'8 \D f,8 \=2) ] \D bes,8 ^\=2( [
  \D f'8 \D des'8 \D bes8 \D f'8 \D f,8 \=2) ] \bar "|"
}


% The score definition
\include "styles/common.ily"
\include "styles/chopin-typography.ily"
\paper { right-margin = 41\mm }
\layout { \context { \Score \override BarNumber.stencil = ##f } }
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
        \context Voice = "PartPOneVoiceTwo" {
          \PartPOneVoiceTwo
        }
      >>
    >>
  >>
  \layout {}
  % To create MIDI output, uncomment the following line:
  % \midi { \tempo 4 = 100 }
}

