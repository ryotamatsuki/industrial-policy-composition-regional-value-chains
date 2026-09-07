PYTHON ?= python3

.PHONY: all verify test outputs paper clean

all: verify test outputs paper

verify:
	$(PYTHON) scripts/verify_symbolic.py

test:
	$(PYTHON) -m pytest -q

outputs:
	$(PYTHON) scripts/generate_outputs.py

paper: outputs
	mkdir -p paper/build
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null
	cd paper && bibtex build/main >/dev/null
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null
	! grep -Eq "Citation .* undefined|Reference .* undefined|There were undefined references|There were undefined citations" paper/build/main.log

clean:
	rm -rf paper/build .pytest_cache */__pycache__ */*/__pycache__
	rm -f tables/thresholds.tex figures/phase_regions.tex figures/phase_regions.svg results/generated_manifest.json
