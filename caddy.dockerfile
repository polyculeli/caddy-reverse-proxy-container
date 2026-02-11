FROM caddy:2.11-builder@sha256:9908dbf7ef6cd7ffdd16d33cf1965445b500ea8ef1ab037e66479c05422acff2 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11@sha256:25da65f8637ef995bb7febf549b48b87e631e491f06dd20fe11f8f75924ae619

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
