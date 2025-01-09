FROM caddy:2.9-builder@sha256:1eb5d03c583abc500bf21b9ba6d9e426de6d3544ec91ff8bf757a9a1ed280fa4 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:2aca9e451b0801901ef2066e872f55219dcfabd87587a769c9227f2eb0ab8a33

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
