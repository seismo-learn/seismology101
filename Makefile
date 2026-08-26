.PHONY: help html serve linkcheck clean-html clean-all

help:
	@echo "html       - Build the website (executes code cells)"
	@echo "serve      - Preview the website locally"
	@echo "linkcheck  - Check external links and report broken ones"
	@echo "clean-html - Remove the built HTML"
	@echo "clean-all  - Remove all build artifacts"

html:
	cd source && jupyter-book build --html --strict --execute

serve:
	cd source && jupyter-book start --execute

linkcheck:
	cd source && jupyter-book build --html --check-links

clean-html:
	cd source && jupyter-book clean --html -y

clean-all:
	cd source && jupyter-book clean --all -y
