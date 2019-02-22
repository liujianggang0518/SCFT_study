
main = chapter2
all_file = ${main}.tex 2.1.tex 2.2.tex 2.3.tex 2.4.tex 2.5.tex

pdf: ${main}.pdf

${main}.pdf: ${all_file}
	xelatex ${main}.tex
	bibtex  ${main}.aux
	xelatex ${main}.tex
	xelatex ${main}.tex
	evince  ${main}.pdf&

view:
	evince ${main}.pdf&

.PHONY:clean  
clean:
	-rm -f *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out *~ *.tid *.tms *.pdf *.bak *.blg *.bbl

