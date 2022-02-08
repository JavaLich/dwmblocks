. ~/.dwm/colors.sh

status=$(playerctl -p spotify status)
artist=$(playerctl -p spotify metadata artist)
album=$(playerctl -p spotify metadata album)
title=$(playerctl -p spotify metadata title)
length=$(playerctl -p spotify metadata mpris:length | sed 's/.\{6\}$//')

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then 
    printf "^c$white^^b$grey^  $(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title) "
else 
    printf ""
fi
