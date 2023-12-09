#!/bin/sh
# shellcheck disable=3020

# echo "%{F#7dcfff} %{F#a9b1d6}$(/usr/sbin/ifconfig wlp0s20f3 | grep "inet " | awk '{print $2}')%{u-}"

interface="wlp0s20f3"
interfazmon="wlp0s20f3mon"
iconoEthernet="%{F#7dcfff} %{F#a9b1d6}"

# Verificar si la interfaz está presente
if /usr/sbin/ifconfig "$interface" &> /dev/null; then
    ip_address=$(/usr/sbin/ifconfig "$interface" | grep "inet " | awk '{print $2}')
    echo "$iconoEthernet$ip_address%{u-}"
elif
     /usr/sbin/ifconfig "$interfazmon" &> /dev/null; then
        ip_address=$(/usr/sbin/ifconfig "$interfazmon")
        echo " $iconoEthernet modo monitor "
    else
        echo "$iconoEthernet Internet N/A"
fi
