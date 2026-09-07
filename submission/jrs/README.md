# Journal of Regional Science submission package

Target journal: **Journal of Regional Science (JRS)**

Canonical theory freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`.

This directory contains presentation and submission materials only. Nothing here may alter the frozen model, theorem statements, thresholds, or claim scope.

## JRS live requirements checked at Stage 13

- Free Format Submission for initial review.
- Double-blind peer review: author-identifying material belongs on a separate title page.
- Abstract: no more than 250 words.
- Seven keywords.
- ORCID required.
- Data availability statement required; JRS mandates data sharing and peer reviews shared data.
- Figures may be embedded in the initial manuscript for readability; supporting information should be supplied separately.
- APA reference style is the journal style, but Free Format Submission permits a consistent initial reference style.
- Wiley requires transparent disclosure when generative AI materially assisted manuscript development; AI tools cannot be authors and the human author remains responsible for the work.

## Package files

- `metadata.md` — title, running title, abstract, keywords, JEL codes, and submission fields.
- `title_page_TEMPLATE.tex` — separate, non-blinded title page template. Author-specific fields remain placeholders until Stage 14.
- `cover_letter_DRAFT.md` — journal-specific cover letter draft with only declarations that can safely be made before authenticated submission.
- `AI_USE_DISCLOSURE.md` — proposed detailed AI disclosure and author-confirmation checklist.
- `ANONYMIZATION_CHECKLIST.md` — double-blind audit, including the public-repository risk.
- `supporting_information/` — anonymous reproducibility materials to upload separately for peer review.

## Double-blind rule for reproducibility

Do **not** put the public GitHub URL or repository owner name in the blinded manuscript or reviewer-facing data-availability statement. The code in `supporting_information/` is the reviewer-facing anonymous package. A public repository can be cited in the accepted version after review.
