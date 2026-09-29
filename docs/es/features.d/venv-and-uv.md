<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Un entorno virtual listo con uv

- Un entorno virtual está activo en cada shell y en cada arranque, así las instalaciones nunca tocan el intérprete del sistema.
- uv viene preinstalado y usa el intérprete de la propia imagen, sin descargar otro; las instalaciones se compilan a bytecode para importar antes la primera vez.
- Un `pyproject.toml` en la compilación se sincroniza solo, y una lista simple `pip.deps` también sirve.
- pip y setuptools están fijados, así una recompilación instala las mismas herramientas.

<!-- textlint-enable -->
