#!/bin/bash

# Build the Latex
# by Alexander Eimer
# from Github/aeimer

echo
echo "++ CLOC ++"
echo

# Code
echo "Check if PERL is installed"
perl -v > /dev/null
if [ $? -eq 0 ]
  then
    echo "yes we have perl!"
    ls -la
	ls -la chapter
	echo "create cloc-results.txt"
	results_file="cloc-results.txt"
	touch $results_file
    echo "running cloc"
    echo
    echo "CLOC:" | tee --append $results_file
    echo "perl \".build/cloc-1.70.pl\" --exclude-lang=Perl,sh,bash,bat,cmd *"  | tee --append $results_file
    perl ".build/cloc-1.70.pl" --exclude-lang=Perl,sh,bash,bat,cmd * | tee --append $results_file
	echo
	echo "TeXcount:" | tee --append $results_file
	texcount_files="*.tex"
	echo "perl \".build/texcount.pl\" -inc $texcount_files" | tee --append $results_file
	perl ".build/texcount.pl" -inc $texcount_files | tee --append $results_file
  else
    echo "dang... no perl :("
fi
