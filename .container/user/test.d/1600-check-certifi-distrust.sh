#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  # shellcheck source=/dev/null
  . b19-i18n

  FAILED=0
  LIST="$(b19-ca-distrust list)"
  WORK="$(mktemp --directory)"
  trap 'rm --recursive --force "${WORK}"' EXIT

  mapfile -t BUNDLES < <(fd --hidden --no-ignore --type file --full-path 'certifi/cacert\.pem$' "${B19_PREFIX}/lib" "${B19_HOME}")
  for BUNDLE in "${BUNDLES[@]}"; do
    rm --force "${WORK}"/cert-*.pem
    awk -v dir="${WORK}" '/BEGIN CERTIFICATE/ { n++ } n { print > (dir "/cert-" n ".pem") }' "${BUNDLE}"
    for CERT in "${WORK}"/cert-*.pem; do
      PRINT="$(openssl x509 -noout -fingerprint -sha256 -in "${CERT}" | sed --expression 's/.*=//' --expression 's/://g')"
      if grep --quiet --fixed-strings --line-regexp "${PRINT}" <<<"${LIST}"; then
        b19-log error "PIP" "$(_p "%s still trusts %s" "${BUNDLE}" "${PRINT}")"
        FAILED=$((FAILED + 1))
      fi
    done
  done

  [ "${FAILED}" -eq 0 ] || exit 1
  b19-log good "PIP" "$(_p "%s certifi bundles hold no distrusted certificate" "${#BUNDLES[@]}")"
