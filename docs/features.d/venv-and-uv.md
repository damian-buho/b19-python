<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Pre-activated venv with uv integration

- A Python virtual environment is created at build time and re-activated at every container startup via an entrypoint hook.
- `uv` is preinstalled and configured: bytecode compilation enabled (`UV_COMPILE_BYTECODE=1`), managed Python downloads disabled (`UV_PYTHON_DOWNLOADS=never`), pointing at the compiled interpreter.
- If a `pyproject.toml` is present at build time, `uv sync --active` runs automatically to install dependencies.
- Declarative pip dependencies supported via plain-text `pip.deps` files.
- pip and setuptools are pinned to specific versions, not whatever ships with the Python release.
