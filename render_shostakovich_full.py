"""Rebuild the complete fresh transcription and its printable proof images.
Run: .tools/venv/bin/python render_shostakovich_full.py
"""
from pathlib import Path
import hashlib, json, re, struct, subprocess
from pypdf import PdfReader
R = Path(__file__).resolve().parent
source = R/'scores/shostakovich-op34-no16-new.ly'
prefix = R/'output/pdf/shostakovich-op34-no16-reengraved'
for directory in (prefix.parent, R/'logs', R/'tmp/pdfs'):
    directory.mkdir(parents=True, exist_ok=True)
for font in ('fingering', 'tempo'):
    subprocess.run([R/'.tools/venv/bin/python', R/f'fonts/{font}/build_font.py'], check=True, cwd=R)
log = R/'logs/shostakovich-full.log'
with log.open('w') as f:
    subprocess.run([R/'.tools/lilypond-2.26.0/bin/lilypond', '-I', R, '-o', prefix, source], cwd=R, stdout=f, stderr=subprocess.STDOUT, check=True)
assert not re.search(r'warning:|error:', log.read_text(), re.I), log.read_text()
checks = re.findall(r'\\barNumberCheck #(\d+)', source.read_text())
assert checks == [str(i) for i in range(1,33)] * 2
pdf = prefix.with_suffix('.pdf')
assert len(PdfReader(pdf).pages) == 2
# Independent MIDI structure check: each hand ends at 126 quarter-note beats.
b = prefix.with_suffix('.midi').read_bytes()
assert b[:4] == b'MThd'
fmt, tracks, ppq = struct.unpack('>HHH', b[8:14])
pos = 14
summary = []
for track in range(tracks):
    assert b[pos:pos+4] == b'MTrk'
    n = int.from_bytes(b[pos+4:pos+8], 'big')
    data = b[pos+8:pos+8+n]; pos += 8+n
    i = tick = 0; running = None; notes = []; active = {}; ends = []
    def vlq():
        global i
        v = 0
        while True:
            x = data[i]; i += 1; v = (v << 7) | (x & 127)
            if x < 128: return v
    while i < len(data):
        tick += vlq()
        if data[i] >= 128:
            status = data[i]; i += 1
            if status < 240: running = status
        else:
            status = running
        if status == 255:
            kind = data[i]; i += 1
            size = vlq(); i += size
        elif status in (240,247):
            size = vlq(); i += size
        else:
            count = 1 if status & 240 in (192,208) else 2
            args = data[i:i+count]; i += count
            key = (status & 15, args[0])
            if status & 240 == 144 and args[1]:
                assert key not in active
                active[key] = tick; notes.append(args[0])
            elif status & 240 == 128 or (status & 240 == 144 and not args[1]):
                assert key in active
                assert tick > active.pop(key)
                ends.append(tick)
    assert not active
    if notes:
        assert tick / ppq == 126, (track,tick,ppq)
        summary.append(dict(track=track, duration_quarter_beats=tick/ppq, note_on_events=len(notes), lowest_midi_note=min(notes), highest_midi_note=max(notes)))
assert len(summary) == 2
assert min(t['lowest_midi_note'] for t in summary) == 22  # Final sounding B-flat 0.
subprocess.run(['pdftoppm', '-r', '150', '-png', pdf, R/'tmp/pdfs/shostakovich-final'], check=True)
report = dict(source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(), pdf_sha256=hashlib.sha256(pdf.read_bytes()).hexdigest(), pages=2, bar_checks_per_hand=32, full_measures=31, pickup_quarter_beats=2, lilypond_warnings=0, midi_tracks=summary, note='Structural checks complement manual scan comparison; they do not prove pitch accuracy.')
(R/'logs/shostakovich-full-validation.json').write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps(report, indent=2))
