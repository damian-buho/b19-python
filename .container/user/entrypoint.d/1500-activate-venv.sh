#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  if [ -f "${VIRTUAL_ENV}/bin/activate" ]
  then
  # shellcheck source=/dev/null
  . "${VIRTUAL_ENV}/bin/activate"
  fi

  PATH="${PWD}/.venv/bin:$PATH"
  export PATH

  b19-log info "VENV" "$(_p "Activate %s" "${PATH}")"
  b19-log info "VENV" "$(_p "Which python3: %s" "$(which python3)")"
