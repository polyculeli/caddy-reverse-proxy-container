FROM caddy:2.9-builder@sha256:f038afccfd7e7c0e66c6b3bfd46870bfab330859536c62167e3c34157be72f4e AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:1dcb36cce561aaa09a706ed413dcf66e3fb2c9714ac68b30d635e761da207855

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
