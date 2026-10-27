# 001 - Initial engine comparison

27 October 2026. Original lyrical and dense piano fixtures, comparing A: LilyPond default; B: LilyPond classical; C: MuseScore/Leland; D: Verovio/Leipzig.

[Full original notes](NOTES.txt) · [Comparison PDF](../../output/pdf/engraving-comparison.pdf)

Canonical inputs: `scores/lyrical.musicxml`, `scores/dense.musicxml`. `build.py fixtures()` is their generator, but normal builds preserve existing inputs. Use `--regenerate-fixtures` only intentionally. B-only exact patches live in `overrides/*.json`; shared local LilyPond settings in `overrides/*.ily`.

Finding: LilyPond has sufficient controls to continue experimenting; its default look was not evidence of an engine limitation. The screen varied multiple settings simultaneously, so it does not establish which individual change caused improvement. Fixed system breaks and short fixtures do not evaluate page turns or long-form pagination.

Build: `./rebuild.sh`. See the shared setup guide first.
