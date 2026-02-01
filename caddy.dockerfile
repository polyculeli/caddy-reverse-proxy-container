FROM caddy:2.11-builder@sha256:4a3be25a74fac19a1345c0f3430bd7b897dbc88177f9581511c302a34ea2c891 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11@sha256:4ad2c913b9e2c3da47f6ce4083fd282689fa86db4fe951f2c490f3bd00e61e98

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
