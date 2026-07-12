# Plantilla TFL — FCEN-UBA, Ciencias Geológicas

Plantilla en LaTeX para el Trabajo Final de Licenciatura (TFL) del
Departamento de Ciencias Geológicas (FCEN-UBA). Pensada para compilarse
con **LuaLaTeX**, funciona igual en tu computadora que en Overleaf.

No es una plantilla institucional oficial: es una base prolija y lista
para usar, inspirada en el formato que pide la carrera.

---

## Guía rápida (5 minutos)

1. **Completá tus datos** en [`config/datos_tfl.tex`](config/datos_tfl.tex):
   título, autor/a, director/a, institución, fecha, etc.
2. **Escribí tu tesis** en los archivos de `capitulos/` (`1 Introduccion.tex`,
   `2 marco geológico.tex`, ...). Son archivos de texto normales, editalos
   con cualquier editor.
3. **Agregá tus citas** en [`bibliografia/referencias.bib`](bibliografia/referencias.bib)
   (formato BibTeX) y citalas en el texto con `\cite{clave}` o `\textcite{clave}`.
4. **Compilá** [`main.tex`](main.tex):

   ```bash
   latexmk
   ```

   El PDF final queda en `build/main.pdf`.

Eso es todo. `main.tex` es el único archivo que hay que compilar, y tiene
comentarios en cada sección explicando qué hace.

### En Overleaf

Subí toda la carpeta, marcá `main.tex` como documento principal, y en
**Menu → Compiler** elegí **LuaLaTeX**.

---

## Estructura del proyecto

| Archivo / carpeta | Qué es | ¿Lo edito? |
| --- | --- | --- |
| `main.tex` | Punto de entrada único: arma la portada, preliminares, capítulos y bibliografía | Solo si querés cambiar tipografía/interlineado/orden de capítulos |
| `config/datos_tfl.tex` | Tus datos: título, autor, director, institución, logos, fecha | **Sí, es lo primero que hay que completar** |
| `capitulos/` | Un archivo por capítulo (`1 Introduccion.tex` a `8 Anexos.tex`) | **Sí, ahí escribís la tesis** |
| `preliminares/` | Resumen, abstract y agradecimientos | Sí |
| `figuras/capituloN/` | Imágenes de contenido, agrupadas por capítulo | Sí, ahí van tus figuras |
| `logos/` | Logos institucionales que aparecen en la portada | Solo si cambiás de institución |
| `bibliografia/referencias.bib` | Tu base de referencias bibliográficas | Sí |
| `tfl-uba-geologia.sty` | Motor de la plantilla: márgenes, tipografía, portada, macros | No, salvo que quieras cambiar el diseño en sí |
| `tests/` | Documentos mínimos para probar la plantilla (no son parte de la tesis) | No |

---

## Personalizar la plantilla

Al principio de `main.tex` hay un bloque con las opciones de la plantilla:

```latex
\usepackage[
  tipografia=sans,        % sans (letra de palo) o serif
  interlineado=uno-medio,  % uno | uno-medio (1.5) | doble
  accesibilidad=standard,  % standard o experimental (ver mas abajo)
  encuadernacion=8mm       % margen extra interno para anillado/espiralado
]{tfl-uba-geologia}
```

Para probar doble faz (impresión a dos caras), cambiar `oneside` por
`twoside` en la línea de `\documentclass` de `main.tex`.

---

## Cómo agregar figuras

Las imágenes van en `figuras/capituloN/`, agrupadas según el capítulo que
las usa (por ejemplo, las figuras del capítulo 2 van en `figuras/capitulo2/`).
Si un capítulo nuevo necesita figuras, creá su carpeta `figuras/capituloN/`.

Para insertarlas, usá el comando `\TFLFigura` en vez de `\includegraphics`
+ `figure` a mano — hace lo mismo pero además numera la figura por
capítulo (`Figura 2.1`, `Figura 2.2`, ...) y admite texto alternativo:

```latex
\TFLFigura[
  ancho=0.7\linewidth,
  etiqueta=fig:ubicacion,
  alt={Mapa de ubicación de la zona de estudio.}
]{figuras/capitulo1/Fig. ubicacion.jpg}{Mapa de ubicación de la zona de estudio.}
```

Después la referenciás en el texto con `\ref{fig:ubicacion}`.

## Cómo agregar un capítulo nuevo

1. Creá el archivo dentro de `capitulos/`, por ejemplo `capitulos/9 Anexo B.tex`.
2. Abrí `main.tex` y agregá una línea `\input{capitulos/9 Anexo B}` junto a
   los demás `\input` de capítulos (están agrupados y comentados).
3. Para sacar un capítulo sin borrarlo, comentá su línea `\input` con `%`.

## Bibliografía

1. Agregá la entrada en `bibliografia/referencias.bib`:

   ```bibtex
   @book{hutton1795,
     author    = {James Hutton},
     title     = {Theory of the Earth},
     year      = {1795},
     publisher = {Cadell and Davies}
   }
   ```

2. Citala en el texto: `\textcite{hutton1795}` (cita narrativa, "Hutton
   (1795) propuso...") o `\parencite{hutton1795}` (cita entre paréntesis).
3. Al compilar, la lista de referencias aparece automáticamente al final
   (capítulo "Bibliografía").

> Nota: `latexmk` corre `biber` automáticamente. Si compilás a mano con
> `lualatex` desde el editor, acordate de correr `biber` también (en
> Overleaf esto es automático).

---

## Problemas comunes

- **"Undefined control sequence" al compilar**: revisá que no hayas
  borrado la línea `\input{config/datos_tfl.tex}` de `main.tex`.
- **"File not found" en una figura**: revisá que la ruta incluya la
  carpeta, por ejemplo `figuras/capitulo2/Fig. provincias.jpg`, no solo
  el nombre del archivo.
- **Las citas aparecen como "?"**: falta correr `biber` (con `latexmk`
  se hace solo) o la clave de la cita no coincide con la del `.bib`.
- **Compila con pdfLaTeX y tira errores raros**: esta plantilla requiere
  **LuaLaTeX** (usa `fontspec`/`unicode-math`). En Overleaf, cambiá el
  compilador en Menu → Compiler.
- **Los PDFs y archivos auxiliares no se suben a Git**: es a propósito,
  quedan en `build/` y están en `.gitignore`.

---

## Accesibilidad (avanzado, opcional)

Existe un perfil experimental que agrega metadatos de accesibilidad al
PDF (`\DocumentMetadata`, PDF etiquetado). **No hace falta para entregar
el TFL** — es un modo en desarrollo, documentado en
[`docs/ACCESIBILIDAD.md`](docs/ACCESIBILIDAD.md) y probado en
`tests/accesibilidad.tex`. Si te interesa activarlo, revisá esa
documentación antes.

---

## Compilación por línea de comandos

```bash
latexmk              # compila main.tex (equivale al comando de abajo)
latexmk -lualatex -interaction=nonstopmode -file-line-error main.tex
make                 # idem, via Makefile
make check           # compila el TFL + los tests de la plantilla
make clean           # borra los archivos auxiliares de compilación
```

El motor recomendado es **LuaLaTeX** con **biber**, coordinados por
`latexmk` (configurado en `.latexmkrc`).
