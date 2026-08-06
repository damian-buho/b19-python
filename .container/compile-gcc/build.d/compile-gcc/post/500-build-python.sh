#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  cd "${B19_TEMP_PATH}" || exit

  # Pass bare compiler names so CPython records "gcc"/"g++" in _sysconfigdata
  # instead of the absolute PATH-resolved path. Without this, 3.14 (CPython
  # #151547) stores the b19/gcc compile-cache wrapper path
  # (/usr/local/lib/compile-cache/g++), which is absent from the clean runtime
  # image and breaks any downstream C++ extension build (PyICU, lxml sdist…).
  # Exported (not prefixed on b19-run's command line): b19-run dispatches via
  # "$@", so "CC=gcc" passed as an arg would be executed as a command (exit 127).
  export CC=gcc CXX=g++
  b19-run "PYTHON" "$(_ "Configure")" --      \
      ./configure                             \
      --enable-optimizations                  \
      --with-lto PROFILE_TASK="./python -m test --pgo --timeout=1200 || true"

# WAITING FOR FULL SUPPORT
# --disable-gil
# --enable-experimental-jit=yes-off

  b19-run "PYTHON" "$(_ "Build")" --      \
    make

  b19-run "PYTHON" "$(_ "Install")" --      \
    make install DESTDIR=/export

  b19-run "CLEANUP" "$(_ "Cleanup .a")" --      \
    fd --extension a --type file --base-directory /export --exec-batch rm --force

  b19-run "CLEANUP" "$(_ "Cleanup .o")" --      \
    fd --extension o --type file --base-directory /export --exec-batch rm --force
