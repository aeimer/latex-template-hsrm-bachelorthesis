#!/bin/bash

# Build the Latex
# by Alexander Eimer
# from Github/aeimer

echo "Buildscript"
echo
echo -n "Check if PDF-LaTeX is installed: "
# TODO
echo -n "Check if BibTeX is installed: "
# TODO
echo
echo "Starting to compile..."
echo "Changing to the projectroot"
cd ..
echo "Now working in:"
pwd
echo

function compilePDFLatex() {
	echo "Compile with PDF-LaTeX"
	pdflatex *.tex
}

function compileBibtex() {
	echo "Compile with BibTeX"
	bibtex
}

compilePDFLatex
echo
compileBibtex
echo
compilePDFLatex
echo
compileBibtex
echo
compilePDFLatex
echo
compilePDFLatex
echo
echo
echo "DONE"
echo "BYE"
