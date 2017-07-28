#!/bin/bash
iptables -t nat -A POSTROUTING -s 172.31.0.2 -j MASQUERADE
ip route del 0/0
ip route add default via 172.32.0.1
while true
do
	sleep 86400
done
