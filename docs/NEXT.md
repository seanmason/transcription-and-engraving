# Next experiments

Suggested priority order; these are proposed work, not completed capabilities.

1. **Independent musical proofreading of Shostakovich.** Review one hand and one layer at a time, with measure-level discrepancy records. Add a separately checked pitch/rhythm event inventory; current assertions prove duration consistency, not transcription correctness.
2. **Controlled spacing/slur study.** Freeze the Chopin notes and accepted fonts, then vary horizontal spacing and long-slur shape separately. Compare fixed staff-size crops against the reference and retain each source revision.
3. **Stress fixtures.** Cross-staff beams, grace notes, close accidental collisions, dense polyphony, long pedal/ottava spans, and fingering substitutions. Check each engine's import fidelity before comparing aesthetics.
4. **Pagination and printing.** Native system breaking, page turns, staff size at actual print scale, and alternative A4/Letter layouts. Current 235 x 310 mm pages should not be silently scaled when evaluating type.
5. **Common correction model.** Decide how to represent source uncertainty, pitch corrections, and renderer-specific exceptions before attempting general OMR ingestion. The current fixture serializer is not a general MusicXML normalizer.
6. **Automated scan ingestion.** Evaluate open-source OMR separately from engraving. Preserve original scans and a confidence/correction trail, then feed corrected semantics into the engraving framework.
