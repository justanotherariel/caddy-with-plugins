FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@v0.2.4 \
    --with github.com/WeidiDeng/caddy-cloudflare-ip@f53b62aa13cb \
    --with github.com/mholt/caddy-dynamicdns@1af4f8876598 \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@v0.11.0 \
    --with github.com/porech/caddy-maxmind-geolocation@v1.0.3

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
