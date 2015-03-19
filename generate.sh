#!/bin/bash

SED=sed
INTER=labels.tex
TEMPLATE=template
TEX=pdflatex
EXT=pdf
MV=mv
CAT=cat
CUT="cut -d;"
CP=cp
DEST_PATH=out

#DEST_PATH=files.farka.eu:/home/fari/pub/lucka
. .config

if [ $# -eq 0 ]; then
	echo "Provide a filename to process ..."
	exit 1
fi

for FILE in $@ 
do
	echo Processing file $FILE
	$CAT $FILE | $CUT -f1,2,3,4,6,8,9,10,11,12 \
		| $SED 's/;/}{/g;s/^/\\mylabel{/;s/$/}/' > $INTER 
	$TEX $TEMPLATE
	OUT=`basename $FILE .csv`".$EXT"
	$MV ${TEMPLATE}.$EXT $OUT
	$CP $OUT $DEST_PATH
done
