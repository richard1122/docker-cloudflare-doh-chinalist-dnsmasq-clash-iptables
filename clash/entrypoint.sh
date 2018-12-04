#!/bin/sh
dnsIp = $(getent hosts cloudflared | awk '{ print $1 }')

iptables -t nat -N CLASH
iptables -t nat -F CLASH
iptables -t nat -A CLASH -m owner --uid-owner 900 --gid-owner 900 -j RETURN
iptables -t nat -A CLASH -p udp -d ${dnsIp} -j RETURN
iptables -t nat -A CLASH -p udp --dport 53 -j DNAT --to ${dnsIp}:53
iptables -t nat -A CLASH -p tcp -j REDIRECT --to-ports 7892
iptables -t nat -A OUTPUT -j CLASH
iptables -t nat -A PPREROUTINE -j CLASH

exec "$@"