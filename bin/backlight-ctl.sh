#!/bin/sh


back_light_up () {
	light -A 1
}

back_light_down () {
	light -U 1
}

[ $1 == '+' ] && back_light_up
[ $1 == '-' ] && back_light_down

kill -35 "$(cat /home/igxnon/.cache/pidofbar)"
