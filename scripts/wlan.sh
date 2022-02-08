. ~/.dwm/colors.sh

case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
up) printf "^c$green^ ^b$black^ 直 Connected " ;;
down) printf "^c$red^ ^b$black^ 睊 Disconnected " ;;
esac
