FROM caddy:2.11-builder@sha256:98f589ee9c60fee6bbb45c1ded7f6f3838c07ef0095838222b65b198608573f0 AS builder

RUN xcaddy build \
    # We need this for our wildcard certificate
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:2.11@sha256:ab7fee37306738d197c627fe4ef40968bc085d0de28aae43cfa5273556d8445f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
