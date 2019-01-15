
main = main
all_file = ${main}.tex 4.1.tex 4.2.tex 4.3.tex 4.4.tex 4.6.tex
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

