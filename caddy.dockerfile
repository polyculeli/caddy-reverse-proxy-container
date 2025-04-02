FROM caddy:2.9-builder@sha256:2223a2b14c52cd3d6054cbb97b14d57e9ae6b06d5fe3f72102bd50be01adca88 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:cd261fc62394f1ff0b44f16eb1d202b4e71d5365c9ec866a4f1a9c5a52da9352

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
