ADDRESS ?= no-spam
MOBILE ?= no-spam
EMAIL ?= no-spam
LANGUAGE ?= fr
OBJECTIVES ?=
ISFREELANCE ?= true

ifeq (,$(OBJECTIVES))
	cv_filename = cv-$(LANGUAGE)
else
	cv_filename = cv-$(OBJECTIVES)-$(LANGUAGE)
endif

.PHONY: $(cv_filename).tex all clean view

all: $(cv_filename).pdf

$(cv_filename).tex:
	sed -e "s/@ADDRESS@/$(ADDRESS)/g"         \
	    -e "s/@MOBILE@/$(MOBILE)/g"           \
	    -e "s/@EMAIL@/$(EMAIL)/g"             \
	    -e "s/@LANGUAGE@/$(LANGUAGE)/g"       \
	    -e "s/@OBJECTIVES@/$(OBJECTIVES)/g"   \
	    -e "s/@ISFREELANCE@/$(ISFREELANCE)/g" \
		cv-nospam.tex > $(cv_filename).tex

%.pdf: %.tex
	pdflatex -halt-on-error $<
	pdflatex -halt-on-error $<
	pdflatex -halt-on-error $<
	rm -f $(cv_filename).tex

clean:
	rm -f *.aux *.log *.nav *.out *.pdf *.snm *.toc *.vrb

view: $(cv_filename).pdf
	evince $<
