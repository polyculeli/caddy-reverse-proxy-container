FROM caddy:2.9-builder@sha256:4b637e55e9d9c1e93d321bbf4ba7c88542f0e9760ab3c553e189a1d641b5ce89 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:0cf0b981b75fa9a0600317712be658614383f6235e0fac272f5a114bd971b22f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
