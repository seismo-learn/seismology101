.PHONY: html clean

html:
	jupyter-book build --html --strict --execute

clean:
	jupyter-book clean --html -y
