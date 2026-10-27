from pathlib import Path
from PIL import Image,ImageChops,ImageOps,ImageDraw
import subprocess,json
root=Path(__file__).resolve().parent;t=root/'tmp/pdfs';meta={}
for p in sorted(t.glob('[ABCD]-*.pdf')):
 subprocess.run(['pdftoppm','-r','130','-png','-singlefile',str(p),str(p.with_suffix(''))],check=True,capture_output=True)
 im=Image.open(p.with_suffix('.png')).convert('RGB');gray=im.convert('L');mask=gray.point(lambda v:255 if v<180 else 0);box=mask.getbbox()
 # Detect staff rows by the long horizontal runs, then group near-adjacent raster rows.
 rows=[y for y in range(im.height) if sum(1 for x in range(im.width) if gray.getpixel((x,y))<150)>im.width*.5]
 groups=[]
 for y in rows:
  if not groups or y>groups[-1][-1]+1:groups.append([y])
  else:groups[-1].append(y)
 centers=[sum(g)/len(g) for g in groups];diffs=[round(b-a,2) for a,b in zip(centers,centers[1:]) if 4<b-a<16]
 meta[p.stem]={'bbox_px':box,'staff_row_centers':centers,'staff_step_px':sorted(diffs)[len(diffs)//2] if diffs else None,'dpi':130}
 crop=im.crop((max(0,box[0]-15),max(0,box[1]-15),min(im.width,box[2]+15),min(im.height,box[3]+15)))
 crop.save(t/f'{p.stem}-crop.png')
(t/'geometry.json').write_text(json.dumps(meta,indent=2))
print(json.dumps({k:{'bbox':v['bbox_px'],'space':v['staff_step_px']} for k,v in meta.items()},indent=2))
