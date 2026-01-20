FROM caddy:2.11-builder@sha256:d69b881a45e9778ef5a5a664ec5325fc707db8bc36f6a3a321590133164ea24b AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11@sha256:5d29d148689099b601ba78e37c5c9626008964fb573942524e656ca098011fe1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
