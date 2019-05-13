
main = 龙格库塔
all_file = ${main}.tex 

pdf: ${龙格库塔}.pdf

${龙格库塔}.pdf: ${all_file}
	xelatex ${main}.tex
	bibtex  ${main}.aux
	xelatex ${main}.tex
	xelatex ${main}.tex
	evince  ${main}.pdf&

view:
	evince ${龙格库塔}.pdf&

.PHONY:clean  
clean:
	-rm -f *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out *~ *.tid *.tms *.pdf *.bak *.blg *.bbl

