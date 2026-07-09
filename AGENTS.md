# Instrucciones para agentes

Este repositorio contiene un Trabajo Final de Licenciatura en LaTeX y una plantilla nueva en paralelo.

## Reglas de trabajo

- No modificar el contenido cientifico, textual ni bibliografico del TFL sin una instruccion explicita.
- Preservar los nombres actuales de archivos, incluidos espacios, mayusculas, minusculas y acentos.
- No renombrar imagenes ni capitulos incluidos desde `Main.tex`.
- No eliminar archivos actualmente versionados.
- Antes de editar, revisar `Main.tex` y los archivos incluidos con `\input`.
- Mantener los cambios acotados y faciles de revisar en Git.

## Compilacion

Hay dos flujos distintos:

- Flujo legado: `Main.tex`
- Flujo de plantilla nueva: `main.tex`

Compilacion recomendada para la plantilla nueva:

```bash
latexmk
```

Eso resuelve a `latexmk -lualatex -interaction=nonstopmode -file-line-error main.tex` mediante `.latexmkrc`.

Compilacion del flujo legado, solo si se esta trabajando sobre el documento previo:

```bash
latexmk -pdf -interaction=nonstopmode -file-line-error Main.tex
```

Los PDFs y archivos auxiliares de LaTeX deben permanecer fuera de Git.

## Estructura actual

- `Main.tex`: documento raiz legado, con contenido existente del TFL.
- `main.tex`: entrada recomendada de la plantilla LuaLaTeX.
- `main-accesible.tex`: variante experimental con `\DocumentMetadata`.
- `tfl-uba-geologia.sty`: configuracion tipografica, visual y macros del proyecto.
- `config/`: metadatos y configuracion centralizada.
- `tests/`: documentos minimos para pruebas.
- `1 Introduccion.tex` a `8 Anexos.tex`: secciones incluidas con `\input`.
- `*.jpg` y `*.png`: imagenes usadas o disponibles para el documento.
- `Tesis Licenciatura Geología FCEN-UBA.zip`: archivo fuente/version empaquetada existente; no modificar salvo pedido explicito.

## Verificacion recomendada

- Ejecutar `make check` despues de cambios en la plantilla nueva.
- Revisar advertencias relevantes en `Main.log` si existen.
- Confirmar `git status --short` para separar fuentes de artefactos generados.
