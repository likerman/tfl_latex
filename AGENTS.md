# Instrucciones para agentes

Este repositorio contiene la plantilla LaTeX del Trabajo Final de
Licenciatura (TFL) de Ciencias Geológicas (FCEN-UBA), lista para que un
estudiante la descargue y complete con sus propios datos y capítulos.

## Reglas de trabajo

- No modificar el contenido cientifico, textual ni bibliografico del TFL
  (lo que hay en `capitulos/`, `preliminares/`, `bibliografia/`) sin una
  instruccion explicita.
- Preservar los nombres actuales de archivos, incluidos espacios,
  mayusculas, minusculas y acentos.
- No eliminar archivos actualmente versionados sin instruccion explicita.
- Antes de editar, revisar `main.tex` (unico punto de entrada) y los
  archivos incluidos con `\input`.
- Mantener los cambios acotados y faciles de revisar en Git.

## Compilacion

```bash
latexmk
```

Eso resuelve a `latexmk -lualatex -interaction=nonstopmode -file-line-error main.tex`
mediante `.latexmkrc`. El PDF final queda en `build/main.pdf`.

Los PDFs y archivos auxiliares de LaTeX deben permanecer fuera de Git
(ver `.gitignore`).

## Estructura actual

- `main.tex`: unico punto de entrada (LuaLaTeX). Preambulo, opciones de la
  plantilla y armado del documento completo, en un solo archivo comentado.
- `config/datos_tfl.tex`: datos personales/institucionales del TFL (titulo,
  autor, director, logos, etc.); es el archivo que un estudiante completa
  primero.
- `config/accesibilidad-experimental.tex`: perfil experimental opcional
  (`\DocumentMetadata`), documentado en `docs/ACCESIBILIDAD.md` y probado en
  `tests/accesibilidad.tex`; no esta conectado a `main.tex` por defecto.
- `capitulos/`: un archivo `.tex` por capitulo (`1 Introduccion.tex` a
  `8 Anexos.tex`), incluidos desde `main.tex` con `\input`.
- `preliminares/`: resumen, abstract y agradecimientos.
- `figuras/`: imagenes de contenido, organizadas en subcarpetas
  `capituloN/` segun el capitulo que las usa.
- `logos/`: logos institucionales usados en la portada.
- `bibliografia/referencias.bib`: base de referencias (BibTeX/biblatex).
- `tfl-uba-geologia.sty`: configuracion tipografica, visual y macros del
  proyecto (portada, `\TFLFigura`, numeracion, margenes, etc.).
- `tests/`: documentos minimos para pruebas de la plantilla, no son parte
  de la tesis.
- `Tesis Licenciatura Geología FCEN-UBA.zip`: archivo fuente/version
  empaquetada existente; no modificar salvo pedido explicito.

## Verificacion recomendada

- Ejecutar `make check` despues de cambios en la plantilla.
- Revisar advertencias relevantes en `build/main.log` si existen.
- Confirmar `git status --short` para separar fuentes de artefactos generados.
