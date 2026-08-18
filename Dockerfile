# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

ARG B19_GCC_BASE_IMAGE=registry.invalid/b19/gcc-16:latest
ARG B19_UBUNTU_BASE_IMAGE=registry.invalid/b19/ubuntu/resolute:latest
ARG B19_PYTHON_SERIES=3.14

FROM ${B19_GCC_BASE_IMAGE} AS b19-python-builder

ARG B19_COMPILE_CACHE
ARG B19_PYTHON_SERIES
ARG B19_VERBOSITY
ARG CCACHE_REMOTE_STORAGE
ARG LANG
ARG M6E_AI=N
ARG M6E_APT_CACHE_HOST
ARG M6E_APT_CACHE_PORT
ARG M6E_NAMESPACE
ARG M6E_NEAR_CACHE_HOST
ARG M6E_PROJECT
ARG SCCACHE_REDIS_ENDPOINT
ARG TARGETARCH

WORKDIR ${B19_HOME}

USER 0

# Copy dependencies, entrypoint, healthcheck and build scripts
COPY --chown="${B19_UID}:${B19_GID}"                             .container/compile-gcc/        /

RUN --mount=type=bind,from=fetch,source=.,target=/fetch                                             \
    --mount=type=cache,target=${B19_DOWNLOAD_PATH},sharing=shared,uid=${B19_UID},gid=${B19_GID}     \
    --mount=type=cache,target=${B19_COMPILE_CACHE_PATH},sharing=shared                              \
    --mount=type=cache,id=apt-cache-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/cache/apt,sharing=shared       \
    --mount=type=cache,id=apt-lists-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/lib/apt,sharing=shared         \
    --mount=type=tmpfs,target=${B19_TEMP_PATH}                                                      \
    build-stage compile-gcc

# hadolint ignore=DL3066 # B19_UID comes from the root
USER ${B19_UID}

FROM ${B19_UBUNTU_BASE_IMAGE} AS b19-python

ARG B19_PYTHON_SERIES
ARG B19_VERBOSITY
ARG LANG
ARG M6E_AI=N
ARG M6E_APT_CACHE_HOST
ARG M6E_APT_CACHE_PORT
ARG M6E_NAMESPACE
ARG M6E_NEAR_CACHE_HOST
ARG M6E_PROJECT
ARG M6E_VERSION
ARG TARGETARCH
ARG VIRTUAL_ENV="${B19_HOME}/.venv"

ENV B19_PYTHON_SERIES="${B19_PYTHON_SERIES}"      \
    PATH="${VIRTUAL_ENV}/bin:${PATH}"             \
    PYTHONPATH="${VIRTUAL_ENV}"                   \
    UV_COMPILE_BYTECODE=1                         \
    UV_PYTHON="/usr/local/bin/python3"            \
    UV_PYTHON_DOWNLOADS=never                     \
    VIRTUAL_ENV="${VIRTUAL_ENV}"

WORKDIR ${B19_HOME}

USER 0

COPY --chown=${B19_UID}:${B19_GID}  .container/base/    /
COPY --from=b19-python-builder      /export             /

RUN --mount=type=bind,from=fetch,source=.,target=/fetch                                             \
    --mount=type=cache,target=${B19_DOWNLOAD_PATH},sharing=shared,uid=${B19_UID},gid=${B19_GID}     \
    --mount=type=cache,id=apt-cache-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/cache/apt,sharing=shared       \
    --mount=type=cache,id=apt-lists-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/lib/apt,sharing=shared         \
    --mount=type=tmpfs,target=${B19_TEMP_PATH}                                                      \
    build-stage base

# hadolint ignore=DL3066 # B19_UID comes from the root
USER ${B19_UID}

COPY --chown=${B19_UID}:${B19_GID} .container/user/ /

RUN --mount=type=bind,from=fetch,source=.,target=/fetch                                               \
    --mount=type=cache,target=${B19_DOWNLOAD_PATH},sharing=shared,uid=${B19_UID},gid=${B19_GID}       \
    --mount=type=cache,target=${XDG_CACHE_HOME}/pip,sharing=locked,uid=${B19_UID},gid=${B19_GID}      \
    --mount=type=cache,target=${XDG_CACHE_HOME}/uv,sharing=locked,uid=${B19_UID},gid=${B19_GID}       \
    --mount=type=tmpfs,target=${B19_TEMP_PATH}                                                        \
    build-stage user

# ENTRYPOINT ["entrypoint.d"] is inherited
# HEALTHCHECK CMD ["healthcheck.d"] is inherited
# Don't use CMD ["sleep", "infinity"] here
