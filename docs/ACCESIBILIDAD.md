# Accesibilidad

## Alcance

El perfil estandar prioriza estabilidad de compilacion en LuaLaTeX, compatibilidad con Overleaf y soporte para las necesidades habituales de un TFL de Ciencias Geologicas. El perfil experimental agrega `\DocumentMetadata` antes de `\documentclass` para habilitar PDF etiquetado y mejoras progresivas de accesibilidad. Eso no equivale a una validacion formal PDF/UA-2.

No se incorporan `\usepackage{tagpdf}`, `\tagpdfsetup{activate-all}` ni callbacks Lua globales porque la infraestructura actual de `\DocumentMetadata` ya enruta por las capas de tagging del kernel y porque no se verifico una necesidad estable de esos agregados para este proyecto.

## Tabla de compatibilidad

| Paquete | Finalidad | Estado conocido | Comportamiento observado | Alternativa considerada | Decision adoptada |
| --- | --- | --- | --- | --- | --- |
| `biblatex` | Bibliografia con `biber` | Utilizable con limitaciones | Compila bien en perfil estandar; requiere verificacion de etiquetado en experimental | `natbib` | Mantener `biblatex` por flexibilidad y Unicode |
| `subcaption` | Figuras multipanel | Necesario para geologia | Funciona en estandar; el orden de lectura debe revisarse en experimental | Paneles manuales | Mantener y documentar revision manual |
| `siunitx` | Unidades cientificas | Compatible | Compilacion estable | Macros ad hoc | Mantener |
| `unicode-math` | Matematica Unicode | Compatible con LuaLaTeX | Compilacion estable en estandar | `newtxmath` | Mantener por coherencia con `fontspec` |
| `fancyhdr` | Encabezados discretos | Compatible | Encabezado minimo y sin regla | `scrlayer-scrpage` | Mantener por simplicidad |
| `setspace` | Interlineado configurable | Compatible | Permite texto principal en uno y medio y bibliografia simple | Ajustes manuales | Mantener |
| `longtable` | Tablas multipagina | Compatible con cautela | Funciona en estandar | `xltabular` | Mantener y revisar lectura en experimental |
| `tabularx` | Tablas de ancho flexible | Compatible | Funciona en estandar | `tabularray` | Mantener |
| `booktabs` | Reglas tipograficas de tablas | Compatible | Mejora legibilidad | Reglas verticales tradicionales | Mantener |
| `multirow` | Celdas combinadas | Compatible con cautela | Sin problemas en pruebas basicas | Simplificar tablas | Mantener |
| `pdflscape` | Paginas apaisadas | Compatible con cautela | Funciona en estandar | `lscape` | Mantener por mejor salida PDF |
| `graphicx` | Insercion de imagenes | Compatible | Estable en estandar | Ninguna | Mantener |
| `hyperref` | Enlaces y metadatos | Esencial | Estable en estandar | Ninguna | Mantener con colores discretos |
| `cleveref` | Referencias enriquecidas | No usado aun | No probado en esta plantilla | `\autoref` | Posponer hasta necesidad real |
| `caption` | Estilo de captions | Compatible | Estable y legible | Defaults de clase | Mantener |

## Figuras accesibles

La macro `\TFLFigura` conserva interfaz simple y soporta:

- `ancho`
- `etiqueta`
- `alt`
- `decorativa`

En el perfil estandar, `alt` se conserva como parte de la interfaz aunque no se garantiza su serializacion en el PDF. En el perfil experimental, el objetivo es conectar esa informacion con el mecanismo de tagging del kernel a medida que la compatibilidad madure.

## Pruebas minimas

- `tests/minimal.tex`
- `tests/figuras.tex`
- `tests/tablas.tex`
- `tests/bibliografia.tex`
- `tests/accesibilidad.tex`

Estas pruebas sirven para detectar regresiones de compilacion y documentar limitaciones reales, especialmente en tablas complejas, subfiguras y bibliografia.
