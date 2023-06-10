# fix java application GUI
wmname LG3D

arr=("fcitx5" "~/.dwm/scripts/feh-bg.sh" "~/.dwm/scripts/bar.sh" "cfw" "picom" "dunst")

for value in ${arr[@]}; do
    if [[ ! $(pgrep ${value}) ]]; then
        exec "$value" &
    fi
done


