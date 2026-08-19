#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  # The interpreter's pip is root-owned here, so its vendored SBOM is stripped
  # in this root stage, not from the user stage.
  strip-pip-vendored-sbom "${B19_PREFIX}/lib"
