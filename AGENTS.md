<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# b19/python

Docker image built on [b19/gcc](../gcc/AGENTS.md) and [b19/Ubuntu](../ubuntu/AGENTS.md)

CPython compiled from source with PGO and LTO.

## Key facts

- Builder: `b19/gcc-{series}`
- Final base: `b19/ubuntu/${B19_UBUNTU_SERIES}`
- Series: 3.12, 3.13, 3.14 (optional: 3.10, 3.11)
- Image name: `b19/python-{series}`
- Arch: amd64, arm64

## ENV

- `VIRTUAL_ENV="${B19_HOME}/.venv"` (venv is a subdirectory of the home dir)
- `UV_PYTHON="/usr/local/bin/python"` (points to compiled Python, not venv python)
- `UV_PYTHON_DOWNLOADS=never`
- `UV_COMPILE_BYTECODE=1`

## Behavior

- Pre-activated venv at `$B19_HOME` (activated in entrypoint, not just at build time)
- `uv sync` runs automatically if `pyproject.toml` detected
- Declarative pip deps via `pip.deps` in `.container/user/deps/`

## Note

Also used as Python source in `b19/node` and `b19/haskell` builder stages — only `python3*` binaries and stdlib are COPY’d, not the full image.

## Scanner visibility

pip ships a CycloneDX SBOM of its vendored tree (`pip/_vendor/bom.cdx.json`); scanners ingest it and flag vendored msgpack/setuptools as installed packages. `600-strip-pip-sbom.i.sh` removes it from every pip copy in the final image so downstream consumers don’t inherit the findings. Drop that script when pip vendors a fixed msgpack.
