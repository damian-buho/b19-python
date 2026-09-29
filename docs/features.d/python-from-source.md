<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# CPython built for speed

- CPython is compiled from upstream source with profile-guided and link-time optimization, so Python code runs faster than on a distribution build.
- Published for Python 3.12, 3.13 and 3.14 on amd64 and arm64.
- C and C++ extensions build against it in derived images with no compiler path to patch.
