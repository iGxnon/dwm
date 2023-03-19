#!/bin/sh

vol_up () {
	amixer -q sset Master,0 1+ unmute
}

vol_down () {
	amixer -q sset Master,0 1- unmute
}

vol_toggle() {
	amixer -q sset Master,0 toggle
}

[ $1 == '+' ] && vol_up
[ $1 == '-' ] && vol_down
[ $1 == 't' ] && vol_toggle

kill -34 "$(cat /home/igxnon/.cache/pidofbar)"
