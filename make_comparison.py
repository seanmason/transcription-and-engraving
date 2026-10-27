from pathlib import Path
import json,io,subprocess
from reportlab.pdfgen import canvas
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
for name,file in [('LabSerif','DejaVuSerif.ttf'),('LabSerifBold','DejaVuSerif-Bold.ttf'),('LabSans','DejaVuSans.ttf'),('LabSansBold','DejaVuSans-Bold.ttf')]:
 pdfmetrics.registerFont(TTFont(name,'/usr/share/fonts/truetype/dejavu/'+file))
pdfmetrics.registerFontFamily('LabSerif',normal='LabSerif',bold='LabSerifBold',italic='LabSerif',boldItalic='LabSerifBold')
pdfmetrics.registerFontFamily('LabSans',normal='LabSans',bold='LabSansBold',italic='LabSans',boldItalic='LabSansBold')
from reportlab.lib.units import mm
from reportlab.platypus import Paragraph
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.colors import HexColor
from pypdf import PdfReader,PdfWriter,Transformation,PageObject
R=Path(__file__).resolve().parent;T=R/'tmp/pdfs';O=R/'output/pdf';W,H=235*mm,310*mm
geo=json.loads((T/'geometry.json').read_text());writer=PdfWriter()
ink=HexColor('#18232b');muted=HexColor('#53616b');accent=HexColor('#456578')
body=ParagraphStyle('body',fontName='LabSerif',fontSize=10.5,leading=14.5,textColor=ink)
small=ParagraphStyle('small',parent=body,fontSize=9,leading=12,textColor=muted)
def para(c,txt,x,y,w=195*mm,style=body):
 p=Paragraph(txt,style);_,h=p.wrap(w,1000);p.drawOn(c,x,y-h);return y-h

def head(c,kicker,title,sub):
 c.setFillColor(accent);c.setFont('LabSans',8);c.drawString(20*mm,H-17*mm,kicker)
 c.setFillColor(ink);c.setFont('LabSerif',23);c.drawString(20*mm,H-29*mm,title)
 para(c,sub,20*mm,H-34*mm,style=small)
def footer(c,num):
 c.setStrokeColor(HexColor('#d4dbe0'));c.setLineWidth(.5);c.line(20*mm,19*mm,217*mm,19*mm)
 c.setFillColor(muted);c.setFont('LabSans',8);c.drawString(20*mm,13*mm,'ENGRAVING LABORATORY  /  STUDY 01  /  27 OCTOBER 2026');c.drawRightString(217*mm,13*mm,str(num))
b=io.BytesIO();c=canvas.Canvas(b,pagesize=(W,H));head(c,'RESEARCH + FIRST RENDERED COMPARISON','Toward a classical piano house style','Three open-source engines. Four treatments. Two identical original piano studies.')
y=H-52*mm
for title,txt in [
 ('What the Henle reference suggests', 'The inspected Chopin Nocturnes HN 185 pages 7-8 suggest a strong contrast between dark noteheads and fine staff lines, tapered slurs, compact rhythmic groups, discreet fingerings, and deliberate separation of the two hands. These are visual observations, not measured Henle specifications. Henle says its custom music fonts reproduce historical engraving tools and are not commercially available.'),
 ('How to compare these pages', 'Each treatment uses the same notes, voices, beams, slur endpoints, dynamics, and line breaks. Staff height is 7 mm and the staff line width is 197 mm, on 235 x 310 mm pages. Scores remain vector artwork at native scale. Compare the melody slurs, accompaniment beams, fingering weight, and space between the hands. Print at actual size; screen antialiasing can change perceived weight.'),
 ('The four treatments', '<b>A - LilyPond baseline:</b> default engraving with common page geometry.<br/><b>B - LilyPond classical:</b> lighter staff lines, restrained text and fingerings, altered spacing, beam weight, and slur geometry.<br/><b>C - MuseScore / Leland:</b> a reusable style preset and an editable graphical score.<br/><b>D - Verovio / Leipzig:</b> a programmable SVG/MEI route with an alternative glyph family.'),
 ('Initial assessment', 'B is my preferred starting point for a reproducible engraving pipeline; C is a strong alternative if its rounder slurs and steadier beams appeal more. D is valuable for browser previews and font exploration. These are provisional visual judgments. The samples do not establish a winner for complex piano repertoire.'),
 ('Framework and next test', 'Scan recognition -> corrected MusicXML -> shared house style -> score-specific refinements -> vector PDF -> visual proof. This prototype implements the engraving comparison, not scan recognition. Next, use a longer passage with tuplets, grace notes, cross-staff beams, pedal changes, and page turns before choosing production defaults.')]:
 c.setFillColor(ink);c.setFont('LabSansBold',10);c.drawString(20*mm,y,title);y-=4*mm;y=para(c,txt,20*mm,y)-6*mm
