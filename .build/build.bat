# Buildsctipt
# by Alexander Eimer
# from Github/aeimer

echo Start Compile
echo.
echo go to project root
cd ..
echo now in:
cd
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
pdflatex *.tex
goto:eof

:compileBibtex
echo "Compile with BibTeX"
bibtex
goto:eof