<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# CPython compilado desde el código fuente con PGO y LTO

- CPython se compila a partir del código fuente upstream usando la cadena de herramientas `b19/gcc`, no se instala desde paquetes de la distribución.
- Optimización guiada por perfil activada mediante `--enable-optimizations` con una tarea de perfil PGO curada (subconjunto de la suite de tests, timeout de 20 minutos).
- Optimización en tiempo de enlazado activada mediante `--with-lto` para una optimización de programa completo.
- Varias series disponibles (3.12, 3.13, 3.14, opcionales 3.10, 3.11), seleccionables en tiempo de compilación mediante `B19_PYTHON_SERIES`.
- Se compila tanto para amd64 como para arm64.
- A `./configure` se le pasan nombres de compilador desnudos (`CC=gcc CXX=g++`) para que `_sysconfigdata` registre nombres desnudos y no la ruta absoluta del envolvente compile-cache de `b19/gcc`. Sin esto, CPython 3.14 (upstream [#151547](https://github.com/python/cpython/issues/151547)) guarda `/usr/local/lib/compile-cache/g++`, ausente en la imagen limpia de runtime, y rompe la compilación de extensiones C++ derivadas (PyICU, lxml sdist, etc.).
- También sirve como fuente de Python para las etapas builder de `b19/node` y `b19/haskell`: solo se extraen los binarios `python3*` y la biblioteca estándar, no la imagen completa.

<!-- textlint-enable -->
