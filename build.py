#!/usr/bin/env python3
"""Rebuild the engraving study from canonical, renderer-independent MusicXML."""
from pathlib import Path
import os, sys, subprocess, json, re, xml.etree.ElementTree as E
R=Path(__file__).resolve().parent
OUT=R/'output/pdf'; TMP=R/'tmp/pdfs'; SRC=R/'scores'; STY=R/'styles'
for p in [OUT,TMP,SRC,STY,R/'logs',R/'overrides']:p.mkdir(parents=True,exist_ok=True)
def run(args,name,env=None):
 p=subprocess.run([str(a) for a in args],cwd=R,env=env,capture_output=True,text=True)
 (R/'logs'/f'{name}.log').write_text(p.stdout+p.stderr)
 if p.returncode:raise RuntimeError(name+' failed; see logs/'+name+'.log')
 return p.stdout

def el(p,n,t=None,**a):
 x=E.SubElement(p,n,{k.replace('_','-'):str(v) for k,v in a.items()})
 if t is not None:x.text=str(t)
 return x

def note(pitch,dur,**kw):return dict(pitch=pitch.split(),dur=dur,**kw)
def sequence(pitches,dur):return [note(p,dur) for p in pitches.split()]
def fixtures():
 lyric_r=[ [note('G4',6),note('Bb4',2),note('D5',4)], [note('C5',4),note('Bb4',4),note('A4',4)], [note('Bb4',6),note('A4',2),note('G4',4)], [note('F#4',8),note('D4',4)], [note('D5',4),note('Eb5',4),note('D5',4)], [note('C5',6),note('Bb4',2),note('A4',4)], [note('Bb4',4),note('A4',4),note('F#4',4)], [note('G4',12)] ]
 lyric_l=[sequence(s,2) for s in ['G2 D3 Bb3 D3 G3 D3','F2 C3 A3 C3 F3 C3','Eb2 Bb2 G3 Bb2 Eb3 Bb2','D2 A2 F#3 A2 D3 A2','Bb2 F3 Bb3 F3 D4 F3','F2 C3 A3 C3 F3 C3','D2 A2 F#3 A2 C4 A2','G2 D3 Bb3 D3 G3 D3']]
 for a,b in [(0,3),(4,7)]:lyric_r[a][0]['slur']='start';lyric_r[b][-1]['slur']='stop'
 lyric_r[0][0]['finger']=1;lyric_r[0][2]['finger']=5;lyric_r[4][1]['finger']=5
 for m in lyric_l:m[0]['slur']='start';m[-1]['slur']='stop'
 dense_r=[sequence(s,1) for s in ['E5 G5 C6 G5 E5 G5 C6 G5 F5 A5 C6 A5 F5 A5 C6 A5','D5 F#5 A5 F#5 D5 F#5 A5 F#5 G5 B5 D6 B5 G5 B5 D6 B5','E5 G5 C6 G5 E5 G5 C6 G5 Eb5 Gb5 A5 Gb5 Eb5 Gb5 A5 Gb5','D5 G5 B5 G5 D5 G5 B5 G5 E5 G5 C6 G5 E5 G5 C6 G5']]
 dense_i=[[note('C5',8),note('C5',8)],[note('A4',8),note('D5',8)],[note('C5',8),note('C5',8)],[note('B4',8),note('C5',8)]]
 dense_l=[[note(c,4,art='staccato') for c in cs] for cs in [['C2 C3','G2 E3','F2 F3','C3 A3'],['D2 D3','A2 F#3','G2 G3','D3 B3'],['C2 C3','G2 E3','C2 C3','Gb2 Eb3'],['G2 G3','D3 F3','C2 C3','G2 E3']]]
 for m in dense_r:m[0]['slur']='start';m[-1]['slur']='stop';m[0]['finger']=1;m[2]['finger']=5
 return {'lyrical':dict(beats=3,fifths=-2,r=lyric_r,l=lyric_l,tempo='Andante cantabile',breaks=[5]),'dense':dict(beats=4,fifths=0,r=dense_r,i=dense_i,l=dense_l,tempo='Allegro con moto',breaks=[3])}

