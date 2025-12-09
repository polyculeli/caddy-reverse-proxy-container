FROM caddy:2.11-builder@sha256:a712bd699e6c4432caa767e1998e3ffb12856dcb48fd8f5af619b73fd9a6a911 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11@sha256:521cf769812c9fd36cce079784f25f544b9213dbe35676f08518adc61ee03102

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
