"""Fetch pinned official portable tools; run from any directory on Linux x86-64."""
from pathlib import Path
import json, subprocess, urllib.request
ROOT = Path(__file__).resolve().parents[1]
tools = ROOT/'.tools'
tools.mkdir(exist_ok=True)
urls = json.loads((ROOT/'references/sources.json').read_text())['downloads']
for name, target in [('lilypond.tar.gz', tools/'lilypond-2.26.0/bin/lilypond'), ('MuseScore.AppImage', tools/'squashfs-root/AppRun')]:
    if target.exists():
        print(f'Already present: {target.relative_to(ROOT)}')
        continue
    archive = tools/name
    if not archive.exists():
        partial = archive.with_suffix(archive.suffix+'.partial')
        urllib.request.urlretrieve(urls[name], partial)
        partial.replace(archive)
    if name.endswith('.tar.gz'):
        subprocess.run(['tar', '-xzf', archive, '-C', tools], check=True)
    else:
        archive.chmod(0o755)
        subprocess.run([archive, '--appimage-extract'], cwd=tools, check=True, stdout=subprocess.DEVNULL)
    if not target.exists():
        raise RuntimeError(f'Expected executable missing: {target}')
