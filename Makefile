SOURCE = source
JB = jupyter-book

.PHONY: help html serve linkcheck clean-html clean-all

help:
	@echo "serve      - Preview the website locally"
	@echo "html       - Build the website (executes code cells)"
	@echo "linkcheck  - Check external links and report broken ones"
	@echo "clean-html - Remove the built HTML"
	@echo "clean-all  - Remove all build artifacts"

serve:
	cd $(SOURCE) && $(JB) start --execute

html:
	cd $(SOURCE) && $(JB) build --html --strict --execute

linkcheck:
	cd $(SOURCE) && $(JB) build --html --check-links

clean-html:
	cd $(SOURCE) && $(JB) clean --html -y

clean-all:
	cd $(SOURCE) && $(JB) clean --all -y
