.PHONY: html serve clean-html clean-all

html:
	jupyter-book build --html --strict --execute

serve:
	jupyter-book start

clean-html:
	jupyter-book clean --html -y

clean-all:
	jupyter-book clean --all -y