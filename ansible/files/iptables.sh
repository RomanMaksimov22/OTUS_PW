#!/bin/bash
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.1.102 --dport 10050 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.1.63 --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.168.1.102 --dport 10050 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.168.1.79 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.168.1.79 --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.168.1.53 --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp -d 192.168.1.53 --dport 443 -j ACCEPT