def musicxml(name,s):
 root=E.Element('score-partwise',version='4.0');ident=el(root,'identification');el(el(ident,'encoding'),'software','Engraving laboratory')
 defaults=el(root,'defaults');sc=el(defaults,'scaling');el(sc,'millimeters',7);el(sc,'tenths',40)
 pl=el(defaults,'page-layout');el(pl,'page-height',310/7*40);el(pl,'page-width',235/7*40)
 margins=el(pl,'page-margins',type='both')
 for k,v in [('left',20),('right',18),('top',15),('bottom',15)]:el(margins,k+'-margin',v/7*40)
 parts=el(root,'part-list');part=el(parts,'score-part',id='P1');el(part,'part-name','');el(part,'part-abbreviation','')
 part=el(root,'part',id='P1')
 for mi in range(len(s['r'])):
  m=el(part,'measure',number=mi+1); accidental_state={}
  if mi+1 in s['breaks']:el(m,'print',new_system='yes')
  if mi==0:
   a=el(m,'attributes');el(a,'divisions',4);el(el(a,'key'),'fifths',s['fifths']);t=el(a,'time');el(t,'beats',s['beats']);el(t,'beat-type',4);el(a,'staves',2)
   for n,sg,ln in [(1,'G',2),(2,'F',4)]:c=el(a,'clef',number=n);el(c,'sign',sg);el(c,'line',ln)
   d=el(m,'direction',placement='above');el(el(d,'direction-type'),'words',s['tempo'],font_weight='bold');el(d,'staff',1)
  if mi in [0,2,4,6]:
   d=el(m,'direction',placement='below');el(el(el(d,'direction-type'),'dynamics'),'p' if mi in [0,6] else 'mf');el(d,'staff',1)
  if mi in [0,1]:
   d=el(m,'direction',placement='below');el(el(d,'direction-type'),'wedge',type='crescendo' if mi==0 else 'stop',number=1);el(d,'staff',1)
  voices=[('r',1,1)]+([('i',2,1)] if 'i' in s else [])+[('l',3,2)]
  for vi,(key,voice,staff) in enumerate(voices):
   if vi:el(el(m,'backup'),'duration',s['beats']*4)
   events=s[key][mi];assert sum(n['dur'] for n in events)==s['beats']*4
   for ni,n in enumerate(events):
    for ci,p in enumerate(n['pitch']):
     nd=el(m,'note',id=f'{name}-m{mi+1}-{key}-n{ni+1}-p{ci+1}')
     if ci:el(nd,'chord')
     pitch=el(nd,'pitch');el(pitch,'step',p[0]);acc=p[1:-1]
     if acc:el(pitch,'alter',1 if acc=='#' else -1)
     el(pitch,'octave',p[-1]);el(nd,'duration',n['dur']);el(nd,'voice',voice)
     typ={1:'16th',2:'eighth',4:'quarter',6:'quarter',8:'half',12:'half'}[n['dur']];el(nd,'type',typ)
     if n['dur'] in [6,12]:el(nd,'dot')
     alteration=1 if acc=='#' else -1 if acc=='b' else 0
     sig=-1 if s['fifths']==-2 and p[0] in 'BE' else 0
     ak=(staff,p[0],p[-1])
     if alteration!=accidental_state.get(ak,sig):el(nd,'accidental',{-1:'flat',0:'natural',1:'sharp'}[alteration])
     accidental_state[ak]=alteration
     if 'i' in s and key in ['r','i']:el(nd,'stem','up' if key=='r' else 'down')
     el(nd,'staff',staff)
     if n['dur']<=2 and ci==0:
      group=4 if n['dur']==1 else 6
      pos=ni%group;beam='begin' if pos==0 else 'end' if pos==group-1 else 'continue'
      for lev in range(1,3 if n['dur']==1 else 2):el(nd,'beam',beam,number=lev)
     if ci==0 and any(k in n for k in ['slur','finger','art']):
      no=el(nd,'notations')
      if 'slur' in n:el(no,'slur',type=n['slur'],number=voice,placement='above')
      if 'finger' in n:el(el(no,'technical'),'fingering',n['finger'],placement='above')
      if 'art' in n:el(el(no,'articulations'),n['art'])
  if mi==len(s['r'])-1:el(el(m,'barline',location='right'),'bar-style','light-heavy')
 E.indent(root);E.ElementTree(root).write(SRC/f'{name}.musicxml',encoding='utf-8',xml_declaration=True)

