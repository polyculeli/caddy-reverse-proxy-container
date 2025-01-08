FROM caddy:2.9-builder@sha256:4b637e55e9d9c1e93d321bbf4ba7c88542f0e9760ab3c553e189a1d641b5ce89 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:b6a227acd28adab47f7976208c42e145dbc3d78c01543c554e918cc23f2d3849

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