c.setFillColor(ink);c.setFont('LabSansBold',9);c.drawString(20*mm,y,'Primary references');y-=4*mm
refs=[('Henle: Nocturnes HN 185 and Look inside previews','https://www.henle.de/us/Nocturnes/HN-185'),('Henle: engraving fonts and production methods','https://www.henle.de/FAQ/'),('LilyPond: spacing controls','https://lilypond.org/doc/v2.26/Documentation/notation/changing-horizontal-spacing-globally'),('MuseScore: command line export','https://handbook.musescore.org/appendix/command-line-usage'),('Verovio: renderer options','https://book.verovio.org/toolkit-reference/toolkit-options.html')]
for label,url in refs:y=para(c,f'<link href="{url}" color="#456578">{label}</link>',20*mm,y,style=small)-1*mm
assert y>24*mm,y
footer(c,1);c.save();writer.add_page(PdfReader(b).pages[0])
profiles=[('A-lily-baseline','A  /  LilyPond baseline','Emmentaler music font; default engraving. Common scale, margins, and breaks only.'),('B-lily-classical','B  /  LilyPond classical','Emmentaler + Nimbus Roman. Adjusted line weight, spacing, slurs, and fingerings.'),('C-musescore','C  /  MuseScore Studio','Leland + Nimbus Roman. Styled command line export; graphical editing available.'),('D-verovio','D  /  Verovio','Leipzig music font. Explicit import notation, encoded line breaks, and full-width final systems.')]
for idx,(key,title,desc) in enumerate(profiles,2):
 b=io.BytesIO();c=canvas.Canvas(b,pagesize=(W,H));head(c,'CONTROLLED COMPARISON  /  7 MM STAFF HEIGHT',title,desc)
 for label,y in [('I. Cantabile study  /  8 bars in G minor',47),('II. Figuration study  /  4 bars in C major',168)]:
  c.setFont('LabSans',9);c.setFillColor(muted);c.drawString(20*mm,H-y*mm,label)
 footer(c,idx);c.save();overlay=PdfReader(b).pages[0];page=PageObject.create_blank_page(width=W,height=H)
 for piece,top in [('lyrical',54),('dense',175)]:
  src=PdfReader(T/f'{key}-{piece}.pdf').pages[0];g=geo[f'{key}-{piece}'];x0,y0,x1,y1=[v*72/g['dpi'] for v in g['bbox_px']];sh=float(src.mediabox.height)
  src.cropbox.lower_left=(x0-2,sh-y1-2);src.cropbox.upper_right=(x1+2,sh-y0+2)
  dy=H-top*mm-(sh-y0)
  assert H-top*mm-(y1-y0)>23*mm,(key,piece)
  page.merge_transformed_page(src,Transformation().translate(ty=dy))
 page.merge_page(overlay)
 writer.add_page(page)
writer.add_metadata({'/Title':'Classical piano engraving - four treatments','/Author':'Engraving laboratory','/Subject':'LilyPond, MuseScore and Verovio controlled comparison'})
p=O/'engraving-comparison.pdf';writer.write(p)
assert len(PdfReader(p).pages)==5
subprocess.run(['pdftoppm','-r','100','-png',str(p),str(T/'comparison')],check=True)
print(p)
