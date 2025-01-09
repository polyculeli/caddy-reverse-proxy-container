FROM caddy:2.9-builder@sha256:1eb5d03c583abc500bf21b9ba6d9e426de6d3544ec91ff8bf757a9a1ed280fa4 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:1dcb36cce561aaa09a706ed413dcf66e3fb2c9714ac68b30d635e761da207855

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
