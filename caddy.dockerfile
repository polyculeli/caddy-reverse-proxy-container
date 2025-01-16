FROM caddy:2.9-builder@sha256:239705a85d233905863a8e8a42035e5501e17dbc1264d70701d9101f8b8f3764 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:7f0336b2c9930a6d84529303563d65880072938c538a9a7713dbffa0f876c951

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
