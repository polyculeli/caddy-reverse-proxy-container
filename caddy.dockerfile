FROM caddy:2.11-builder@sha256:6b36efcd202338aa98f877cff3df057b33a9aa913ea5696d96496788a6903e50 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11@sha256:26cea62459fa0ed89980992b758c76273e08928f819fd40a3791a60276489d1b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
