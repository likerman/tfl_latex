LATEXMK = latexmk

.PHONY: all pdf clean check check-tests

all: pdf

pdf:
	$(LATEXMK)

# "check" compila el TFL y ademas corre los documentos minimos de prueba
# de la plantilla (tests/), incluido el perfil experimental de accesibilidad.
check: pdf check-tests

check-tests:
	$(LATEXMK) tests/minimal.tex
	$(LATEXMK) tests/figuras.tex
	$(LATEXMK) tests/tablas.tex
	$(LATEXMK) tests/bibliografia.tex
	$(LATEXMK) tests/accesibilidad.tex

clean:
	$(LATEXMK) -C main.tex
	$(LATEXMK) -C tests/minimal.tex
	$(LATEXMK) -C tests/figuras.tex
	$(LATEXMK) -C tests/tablas.tex
	$(LATEXMK) -C tests/bibliografia.tex
	$(LATEXMK) -C tests/accesibilidad.tex
