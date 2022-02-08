. ~/.dwm/colors.sh

muted=$(pamixer --get-mute)
check="false"
if [ "$muted" = "$check" ]; then
    printf "^c$white^^b$grey^  $(pamixer --get-volume)"
else
    printf "^c$red^^b$grey^  ^c$white^^b$grey^$(pamixer --get-volume)"
fi
