#!/bin/sh

BAT_PATH=/sys/class/power_supply/BAT1

update_vol() {
  VOL=$(pamixer --get-volume-human)
}

update_bat() {
  BAT_CAP=$(cat $BAT_PATH/capacity)
  BAT_STA=$(cat $BAT_PATH/status)
}

update_date() {
  DATE=$(date +"%x %a %H:%M:%S" | awk '{gsub(/ /,",")}1')
}

update_light() {
  LIGHT=$(light -G)
}

update_wifi() {
  if [ "$(nmcli radio wifi)" == "enabled" ]
  then
    WIFI="󰖩 $(nmcli -t -f active,ssid dev wifi | grep -E '^yes' | cut -d: -f2)"
  else
    WIFI="󰖪 "
  fi
}

display() {
  xsetroot -name "[ $LIGHT] [󰕾 $VOL] [$WIFI] [󱊣 $BAT_CAP%,$BAT_STA] [$DATE]"
}

while true; do
  update_vol
  update_bat
  update_date
  update_light
  update_wifi
  display
  sleep 1
done
