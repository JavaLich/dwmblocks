. ~/.dwm/colors.sh

cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

printf "^c$white^ ^b$grey^ CPU $cpu_val "
