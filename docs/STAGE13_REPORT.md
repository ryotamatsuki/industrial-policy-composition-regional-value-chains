# Stage 13 — Full-Paper Integration for Journal of Regional Science

## Executive integration verdict

`INTEGRATED MANUSCRIPT READY FOR SUBMISSION QA`

Primary journal: **Journal of Regional Science (JRS)**  
Canonical theory freeze: `IPCRVC-THEORY-FREEZE-2026-09-07-v1`  
Stage 12 verdict: `PRIMARY JOURNAL SELECTED — GO TO INTEGRATION`  
Stage 13 branch: `stage13-jrs-integration`

No theory, payoff, strategy set, equilibrium concept, planner feasible set, theorem statement, threshold, or certified robustness domain was changed. Stage 13 changed exposition, journal-facing metadata, declarations, reproducibility packaging, figure/table signposting, and one stale robustness heading.

---

## 1. JRS live-rule audit

Current JRS Author Guidelines were rechecked on 2026-09-07 at:

- https://onlinelibrary.wiley.com/page/journal/14679787/homepage/forauthors.html

The integration uses the following current requirements:

- initial **Free Format Submission**;
- **double-blind** peer review;
- separate title page with author details;
- **ORCID required**;
- abstract no more than **250 words**;
- exactly **seven keywords**;
- title page includes a running title of less than 40 characters;
- a **data availability statement is required**;
- JRS mandates data sharing and peer reviews shared data;
- figures may be embedded in the initial manuscript for readability; supporting information is supplied separately;
- JRS uses APA style, but Free Format Submission permits an initially consistent reference format.

Wiley's live AI guidance was checked at:

- https://authorservices.wiley.com/ethics-guidelines/

Material AI use in manuscript development must be disclosed transparently and in detail; AI tools cannot be authors; the human author remains accountable. This project used AI beyond spelling/grammar and therefore includes a substantive disclosure.

---

## 2. Section-role audit

### Abstract

Rewritten to a compact JRS-facing version of approximately 167 words. It states the question, full-equilibrium/planner comparison, two thresholds, positive-measure unique-duplication interval, mechanism, and certified robustness boundary. It does not claim generic novelty for spillovers, fixed budgets, or policy composition.

**State:** PASS.

### Introduction

The Introduction already passed the Stage-11 novelty recalibration. It begins with the composition question before mathematical machinery, states the exact threshold result, explicitly concedes classic fiscal-spillover and fixed-budget/composition prior art, identifies fixed capacity as maintained rather than derived, and limits the policy message.

**State:** PASS; no substantive rewrite required in Stage 13.

### Related Literature

The literature section is organized into conceptual families rather than a paper-by-paper catalogue:

1. fiscal federalism / local-public-good spillovers;
2. strategic multi-jurisdiction industrial policy;
3. fixed-budget allocation and expenditure composition;
4. place-based policy and smart specialization.

It explicitly states the killed novelty claims and isolates the surviving strategic configuration result.

**State:** PASS.

### Model / Equilibrium / Welfare

Assumptions and proposition scopes match the freeze and proof files. The baseline remains a two-region continuous portfolio game. No FOC/local-equilibrium shortcut is introduced. The planner remains a coordinated fixed-capacity benchmark, not a first best.

Stage 13 added explicit prose references to the regime figure and threshold table so both required Stage-10 exposition vehicles are introduced and interpreted in surrounding text.

**State:** PASS.

### Mechanism and Robustness

One stale heading remained from an earlier generality formulation: `A general switching representation`. The certified theorem is binary/configuration-specific, so Stage 13 corrected the heading to `A binary switching representation`. The proposition itself was already correctly scoped and was not changed.

CRS/CES and alternative-matching exercises retain their restricted-scope language. No arbitrary-function or arbitrary-matching claim is introduced.

**State:** PASS after bounded wording repair.

### Institutional Interpretation

Functions as the Discussion section: it maps fixed priority capacity, cross-regional complementarity, and local-return incentives to smart specialization, I3/value chains, OECD place-based industrial policy, and Tian-Wang-Zhang evidence. It explicitly states that these examples motivate rather than estimate the model.

**State:** PASS.

### Conclusion

Short, answers the question, repeats the certified threshold/configuration result, identifies robustness limits, and stops short of centralization or transfer-design claims.

**State:** PASS.

---

## 3. Contribution-claim audit

### Maximum defensible headline

When multiple regional governments allocate fixed policy portfolios across complementary activities, incomplete jurisdictional capture can generate a positive-measure interval in which complete priority duplication is the unique decentralized Nash outcome even though coordinated reallocation of the same total capacity is welfare improving.

### Explicitly not claimed

- interjurisdictional spillovers are new;
- incomplete internalization is new;
- fixed budgets are new;
- policy composition is new;
- coordination always causes complete specialization;
- centralization is optimal;
- the planner is a first best;
- the result holds for arbitrary matching/production functions or arbitrary numbers of regions/sectors.

**State:** PASS against Stage 6, Stage 8, Stage 11, and Stage 12 records.

---

## 4. Results / Discussion separation

The formal Results sections contain equilibrium, planner, welfare, and restricted robustness objects. Institutional Interpretation discusses policy analogues and limitations without adding a new theorem or policy-design result. The Conclusion does not introduce a new instrument or institutional prescription.

**State:** PASS.

---

## 5. Abstract / Introduction / Conclusion alignment

All three now carry the same core chain:

1. fixed industrial-policy composition;
2. cross-regional complementary value with incomplete local capture;
3. coordinated threshold below decentralized threshold;
4. positive-measure unique duplication interval;
5. coordination can improve composition without increasing total capacity;
6. complete specialization and centralization are not general conclusions.

**State:** PASS.

---

## 6. Figure/Table Architecture reconciliation

