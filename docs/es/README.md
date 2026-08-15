<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
pf-cli-managed: yes
-->

<!-- textlint-disable terminology -->

[English](../../README.md) · [Українська](../uk/README.md)

# B19/Python

CPython runtime compiled with PGO and LTO

[![Stand with Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://damian-buho.github.io/support-ukraine/) [![License](https://img.shields.io/static/v1?label=license&message=MIT&color=4c1&style=flat-square)](LICENSE) ![Commit style](https://img.shields.io/static/v1?label=commits&message=conventional&color=blue&style=flat-square) ![Workflow](https://img.shields.io/static/v1?label=workflow&message=git-flow&color=blue&style=flat-square) ![Versioning](https://img.shields.io/static/v1?label=versioning&message=semantic&color=blue&style=flat-square) [![PRs welcome](https://img.shields.io/static/v1?label=PRs&message=welcome&color=4c1&style=flat-square)](CONTRIBUTING.md) [![Citation](https://img.shields.io/static/v1?label=citation&message=cff&color=blue&style=flat-square)](CITATION.cff) [![REUSE compliance](https://api.reuse.software/badge/codeberg.org/b19/python)](https://api.reuse.software/info/codeberg.org/b19/python)

![Project status](https://img.shields.io/static/v1?label=status&message=maintained&color=1d63ed&style=flat-square) [![Last commit](https://img.shields.io/gitea/last-commit/b19/python?gitea_url=https://codeberg.org&style=flat-square)](https://codeberg.org/b19/python)

[![Build status on kiota.ch](https://kiota.ch/b19/python/badges/workflows/published.yaml/badge.svg)](https://kiota.ch/b19/python/actions)

## Características

- CPython compiled from source with PGO and LTO
- Pre-activated venv with uv integration
- Persistent APT cache across builds
- Service process management with log routing (b19-exec)
- Cached artifact downloads with integrity verification (b19-fetch)
- Timed command execution with failure reporting (b19-run)
- Run-once initialization (bootstrap.d)
- Modular build hooks (build.d)
- Automatic CPU count detection (NUMPROCS)
- Declarative dependency management (b19-deps)
- Pluggable startup system (entrypoint.d)
- Feature toggles for all subsystems
- Built-in health monitoring (healthcheck.d)
- Multilingual shell output (b19-i18n)
- Image lineage tracking
- Structured, level-filtered logging (b19-log)
- Non-root container by default
- Air-gapped / offline build and runtime support
- Runtime overlay injection
- Reproducible base image (pinned by digest)
- Port validation
- Unified lifecycle runner family
- Docker secrets auto-loading (secrets)
- Interactive shell hooks (shell.d)
- Graceful signal handling
- Jinja2 configuration templates (minijinja-cli)
- Built-in test framework (test.d)
- Pre-installed utility tools
- XDG Base Directory paths

Consulta [FEATURES.md](../../FEATURES.md) para ver la lista completa.

## Qué entrega este proyecto

- **Imagen de contenedor** `ghcr.io/damian-buho/b19/python-3.12:latest`
- **Imagen de contenedor** `ghcr.io/damian-buho/b19/python-3.13:latest`
- **Imagen de contenedor** `ghcr.io/damian-buho/b19/python-3.14:latest`
- **Imagen de contenedor** `docker.io/damianbuho/b19-python-3.12:latest`
- **Imagen de contenedor** `docker.io/damianbuho/b19-python-3.13:latest`
- **Imagen de contenedor** `docker.io/damianbuho/b19-python-3.14:latest`

## Instalación

Descarga la imagen de contenedor publicada:

```sh
docker pull ghcr.io/damian-buho/b19/python-3.12:latest
```

Variantes disponibles: B19_PYTHON_SERIES: 3.12, 3.13, 3.14

```sh
docker pull ghcr.io/damian-buho/b19/python-3.13:latest
docker pull ghcr.io/damian-buho/b19/python-3.14:latest
docker pull docker.io/damianbuho/b19-python-3.12:latest
docker pull docker.io/damianbuho/b19-python-3.13:latest
docker pull docker.io/damianbuho/b19-python-3.14:latest
```

Si los registros anteriores no están disponibles, descarga desde el origen:

```sh
docker pull kiota.ch/b19/python-3.12:latest
```

Variantes disponibles: B19_PYTHON_SERIES: 3.12, 3.13, 3.14

```sh
docker pull kiota.ch/b19/python-3.13:latest
docker pull kiota.ch/b19/python-3.14:latest
```

## Uso

Construye sobre esta imagen:

```dockerfile
FROM ghcr.io/damian-buho/b19/python-3.12:latest
```

Variantes disponibles: B19_PYTHON_SERIES: 3.12, 3.13, 3.14

```dockerfile
FROM ghcr.io/damian-buho/b19/python-3.13:latest
FROM ghcr.io/damian-buho/b19/python-3.14:latest
FROM docker.io/damianbuho/b19-python-3.12:latest
FROM docker.io/damianbuho/b19-python-3.13:latest
FROM docker.io/damianbuho/b19-python-3.14:latest
```

Para el patrón multietapa recomendado y el sistema de hooks de compilación (build.d), genera un derivado con `b19/scripts/scaffold.sh` de [m6e/b19](https://kiota.ch/m6e/b19).

## Compilación

- [Referencia del Makefile](../MAKEFILE.md)

Puntos de entrada de la canalización:

- `make analyze` — Run the heavy analysis sweep (mutation testing, benchmarks)
- `make audited` — Re-scan the pinned dependencies and published artifacts for new vulnerabilities
- `make check-outdated` — Report every pinned dependency that lags upstream
- `make ready-to-publish` — Run the pseudo-CI pipeline locally — build, test and scan, without publishing

Ejecuta `make` sin argumentos para el destino predeterminado; ejecuta `make help` para listar todos los destinos.

Para el bucle de desarrollo local, `make dev-container` levanta el dev-container.

## Políticas

- [Cómo contribuir](CONTRIBUTING.md)
- [Política de seguridad](SECURITY.md)
- [Cómo obtener ayuda](SUPPORT.md)
- [Código de conducta](CODE_OF_CONDUCT.md)

## Enlaces

- [Especificación de Projectfile](https://projectfile.org)
- [B19/Python on Codeberg](https://codeberg.org/b19/python)
- [B19/Python on GitHub](https://github.com/damian-buho/b19-python)
- [B19/Python on kiota.ch](https://kiota.ch/b19/python)
- [Issues on Codeberg](https://codeberg.org/b19/python/issues)
- [Issues on GitHub](https://github.com/damian-buho/b19-python/issues)
- [Packages on PyPI](https://pypi.org/project/python/)

## Licencia

Este proyecto se publica bajo la licencia MIT — consulta el archivo [LICENSE](LICENSE) para más detalles.

*Generado desde projectfile ([saber cómo](https://projectfile.org/how-to/readme))*
<!-- textlint-enable -->
