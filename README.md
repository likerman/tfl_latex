# Plantilla TFL — FCEN-UBA, Ciencias Geológicas

Plantilla en LaTeX para el Trabajo Final de Licenciatura (TFL) del
Departamento de Ciencias Geológicas (FCEN-UBA). Pensada para compilarse
con **LuaLaTeX**, funciona igual en tu computadora que en Overleaf.

No es una plantilla institucional oficial: es una base prolija y lista
para usar, inspirada en el formato que pide la carrera.

## Tutorial completo

La guía paso a paso para estudiantes —incluyendo edición de la portada,
capítulos, Figuras, Tablas, bibliografía y uso en Overleaf— está disponible
en el siguiente documento:

[Tutorial de uso de la plantilla TFL — Ciencias Geológicas FCEN-UBA](https://docs.google.com/document/d/1l3h0R5y7yykeLF-MS0hQ69qFxHT51ddVvDwlAafIioA/edit)

---

## Guía rápida (5 minutos)

1. **Completá tus datos** en [`config/datos_tfl.tex`](config/datos_tfl.tex):
   título, autor/a, director/a, institución, fecha, etc.
2. **Escribí tu tesis** en los archivos de `capitulos/` (`1 Introduccion.tex`,
   `2 marco geológico.tex`, ...). Son archivos de texto normales, editalos
   con cualquier editor.
3. **Agregá tus citas** en [`bibliografia/referencias.bib`](bibliografia/referencias.bib)
   (formato BibTeX) y citalas con `\textcite{clave}` o `\parencite{clave}`.
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
| `config/datos_tfl.tex` | Tus datos: título, autor, director, institución, logos y fecha | **Sí, es lo primero que hay que completar** |
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
  encuadernacion=5mm       % margen extra interno para anillado/espiralado
]{tfl-uba-geologia}
```

El documento usa hojas **A4**. Con la configuración predeterminada, los
márgenes son 25 mm arriba y abajo, 23 mm en el borde exterior y 28 mm en el
interior, más 5 mm adicionales para encuadernación.

Para probar doble faz (impresión a dos caras), cambiar `oneside` por
`twoside` en la línea de `\documentclass` de `main.tex`.

La fecha de la portada usa `\today`, por lo que se actualiza cada vez que
se compila. Si necesitás fijarla manualmente, seguí el comentario que está
junto a `\TFLFecha` en `config/datos_tfl.tex`.

El índice general se incluye siempre. Los índices de figuras y tablas están
desactivados por defecto; para mostrarlos, quitá `%` delante de
`\listoffigures` y `\listoftables` en `main.tex`, junto con sus respectivos
`\clearpage`.

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

Después la referenciás en el texto con `Figura~\ref{fig:ubicacion}`. La
virgulilla `~` evita que la palabra «Figura» quede separada de su número al
cambiar de renglón. También podés indicar la página con
`Figura~\ref{fig:ubicacion} de la página~\pageref{fig:ubicacion}`.

Los capítulos 1 y 2 contienen ejemplos visibles de estas dos formas de cita.
Toda figura debe tener una etiqueta única y debe mencionarse en el texto.

## Cómo agregar y citar una tabla

El capítulo 4 contiene una tabla completa para copiar y adaptar. La regla es
la misma que para una figura: colocá `\label{tab:resultados}` inmediatamente
después de `\caption{...}` y escribí `Tabla~\ref{tab:resultados}` en el texto.
La numeración y el número de página se actualizan al compilar.

## Secciones y subsecciones

- `\section{Título}` y `\subsection{Título}` crean apartados numerados que
  aparecen automáticamente en el índice.
- `\section*{Título}` y `\subsection*{Título}` crean apartados sin número y
  no los agregan automáticamente al índice.
- Para citar una sección, agregá `\label{sec:metodos}` después del título y
  usá `sección~\ref{sec:metodos}` en el texto.

El capítulo 3 muestra las variantes numerada y sin número.

## Cómo agregar un capítulo nuevo

1. Creá el archivo dentro de `capitulos/`, por ejemplo `capitulos/9 Anexo B.tex`.
2. Abrí `main.tex` y agregá una línea `\input{capitulos/9 Anexo B}` junto a
   los demás `\input` de capítulos (están agrupados y comentados).
3. Para sacar un capítulo sin borrarlo, comentá su línea `\input` con `%`.

## Bibliografía

1. Agregá la entrada en `bibliografia/referencias.bib`:

   ```bibtex
   @article{groeber1946,
     author       = {Groeber, Pablo},
     title        = {Observaciones geológicas a lo largo del meridiano 70. Hoja Chos Malal},
     journaltitle = {Revista de la Sociedad Geológica Argentina},
     year         = {1946},
     volume       = {1},
     number       = {3},
     pages        = {178--208}
   }
   ```

   Una forma práctica de obtenerla es buscar el trabajo en Google Scholar,
   elegir **Citar → BibTeX**, copiar la entrada y pegarla en ese archivo.
   Revisá siempre autores, título, año, revista, volumen, número y páginas:
   los datos exportados pueden estar incompletos o contener errores.

2. Citala en el texto: `\textcite{groeber1946}` produce “Groeber (1946)”;
   `\parencite{groeber1946}` produce “(Groeber 1946)”. Para varias fuentes,
   usá `\parencite{weaver1931,groeber1946}`.
3. Al compilar, la lista de referencias aparece automáticamente al final
   (capítulo "Bibliografía").

El archivo `capitulos/1 Introduccion.tex` contiene un bloque claramente
marcado con tres ejemplos visibles en el PDF: cita narrativa, cita
parentética y varias fuentes en una misma cita. Reemplazá ese bloque por las
citas reales del trabajo cuando empieces a redactar.

La plantilla aplica el formato de la **Revista de la Asociación Geológica
Argentina (RAGA)**: citas autor-año sin coma, “y” para dos autores, “et al.”
para tres o más, nombres completos de revistas y puntuación RAGA en la lista
final. `bibliografia/referencias.bib` incluye ejemplos de artículo, libro,
capítulo de libro, congreso, boletín, sitio web y tesis para copiar y adaptar.
La implementación sigue las
[directrices oficiales para autores de RAGA](https://revista.geologica.org.ar/raga/about/submissions).

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
