ADDRESS ?= no-spam
MOBILE ?= no-spam
EMAIL ?= no-spam
LANGUAGE ?= fr
OBJECTIVES ?=

ifeq (,$(OBJECTIVES))
	cv_filename = cv-$(LANGUAGE)
else
	cv_filename = cv-$(OBJECTIVES)-$(LANGUAGE)
endif

.PHONY: $(cv_filename).tex all clean view

all: $(cv_filename).pdf

$(cv_filename).tex:
	sed -e "s/@ADDRESS@/$(ADDRESS)/g"       \
	    -e "s/@MOBILE@/$(MOBILE)/g"         \
	    -e "s/@EMAIL@/$(EMAIL)/g"           \
	    -e "s/@LANGUAGE@/$(LANGUAGE)/g"     \
	    -e "s/@OBJECTIVES@/$(OBJECTIVES)/g" \
		cv-nospam.tex > $(cv_filename).tex

%.pdf: %.tex
	pdflatex -halt-on-error $<
	pdflatex -halt-on-error $<
	pdflatex -halt-on-error $<

clean:
	rm -f *.aux *.log *.nav *.out *.pdf *.snm *.toc *.vrb cv.tex $(cv_filename).tex $(cv_filename).pdf

view: $(cv_filename).pdf
	evince $<
