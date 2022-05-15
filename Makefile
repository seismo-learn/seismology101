SOURCEDIR	= source
OUTPUTDIR 	= .

html dirhtml:
	jupyter-book build ${SOURCEDIR} --path-output ${OUTPUTDIR} --builder $@

clean:
	rm -rf ${OUTPUTDIR}/_build/
