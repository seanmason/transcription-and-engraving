"""Build the editable Amelie master; check structure and selected scan readings.
Run: .tools/venv/bin/python render_la_valse_d_amelie.py
This script never generates or replaces the manually edited LilyPond source.
"""
from pathlib import Path
from collections import defaultdict
import hashlib, json, re, struct, subprocess
from pypdf import PdfReader
R = Path(__file__).resolve().parent
source = R/'scores/la-valse-d-amelie.ly'
prefix = R/'output/pdf/la-valse-d-amelie-reengraved'
for directory in (prefix.parent, R/'logs', R/'tmp/pdfs'):
    directory.mkdir(parents=True, exist_ok=True)
for font in ('fingering', 'tempo'):
    subprocess.run([R/'.tools/venv/bin/python', R/f'fonts/{font}/build_font.py'], cwd=R, check=True)
log = R/'logs/la-valse-d-amelie.log'
with log.open('w') as f:
    subprocess.run([R/'.tools/lilypond-2.26.0/bin/lilypond', '-I', R, '-o', prefix, source], cwd=R, stdout=f, stderr=subprocess.STDOUT, check=True)
assert not re.search(r'warning:|error:', log.read_text(), re.I), log.read_text()
assert re.findall(r'\\barNumberCheck #(\d+)', source.read_text()) == [str(i) for i in range(2,138)] * 3
assert len(PdfReader(prefix.with_suffix('.pdf')).pages) == 5
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
        assert tick/ppq==368,(track,tick/ppq)
        tracks.append(dict(track=track,duration_quarter_beats=tick/ppq,note_on_events=len(notes),lowest_midi_note=min(notes),highest_midi_note=max(notes),onsets=[dict(beat=t,pitches=sorted(set(ps))) for t,ps in sorted(groups.items())],spans=spans))
assert len(tracks)==2
assert tempos==[[0,100],[64,150],[352,100]],tempos
assert meters==[[0,2,4],[64,3,4],[352,2,4]],meters

def bounds(m):
    if m<=32:return (m-1)*2,2
    if m<=128:return 64+(m-33)*3,3
    return 352+(m-129)*2,2

def measure(hand,m):
    start,length=bounds(m)
    return [e['pitches'] for e in tracks[hand]['onsets'] if start<=e['beat']<start+length]

# Separately recorded readings from enlarged scan crops; MIDI contains attacks,
# so notes tied from the preceding bar do not appear again at the bar line.
checks={
 (0,1):[[74]], (0,2):[[74]], (0,3):[[71]], (0,4):[[71],[69]],
 (0,6):[[76],[74],[72],[71],[74]], (0,9):[[72]],
 (0,14):[[74],[72],[71],[72],[71]],
 (0,17):[[74,86]], (0,18):[[72,84]],
 (0,22):[[76],[74],[72],[71],[72]],
 (0,33):[[74],[64],[65],[64],[65],[64]],
 (0,34):[[74],[64],[65],[72],[64],[65]],
 (0,35):[[71],[62],[64],[62],[64],[62]],
 (0,36):[[69],[60],[62],[64],[62],[60]],
 (0,41):[[72],[64],[65],[64],[65],[64]],
 (0,42):[[72],[64],[65],[64],[65],[62]],
 (0,43):[[72],[62],[64],[62],[64],[62]],
 (0,44):[[64],[62],[60],[64],[62],[60]],
 (0,50):[[76],[64],[65],[72],[64],[65]],
 (0,58):[[72],[64],[65],[71],[64],[65]],
 (0,59):[[67],[62],[64],[62],[64],[62]],
 (0,66):[[76],[77],[76],[79],[77]],
 (0,68):[[71],[72]], (0,72):[[67]],
 (0,74):[[71],[72],[71],[74],[72]],
 (0,76):[[65],[67]], (0,82):[[72,84]],
 (0,86):[[76],[74],[72],[71],[74]],
 (0,97):[[86],[76],[77],[76],[77],[76]],
 (0,99):[[83],[74],[76],[74],[76],[74]],
 (0,100):[[81],[72],[74],[76],[74],[72]],
 (0,106):[[83],[74],[76],[74],[76],[72]],
 (0,122):[[84],[76],[77],[83],[76],[77]],
 (0,123):[[79],[74],[76],[74],[76],[74]],
 (0,130):[[72]], (0,134):[[76],[74],[72],[71],[72]],
 (0,135):[[71]], (0,136):[[69]],
 (1,2):[[53,57,62]], (1,4):[[48,52,59]],
 (1,10):[[57,60]], (1,12):[[52,55,59]],
 (1,33):[[50],[53,57,62],[53,57,62]],
 (1,35):[[45],[48,52,57],[48,52,57]],
 (1,36):[[48],[52,57],[52,57]],
 (1,41):[[53],[57,60],[57,60]],
 (1,43):[[48],[52,55],[52,55]],
 (1,65):[[50],[57],[62],[64],[65],[69]],
 (1,66):[[65],[64],[62],[57],[50],[57]],
 (1,67):[[45],[52],[57],[59],[60],[64]],
 (1,68):[[60],[59],[57],[52],[45],[52]],
 (1,73):[[41],[48],[53],[55],[57],[60]],
 (1,75):[[36],[43],[48],[50],[52],[55]],
 (1,105):[[50],[57],[62],[64],[65],[69]],
 (1,107):[[45],[52],[57],[59],[60],[64]],
 (1,128):[[60],[59],[57],[52],[45],[52]],
 (1,136):[[48,52,59]],
}
for (hand,m),expected in checks.items():
    assert measure(hand,m)==expected,(hand,m,measure(hand,m),expected)
# All 32 measures of the final variation retain the D/A bass cycle.
for m in range(97,129):assert measure(1,m)==measure(1,65+(m-97)%4),(1,m)
# The sustained upper notes are not shortened to the eighth-note figuration.
for m,pitch,length in [(33,74,3),(34,74,1.5),(34,72,1.5),(97,86,3),(122,84,1.5),(122,83,1.5)]:
    beat,_=bounds(m)
    if (m,pitch) in [(34,72),(122,83)]:beat+=1.5
    assert any(e['pitch']==pitch and e['start']==beat and e['end']==beat+length for e in tracks[0]['spans']),(m,pitch)
subprocess.run(['pdftoppm','-r','150','-png',prefix.with_suffix('.pdf'),R/'tmp/pdfs/amelie-final'],check=True)
report=dict(source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),pdf_sha256=hashlib.sha256(prefix.with_suffix('.pdf').read_bytes()).hexdigest(),pages=5,measures=136,bar_checks_per_voice=136,checked_voices=3,total_quarter_beats=368,lilypond_warnings=0,selected_scan_pitch_checks=len(checks),tempos=tempos,meters=meters,midi_tracks=[{k:v for k,v in t.items() if k not in ('onsets','spans')} for t in tracks],limitation='Structural and selected pitch/duration checks complement manual scan comparison; they do not independently certify every note, fingering or marking.')
(R/'logs/la-valse-d-amelie-validation.json').write_text(json.dumps(report,indent=2)+'\n')
(R/'logs/la-valse-d-amelie-note-events.json').write_text(json.dumps(tracks,indent=2)+'\n')
print(json.dumps(report,indent=2))
