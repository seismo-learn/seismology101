.PHONY: help html serve linkcheck clean-html clean-all

help:
	@echo "serve      - Preview the website locally"
	@echo "html       - Build the website (executes code cells)"
	@echo "linkcheck  - Check external links and report broken ones"
	@echo "clean-html - Remove the built HTML"
	@echo "clean-all  - Remove all build artifacts"

serve:
	cd source && jupyter-book start --execute

html:
	cd source && jupyter-book build --html --strict --execute

linkcheck:
	cd source && jupyter-book build --html --check-links

clean-html:
	cd source && jupyter-book clean --html -y

clean-all:
	cd source && jupyter-book clean --all -y
