FROM caddy:2.9-builder@sha256:f038afccfd7e7c0e66c6b3bfd46870bfab330859536c62167e3c34157be72f4e AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:7f0336b2c9930a6d84529303563d65880072938c538a9a7713dbffa0f876c951

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
