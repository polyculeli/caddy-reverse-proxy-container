FROM caddy:2.9-builder@sha256:57f45106467c6368822bf1bd20b335b3c41102212d350e813a691f8978151814 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:262e1d7bb9d6fb55a7310a9365213a73365dcdea90380eb601d33d8b3964fcea

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
