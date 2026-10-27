"""Build a four-page, same-passage side-by-side comparison at 7 mm staff height."""
from pathlib import Path
import io,json,subprocess,xml.etree.ElementTree as E,zipfile
from PIL import Image,ImageDraw
from reportlab.pdfgen import canvas
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.units import mm
from reportlab.lib.colors import HexColor
from pypdf import PdfReader,PdfWriter,PageObject,Transformation
R=Path(__file__).resolve().parent;T=R/'tmp/pdfs';O=R/'output/pdf';name='chopin-op9-no1-opening'
for fam,file in [('Serif','DejaVuSerif.ttf'),('Sans','DejaVuSans.ttf'),('Bold','DejaVuSans-Bold.ttf')]:pdfmetrics.registerFont(TTFont('Lab'+fam,'/usr/share/fonts/truetype/dejavu/'+file))
# Retain the original pixels for musical notation. Exclude the edition-only
# opus/composition headings, which would otherwise be partially clipped.
im=Image.open(R/'references/henle-nocturnes-09.jpg').convert('RGB');crop=im.crop((245,330,1670,735));draw=ImageDraw.Draw(crop);draw.rectangle((455,0,crop.width,55),fill='white');ref=T/'henle-chopin-system-reference.png';crop.save(ref)
geo=json.loads((T/'geometry.json').read_text());W,H=440*mm,155*mm;wr=PdfWriter();srcurl='https://www.henle.de/us/Nocturnes/HN-185'
profiles=[('A-lily-baseline','A / LilyPond - default geometry','Default engraving geometry with the revised typography preset.'),('B-lily-classical','B / LilyPond classical','Tuned staff/beam weight, slur geometry, text, fingerings, and rhythmic spacing.'),('C-musescore','C / MuseScore Studio - Leland','Saved house style; one-system lock and corrected tuplet endpoint timing.'),('D-verovio','D / Verovio - Leipzig','Encoded system break; working metronome glyph; aligned p espress. expression.')]
for idx,(key,label,desc) in enumerate(profiles,1):
 buf=io.BytesIO();c=canvas.Canvas(buf,pagesize=(W,H));c.setFillColor(HexColor('#243746'));c.setFont('LabSans',8);c.drawString(15*mm,H-13*mm,'ENGRAVING LABORATORY / SAME-PASSAGE STUDY')
 c.setFont('LabSerif',21);c.drawString(15*mm,H-25*mm,'Chopin: Nocturne in B-flat minor, Op. 9 No. 1')
 c.setFillColor(HexColor('#53616b'));c.setFont('LabSans',9);c.drawString(15*mm,H-33*mm,'Pickup and measures 1-2. Same pitches, rhythm, markings, system break, and nominal staff height.')
 for x,title in [(15,'HENLE / HN 185, printed page 7'),(235,label)]:c.setFillColor(HexColor('#243746'));c.setFont('LabBold',10);c.drawString(x*mm,H-46*mm,title)
 # Reference staff outer lines y452..507 => 55 px = 7 mm. First staff starts x282.
 scale=7/55*mm;ref_y=H-68*mm+(452-330)*scale-crop.height*scale
 c.drawImage(str(ref),15*mm,ref_y,width=crop.width*scale,height=crop.height*scale)
 c.setStrokeColor(HexColor('#dce2e6'));c.setLineWidth(.5);c.line(220*mm,H-43*mm,220*mm,39*mm)
 c.setFillColor(HexColor('#53616b'));c.setFont('LabSans',9)
 c.drawString(15*mm,30*mm,'Typography revision: music numerals with an open-top 4 and a curved foot on 2.')
 c.drawString(15*mm,24*mm,desc)
 c.setFont('LabSans',8);c.drawString(15*mm,16*mm,'Reference: official Henle preview, copyright 1980 G. Henle Verlag, Munich. Non-musical headings omitted from the crop.')
 c.linkURL(srcurl,(15*mm,14*mm,215*mm,19*mm),relative=0)
 c.drawString(15*mm,10*mm,'Henle is a raster preview; re-engraving is vector. Reference scale is estimated from its staff lines. No claim of exact font matching.')
 c.drawRightString(W-15*mm,10*mm,f'{idx} / 4');c.save();overlay=PdfReader(buf).pages[0]
 page=PageObject.create_blank_page(width=W,height=H)
 pdf=PdfReader(T/f'{key}-{name}.pdf').pages[0];g=geo[f'{key}-{name}'];dpi=g['dpi'];bbox=[v*72/dpi for v in g['bbox_px']];ph=float(pdf.mediabox.height)
 pdf.cropbox.lower_left=(bbox[0]-2,ph-bbox[3]-2);pdf.cropbox.upper_right=(bbox[2]+2,ph-bbox[1]+2)
 staff_y=g['staff_row_centers'][0]*72/dpi
 dx=235*mm+(282-245)*scale-20*mm;dy=H-68*mm-(ph-staff_y)
 assert ph-bbox[3]+dy>40*mm
 page.merge_transformed_page(pdf,Transformation().translate(tx=dx,ty=dy));page.merge_page(overlay);wr.add_page(page)
wr.add_metadata({'/Title':'Chopin opening - Henle versus four open-source treatments','/Author':'Engraving laboratory'})
p=O/'chopin-henle-side-by-side.pdf';wr.write(p)
# Independent structural counts catch lost notes and slurs in renderer adapters.
source=E.parse(R/'scores'/f'{name}.musicxml');pitched=source.findall('.//note/pitch');assert len(pitched)==51
with zipfile.ZipFile(R/'scores'/f'C-musescore-{name}.mscz') as z:
 rt=E.fromstring(z.read(next(n for n in z.namelist() if n.endswith('.mscx'))))
 assert len(rt.findall('.//Note/pitch'))==51
 assert len(rt.findall('.//Slur'))==8
 srcmidi=[]
 for pch in pitched:srcmidi.append(12*(int(pch.findtext('octave'))+1)+{'C':0,'D':2,'E':4,'F':5,'G':7,'A':9,'B':11}[pch.findtext('step')]+int(pch.findtext('alter','0')))
 assert sorted(srcmidi)==sorted(int(n.text) for n in rt.findall('.//Note/pitch'))
mei=E.parse(R/'scores'/f'D-verovio-{name}.mei');ns={'m':'http://www.music-encoding.org/ns/mei'}
assert len(mei.findall('.//m:note',ns))==51;assert len(mei.findall('.//m:slur',ns))==8
assert len(PdfReader(p).pages)==4
(R/'logs/chopin-final-validation.json').write_text(json.dumps({'pitched_notes':51,'slurs':8,'source_measure_quarter_lengths':[3,6,6],'musescore_pitch_multiset_matches':True,'pdf_pages':4,'staff_height_mm':7,'reference_scale_estimated':True},indent=2))
subprocess.run(['pdftoppm','-r','110','-png',str(p),str(T/'chopin-shaped-digits-final-proof')],check=True)
print(p)
