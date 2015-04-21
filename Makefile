RM=rm -f
TEX=pdflatex
BIBTEX=bibtex
BIB=references.bib


.PHONY: clean veryclean

default: clean




#cleaning rules

clean:
	$(RM) *.aux *.xml *.bcf *.bbl *.blg *-blx.bib \
		*.log *.nav *.out *.vrb *.snm *.toc \
		X.tex *.bak

veryclean: clean
	$(RM) *.pdf *.dvi

