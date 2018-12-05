#!/bin/sh
exec dnsmasq --conf-dir=/etc/dnsmasq.d/ \
    --cache-size=25000 \
    --server="$(getent hosts cloudflared | awk '{ print $1 }')#5300" \
    --keep-in-foreground \
    --log-facility=/dev/stdout \
    --no-resolv \
    --log-queries \
    --port=5300 \
    --user=root
