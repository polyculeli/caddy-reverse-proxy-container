FROM caddy:2.9-builder@sha256:b498d7800b72667c072267e135e1f64ea4d2f2b80a90b008d82df3938f3239e1 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:b6a227acd28adab47f7976208c42e145dbc3d78c01543c554e918cc23f2d3849

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
