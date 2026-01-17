FROM caddy:2.11-builder@sha256:7b5e2e75ff17855146b43b35f42dc9848ace87c19d1a8f9ee9e1f523307d2840 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11@sha256:25a1816bb35dab1b7a7c256455c3decb3e390f98f6e8a198be482d567b656d96

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
