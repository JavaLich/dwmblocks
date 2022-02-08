. ~/.dwm/colors.sh

printf "^c$white^^b$black^ MEM $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g) "
