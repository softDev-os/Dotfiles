#!/bin/sh
# shellcheck disable=2002,2046

ip_target=$(cat ~/.config/bin/target | awk '{print $1}')
name_target=$(cat ~/.config/bin/target | awk '{print $2}')

if [ "$ip_target" ] && [ "$name_target" ]; then
	echo "%{F#e53935}什%{F#a9b1d6} $ip_target %{F#cf9fff}/%{F#a9b1d6} $name_target"
elif [ $(cat ~/.config/bin/target | wc -w) -eq 1 ]; then
	echo "%{F#e53935}什%{F#a9b1d6} $ip_target"
else
	echo "%{F#cf9fff}ﲅ %{u-}%{F#a9b1d6} No target"
fi
