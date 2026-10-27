# Working workflow

1. Start a numbered experiment using `experiments/_template/README.md`. Identify the question and the exact master input. Record source provenance and hashes.
2. Transcribe or import, then validate pitches, rhythms, voices, clefs, accidentals, ties and rests before aesthetic tuning. Record ambiguous readings by measure and hand.
3. Save a reproducible source/style revision. Render controlled alternatives, preferably changing one variable at a time. Compare at the same staff size; do not stretch one rendering to fit the other.
4. Inspect the entire rendered pages and enlarged problem passages. Check fingerings, beams, slurs, accidental spacing, text hierarchy, collisions, system density and turns. Repeat inspect/scrutinize/revise, recording corrections.
5. Run structural checks appropriate to that source. Preserve the results, but state what they cannot prove. MIDI counts and pitch multisets do not validate note order, articulation or optical placement.
6. Keep current deliverables in `output/`; retain selected historical evidence under the experiment. For new trials, commit the corresponding source and styles before moving on, so historical proofs can actually be rebuilt.
7. Record the user's preference without turning it into an unsupported objective quality claim. Update the index and decisions. Commit coherent milestones.

## File ownership

- Shared geometry and type settings: `styles/`, `fonts/`.
- Initial fixture masters: `scores/lyrical.musicxml`, `scores/dense.musicxml` (normal builds preserve them).
- Chopin musical master: `chopin_study.py` (recreates exported MusicXML/native files).
- Full Shostakovich master: `scores/shostakovich-op34-no16-new.ly`.
- Native GUI refinements: copy to `manual/` and document that copy as a master before editing. Re-importing MusicXML may erase positions.
- Score-specific generated-LilyPond edits: persistent `overrides/` patches where supported; do not rely on edits to overwritten exports.

Raw scans, full reference previews, runtimes and disposable proofs stay local. `references/manifest.json` records hashes; `references/sources.json` supplies official preview URLs. Curated comparison PDFs include credited short excerpts. Preserve upstream font license notices whenever redistributing fonts or recipes.
