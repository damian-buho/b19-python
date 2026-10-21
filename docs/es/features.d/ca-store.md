<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Un solo almacén de confianza para todos los clientes TLS de Python

- `ssl`, `requests` y `httpx` verifican contra el almacén del sistema mediante `SSL_CERT_FILE` y `REQUESTS_CA_BUNDLE`, así que una raíz eliminada allí también se elimina para ellos.
- Cada paquete `certifi` de la imagen, incluida la copia integrada en pip, se recorta con la lista de desconfianza de b19 durante la construcción, antes de una nueva versión de pip o certifi.
- Los paquetes instalados en una etapa de usuario derivada se recortan igual.
- `B19_CA_DISTRUST_ENABLED=false` deja los paquetes tal como se distribuyen.

<!-- textlint-enable -->
