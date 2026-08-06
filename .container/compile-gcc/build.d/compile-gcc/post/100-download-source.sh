#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  cd "${B19_TEMP_PATH}" || exit

  M6E_SERIES="${B19_PYTHON_SERIES}"
  export M6E_SERIES
  eval "$(b19-resolve-dep python)"

  b19-fetch "PYTHON" "${M6E_UPSTREAM__URL}" "${M6E_UPSTREAM__FILE}" "${M6E_UPSTREAM__HASH}"

  b19-run "PYTHON" "$(_p "Extract %s" "${B19_TEMP_PATH}/${M6E_UPSTREAM__FILE}")" --     \
    tar --extract                                                                       \
        --file "${B19_TEMP_PATH}/${M6E_UPSTREAM__FILE}"                                 \
        --strip-components 1                                                            \
        --use-compress-program pixz

  # No need to cleanup files
