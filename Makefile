ADDRESS ?= no-spam
MOBILE ?= no-spam
EMAIL ?= no-spam

.PHONY: cv.tex all clean view

all: cv.pdf

cv.tex:
	sed -e "s/@ADDRESS@/$(ADDRESS)/g" \
	    -e "s/@MOBILE@/$(MOBILE)/g" \
	    -e "s/@EMAIL@/$(EMAIL)/g" \
	    cv-nospam.tex > cv.tex

%.pdf: %.tex
	pdflatex -halt-on-error $<
	pdflatex -halt-on-error $<
	pdflatex -halt-on-error $<

clean:
	rm -f *.aux *.log *.nav *.out *.pdf *.snm *.toc *.vrb cv.tex cv.pdf

view: cv.pdf
	evince $<
