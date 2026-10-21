<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Одне сховище довіри для всіх TLS-клієнтів Python

- `ssl`, `requests` і `httpx` перевіряють сертифікати за системним сховищем через `SSL_CERT_FILE` і `REQUESTS_CA_BUNDLE`, тож кореневий сертифікат, вилучений там, вилучається і для них.
- Кожен набір `certifi` в образі, зокрема вбудована в pip копія, урізається списком недовіри b19 під час збирання, ще до нового випуску pip або certifi.
- Пакети, встановлені на похідному етапі користувача, урізаються так само.
- `B19_CA_DISTRUST_ENABLED=false` залишає набори в первісному вигляді.

<!-- textlint-enable -->
