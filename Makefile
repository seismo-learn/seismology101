.PHONY: html clean-html clean-all

html:
	jupyter-book build --html --strict --execute

clean-html:
	jupyter-book clean --html -y

clean-all:
	jupyter-book clean --all -y