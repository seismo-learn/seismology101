SOURCEDIR	= source
OUTPUTDIR 	= .

html dirhtml:
	jupyter-book build ${SOURCEDIR} --path-output ${OUTPUTDIR} --builder $@ -n

clean:
	jupyter-book clean --all ${OUTPUTDIR}
