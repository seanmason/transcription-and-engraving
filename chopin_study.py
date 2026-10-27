"""Henle HN185 p7: pickup and measures 1-2, transcribed for engraving comparison."""
from pathlib import Path
import xml.etree.ElementTree as E
from fractions import Fraction
import json,os,re,subprocess
import build as b
R=b.R; T=b.TMP; S=b.SRC; name='chopin-op9-no1-opening'
el=b.el
D=44

def direction(m,kind,value,offset=0,staff=1,placement='below',**attrs):
 d=el(m,'direction',placement=placement);dt=el(d,'direction-type')
 if kind=='dynamic':el(el(dt,'dynamics'),value)
 elif kind=='words':el(dt,'words',value,**attrs)
 elif kind=='metronome':
  mt=el(dt,'metronome',parentheses='no');el(mt,'beat-unit','quarter');el(mt,'per-minute',116)
 else:el(dt,kind,type=value,**attrs)
 el(d,'offset',int(Fraction(offset)*D));el(d,'staff',staff)
 return d

def make_source():
 root=E.Element('score-partwise',version='4.0')
 ident=el(root,'identification');el(el(ident,'encoding'),'software','Engraving laboratory - manual transcription')
 defs=el(root,'defaults');sc=el(defs,'scaling');el(sc,'millimeters',7);el(sc,'tenths',40)
 pl=el(defs,'page-layout');el(pl,'page-height',310/7*40);el(pl,'page-width',235/7*40)
 mar=el(pl,'page-margins',type='both')
 for k,v in [('left',20),('right',41),('top',15),('bottom',15)]:el(mar,k+'-margin',v/7*40)
 partlist=el(root,'part-list');sp=el(partlist,'score-part',id='P1');el(sp,'part-name','');el(sp,'part-abbreviation','')
 part=el(root,'part',id='P1');counts=[]
 for mn in range(3):
  m=el(part,'measure',number=mn,**({'implicit':'yes'} if mn==0 else {}));state={}
  if mn==0:
   a=el(m,'attributes');el(a,'divisions',D);el(el(a,'key'),'fifths',-5);ti=el(a,'time');el(ti,'beats',6);el(ti,'beat-type',4);el(a,'staves',2)
   for sn,sign,line in [(1,'G',2),(2,'F',4)]:cl=el(a,'clef',number=sn);el(cl,'sign',sign);el(cl,'line',line)
   # One direction containing text and metronome makes the same tempo heading.
   d=direction(m,'words','Larghetto',placement='above',font_weight='bold')
   dt=E.Element('direction-type');met=el(dt,'metronome',parentheses='no');el(met,'beat-unit','quarter');el(met,'per-minute',116);d.insert(1,dt)
   direction(m,'dynamic','p');direction(m,'words','espress.',font_style='italic',relative_x=22)
  elif mn==1:
   for typ,off in [('crescendo',0),('stop',3),('diminuendo',4),('stop',6)]:direction(m,'wedge',typ,off,number=1)
   # Pedal directions are inserted in the lower-staff stream below.
  else:
   for typ,off in [('diminuendo',0),('stop',2),('crescendo',3),('stop',Fraction(63,11))]:direction(m,'wedge',typ,off,number=1)
  if mn==0:
   rh=[dict(p=p,q=Fraction(1,2),typ='eighth',beam=('begin' if i==0 else 'end' if i==5 else 'continue'),**({'slur':'start','finger':'2','italic':True} if i==0 else {'finger':'4'} if i==4 else {})) for i,p in enumerate('Bb5 C6 Db6 A5 Bb5 Gb5'.split())]
   lh=[dict(p=None,q=2,typ='half'),dict(p=None,q=1,typ='quarter')]
  elif mn==1:
   rh=[dict(p='F5',q=1,typ='quarter',**({'art':'staccato'} if i<3 else {'slur':'stop'}),**({'finger':'3'} if i==1 else {})) for i in range(4)]
   rh += [dict(p=p,q=Fraction(1,2),typ='eighth',beam=('begin' if i==0 else 'end' if i==3 else 'continue'),**({'slur':'start'} if i==0 else {'slur':'stop'} if i==3 else {})) for i,p in enumerate('Gb5 F5 Eb5 C5'.split())]
   lh=[dict(p=p,q=Fraction(1,2),typ='eighth',beam=('begin' if i%6==0 else 'end' if i%6==5 else 'continue'),**({'slur':'start'} if i%6==0 else {'slur':'stop'} if i%6==5 else {}),**({'finger':{1:'3',3:'2',5:'3'}[i]} if i in [1,3,5] else {})) for i,p in enumerate('Bb2 F3 Db4 Bb3 F4 F3 Bb2 F3 Eb4 A3 F4 F3'.split())]
  else:
   rh=[dict(p='Db5',q=2,typ='half',slur='start',finger='2',italic=True),dict(p='Bb4',q=1,typ='quarter',slur='stop')]
   rh += [dict(p=p,q=Fraction(3,11),typ='eighth',tuplet=True,beam=('begin' if i==0 else 'end' if i==10 else 'continue'),**({'slur':'start','tuplet_end':'start'} if i==0 else {'slur':'stop','tuplet_end':'stop'} if i==10 else {}),**({'finger':'4'} if i==4 else {})) for i,p in enumerate('Bb5 C6 Db6 A5 Bb5 A5 G#5 A5 C6 Bb5 Gb5'.split())]
   lh=[dict(p=p,q=Fraction(1,2),typ='eighth',beam=('begin' if i%6==0 else 'end' if i%6==5 else 'continue'),**({'slur':'start'} if i%6==0 else {'slur':'stop'} if i%6==5 else {})) for i,p in enumerate('Bb2 F3 Db4 Bb3 F4 F3 Bb2 F3 Db4 Bb3 F4 F3'.split())]
  expected=3 if mn==0 else 6
  for staff,events in [(1,rh),(2,lh)]:
   assert sum(Fraction(n['q']) for n in events)==expected
   if staff==2:
    el(el(m,'backup'),'duration',expected*D)
    if mn==1:
     for typ,off in [('start',0),('stop',Fraction(5,2)),('start',3),('stop',Fraction(11,2))]:direction(m,'pedal',typ,off,staff=2,line='no',sign='yes')
   for ni,n in enumerate(events):
    nd=el(m,'note',id=f'chopin-m{mn}-s{staff}-n{ni+1}')
    p=n['p']
    if p:
     pt=el(nd,'pitch');el(pt,'step',p[0]);alt=1 if '#' in p else -1 if 'b' in p else 0
     if alt:el(pt,'alter',alt)
     el(pt,'octave',p[-1])
    else:el(nd,'rest')
    dur=Fraction(n['q'])*D;assert dur.denominator==1
    el(nd,'duration',int(dur));el(nd,'voice',staff);el(nd,'type',n['typ'])
    if p:
     key=(staff,p[0],p[-1]);prev=state.get(key,-1 if p[0] in 'BEADG' else 0)
     if prev!=alt:el(nd,'accidental',{-1:'flat',0:'natural',1:'sharp'}[alt])
     state[key]=alt
    if n.get('tuplet'):
     tm=el(nd,'time-modification');el(tm,'actual-notes',11);el(tm,'normal-notes',6);el(tm,'normal-type','eighth')
    if p:el(nd,'stem','down')
    el(nd,'staff',staff)
    if 'beam' in n:el(nd,'beam',n['beam'],number=1)
    if any(k in n for k in ['slur','finger','art','tuplet_end']):
     no=el(nd,'notations')
     if 'slur' in n:el(no,'slur',type=n['slur'],number=staff,placement='above')
     if 'tuplet_end' in n:el(no,'tuplet',type=n['tuplet_end'],number=1,bracket='no',show_number='actual',placement='below')
     if 'finger' in n:
      tech=el(no,'technical');el(tech,'fingering',n['finger'],placement='above' if staff==1 else 'below',font_style='italic' if n.get('italic') else 'normal')
     if 'art' in n:el(el(no,'articulations'),n['art'])
  el(el(m,'barline',location='right'),'bar-style','regular')
  counts.append({'measure':mn,'quarter_beats':expected,'RH_events':len(rh),'LH_events':len(lh)})
 E.indent(root);E.ElementTree(root).write(S/f'{name}.musicxml',encoding='utf-8',xml_declaration=True)
 (R/'logs/chopin-validation.json').write_text(json.dumps(counts,indent=2))

