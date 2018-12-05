#!/bin/sh
iptables -t nat -D PREROUTING -j CLASH
iptables -t nat -D OUTPUT CLASH_OUTPUT

iptables -t nat -N CLASH
iptables -t nat -F CLASH
iptables -t nat -A CLASH -p tcp -j REDIRECT --to-ports 7892
iptables -t nat -A CLASH -p udp --dport 53 ! -d 114.114.115.115 -j DNAT --to 127.0.0.1:5300
iptables -t nat -A PREROUTING -j CLASH

iptables -t nat -N CLASH_OUTPUT
iptables -t nat -F CLASH_OUTPUT
iptables -t nat -A CLASH_OUTPUT -m owner --uid-owner 900 --gid-owner 900 -j RETURN
iptables -t nat -A CLASH_OUTPUT -j CLASH
iptables -t nat -A OUTPUT -j CLASH_OUTPUT

exec "$@"
