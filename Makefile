SOURCEDIR	= source
OUTPUTDIR 	= .

.PHONY: html dirhtml clean

html dirhtml:
	jupyter-book build ${SOURCEDIR} --path-output ${OUTPUTDIR} --builder $@ -n

clean:
	jupyter-book clean --all ${OUTPUTDIR}
