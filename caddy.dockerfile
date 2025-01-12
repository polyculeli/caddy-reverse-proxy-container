FROM caddy:2.9-builder@sha256:3e225bb553d4a38be7a952d007da2ee78c4567b5b4380592041325446eb37420 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:1dcb36cce561aaa09a706ed413dcf66e3fb2c9714ac68b30d635e761da207855

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
