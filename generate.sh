#!/bin/sh

SED=sed
INTER=labels.tex

if [ $# -eq 0 ]; then
	echo "Provide a filename to process ..."
	exit 1
fi

for FILE in $@ 
do
	OUT=`basename $FILE .csv`".tex"
	echo Processing file $FILE
	$SED 's/;/}{/g;s/^/\\mylabel{/;s/$/}/' $FILE  > $INTER


done
