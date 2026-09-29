<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# CPython, зібраний для швидкості

- CPython компілюється з першоджерельного коду з оптимізацією за профілем і на етапі компонування, тож код Python працює швидше, ніж на збірці з дистрибутива.
- Публікується для Python 3.12, 3.13 і 3.14 на amd64 і arm64.
- Розширення на C і C++ збираються з ним у похідних образах без шляху компілятора, який треба латати.

<!-- textlint-enable -->
