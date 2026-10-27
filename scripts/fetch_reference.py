"""Cache the official Henle preview needed for the local Chopin comparison."""
from pathlib import Path
import hashlib, json, urllib.request
root = Path(__file__).resolve().parents[1]
url = json.loads((root/'references/sources.json').read_text())['Henle Nocturnes HN185']['previews']['9']
path = root/'references/henle-nocturnes-09.jpg'
if not path.exists():
    partial = path.with_suffix('.jpg.partial')
    urllib.request.urlretrieve(url, partial)
    partial.replace(path)
print(f'{path.name}: sha256={hashlib.sha256(path.read_bytes()).hexdigest()}')
