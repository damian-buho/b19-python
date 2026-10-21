<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# One certificate trust store for every Python TLS client

- `ssl`, `requests` and `httpx` verify against the system store through `SSL_CERT_FILE` and `REQUESTS_CA_BUNDLE`, so a root removed there is removed for them too.
- Every `certifi` bundle in the image, pip’s vendored copy included, is cut from the b19 distrust list at build time, ahead of a new pip or certifi release.
- Packages installed in a downstream user stage are cut the same way.
- `B19_CA_DISTRUST_ENABLED=false` leaves the bundles as shipped.
