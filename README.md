# Plantilla TFL FCEN-UBA Geologia

Esta plantilla esta inspirada conceptualmente en una tesis academica moderna para LuaLaTeX, con una linea visual sobria, front matter separado y una estrategia gradual de accesibilidad. No es una copia institucional de UW-Madison y tampoco es una plantilla oficial de FCEN-UBA.

## Alcance

- `Main.tex` y los archivos historicos del TFL se conservan sin cambios de contenido.
- La plantilla nueva vive en `main.tex` y variantes relacionadas.
- El motor recomendado es `LuaLaTeX` con `biber`, coordinados por `latexmk`.
- La estructura nueva reutiliza el flujo documental historico del TFL: portada, resumen, agradecimientos, indice, secciones principales, referencias y anexos.

## Uso

- Editar datos generales en `config/datos_tfl.tex`.
- Mantener el contenido principal en archivos separados (`1 Introduccion.tex`, `2 marco geológico.tex`, etc.).
- Evitar comandos de tamano manual dentro de titulos (`\Large`, `\huge`, etc.) para no pelear contra la plantilla.
- Reservar `main.tex` como punto de entrada y dejar `Main.tex` como referencia historica mientras dure la migracion.

## Compilacion

Compilacion recomendada:

```bash
latexmk
```

Comando equivalente:

```bash
latexmk -lualatex -interaction=nonstopmode -file-line-error main.tex
```

Tambien se puede usar:

```bash
make
```

En Overleaf, el compilador seleccionado debe ser `LuaLaTeX`.

## Variantes

- `main.tex`: perfil estandar, tipografia sans serif, una cara.
- `main-serif.tex`: perfil estandar, tipografia serif.
- `main-twoside.tex`: perfil estandar, doble faz.
- `main-accesible.tex`: perfil experimental con `\DocumentMetadata`.

## Tipografia

La plantilla usa `fontspec` y `unicode-math` con fuentes Latin Modern incluidas en TeX Live y disponibles en Overleaf. Esta eleccion sigue la logica tipografica de la plantilla de referencia en LuaLaTeX.

- Sans serif: `tipografia=sans`
- Serif: `tipografia=serif`

Ejemplo:

```latex
\usepackage[tipografia=serif]{tfl-uba-geologia}
```

## Interlineado

Opciones disponibles:

- `interlineado=uno`
- `interlineado=uno-medio`
- `interlineado=doble`

El valor predeterminado es `uno-medio`. La bibliografia y las captions se componen en simple para sostener legibilidad.

## Encuadernacion

El margen adicional se controla con:

```latex
\usepackage[encuadernacion=10mm]{tfl-uba-geologia}
```

Los margenes estan centralizados en [tfl-uba-geologia.sty](/home/jl/proyectos/tfl_latex/tfl-uba-geologia.sty).

## Accesibilidad experimental

Existe un perfil experimental activado en `main-accesible.tex`. Ese perfil busca PDF etiquetado y mejoras progresivas de accesibilidad, pero no afirma validacion formal PDF/UA-2.

Limitaciones actuales:

- no se ejecuta un validador PDF/UA en este repositorio;
- la compatibilidad de etiquetado depende de la version de LaTeX y del entorno;
- figuras multipanel, tablas complejas y bibliografia siguen requiriendo verificacion manual.

El analisis de paquetes y decisiones esta documentado en [docs/ACCESIBILIDAD.md](/home/jl/proyectos/tfl_latex/docs/ACCESIBILIDAD.md).
