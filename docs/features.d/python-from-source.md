<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# CPython compiled from source with PGO and LTO

- CPython is built from upstream source using the `b19/gcc` toolchain, not installed from distribution packages.
- Profile-guided optimization enabled via `--enable-optimizations` with a curated PGO profile task (test suite subset, 20-minute timeout).
- Link-time optimization enabled via `--with-lto` for whole-program optimization.
- Multiple series available (3.12, 3.13, 3.14, optional 3.10, 3.11), selectable at build time via `B19_PYTHON_SERIES`.
- Compiles for both amd64 and arm64.
- Bare compiler names (`CC=gcc CXX=g++`) are passed to `./configure` so `_sysconfigdata` records bare names, not the absolute `b19/gcc` compile-cache wrapper path. Without this, CPython 3.14 (upstream [#151547](https://github.com/python/cpython/issues/151547)) stores `/usr/local/lib/compile-cache/g++`, which is absent from the clean runtime image and breaks downstream C++ extension builds (PyICU, lxml sdist, etc.).
- Also serves as Python source for `b19/node` and `b19/haskell` builder stages -- only `python3*` binaries and stdlib are extracted, not the full image.
