FROM caddy:2.9-builder@sha256:3f2edfec10ca2baa71333220af869c0c2f6ccdce37ff502542152c2d8f00e05d AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9@sha256:f4f15f3e5e49bdbfdf34a8531d013a3ddf8e2f650978d8b5cdddce3a8ce2bfd4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
