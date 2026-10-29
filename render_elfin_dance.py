"""Build and structurally validate the manually transcribed Elfin Dance.
Run: .tools/venv/bin/python render_elfin_dance.py
"""
from pathlib import Path
from collections import defaultdict
import hashlib, json, re, struct, subprocess
from pypdf import PdfReader
R = Path(__file__).resolve().parent
source = R/'scores/elfin-dance.ly'
prefix = R/'output/pdf/elfin-dance-reengraved'
for directory in (prefix.parent, R/'logs', R/'tmp/pdfs'):
    directory.mkdir(parents=True, exist_ok=True)
for font in ('fingering', 'tempo'):
    subprocess.run([R/'.tools/venv/bin/python', R/f'fonts/{font}/build_font.py'], cwd=R, check=True)
log = R/'logs/elfin-dance.log'
with log.open('w') as f:
    subprocess.run([R/'.tools/lilypond-2.26.0/bin/lilypond', '-I', R, '-o', prefix, source], cwd=R, stdout=f, stderr=subprocess.STDOUT, check=True)
assert not re.search(r'warning:|error:', log.read_text(), re.I), log.read_text()
assert re.findall(r'\\barNumberCheck #(\d+)', source.read_text()) == [str(i) for i in range(2,74)] * 2
assert len(PdfReader(prefix.with_suffix('.pdf')).pages) == 2
b = prefix.with_suffix('.midi').read_bytes()
assert b[:4] == b'MThd'
fmt, track_count, ppq = struct.unpack('>HHH', b[8:14])
pos = 14
tracks = []
for track in range(track_count):
    assert b[pos:pos+4] == b'MTrk'
    size = int.from_bytes(b[pos+4:pos+8], 'big')
    data = b[pos+8:pos+8+size]; pos += 8+size
    i = tick = 0; running = None; notes = []; active = {}; groups = defaultdict(list)
    def vlq():
        global i
        v = 0
        while True:
            byte = data[i]; i += 1; v = (v << 7) | (byte & 127)
            if byte < 128: return v
    while i < len(data):
        tick += vlq()
        if data[i] >= 128:
            status = data[i]; i += 1
            if status < 240: running = status
        else:
            status = running
        if status == 255:
            kind = data[i]; i += 1
            length = vlq(); i += length
        elif status in (240,247):
            length = vlq(); i += length
        else:
            count = 1 if (status & 240) in (192,208) else 2
            args = data[i:i+count]; i += count
            key = (status & 15, args[0])
            if status & 240 == 144 and args[1]:
                assert key not in active
                active[key] = tick; notes.append(args[0]); groups[tick/ppq].append(args[0])
            elif status & 240 == 128 or (status & 240 == 144 and not args[1]):
                assert key in active
                assert tick > active.pop(key)
    assert not active
    if notes:
        assert tick / ppq == 216, (track, tick, ppq)
        tracks.append(dict(track=track, duration_quarter_beats=tick/ppq, note_on_events=len(notes), lowest_midi_note=min(notes), highest_midi_note=max(notes), onsets=[dict(beat=beat, pitches=sorted(pitches)) for beat,pitches in sorted(groups.items())]))
assert len(tracks) == 2

def notes_in_measure(hand, measure):
    start = (measure-1)*3
    return [e['pitches'] for e in tracks[hand]['onsets'] if start <= e['beat'] < start+3]

# Selected scan readings checked separately from source parsing. These focus on
# corrected pitches, accidental carry, repeated phrases and the coda.
checks = {
    (0,1): [[71,76],[71,76],[72,76]],
    (0,3): [[71],[72],[71],[78],[76],[74]],
    (0,4): [[71],[76],[79],[82],[83]],
    (0,5): [[74,78,83],[74,78,83],[74,79,83]],
    (0,17): [[59],[59],[54]],
    (0,19): [[67],[70],[67],[70],[66],[70]],
    (0,23): [[67],[70],[67],[70],[66],[70]],
    (0,25): [[70],[73],[70],[73],[69],[73]],
    (0,26): [[67],[73],[67],[73],[70],[71]],
    (0,27): [[72],[74],[72],[74],[71],[74]],
    (0,28): [[70],[74],[70],[74],[70],[74]],
    (0,65): [[68],[69],[72],[76]],
    (0,66): [[64],[65],[69],[72]],
    (0,67): [[62],[63],[66],[71]],
    (1,65): [[60,64]], (1,66): [[57,60]], (1,67): [[48,54,57]],
    (1,68): [[40,47,52],[40,47,52],[40,45,52]],
    (1,69): [[40,47,52],[40,47,52],[40,48,52]],
}
for (hand,measure),expected in checks.items():
    assert notes_in_measure(hand, measure) == expected, (hand,measure,notes_in_measure(hand,measure),expected)
for original, repeats in [(3,[11,33,55,63]),(4,[12,34,56,64]),(19,[41]),(25,[47]),(26,[48]),(27,[49]),(28,[50])]:
    for measure in repeats:
        assert notes_in_measure(0,measure) == notes_in_measure(0,original)
# Grace notes precede each beat; their audition duration is chosen by LilyPond.
ending = tracks[0]['onsets'][-6:]
assert [e['pitches'] for e in ending] == [[71],[75],[67,76],[83],[87],[79,88]]
assert 209 < ending[0]['beat'] < ending[1]['beat'] < 210
assert ending[2]['beat'] == 210
assert 212 < ending[3]['beat'] < ending[4]['beat'] < 213
assert ending[5]['beat'] == 213
subprocess.run(['pdftoppm', '-r', '150', '-png', prefix.with_suffix('.pdf'), R/'tmp/pdfs/elfin-final'], check=True)
report = dict(source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(), pdf_sha256=hashlib.sha256(prefix.with_suffix('.pdf').read_bytes()).hexdigest(), pages=2, full_measures=72, bar_checks_per_hand=72, lilypond_warnings=0, selected_pitch_checks=len(checks), midi_tempo_note='144 quarter notes per minute is an editorial audition setting; the printed source says Allegro without a metronome figure.', midi_tracks=[{k:v for k,v in t.items() if k!='onsets'} for t in tracks], limitation='Structural and selected pitch checks complement manual scan comparison; they are not independent certification of all pitches and markings.')
(R/'logs/elfin-dance-validation.json').write_text(json.dumps(report,indent=2)+'\n')
(R/'logs/elfin-dance-note-events.json').write_text(json.dumps(tracks,indent=2)+'\n')
print(json.dumps(report,indent=2))
