. ~/.dwm/colors.sh

is_charging="$(acpi | awk '{print $3}' | awk -F ',' '{print $1}')"
get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
if [ $is_charging = "Charging" ]; then
    printf "^b$black^^c$green^  ^b$black^^c$green^$get_capacity%%"
elif [ $is_charging = "Full" ]; then
    printf "^b$black^^c$blue^  ^b$black^^c$blue^$get_capacity%%"
else
    printf "^b$black^^c$white^  ^b$black^^c$white^$get_capacity%%"
fi
