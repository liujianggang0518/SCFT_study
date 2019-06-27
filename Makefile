######################################################################
##########                                                  ##########
##########        Start Date: April.20 2019                 ##########
##########        Author: Wei Si                            ##########
##########        Email: 201610111098@smail.xtu.edu.cn      ##########
##########                                                  ##########
######################################################################

#### Compile Latex file;
### all: file   ('all' depends on 'file');
### .PHONY: object  ('object' is pointed a phony object);
### @  (display the code in the terminal);
### -  (ignore the error of the command);

#### If you use this Makefile, please replace 'file' by your file name;

file = main


.PHONY: all
all:
ifeq ($(file).tex, $(wildcard $(file).tex))
	@-xelatex $(file).tex
	@-bibtex $(file).aux
	@-xelatex $(file).tex
	@-xelatex $(file).tex
	@-evince $(file).pdf &
	clear
else
	clear
	@echo "WARNING: Lack tex files"
endif


.PHONY: vim
vim:
ifeq (Contents/Contents.tex, $(wildcard Contents/Contents.tex))
	clear
	@vim Contents/Contents.tex
else
	clear
	@echo "WARNING: Lack Main Contents"
endif


.PHONY: view
view:
ifeq ($(file).pdf, $(wildcard $(file).pdf))
	clear
	@evince $(file).pdf &
else
	clear
	@echo "WARNING: Lack pdf files"
endif


.PHONY: clean
clean:
	clear
	@-rm -f *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out *~ *.tid *.tms *.pdf *.bak *.blg *.bbl
	@echo "Hint: Clean Out"


.PHONY: help
help:
	clear
	@echo "==================== A Common Makefile for Latex ===================="
	@echo " Copyright (Latex)	2019	Wei Si"
	@echo " The following targets are support"
	@echo
	@echo " all				- (== make) compile"
	@echo " vim				- edit the main file"
	@echo " view				- view the pdf file"
	@echo " clean			- clean all files from compiling"
	@echo "========================== Version 1.0 =========================="


