#!/bin/sh
set -e

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t mangle -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

echo "Iniciando conexión OpenFortiVPN..."
exec openfortivpn -c /etc/openfortivpn/vpn.conf
