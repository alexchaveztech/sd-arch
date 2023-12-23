#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Hibernate\n  Log Out\n  Lock" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Suspend") systemctl suspend-then-hibernate ;;
	"  Hibernate") systemctl hibernate ;;
	"  Log Out") i3-msg exit ;;
	"  Lock") i3lock -i /usr/share/backgrounds/f38/default/f38-00-day.png ;;
	*) exit 1 ;;
esac
