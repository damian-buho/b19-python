#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  # shellcheck source=/dev/null
  . b19-i18n

  WORK="$(mktemp --directory)"
  trap 'rm --recursive --force "${WORK}"' EXIT

  # A copy of the installer that reads a temp deps list instead of /deps/pip.deps
  sed "s#/deps/pip.deps#${WORK}/pip.deps#" "$(command -v install-pip-from-deps)" > "${WORK}/install"
  printf 'unresolvable==0\n' > "${WORK}/pip.deps"

  # Stub b19-run as an exported function: it logs each call and fails the pip install step only
  b19-run() { printf '%s\n' "${*}" >> "${WORK}/calls"; [[ "${*}" != *xargs* ]]; }
  export -f b19-run
  export WORK

  STATUS=0
  bash "${WORK}/install" || STATUS=$?

  b19-assert matches "PIP" "^[1-9][0-9]*$" "${STATUS}"
  b19-assert equals "PIP" "0" "$(grep --count --fixed-strings "Remove" "${WORK}/calls" || true)"
  b19-assert equals "PIP" "present" "$([[ -f "${WORK}/pip.deps" ]] && echo present || echo absent)"
