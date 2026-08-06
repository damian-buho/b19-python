<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Five-series CPython family on a shared gcc toolchain

- Five CPython series are available — 3.10, 3.11, 3.12, 3.13, 3.14 — each compiled from source with the same PGO and LTO treatment.
- Series is selected at build time via `B19_PYTHON_SERIES` (default `3.14`); each value publishes its own image tag `b19/python-{series}`.
- The CI build grid is declared as code in `projectfile.yaml` (`org.projectfile.ci.matrix.axes`): 3.12, 3.13 and 3.14 are on the default sweep; 3.10 and 3.11 are buildable but off the default grid.
- Builder-stage lineage is constant across the whole family: `b19/gcc-{series}` compiles, `b19/ubuntu/resolute` is the runtime base.
- Both amd64 and arm64 receive the same gcc-tuned, PGO+LTO build — arm64 is not a second-class build as it is in the upstream images.
