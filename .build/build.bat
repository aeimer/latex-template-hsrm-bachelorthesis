@echo off
REM Buildsctipt
REM by Alexander Eimer
REM from Github/aeimer

echo
echo Working in:
echo %cd%
echo.
echo Start Compile
echo.
echo.
call:compileLatex
call:compileBibtex
call:compileLatex
call:compileBibtex
call:compileLatex
call:compileLatex
echo.
echo.
echo DONE
echo BYE

:compileLatex
echo "Compile with PDF-LaTeX"
REM need to use the name, because with a wildcard 'pdflatex *.tex' does not find any file
pdflatex bachelorthesis.tex
goto:eof

:compileBibtex
echo "Compile with BibTeX"
bibtex
goto:eof