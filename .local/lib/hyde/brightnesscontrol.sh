#!/usr/bin/env bash

scrDir=$(dirname "$(realpath "$0")")
# shellcheck disable=SC1091
source "$scrDir/globalcontrol.sh"

# Check if SwayOSD is installed
use_swayosd=false
isNotify=${BRIGHTNESS_NOTIFY:-true}
if command -v swayosd-client >/dev/null 2>&1 && pgrep -x swayosd-server >/dev/null; then
	use_swayosd=true
fi

print_error() {
	local cmd
	cmd=$(basename "$0")
	cat <<EOF
    "${cmd}" <action> [step]
    ...valid actions are...
        i -- <i>ncrease brightness [+5%]
        d -- <d>ecrease brightness [-5%]

    Example:
        "${cmd}" i 10    # Increase brightness by 10%
        "${cmd}" d       # Decrease brightness by default step (5%)
EOF
}

send_notification() {
	brightness=$(light -G | cut -d. -f1)
	angle="$((((brightness + 2) / 5) * 5))"
	ico="${iconsDir}/Wallbash-Icon/media/knob-${angle}.svg"
	bar=$(seq -s "." $((brightness / 15)) | sed 's/[0-9]//g')
	[[ "${isNotify}" == true ]] && notify-send -a "HyDE Notify" -r 7 -t 800 -i "${ico}" "${brightness}${bar}" "Display Backlight"
}

get_brightness() {
	light -G | cut -d. -f1
}

step=${BRIGHTNESS_STEPS:-5}
step="${2:-$step}"

case $1 in
i | -i) # increase the backlight
	if [[ $(get_brightness) -lt 10 ]]; then
		step=1
	fi

	$use_swayosd && swayosd-client --brightness raise "$step" && exit 0
	light -A "$step"
	send_notification
	;;
d | -d) # decrease the backlight
	if [[ $(get_brightness) -le 10 ]]; then
		step=1
	fi

	if [[ $(get_brightness) -le 1 ]]; then
		light -S "$step"
		$use_swayosd && exit 0
	else
		$use_swayosd && swayosd-client --brightness lower "$step" && exit 0
		light -U "$step"
	fi

	send_notification
	;;
*) # print error
	print_error ;;
esac
