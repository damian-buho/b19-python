#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  # Covers the venv pip(s) under the home dir; the interpreter's root-owned
  # copy is stripped by build.d/base/post/500-strip-pip-sbom.i.sh.
  strip-pip-vendored-sbom "${B19_HOME}"
