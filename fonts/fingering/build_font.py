"""Fingering-only Emmentaler derivative; build normalized, narrow music numerals."""
from pathlib import Path
from fontTools.ttLib import TTFont
from fontTools.fontBuilder import FontBuilder
from fontTools.pens.boundsPen import BoundsPen
from fontTools.pens.t2CharStringPen import T2CharStringPen
from fontTools.pens.transformPen import TransformPen
import shutil,subprocess
out=Path(__file__).resolve().parent
src=TTFont(out.parents[1]/'.tools/lilypond-2.26.0/share/lilypond/2.26.0/fonts/otf/emmentaler-20.otf')
glyphs=src.getGlyphSet();cmap=src.getBestCmap()
for style in ['Regular','Italic']:
 order=['.notdef','space']+[cmap[ord(c)] for c in '0123456789'];chars={};metrics={}
 for name in order:
  if name in ['.notdef','space']:
   pen=T2CharStringPen(250,None);chars[name]=pen.getCharString();metrics[name]=(250,0);continue
  bounds=BoundsPen(glyphs);glyphs[name].draw(bounds);x0,y0,x1,y1=bounds.bounds
  sy=700/(y1-y0);sx=sy*.88;shear=.10*sy if style=='Italic' else 0
  advance=round((x1-x0)*sx+(y1-y0)*shear+60)
  pen=T2CharStringPen(advance,glyphs)
  glyphs[name].draw(TransformPen(pen,(sx,0,shear,sy,30-x0*sx-y0*shear,-y0*sy)))
  chars[name]=pen.getCharString();metrics[name]=(advance,30)
 family='Engraving Fingering';ps='EngravingFingering-'+style
 fb=FontBuilder(1000,isTTF=False);fb.setupGlyphOrder(order)
 fb.setupCharacterMap({32:'space',**{ord(c):cmap[ord(c)] for c in '0123456789'}})
 fb.setupCFF(ps,{'FullName':family+' '+style,'FamilyName':family,'Weight':'Regular','Notice':'Derived from GNU LilyPond Emmentaler. GPL-3.0-or-later with font embedding exception.'},chars,{})
 fb.setupHorizontalMetrics(metrics);fb.setupHorizontalHeader(ascent=800,descent=-200)
 fb.setupNameTable({'familyName':family,'styleName':style,'uniqueFontIdentifier':ps+'-music-v2','fullName':family+' '+style,'psName':ps,'version':'Version 2.0'})
 fb.setupOS2(sTypoAscender=800,sTypoDescender=-200,usWinAscent=800,usWinDescent=200,usWeightClass=400,fsSelection=1 if style=='Italic' else 64)
 fb.setupPost(italicAngle=-5.71 if style=='Italic' else 0)
 fb.font['head'].macStyle=2 if style=='Italic' else 0
 path=out/(ps+'.otf');fb.save(path)
 install=Path.home()/'.local/share/fonts/music-engraving';install.mkdir(parents=True,exist_ok=True);shutil.copy2(path,install/path.name)
subprocess.run(['fc-cache','-f',str(install)],check=True)
