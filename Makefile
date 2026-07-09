LATEXMK = latexmk

.PHONY: all pdf clean check check-standard check-accessible

all: pdf

pdf:
	$(LATEXMK)

check: check-standard check-accessible

check-standard:
	$(LATEXMK) main.tex
	$(LATEXMK) main-serif.tex
	$(LATEXMK) main-twoside.tex

check-accessible:
	$(LATEXMK) main-accesible.tex
	$(LATEXMK) tests/minimal.tex
	$(LATEXMK) tests/figuras.tex
	$(LATEXMK) tests/tablas.tex
	$(LATEXMK) tests/bibliografia.tex
	$(LATEXMK) tests/accesibilidad.tex

clean:
	$(LATEXMK) -C main.tex
	$(LATEXMK) -C main-serif.tex
	$(LATEXMK) -C main-twoside.tex
	$(LATEXMK) -C main-accesible.tex
	$(LATEXMK) -C tests/minimal.tex
	$(LATEXMK) -C tests/figuras.tex
	$(LATEXMK) -C tests/tablas.tex
	$(LATEXMK) -C tests/bibliografia.tex
	$(LATEXMK) -C tests/accesibilidad.tex
