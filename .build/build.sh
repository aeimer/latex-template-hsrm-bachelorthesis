#!/bin/bash

# Build the Latex
# by Alexander Eimer
# from Github/aeimer

# Check if USE_BIBTEX is set or set default to true
if [ -z "$USE_BIBTEX" ] ; then
	USE_BIBTEX="true"
	if [ $# -eq 1 ] ; then
		if [ "$1" == "nobib" ] ; then
			USE_BIBTEX="false"
		fi
	fi
fi

echo "Buildscript"
echo
echo "will use bibtex? $USE_BIBTEX"
echo

# Check PDF Latex
echo -n "Check if PDF-LaTeX is installed: "
pdflatex --version
exitcode=$?
if [ $exitcode -ne 0 ] ; then exit $exitcode ; fi

# Check Bibtex
echo -n "Check if BibTeX is installed: "
bibtex --version
exitcode=$?
if [ $exitcode -ne 0 -a $USE_BIBTEX == "true" ] ; then exit $exitcode ; fi
echo

# Compile start
echo "Starting to compile..."
if [ ${PWD##*/} == ".build" ] ; then
	echo
	echo "Changing to the projectroot"
	cd ..
	echo "Now working in:"
	pwd
	echo
fi

function compilePDFLatex {
	echo "Compile with PDF-LaTeX"
	pdflatex *.tex
	exitcode=$?
	if [ $exitcode -ne 0 ] ; then echo "HERE WAS THE ERROR"; exit $exitcode ; fi
}

function compileBibtex {
	echo "Compile with BibTeX"
	bibtex *.aux
	exitcode=$?
	if [ $exitcode -ne 0 ] ; then echo "HERE WAS THE ERROR"; exit $exitcode ; fi
}

compilePDFLatex
echo
if [ "$USE_BIBTEX" == "true" ] ; then compileBibtex ; fi
echo
compilePDFLatex
echo
if [ "$USE_BIBTEX" == "true" ] ; then compileBibtex ; fi
echo
compilePDFLatex
echo
compilePDFLatex
echo
echo 
if [ $# -eq 1 -a "$1" == "ci" ] ; then
	echo "++ Copy all PDFs to processed_pdfs ++"
	cp *.pdf $DESTINATIONFOLDER
	echo
fi
echo "DONE"
echo "BYE"
