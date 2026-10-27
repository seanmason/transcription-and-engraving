#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
.tools/venv/bin/python build.py "$@"
.tools/venv/bin/python render_previews.py
.tools/venv/bin/python make_comparison.py
if rg -n -i 'warning:|error:' logs/*-lyrical.log logs/*-dense.log; then
  echo 'Review current fixture engraving diagnostics before accepting output.' >&2
  exit 1
fi
