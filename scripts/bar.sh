#!/bin/sh

BAT_PATH=/sys/class/power_supply/BAT1

while true; do
	xsetroot -name "[Light $(light -G)] [Vol $(pamixer --get-volume-human)] [Bat $(cat $BAT_PATH/capacity) $(cat $BAT_PATH/status)] [$(date +"%x %a %H:%M:%S")]"
	sleep 1
done
