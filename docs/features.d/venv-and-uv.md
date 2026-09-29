<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# A ready virtual environment with uv

- A virtual environment is active in every shell and at every start, so installs never touch the system interpreter.
- uv is preinstalled and uses the image’s own interpreter, never downloading another; installs are byte-compiled for faster first imports.
- A `pyproject.toml` in the build is synced automatically, and a plain `pip.deps` list works too.
- pip and setuptools are pinned, so a rebuild installs the same tooling.