Stage-10 architecture required only:

- one symbolic regime figure; and
- one exact threshold/scope table.

Both remain generator-derived and unchanged in substance.

Stage 13 repaired the integration gap:

- `paper/sections/equilibrium.tex` now explicitly introduces and interprets Figure `phase-regions`;
- `paper/sections/welfare.tex` now explicitly introduces and interprets Table `thresholds`.

No new decorative visual or numerical experiment was added.

JRS initial submission guidance allows figures within the main document and encourages this for readability. Separate/high-resolution files can be handled at revision or Stage 14 as required.

**State:** PASS.

---

## 7. JRS journal-facing manuscript integration

### Title

Retained: **Industrial Policy Composition and Regional Value Chains**.

It is short, informative, contains major keywords, and avoids abbreviations.

### Running title

**Industrial Policy Portfolios** — under the JRS 40-character limit.

### Keywords

Exactly seven keywords were added to the blinded manuscript:

1. industrial policy;
2. regional policy;
3. policy composition;
4. regional value chains;
5. interjurisdictional spillovers;
6. fiscal federalism;
7. place-based policy.

JEL codes H77, L52, and R58 are included as optional economics metadata.

### Double-blind manuscript

`paper/main.tex` remains authorless. A separate `submission/jrs/title_page_TEMPLATE.tex` contains placeholders for author-specific information.

**State:** PASS, subject to Stage-14 metadata completion.

---

## 8. Data/reproducibility integration

JRS requires a data availability statement and mandates data sharing. The paper uses no empirical data, so the anonymous manuscript now states:

> This study uses no empirical data. Code supporting the analytical and reproducibility checks is provided as anonymous supporting information for peer review. A public version of the reproducibility materials will be cited in the final accepted article.

An anonymous reviewer-facing supplement was created at `submission/jrs/supporting_information/` containing:

- baseline model code;
- exact symbolic verification;
- headline/boundary regression tests;
- permanent scope-counterexample tests;
- pinned Python dependencies;
- an anonymous README.

The public GitHub URL is deliberately absent from the blinded manuscript and supplement.

**State:** PASS for integration; execution is CI-gated before merge.

---

## 9. AI disclosure integration

Because AI assistance was substantive, Stage 13 does not rely on the spelling/grammar exception. The proposed disclosure is included in the anonymous manuscript and separate title-page template:

> OpenAI ChatGPT was used as an AI-assisted tool for literature discovery, algebraic and code cross-checking, and manuscript drafting and editing. AI-generated outputs were not treated as evidence: cited sources were checked against source materials, and mathematical claims were checked against the frozen theory record, symbolic verification, and regression tests. The author retains full responsibility for the final content.

`submission/jrs/AI_USE_DISCLOSURE.md` records the Wiley policy and requires author confirmation before Stage 14 closes.

**State:** PASS for integration; final author confirmation remains operational.

---

## 10. Anonymity audit

The reviewer-facing manuscript/supplement contain no intentional author names, affiliations, or public repository URL. However, the development repository is public and contains the manuscript title. JRS explicitly warns that public preprints can compromise anonymity; a public title-searchable repository creates a comparable practical risk.

Stage 14 must choose one operational mitigation:

1. preferred: make the development repository private during peer review if feasible; or
2. accept the residual anonymity risk explicitly and submit the anonymous supplement without linking the repository.

This does not reopen theory or Stage 13 content integration.

---

## 11. Notation / citation / cross-reference audit

- Baseline notation remains `x_i`, `A`, `Delta`, `alpha`, `A^P`, `A^N`, `q`.
- General switching notation remains `G`, `lambda`, and is explicitly binary-scope.
- No first-best terminology is introduced.
- Figure/table objects still derive from `scripts/generate_outputs.py`.
- JRS Free Format means no forced APA conversion is required at first submission; the existing consistent author-year style is retained.
- CI continues to fail on unresolved LaTeX citations/references.

**State:** PASS subject to final CI.

---

## 12. Changes made in Stage 13

1. Tightened the abstract for JRS and kept it below 250 words.
2. Added exactly seven keywords and optional JEL classifications.
3. Added anonymous Data Availability and AI-use declarations.
4. Added explicit text references to the required regime figure and threshold table.
5. Corrected one stale robustness heading from `general` to `binary` switching representation.
6. Created a separate JRS title-page template.
7. Created JRS metadata and cover-letter drafts.
8. Created a detailed AI-use disclosure record.
9. Created a double-blind anonymization checklist.
10. Created an anonymous reviewer-facing reproducibility supplement.
11. Added the anonymous supplement to `make all` and JRS package paths to manuscript CI.

No theory change occurred.

---

## 13. Remaining blockers / Stage-14 operational items

No substantive manuscript blocker remains. The following items require author/account/live-system information and therefore belong in Stage 14:

- full author name(s);
- affiliation(s);
- email address(es);
- ORCID(s), required by JRS;
- funding declaration;
- conflict-of-interest declaration;
- acknowledgments if any;
- live confirmation of exclusive submission and preprint status;
- confirmation that the AI disclosure accurately describes actual use and author oversight;
- final decision on public-repository visibility during double-blind review;
- final PDF metadata/anonymity inspection;
- live Wiley submission-system fields and any current file-upload constraints.

---

## 14. Stage-13 verdict

`INTEGRATED MANUSCRIPT READY FOR SUBMISSION QA`

## Stage-14 contract

Stage 14 should verify the actual JRS submission package and live system. It may fill author metadata, confirm declarations, package/upload anonymous code, adjust Free Format file presentation, and repair submission-format defects. It may not enlarge novelty claims, add mechanisms, alter theorem scope, or change `IPCRVC-THEORY-FREEZE-2026-09-07-v1` without reopening the relevant earlier stages.
