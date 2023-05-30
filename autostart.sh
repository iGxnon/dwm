# fix java application GUI
wmname LG3D

arr=("fcitx5" "~/.dwm/bin/feh-bg.sh" "cfw" "picom" "dunst")

for value in ${arr[@]}; do
    if [[ ! $(pgrep ${value}) ]]; then
        exec "$value" &
    fi
done


