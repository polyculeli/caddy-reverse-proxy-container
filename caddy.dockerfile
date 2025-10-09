FROM caddy:2.10-builder@sha256:8b4ef1aecb03330cf0532b2785a8f0807d0d1c87127054e533ad25b75df3c224 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:2.10@sha256:a41a9b42b2a0a9d47f7c8b84a42485649442cc490c51264811150d447a331c56

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
