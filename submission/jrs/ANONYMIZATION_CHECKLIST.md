# JRS double-blind anonymization checklist

JRS operates double-blind peer review. The journal also notes that public preprints can compromise anonymity. This project has a public development repository, so the submission package must avoid linking reviewers to author-identifying repository metadata.

## Blinded manuscript

- [x] `paper/main.tex` contains no author name or affiliation.
- [x] Acknowledgments are not in the blinded manuscript.
- [x] The public GitHub repository URL is not included in the blinded manuscript.
- [x] Data availability is worded around anonymous supporting information rather than a public author-owned URL.
- [x] AI disclosure contains no author-identifying affiliation or personal metadata.
- [ ] Final PDF metadata must be checked for author names before upload.
- [ ] TeX/PDF file properties and comments must be checked for identifying metadata.
- [ ] Any self-citations, if added later, must be written in the third person like ordinary citations.

## Separate title page

- [ ] Full author name(s).
- [ ] Affiliation(s).
- [ ] Email address(es).
- [ ] ORCID(s) — required by JRS.
- [ ] Running title under 40 characters.
- [ ] Acknowledgments.
- [ ] Funding statement.
- [ ] Conflict-of-interest statement.
- [ ] Any other author-specific ethics/integrity declaration required by the live submission system.

## Reproducibility materials

For peer review, upload the files in `supporting_information/` directly as supporting files. Do not give reviewers the public GitHub URL during double-blind review.

### Public-repository risk

Even if the blinded files contain no author name, a reviewer who searches the exact paper title may discover the public repository and infer authorship. Before Stage 14 submission, choose one of the following operational mitigations:

1. **Preferred for strict anonymity:** temporarily make the development repository private during peer review, if feasible; or
2. keep the repository public but accept the anonymity risk explicitly, consistent with JRS's warning that public preprints can compromise double-blind anonymity.

This is an anonymity/operations issue, not a theory or manuscript-content defect.