COMMON=r'''\paper {
 paper-width = 235\mm paper-height = 310\mm
 left-margin = 20\mm right-margin = 18\mm top-margin = 15\mm bottom-margin = 15\mm
 indent = 0\mm short-indent = 0\mm
 print-page-number = ##f
 oddHeaderMarkup = ##f evenHeaderMarkup = ##f oddFooterMarkup = ##f evenFooterMarkup = ##f
 ragged-last = ##f ragged-bottom = ##t
 system-system-spacing.basic-distance = #20
 system-system-spacing.minimum-distance = #18
 system-system-spacing.padding = #5
}
\header { title = ##f subtitle = ##f composer = ##f tagline = ##f }
#(set-global-staff-size 19.9169)
'''
TUNED=r'''\paper { property-defaults.fonts.serif = "Nimbus Roman" }
\layout {
 \context { \Score
  \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  \override SpacingSpanner.spacing-increment = #1.15
  \override SpacingSpanner.shortest-duration-space = #2.2
  \override BarNumber.font-size = #-2
  \override BarNumber.font-series = #'medium
 }
 \context { \Staff
  \override StaffSymbol.thickness = #0.85
  \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #11.5
  \override VerticalAxisGroup.staff-staff-spacing.minimum-distance = #10
  \override VerticalAxisGroup.staff-staff-spacing.padding = #2
 }
 \context { \Voice
  \override Stem.thickness = #1.05
  \override Beam.beam-thickness = #0.48
  \override Slur.thickness = #1.6
  \override Slur.height-limit = #2.8
  \override Slur.ratio = #0.3
  \override Tie.thickness = #1.1
  \override Hairpin.thickness = #1.0
  \override Hairpin.height = #0.55
  \override Fingering.font-size = #-3
  \override Fingering.font-name = "Nimbus Roman"
  \override DynamicText.font-size = #-0.5
 }
}
'''
def styles():
 for name,text in [('common.ily',COMMON),('lily-classical.ily',TUNED)]:
  p=STY/name
  if not p.exists():p.write_text(text)
 p=STY/'musescore-classical.mss'
 if not p.exists():
  root=E.Element('museScore',version='4.70');s=el(root,'Style')
  vals={'pageWidth':235/25.4,'pageHeight':310/25.4,'pagePrintableWidth':197/25.4,'pageEvenLeftMargin':20/25.4,'pageOddLeftMargin':20/25.4,'pageEvenTopMargin':15/25.4,'pageOddTopMargin':15/25.4,'pageEvenBottomMargin':15/25.4,'pageOddBottomMargin':15/25.4,'Spatium':1.75,'musicalSymbolFont':'Leland','musicalTextFont':'Leland Text','staffDistance':7.5,'akkoladeDistance':7.5,'minSystemDistance':8,'maxSystemDistance':12,'enableVerticalSpread':0,'staffLineWidth':0.1,'stemWidth':0.11,'beamWidth':0.48,'slurMidWidth':0.18,'slurEndWidth':0.07,'measureSpacing':1.2,'showPageNumber':0,'showHeader':0,'showFooter':0,'defaultFontFace':'Nimbus Roman','tempoFontFace':'Nimbus Roman','expressionFontFace':'Nimbus Roman','fingeringFontFace':'Nimbus Roman','fingeringFontSize':8,'measureNumberFontFace':'Nimbus Roman','measureNumberFontSize':8}
  for k,v in vals.items():el(s,k,v)
  E.indent(root);E.ElementTree(root).write(p,encoding='utf-8',xml_declaration=True)
 p=STY/'verovio-classical.json'
 if not p.exists():p.write_text(json.dumps(dict(inputFrom='musicxml',font='Leipzig',pageWidth=2350,pageHeight=3100,pageMarginLeft=200,pageMarginRight=180,pageMarginTop=150,pageMarginBottom=150,scale=100,unit=8.75,mmOutput=True,breaks='encoded',header='none',footer='none',spacingStaff=10,spacingSystem=10,staffLineWidth=0.12,slurMidpointThickness=0.45,slurEndpointThickness=0.08,spacingLinear=0.25,spacingNonLinear=0.6),indent=2))

