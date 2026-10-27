\version "2.26.0"
% automatically converted by musicxml2ly from /home/mason/Documents/ChatGPT/Music Engraving/scores/dense.musicxml
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
PartPOneVoiceOne = \relative e'' {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major \U e16 ^1 ^( [
  ^\markup \bold "Allegro con moto" _\p _\< \U g16 \U c16 ^5 \U g16 ] \U e16 [
  \U g16 \U c16 \U g16 ] \U f16 [ \U a16 \U c16 \U a16 ] \U f16 [ \U a16 \U c16
  \U a16 ) ] | % 1
  \U d,16 ^1 ^( [ \! \U fis16 \U a16 ^5 \U fis16 ] \U d16 [ \U fis16 \U a16 \U
  fis16 ] \U g16 [ \U b16 \U d16 \U b16 ] \U g16 [ \U b16 \U d16 \U b16 ) ]
  \break | % 2
  \U e,16 ^1 ^( [ _\mf \U g16 \U c16 ^5 \U g16 ] \U e16 [ \U g16 \U c16 \U g16 ]
  \U es16 [ \U ges16 \U a16 \U ges16 ] \U es16 [ \U ges16 \U a16 \U ges16 ) ] | % 3
  \U d16 ^1 ^( [ \U g16 \U b16 ^5 \U g16 ] \U d16 [ \U g16 \U b16 \U g16 ] \U e16
  [ \U g16 \U c16 \U g16 ] \U e16 [ \U g16 \U c16 \U g16 ) ] \bar "|."
}

PartPOneVoiceTwo = \relative c'' {
  \clef "treble" \numericTimeSignature \time 4/4 \key c \major \D c2 \D c2 | % 1
  \D a2 \D d2 \break | % 2
  \D c2 \D c2 | % 3
  \D b2 \D c2 \bar "|."
}

PartPOneVoiceThree = \relative c, {
  \clef "bass" \numericTimeSignature \time 4/4 \key c \major <c c'>4 -. <g' e'>4
  -. <f f'>4 -. <c' a'>4 -. | % 1
  <d, d'>4 -. <a' fis'>4 -. <g g'>4 -. <d' b'>4 -. \break | % 2
  <c, c'>4 -. <g' e'>4 -. <c, c'>4 -. <ges' es'>4 -. | % 3
  <g g'>4 -. <d' f>4 -. <c, c'>4 -. <g' e'>4 -. \bar "|."
}


% The score definition
\include "styles/common.ily"
\include "overrides/dense.ily"
\score {
  <<
    \new PianoStaff <<
      \context Staff = "1" <<
        \mergeDifferentlyDottedOn
        \mergeDifferentlyHeadedOn
        \context Voice = "PartPOneVoiceOne" {
          \voiceOne \PartPOneVoiceOne
        }
        \context Voice = "PartPOneVoiceTwo" {
          \voiceTwo \PartPOneVoiceTwo
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

