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
DEST_PATH=out/

. .config

if [ $# -le 1 ]; then
	#echo "Provide a filename(s) to process ..."
    
        echo "Usage: $0 template file..."
        echo "Generates labels in a form given the by template from file(s) to $DEST_PATH"
        echo ""
        echo "available templates are:"
        echo "  template"
        echo "  ethanol"
        echo ""
        echo "Examples:"
        echo "  $0 template src/sample.csv"
        echo "  $0 ethanol src/sample.csv"

	exit 1
fi

if [ -f ${1}.tex ]; then
	TEMPLATE=$1
	echo "Using '$TEMPLATE' template"
else
	echo "Unknow template $1. Die!"
	exit 1
fi

shift

for FILE in $@ 
do
	echo Processing file $FILE
	#	| head -n 20 \
	$CAT $FILE | $CUT -f1,2,3,4,6,8,9,10,11,12,13 \
		| $SED 's/\&/\\&/g;s/;/}{/g;s/^/\\mylabel{/;s/$/}/' > $INTER 
	$TEX $TEMPLATE
	OUT=`basename $FILE .csv`".$EXT"
	$MV ${TEMPLATE}.$EXT $OUT
	$CP $OUT $DEST_PATH
done
