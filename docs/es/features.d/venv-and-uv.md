<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Venv preactivado con integración de uv

- Un entorno virtual de Python se crea en tiempo de compilación y se reactiva en cada arranque del contenedor mediante un hook del entrypoint.
- `uv` viene preinstalado y configurado: compilación de bytecode activada (`UV_COMPILE_BYTECODE=1`), descargas gestionadas de Python desactivadas (`UV_PYTHON_DOWNLOADS=never`), apuntando al intérprete compilado.
- Si hay un `pyproject.toml` en tiempo de compilación, `uv sync --active` se ejecuta automáticamente para instalar las dependencias.
- Se admiten dependencias pip declarativas mediante simples archivos de texto `pip.deps`.
- pip y setuptools están fijados a versiones concretas, no a lo que traiga el release de Python.

<!-- textlint-enable -->
