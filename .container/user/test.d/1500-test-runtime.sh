#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  # shellcheck source=/dev/null
  . b19-i18n

  TESTDIR=$(mktemp -d)

  PY_VERSION=$(get-python-version)

  echo 'print("ok")' > "${TESTDIR}/test.py"
  python3 "${TESTDIR}/test.py"

  python3 -c "print('ok')"

  b19-log good "PYTHON" "$(_p "python-%s runtime test passed" "${PY_VERSION}")"

  rm -rf "${TESTDIR}"
