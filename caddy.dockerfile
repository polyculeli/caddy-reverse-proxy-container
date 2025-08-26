FROM caddy:2.10-builder@sha256:38708d13dba3aafb83ed97d8b1f9ed00823a6d0eb63de314945a55ada80db2d8 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10@sha256:73ba793f1b2355cfefe2a7ec53ac2f2db0531bf52679deaf16df087fd35ce4ea

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
