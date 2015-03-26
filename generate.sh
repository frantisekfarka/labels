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

. .config

if [ $# -le 1 ]; then
	echo "Provide a filename(s) to process ..."
	exit 1
fi

if [ $1 = template ]; then
	echo "Using normal template"
	TEMPLATE=template
else 
	if [ $1 = ethanol ]; then
		TEMPLATE=ethanol
		echo "Using Etanol template"
	else
		echo "Unknow template $1. Die!"
		exit 1
	fi
fi

shift

for FILE in $@ 
do
	echo Processing file $FILE
		#| head -n 20 \
	$CAT $FILE | $CUT -f1,2,3,4,6,8,9,10,11,12 \
		| $SED 's/\&/\\&/g;s/;/}{/g;s/^/\\mylabel{/;s/$/}/' > $INTER 
	$TEX $TEMPLATE
	OUT=`basename $FILE .csv`".$EXT"
	$MV ${TEMPLATE}.$EXT $OUT
	$CP $OUT $DEST_PATH
done
