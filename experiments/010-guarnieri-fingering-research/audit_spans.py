"""Score-specific diagnostic, not a fingering solver or general LilyPond parser.

Combine each LH figuration attack with its notated bass. A held note is
counted as physically held: flags require human review of release/pedal choices.
Absolute English pitch syntax and explicit durations are required here.
"""
from pathlib import Path
from fractions import Fraction
import re, json, hashlib
ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'scores/guarnieri-ponteio-15-fingered.ly'
NOTE = r"[a-g](?:isis|eses|is|es|s)?[',]*[!?]?"
EVENT = re.compile(r'<[^>]+>\d+\.*|(?<![\w\\])(?:'+NOTE+r'|s)\d+\.*')
PITCH = re.compile(r'^([a-g])(isis|eses|is|es|s)?([\x27,]*)([!?]?)$')
MEMBER = re.compile(r'(?<![\w])('+NOTE+r')-(?:\\tweak color #black )?-([1-5])|(?<![\w])('+NOTE+r')-([1-5])')

def pitch(n):
    m=PITCH.fullmatch(n); assert m,n
    step,acc,octaves,_=m.groups()
    midi=48+dict(c=0,d=2,e=4,f=5,g=7,a=9,b=11)[step]+{'':0,'is':1,'isis':2,'es':-1,'eses':-2,'s':-1}[acc or '']+12*(octaves.count("'")-octaves.count(','))
    label=step.upper()+{'':'','is':'#','isis':'##','es':'b','eses':'bb','s':'b'}[acc or '']+str(3+octaves.count("'")-octaves.count(','))
    return midi,label

def blocks(text):
    return {int(m):v for m,v in re.findall(r'% Measure (\d+)\s*\n(.*?)(?=% Measure|\Z)',text,re.S)}

def events(text,figuration=False):
    out=[]; pos=Fraction(0)
    matches=list(EVENT.finditer(text))
    for i,m in enumerate(matches):
        token=m.group(); d=re.search(r'(\d+)(\.*)$',token)
        duration=Fraction(8,int(d[1]))*sum((Fraction(1,2**j) for j in range(len(d[2])+1)),Fraction(0))
        if token.startswith('<'):
            members=[]
            for a,b,c,e in MEMBER.findall(token):
                name,finger=(a,b) if a else (c,e)
                number,label=pitch(name);members.append(dict(pitch=number,note=label,finger=int(finger)))
            clean=re.sub(r'\\tweak color #black ', '', token[1:token.index('>')])
            assert len(members)==len(clean.split()),token
        elif token.startswith('s'):members=[]
        else:
            name=token[:d.start()];number,label=pitch(name)
            tail=text[m.end():matches[i+1].start() if i+1<len(matches) else len(text)]
            fm=re.match(r'-(?:\\tweak color #black )?-?([1-5])',tail)
            assert fm,(token,tail)
            members=[dict(pitch=number,note=label,finger=int(fm[1]))]
        prior=text[:m.start()]
        hand='LH' if not figuration or prior.rfind('\\down')>prior.rfind('\\up') else 'RH'
        out.append(dict(onset=pos,duration=duration,hand=hand,notes=members))
        pos+=duration
    return out,pos

def main():
    text=SOURCE.read_text();fig=text.split('figuration = {',1)[1].split('bassLine = {',1)[0]
    bass=text.split('bassLine = {',1)[1].split('expression = {',1)[0]
    fb,bb=blocks(fig),blocks(bass);rows=[]
    assert set(fb)==set(bb)==set(range(1,54))
    for bar in range(1,54):
        fs,ft=events(fb[bar],True);bs,bt=events(bb[bar]);assert ft==bt,(bar,ft,bt)
        for e in fs:
            if e['hand']!='LH':continue
            active=[n for b in bs if b['onset']<=e['onset']<b['onset']+b['duration'] for n in b['notes']]
            combined=sorted(active+e['notes'],key=lambda n:n['pitch'])
            pairs=[abs(a['pitch']-b['pitch']) for a in combined for b in combined if a['finger']==5 and b['finger']==4 and a['pitch']!=b['pitch']]
            flags=[]
            if any(x>=4 for x in pairs):flags.append('5-4 span at least major third')
            if len({n['finger'] for n in combined})<len({n['pitch'] for n in combined}):flags.append('same finger assigned to distinct sounding pitches')
            span=combined[-1]['pitch']-combined[0]['pitch']
            if span>14:flags.append('combined span exceeds major ninth')
            if any(a['finger']<=b['finger'] for a,b in zip(combined,combined[1:]) if a['pitch']<b['pitch']):flags.append('non-descending LH finger order')
            rows.append(dict(measure=bar,eighth_position=str(e['onset']+1),bass=active,upper=e['notes'],combined_span_semitones=span,spans_5_4=pairs,flags=flags))
    assert rows[0]['spans_5_4']==[4]
    assert [n['pitch'] for n in rows[0]['bass']+rows[0]['upper']]==[53,57,59,64]
    assert all(not r['bass'] for r in rows if r['measure'] in (21,22))
    assert any('non-descending LH finger order' in r['flags'] for r in rows if r['measure']==30 and r['eighth_position']=='4')
    final,_=events(bb[53]); assert [n['pitch'] for n in final[0]['notes']]==[72,74,79,81]
    result=dict(source=str(SOURCE.relative_to(ROOT)),source_sha256=hashlib.sha256(SOURCE.read_bytes()).hexdigest(),assumptions=['All notated bass duration is treated as finger-held for screening, including ties. A pedal release can resolve some flags but is not encoded here.','Major ninth (14 semitones) is a screening reference, not a measured hand limit.','5-4 >= 4 semitones is a project review trigger, not a universal physiological cutoff.','No RH ergonomic audit, keyboard-depth geometry, transitions, or automatic reassignment.'],lh_attacks=len(rows),flagged_attacks=sum(bool(r['flags']) for r in rows),events=rows)
    (Path(__file__).parent/'span-audit.json').write_text(json.dumps(result,indent=2)+'\n')
    print('LH attacks',len(rows),'flagged',result['flagged_attacks'])
    for r in rows:
        if r['flags']:
            print(r['measure'],r['eighth_position'],' '.join(f"{n['note']}:{n['finger']}" for n in sorted(r['bass']+r['upper'],key=lambda n:n['pitch'])),r['flags'])
if __name__=='__main__':main()
