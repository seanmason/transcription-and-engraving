"""Experimental narrow C059 derivative for score fingerings; AGPL-3 + font exception."""
from pathlib import Path
from fontTools.ttLib import TTFont
from fontTools.pens.t2CharStringPen import T2CharStringPen
from fontTools.pens.transformPen import TransformPen
import shutil,subprocess
out=Path(__file__).resolve().parent
for style,source in [('Regular','Bold'),('Italic','BdIta')]:
 f=TTFont('/usr/share/fonts/opentype/urw-base35/C059-'+source+'.otf')
 top=f['CFF '].cff.topDictIndex[0]; glyphs=f.getGlyphSet(); result={};scale=.88
 for name in f.getGlyphOrder():
  width,lsb=f['hmtx'][name];pen=T2CharStringPen(round(width*scale),glyphs)
  glyphs[name].draw(TransformPen(pen,(scale,0,0,1,0,0)))
  result[name]=pen.getCharString(private=top.Private,globalSubrs=f['CFF '].cff.GlobalSubrs)
  f['hmtx'][name]=(round(width*scale),round(lsb*scale))
 for name,cs in result.items():top.CharStrings[name]=cs
 family='Engraving Fingering';ps='EngravingFingering-'+style
 for nid,val in [(1,family),(2,style),(3,ps+'-v1'),(4,family+' '+style),(6,ps),(16,family),(17,style)]:
  f['name'].removeNames(nameID=nid)
  f['name'].setName(val,nid,3,1,0x409)
 top.FamilyName=family;top.FullName=family+' '+style;f['CFF '].cff.fontNames=[ps]
 f['OS/2'].usWeightClass=400
 f['OS/2'].fsSelection=(1 if style=='Italic' else 64)
 f['head'].macStyle=(2 if style=='Italic' else 0)
 f['OS/2'].usWidthClass=4;f['OS/2'].xAvgCharWidth=round(f['OS/2'].xAvgCharWidth*scale)
 path=out/(ps+'.otf');f.save(path)
 install=Path.home()/'.local/share/fonts/music-engraving';install.mkdir(parents=True,exist_ok=True);shutil.copy2(path,install/path.name)
subprocess.run(['fc-cache','-f',str(install)],check=True)