def render():
 import verovio,cairosvg
 styles()
 for name,s in fixtures().items():
  if not (SRC/f'{name}.musicxml').exists():musicxml(name,s)
  raw=TMP/f'{name}-converted.ly'
  run([R/'.tools/lilypond-2.26.0/bin/musicxml2ly','--npm','-o',raw,SRC/f'{name}.musicxml'],f'convert-{name}')
  txt=raw.read_text();txt=re.sub(r'\\header\s*\{.*?\}', '',txt,flags=re.S)
  # Converter emits a simple page block; replace with explicit common geometry.
  txt=re.sub(r'\\paper\s*\{.*?\}', '',txt,flags=re.S)
  for profile in ['A-lily-baseline','B-lily-classical']:
   inc='\\include "styles/common.ily"\n'+('\\include "styles/lily-classical.ily"\n' if profile.startswith('B') else '')
   override=R/'overrides'/f'{name}.ily'
   if not override.exists():override.write_text('% Optional score-specific LilyPond settings. Included before the score.\n')
   # Insert profile just before score so converted setup cannot override it.
   content=txt.replace('\\score {',inc+f'\\include "overrides/{name}.ily"\n\\score {{')
   patchfile=R/'overrides'/f'{name}.json'
   if not patchfile.exists():patchfile.write_text('[]\n')
   if profile.startswith('B'):
    for patch in json.loads(patchfile.read_text()):
     assert content.count(patch['find'])==1, 'Override must match exactly once: '+name
     content=content.replace(patch['find'],patch['replace'],1)
   f=SRC/f'{profile}-{name}.ly';f.write_text(content)
   run([R/'.tools/lilypond-2.26.0/bin/lilypond','-I',R,'-o',TMP/f'{profile}-{name}',f],f'{profile}-{name}')
  env=dict(os.environ,QT_QPA_PLATFORM='offscreen')
  run([R/'.tools/squashfs-root/AppRun','-S',STY/'musescore-classical.mss','-o',TMP/f'C-musescore-{name}.pdf',SRC/f'{name}.musicxml'],f'C-musescore-{name}',env)
  run([R/'.tools/squashfs-root/AppRun','-S',STY/'musescore-classical.mss','-o',SRC/f'C-musescore-{name}.mscz',SRC/f'{name}.musicxml'],f'C-musescore-editable-{name}',env)
  v=verovio.toolkit();assert v.setOptions(json.loads((STY/'verovio-classical.json').read_text()))
  assert v.loadFile(str(SRC/f'{name}.musicxml'))
  assert v.getPageCount()==1,(name,v.getPageCount())
  svg=v.renderToSVG(1);(TMP/f'D-verovio-{name}.svg').write_text(svg)
  (SRC/f'D-verovio-{name}.mei').write_text(v.getMEI())
  cairosvg.svg2pdf(bytestring=svg.encode(),write_to=str(TMP/f'D-verovio-{name}.pdf'))
 print('Rendered all four treatments of both studies.')

if __name__=='__main__':
 if '--regenerate-fixtures' in sys.argv:
  for name,s in fixtures().items():musicxml(name,s)
 render()
