.PHONY: rep clean

FILE = report

rep:
	cd docs ; \
	pdflatex $(FILE).tex ; \
	# bibtex $(FILE).aux ; \
	pdflatex $(FILE).tex ; \
	pdflatex $(FILE).tex ; \
	xdg-open $(FILE).pdf ; \
	rm *.aux


open:
	cd docs ; \
	xdg-open $(FILE).pdf


prog:
	cd src ; \
	python3 ../src/main.py


check:
	find . -name "*.tex" -exec aspell --lang=ru --mode=tex check "{}" \;

clean:
	rm *.aux *.bbl *.blg *.log *.out *.toc *.tex.bak

	echo "Clear:Ready"


# Hanspell check 
# find . -name "*.tex" -exec hunspell -t -i utf-8 '{}' \; 

# Aspell check
#find . -name "*.tex" -exec aspell --lang=en --mode=tex check "{}" \; 

# find . -name "*.tex" -exec aspell --lang=ru --mode=tex check "{}" \; 