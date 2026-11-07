"""Compile the manually editable practice edition; preserve the clean master."""
from pathlib import Path
import hashlib, json, re, subprocess
from pypdf import PdfReader
R=Path(__file__).resolve().parent
source=R/'scores/guarnieri-ponteio-15-fingered.ly'
base=R/'scores/guarnieri-ponteio-15.ly'
out=R/'output/pdf/guarnieri-ponteio-15-fingered'
(R/'logs').mkdir(exist_ok=True)
(R/'tmp/pdfs').mkdir(parents=True,exist_ok=True)
log=R/'logs/guarnieri-fingered.log'
with log.open('w') as f:
    subprocess.run([R/'.tools/lilypond-2.26.0/bin/lilypond','-I',R,'-o',out,source],stdout=f,stderr=subprocess.STDOUT,check=True)
assert not re.search(r'warning:|error:',log.read_text(),re.I)
assert re.findall(r'\\barNumberCheck #(\d+)',source.read_text()) == [str(i) for i in range(2,55)]*2
# Compile the unmodified musical base anew, avoiding stale MIDI comparisons.
reference=R/'tmp/pdfs/guarnieri-fingering-base-check'
with (R/'logs/guarnieri-fingering-base-check.log').open('w') as f:
    subprocess.run([R/'.tools/lilypond-2.26.0/bin/lilypond','-I',R,'-o',reference,base],stdout=f,stderr=subprocess.STDOUT,check=True)
assert out.with_suffix('.midi').read_bytes()==reference.with_suffix('.midi').read_bytes(), 'Musical MIDI changed'
pages=len(PdfReader(out.with_suffix('.pdf')).pages)
assert pages==4,pages
subprocess.run(['pdftoppm','-scale-to','1400','-png',out.with_suffix('.pdf'),R/'tmp/pdfs/fingered'],check=True)
report=dict(status='provisional practice fingering; not piano-tested',pages=pages,measures=53,compiler_warnings=0,bar_checks=106,midi_byte_identical_to_fresh_base=True,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),base_sha256=hashlib.sha256(base.read_bytes()).hexdigest(),pdf_sha256=hashlib.sha256(out.with_suffix('.pdf').read_bytes()).hexdigest(),limits='Underlying transcription audited against the new scan in experiment 009. MIDI equality proves preservation, not accuracy or physical playability. Fingering remains untested at a piano.')
(R/'experiments/008-guarnieri-fingering/validation.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
