.PHONY: html serve clean-html clean-all

html:
	cd source && jupyter-book build --html --strict --execute

serve:
	cd source && jupyter-book start

clean-html:
	cd source && jupyter-book clean --html -y

clean-all:
	cd source && jupyter-book clean --all -y
