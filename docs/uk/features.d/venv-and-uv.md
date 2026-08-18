<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Наперед активований venv з інтеграцією uv

- Віртуальне середовище Python створюється під час збирання й реактивується при кожному запуску контейнера хуком entrypoint.
- `uv` попередньо встановлено й налаштовано: компіляція байткоду увімкнена (`UV_COMPILE_BYTECODE=1`), керовані завантаження Python вимкнені (`UV_PYTHON_DOWNLOADS=never`), із вказівником на зібраний інтерпретатор.
- Якщо під час збирання є `pyproject.toml`, автоматично запускається `uv sync --active` для встановлення залежностей.
- Підтримуються декларативні pip-залежності через прості текстові файли `pip.deps`.
- pip і setuptools зафіксовані на конкретних версіях, а не на тому, що постачається з релізом Python.

<!-- textlint-enable -->
