#!/bin/sh

echo "%{F#7dcfff} %{F#a9b1d6}$(/usr/sbin/ifconfig wlp0s20f3 | grep "inet " | awk '{print $2}')%{u-}"
