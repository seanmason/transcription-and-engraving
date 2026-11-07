"""Build the editable Guarnieri working proof; check structure only.
Run: .tools/venv/bin/python render_guarnieri_ponteio_15.py
This script never generates or replaces the manually edited LilyPond source.
"""
from pathlib import Path
from collections import defaultdict
import hashlib, json, re, struct, subprocess
from pypdf import PdfReader
R = Path(__file__).resolve().parent
source = R/'scores/guarnieri-ponteio-15.ly'
prefix = R/'output/pdf/guarnieri-ponteio-15-reengraved'
for directory in (prefix.parent, R/'logs', R/'tmp/pdfs'):
    directory.mkdir(parents=True, exist_ok=True)
for font in ('fingering', 'tempo'):
    subprocess.run([R/'.tools/venv/bin/python', R/f'fonts/{font}/build_font.py'], cwd=R, check=True)
log = R/'logs/guarnieri-ponteio-15.log'
with log.open('w') as f:
    subprocess.run([R/'.tools/lilypond-2.26.0/bin/lilypond', '-I', R, '-o', prefix, source], cwd=R, stdout=f, stderr=subprocess.STDOUT, check=True)
assert not re.search(r'warning:|error:', log.read_text(), re.I), log.read_text()
assert re.findall(r'\\barNumberCheck #(\d+)', source.read_text()) == [str(i) for i in range(2,55)] * 2
assert len(PdfReader(prefix.with_suffix('.pdf')).pages) == 4
b=prefix.with_suffix('.midi').read_bytes()
assert b[:4] == b'MThd'
fmt, track_count, ppq = struct.unpack('>HHH', b[8:14]); pos=14
tracks=[]; tempos=[]; meters=[]
for track in range(track_count):
    assert b[pos:pos+4]==b'MTrk'
    size=int.from_bytes(b[pos+4:pos+8],'big'); data=b[pos+8:pos+8+size];pos+=8+size
    i=tick=0; running=None; notes=[]; active=defaultdict(list); groups=defaultdict(list); spans=[]
    def vlq():
        global i
        v=0
        while True:
            byte=data[i];i+=1;v=(v<<7)|(byte&127)
            if byte<128:return v
    while i<len(data):
        tick+=vlq()
        if data[i]>=128:
            status=data[i];i+=1
            if status<240:running=status
        else:status=running
        if status==255:
            kind=data[i];i+=1;length=vlq();meta=data[i:i+length];i+=length
            if kind==81:tempos.append([tick/ppq,round(60000000/int.from_bytes(meta,'big'))])
            if kind==88:meters.append([tick/ppq,meta[0],2**meta[1]])
        elif status in (240,247):length=vlq();i+=length
        else:
            count=1 if status&240 in (192,208) else 2
            args=data[i:i+count];i+=count;key=(status&15,args[0])
            if status&240==144 and args[1]:
                active[key].append(tick);notes.append(args[0]);groups[tick/ppq].append(args[0])
            elif status&240==128 or (status&240==144 and not args[1]):
                assert active[key],(track,key,tick)
                start=active[key].pop(0);assert tick>start
                spans.append(dict(start=start/ppq,end=tick/ppq,pitch=args[0]))
    assert not any(active.values())
    if notes:
        assert tick/ppq==218,(track,tick/ppq)
        tracks.append(dict(track=track,duration_quarter_beats=tick/ppq,note_on_events=len(notes),lowest_midi_note=min(notes),highest_midi_note=max(notes),onsets=[dict(beat=t,pitches=sorted(set(ps))) for t,ps in sorted(groups.items())],spans=spans))
assert len(tracks)==2
assert tempos == [[0.0, 240]], tempos
expected_meters = []
beat = 0
last = None
for measure in range(1,54):
    meter = (3,2) if measure in (12,18,22,32) else ((3,4) if measure in (34,35) else (2,2))
    if meter != last: expected_meters.append([float(beat), *meter]); last=meter
    beat += meter[0]*4/meter[1]
assert meters == expected_meters, (meters,expected_meters)
assert beat == 218
for page in range(1,5):
    subprocess.run(['pdftoppm','-f',str(page),'-singlefile','-r','150','-png',prefix.with_suffix('.pdf'),R/f'tmp/pdfs/guarnieri-final-{page}'],check=True)
report = dict(status='scan-audited working edition; see experiment 009', pages=4, measures=53, quarter_beats=218, compiler_warnings=0, explicit_bar_checks=106, tempos=tempos, meters=meters, midi_tracks=[{k:v for k,v in t.items() if k not in ('onsets','spans')} for t in tracks], source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(), pdf_sha256=hashlib.sha256(prefix.with_suffix('.pdf').read_bytes()).hexdigest(), limits='Structural checks do not certify musical accuracy. All 53 measures manually compared with the higher-quality scan; source-mark ambiguities and limits in experiment 009.')
(R/'logs/guarnieri-ponteio-15-validation.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
