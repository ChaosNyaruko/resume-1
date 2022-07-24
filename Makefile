SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

MYTEX := wft-zh_CN.tex
MYTEX-EN := wft.tex
wft:
	@echo making ${MYTEX} ${MYTEX-EN}
	rm -f wft.html wft.pdf wft-zh_CN.html wft-zh_CN.html
	pandoc -t html --pdf-engine=xelatex ${MYTEX}  -o wft-zh_CN.html
	xelatex  ${MYTEX}
	pandoc -t html --pdf-engine=xelatex ${MYTEX-EN}  -o wft.html
	xelatex  ${MYTEX-EN}

demo:
	@echo $(SRC)
	@echo $(PDFS)

all:	clean pdf

en:	clean xelatex resume.tex

zh_CN:	clean xelatex resume-zh_CN.tex

pdf:	clean $(PDFS)

%.pdf:  %.tex
	xelatex $<

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf *.html
