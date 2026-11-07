"""Check the stated hand division against the previous combined-voice inventory.
Not a movement simulator: neighbouring-event review is documented separately.
"""
from pathlib import Path
import re,json,hashlib
R=Path(__file__).resolve().parents[2]
source=R/'scores/guarnieri-ponteio-15-fingered.ly'
s=source.read_text();fig=s.split('figuration = {',1)[1].split('bassLine = {',1)[0]
old=json.loads((R/'experiments/010-guarnieri-fingering-research/span-audit.json').read_text())
changes=[];bybar={}
for m,body in re.findall(r'% Measure (\d+)\s*\n(.*?)(?=% Measure|\Z)',fig,re.S):
 events=[]
 for c in re.finditer(r'<[^>]+>',body):
  before=body[:c.start()]
  if before.rfind('\\down')<before.rfind('\\up'):continue
  labels=[]
  for f in re.findall(r'-(?:\\tweak color #black )?-?([1-5])|\\right(One|Two|Three)',c[0]):
   labels.append(('LH',int(f[0])) if f[0] else ('RH',dict(One=1,Two=2,Three=3)[f[1]]))
  events.append((c[0],labels))
 bybar[int(m)]=events
counts={};out=[];roll_bars={32,33,34,35,51,52}
for row in old['events']:
 bar=row['measure'];j=counts.get(bar,0);counts[bar]=j+1
 chord,labels=bybar[bar][j];assert len(labels)==len(row['upper'])
 bass=[dict(n,hand='LH') for n in row['bass']]
 if bar==30 and row['eighth_position'] in ('1','4'):
  for n in bass:
   if n['note']=='G3':n['finger']=4
 upper=[dict(n,hand=h,finger=f) for n,(h,f) in zip(row['upper'],labels)]
 lh=[n for n in upper if n['hand']=='LH']+(bass if bar not in roll_bars else [])
 # One physical key can appear in both notated voices.
 unique={n['pitch']:n for n in lh}
 for n in lh:assert unique[n['pitch']]['finger']==n['finger'],(bar,n)
 lh=sorted(unique.values(),key=lambda n:n['pitch'])
 assert len({n['finger'] for n in lh})==len(lh),(bar,lh)
 assert all(a['finger']>b['finger'] for a,b in zip(lh,lh[1:])),(bar,lh)
 assert lh[-1]['pitch']-lh[0]['pitch']<=14,(bar,lh)
 gaps=[b['pitch']-a['pitch'] for a in lh for b in lh if a['finger']==5 and b['finger']==4]
 assert all(0<g<=3 for g in gaps),(bar,gaps)
 out.append(dict(measure=bar,eighth_position=row['eighth_position'],upper=upper,bass=bass,pedal_release=bar in roll_bars,lh_span_semitones=lh[-1]['pitch']-lh[0]['pitch'],rh_takeover=[n for n in upper if n['hand']=='RH']))
assert len(out)==156
result=dict(source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),events_reviewed=156,rh_takeover_events=sum(bool(x['rh_takeover']) for x in out),pedal_realization_bars=sorted(roll_bars),checks=['Under the stated pedal realization, no distinct held LH keys share a finger; duplicated same-pitch voices agree.','Conventional descending LH finger order; no represented LH span exceeds 14 semitones.','No represented LH 5-4 span exceeds three semitones.'],limits='Keyboard geometry, all other finger-pair comfort, transition speed and pedal sound require a pianist trial. Baseline pitches come from the preserved 010 inventory; MIDI equality separately checks the current score.',events=out)
(Path(__file__).parent/'realization-check.json').write_text(json.dumps(result,indent=2)+'\n')
print({k:v for k,v in result.items() if k!='events'})
