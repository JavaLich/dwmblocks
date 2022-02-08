black="#1E1D2D"
green="#ABE9B3"
white="#D9E0EE"
grey="#282737"
blue="#96CDFB"
red="#F28FAD"
darkblue="#83bae8"

interval=0

cpu() {
	cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

	printf "^c$white^ ^b$black^ CPU"
	printf "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
	updates=$(sudo xbps-install -un | wc -l) # void
	# updates=$(checkupdates | wc -l)   # arch , needs pacman contrib
	# updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

	if [ -z "$updates" ]; then
		printf "^c$green^  Fully Updated"
	else
		printf "^c$green^  $updates"" updates"
	fi
}

volume() {
    muted=$(pamixer --get-mute)
    check="false"
    if [ "$muted" = "$check" ]; then
        printf "^c$white^ ^b$black^  "
    else
        printf "^c$red^ ^b$black^ ﱝ "
    fi

    printf "^c$white^^b$grey^ $(pamixer --get-volume)"
}

spotify() {
    status=$(playerctl -p spotify status)
    artist=$(playerctl -p spotify metadata artist)
    album=$(playerctl -p spotify metadata album)
    title=$(playerctl -p spotify metadata title)
    length=$(playerctl -p spotify metadata mpris:length | sed 's/.\{6\}$//')

    if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then 
        printf "^c$white^^b$black^  "
        printf "^c$white^^b$grey^ $(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title)"
    else 
        printf ""
    fi
}

battery() {
    is_charging="$(acpi | awk '{print $3}' | awk -F ',' '{print $1}')"
	get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ $is_charging = "Charging" ]; then
        printf "^b$black^^c$green^  "
        printf "^b$grey^^c$green^ $get_capacity%%"
    elif [ $is_charging = "Full" ]; then
        printf "^b$black^^c$blue^  "
        printf "^b$grey^^c$blue^ $get_capacity%%"
    else
        printf "^b$black^^c$white^  "
        printf "^b$grey^^c$white^ $get_capacity%%"
    fi
}

brightness() {
	printf "^c$red^   "
	printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
	printf "^c$white^^b$black^ MEM "
	printf "^c$white^^b$grey^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$green^ ^b$black^ 直 ^b$grey^^c$green^ Connected" ;;
	down) printf "^c$red^ ^b$black^ 睊 ^b$grey^^c$red^ Disconnected" ;;
	esac
	# case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	# up) printf "^c$green^ ^b$black^ 直 ^d^%s" " ^b$grey^^c$blue^Connected" ;;
	# down) printf "^c$red^ ^b$black^ 睊 ^d^%s" " ^b$grey^^c$blue^Disconnected" ;;
	# esac
}

clock() {
	printf "^c$white^^b$black^ $(date '+%b %d (%a) %I:%M%p')  "
}

while true; do
	[ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
	interval=$((interval + 1))

    sleep 1 && xsetroot -name "$(spotify) $(battery)$(cpu) $(mem)$(volume)$(wlan) $(clock)"
done
