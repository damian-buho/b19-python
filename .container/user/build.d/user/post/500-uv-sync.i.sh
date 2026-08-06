#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  if [ -f pyproject.toml ]
  then
    b19-run "UV" "$(_ "Sync dependencies")" --      \
      uv sync                                       \
        --active
  fi
