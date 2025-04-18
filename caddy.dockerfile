FROM caddy:2.9-builder@sha256:84c64e5704f0b7366f0721cd9f5e6be155e824126dd12fe3f0fd7d6ea996b78b AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:1972548f05660a069cfdf052aa2b923ce691627cbad1b7b97fb0a18533a766f2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
