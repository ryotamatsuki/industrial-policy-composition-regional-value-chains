PYTHON ?= python3

.PHONY: all verify test outputs jrs-supplement paper clean

all: verify test outputs jrs-supplement paper

verify:
	$(PYTHON) scripts/verify_symbolic.py

test:
	$(PYTHON) -m pytest -q

outputs:
	$(PYTHON) scripts/generate_outputs.py

jrs-supplement:
	cd submission/jrs/supporting_information && $(PYTHON) verify_symbolic.py
	cd submission/jrs/supporting_information && $(PYTHON) -m pytest -q
	cd submission/jrs/supporting_information && $(PYTHON) generate_outputs.py

paper: outputs
	mkdir -p paper/build
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null
	cd paper && bibtex build/main >/dev/null
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null
	cd paper && pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex >/dev/null
	! grep -Eq "Citation .* undefined|Reference .* undefined|There were undefined references|There were undefined citations" paper/build/main.log

clean:
	rm -rf paper/build .pytest_cache */__pycache__ */*/__pycache__ submission/jrs/supporting_information/.pytest_cache submission/jrs/supporting_information/*/__pycache__
	rm -rf submission/jrs/supporting_information/figures submission/jrs/supporting_information/tables submission/jrs/supporting_information/results
	rm -f tables/thresholds.tex figures/phase_regions.tex figures/phase_regions.svg results/generated_manifest.json
