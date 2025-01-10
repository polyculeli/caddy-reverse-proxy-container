FROM caddy:2.9-builder@sha256:f038afccfd7e7c0e66c6b3bfd46870bfab330859536c62167e3c34157be72f4e AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:0cf0b981b75fa9a0600317712be658614383f6235e0fac272f5a114bd971b22f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