def render():
 import verovio,cairosvg
 b.run([R/'.tools/venv/bin/python',R/'fonts/fingering/build_font.py'],'build-fingering-font')
 b.run([R/'.tools/venv/bin/python',R/'fonts/tempo/build_font.py'],'build-tempo-font')
 b.styles();src=S/f'{name}.musicxml';raw=T/f'{name}-converted.ly'
 b.run([R/'.tools/lilypond-2.26.0/bin/musicxml2ly','--npm','-o',raw,src],'convert-'+name)
 txt=raw.read_text().replace(r"\bold Larghetto", r"""\override #'(font-name . "Engraving Tempo") Larghetto""")
 txt=txt.replace(r'\smaller { \fontsize #-2 \rhythm', r'\fontsize #-4 { \rhythm')
 # Native adapters preserve the source's combined expression and italic fingerings.
 txt=txt.replace('_\\p _\\markup \\italic "espress."', '_\\markup { \\dynamic p \\italic "espress." }')
 txt=txt.replace('^2', r'-\tweak font-name #"Engraving Fingering Italic" ^2')
 txt=re.sub(r'\\header\s*\{.*?\}','',txt,flags=re.S);txt=re.sub(r'\\paper\s*\{.*?\}','',txt,flags=re.S)
 for profile in ['A-lily-baseline','B-lily-classical']:
  inc='\\include "styles/common.ily"\n'+('\\include "styles/lily-classical.ily"\n' if profile.startswith('B') else '')
  inc+='\\include "styles/chopin-typography.ily"\n'
  inc+=r'''\paper { right-margin = 41\mm }
\layout { \context { \Score \override BarNumber.stencil = ##f } }
'''
  # Force one system, with the last excerpt barline ordinary rather than final.
  content=txt.replace('\\score {',inc+'\\score {')
  f=S/f'{profile}-{name}.ly';f.write_text(content)
  b.run([R/'.tools/lilypond-2.26.0/bin/lilypond','-I',R,'-o',T/f'{profile}-{name}',f],f'{profile}-{name}')
 sty=E.parse(R/'styles/musescore-classical.mss');st=sty.getroot().find('Style');st.find('pagePrintableWidth').text=str(174/25.4)
 for key,value in {'defaultFontFace':'C059','tempoFontFace':'Engraving Tempo','tempoFontSize':'12','tempoFontStyle':'0','expressionFontFace':'C059','expressionFontSize':'11','expressionFontStyle':'2','fingeringFontFace':'Engraving Fingering','fingeringFontSize':'7','fingeringFontStyle':'0','tupletFontFace':'C059','tupletFontSize':'8','tupletFontStyle':'3','tupletMusicalSymbolsScale':'1'}.items():
  node=st.find(key)
  if node is None:node=el(st,key)
  node.text=value
 el(st,'showMeasureNumber',0);path=R/'styles/musescore-chopin.mss';sty.write(path,encoding='utf-8',xml_declaration=True)
 env=dict(os.environ,QT_QPA_PLATFORM='offscreen')
 import zipfile
 native=S/f'C-musescore-{name}.mscz'
 b.run([R/'.tools/squashfs-root/AppRun','-S',path,'-o',native,src],f'C-musescore-{name}-import',env)
 with zipfile.ZipFile(native) as z:
  score=E.fromstring(z.read(next(x for x in z.namelist() if x.endswith('.mscx'))))
 for staff in score.findall('./Score/Staff'):
  for frame in staff.findall('VBox'):staff.remove(frame)
  for measure in staff.findall('Measure')[:-1]:el(el(measure,'LayoutBreak'),'subtype','nobreak')
 # MuseScore's MusicXML import rounds the hairpin's tuplet endpoint to ticks,
 # inserting a tiny backwards location before the last note. Restore the exact
 # 15/22 whole-note span; otherwise reopening loses that note's slur anchor
 # and adds a spurious end barline. This correction is specific to this excerpt.
 for voice in score.findall('.//voice'):
  for loc in voice.findall('location'):
   frac=loc.find('fractions')
   if frac is not None and abs(Fraction(frac.text))<Fraction(1,10000):voice.remove(loc)
 for frac in score.findall('.//Spanner/next/location/fractions')+score.findall('.//Spanner/prev/location/fractions'):
  if frac.text=='1309/1920':frac.text='15/22'
  elif frac.text=='-1309/1920':frac.text='-15/22'
 for tempo in score.findall('.//Tempo'):
  tx=tempo.find('text');tx.clear();tx.text='Larghetto '
  el(tx,'font',face='C059');el(tx,'font',size='8');el(tx,'sym','metNoteQuarterUp').tail=' = 116'
 native_xml=S/f'C-musescore-{name}.mscx';E.ElementTree(score).write(native_xml,encoding='utf-8',xml_declaration=True)
 for ext,folder in [('pdf',T),('mscz',S)]:b.run([R/'.tools/squashfs-root/AppRun','-S',path,'-o',folder/f'C-musescore-{name}.{ext}',native_xml],f'C-musescore-{name}-{ext}',env)
 # CairoSVG cannot consume CSS-embedded WOFF2 fonts. Make that same bundled
 # Leipzig text font available to Fontconfig (no change to its glyph design).
 import base64,io
 from fontTools.ttLib import TTFont
 import verovio
 data=Path(verovio.__file__).resolve().parent/'data'
 css=(data/'Leipzig.css').read_text();blob=re.search(r'base64,([^)]*)',css).group(1).strip("'\" ")
 fontdir=R/'.tools/fonts';fontdir.mkdir(exist_ok=True)
 ft=TTFont(io.BytesIO(base64.b64decode(blob)));ft.flavor=None;ft.save(fontdir/'Leipzig.ttf')
 conf=fontdir/'fonts.conf';conf.write_text(f'<fontconfig><include>/etc/fonts/fonts.conf</include><dir>{fontdir}</dir></fontconfig>')
 v=verovio.toolkit();opts=json.loads((R/'styles/verovio-classical.json').read_text());opts.update(pageMarginRight=410,mnumInterval=0,breaks='auto')
 assert v.setOptions(opts);assert v.loadFile(str(src))
 mei=E.fromstring(v.getMEI());ns={'m':'http://www.music-encoding.org/ns/mei'};q='{'+ns['m']+'}'
 section=mei.find('.//m:section',ns);section.insert(0,E.Element(q+'sb'))
 # Keep p and espress. on one baseline while retaining separate objects.
 for dynam in mei.findall('.//m:dynam',ns):dynam.set('vgrp','1')
 for dr in mei.findall('.//m:dir',ns):
  if 'espress.' in ''.join(dr.itertext()):dr.set('vgrp','1');dr.set('ho','3')
 E.register_namespace('',ns['m']);meitext=E.tostring(mei,encoding='unicode');(S/f'D-verovio-{name}.mei').write_text(meitext)
 opts['inputFrom']='mei';opts['breaks']='encoded';assert v.setOptions(opts);assert v.loadData(meitext);assert v.getPageCount()==1
 svg=v.renderToSVG(1)
 # Source has a single p espress. baseline. Correct only the expression's
 # placement after Verovio lays out its separate dynamic and text objects.
 sg=E.fromstring(svg);sns={'s':'http://www.w3.org/2000/svg'}
 dyn=next(g for g in sg.findall('.//s:g',sns) if g.get('class')=='dynam')
 use=dyn.find('s:use',sns);xy=re.search(r'translate\(([-.0-9]+),\s*([-.0-9]+)\)',use.get('transform'))
 for group in sg.findall('.//s:g',sns):
  if group.get('class')=='dir' and 'espress.' in ''.join(group.itertext()):
   tx=group.find('s:text',sns);tx.set('x',str(float(xy[1])+400));tx.set('y',xy[2])
 # Typography adapter: retain music glyphs and give each textual role its own size.
 # SVG units are 100/mm at the current scale; convert typographic points explicitly.
 pt=100*25.4/72
 for group in sg.findall('.//s:g',sns):
  role=group.get('class')
  if role in ('tempo','dir','fing'):
   tx=group.find('s:text',sns)
   if tx is None:continue
   tx.set('font-family','C059');tx.set('font-weight','normal')
   if role=='tempo':
    tx.set('font-family','Engraving Tempo')
    for span in tx.iter():
     if span.get('font-weight'):span.set('font-weight','normal')
     if span.get('font-family')=='Leipzig':span.set('font-size','460px')
   if role=='fing':
    tx.set('font-family','Engraving Fingering')
    # The two RH 2s are composer's italic fingerings; LH 2 remains upright.
    tx.set('font-style','italic' if ''.join(tx.itertext()).strip()=='2' and float(tx.get('y'))<2000 else 'normal')
   for span in tx.iter():
    if span.get('font-size') not in (None,'0px') and span.get('font-family')!='Leipzig':
     size={'tempo':12,'dir':11,'fing':7}[role]
     if role=='tempo' and '116' in (span.text or ''):size=8;span.set('font-family','C059')
     span.set('font-size',str(size*pt)+'px')
  elif role=='tupletNum':
   uses=group.findall('s:use',sns)
   if uses:
    positions=[re.search(r'translate\(([-.0-9]+),\s*([-.0-9]+)',u.get('transform')) for u in uses]
    x=sum(float(pos[1]) for pos in positions)/len(positions)+72;y=float(positions[0][2])
    for u in uses:group.remove(u)
    tx=E.SubElement(group,'{'+sns['s']+'}text',{'x':str(x),'y':str(y),'text-anchor':'middle','font-family':'C059','font-weight':'bold','font-style':'italic','font-size':str(8*pt)+'px'});tx.text='11'
 E.register_namespace('',sns['s']);E.register_namespace('xlink','http://www.w3.org/1999/xlink')
 svg=E.tostring(sg,encoding='unicode');svpath=T/f'D-verovio-{name}.svg';svpath.write_text(svg)
 env2=dict(os.environ,FONTCONFIG_FILE=str(conf))
 b.run([R/'.tools/venv/bin/python','-m','cairosvg',svpath,'-o',T/f'D-verovio-{name}.pdf'],f'D-verovio-{name}-pdf',env2)
 print('Chopin excerpt rendered in four treatments.')
if __name__=='__main__':make_source();render()
