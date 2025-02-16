FROM caddy:2.9-builder@sha256:4acea926083a7bc7a4aca4250cec68c9dd6d4a6dc66c6ca8e26ceb1041bca86a AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:1c4bc9ead95a0888f1eea3a56ef79f30bd0d271229828fdd25090d898f553571

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
