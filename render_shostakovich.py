"""Restyle the recovered two-system transcription without changing musical events."""
from pathlib import Path
import subprocess,hashlib,json
R=Path(__file__).resolve().parent
src=R/'scores/shostakovich-op34-no16-recovered.ly'
if not src.exists():raise FileNotFoundError("Archived recovered score is missing: " + str(src))
for directory in (R/"logs", R/"output/pdf", R/"tmp/pdfs"):
 directory.mkdir(parents=True,exist_ok=True)
s=src.read_text();music=s[s.index('upper ='):s.index('\\score {')]
old=r'\tempo "Andantino" 4 = 120'
new=r'''\tempo \markup \concat { \override #'(font-name . "Engraving Tempo") "Andantino" " " \fontsize #-4 { \rhythm { 4 } " = 120" } }'''
assert old in music
styled=music.replace(old,new)
assert styled.replace(new,old)==music
header=r'''\version "2.26.0"
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
'''
score=r'''
\score {
 \new PianoStaff <<
  \new Staff = "RH" { \upper }
  \new Staff = "LH" { \lower }
 >>
 \layout { indent = 0\mm ragged-last = ##f ragged-right = ##f }
 \midi { \tempo 4 = 120 }
}
'''
out=R/'scores/shostakovich-op34-no16-classical.ly';out.write_text(header+styled+score)
for font in ['fingering','tempo']:
 subprocess.run([R/'.tools/venv/bin/python',R/f'fonts/{font}/build_font.py'],check=True)
with (R/'logs/shostakovich-classical.log').open('w') as log:
 subprocess.run([R/'.tools/lilypond-2.26.0/bin/lilypond','-I',R,'-o',R/'output/pdf/shostakovich-op34-no16-classical',out],stdout=log,stderr=subprocess.STDOUT,check=True)
(R/'logs/shostakovich-provenance.json').write_text(json.dumps({'recovered_from':'Earlier workbench shostakovich-minimax-v4/rendered/prelude-complete.ly','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'scope':'Pickup and measures 1-5; recovered v4 two-system transcription','music_body_preserved_except_tempo_typography':True,'transcription_status':'Opening previously checked; remaining measures require review. Full-length v3 rejected due to known hand-allocation and duration errors.'},indent=2))
subprocess.run(['pdftoppm','-r','150','-png',R/'output/pdf/shostakovich-op34-no16-classical.pdf',R/'tmp/pdfs/shostakovich-classical-proof'],check=True)
