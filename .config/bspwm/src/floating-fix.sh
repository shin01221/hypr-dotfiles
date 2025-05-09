#!/bin/bash

# Get monitor and window info
monitor_json=$(bspc query -T -m focused)
window_json=$(bspc query -T -n focused)

# Parse monitor dimensions
mon_x=$(echo "$monitor_json" | jq '.rectangle.x')
mon_y=$(echo "$monitor_json" | jq '.rectangle.y')
mon_w=$(echo "$monitor_json" | jq '.rectangle.width')
mon_h=$(echo "$monitor_json" | jq '.rectangle.height')

# Parse window dimensions
win_w=$(echo "$window_json" | jq '.rectangle.width')
win_h=$(echo "$window_json" | jq '.rectangle.height')

# Calculate centered position
center_x=$((mon_x + (mon_w - win_w) / 2))
center_y=$((mon_y + (mon_h - win_h) / 2))

# Move window to center (absolute coordinates)
bspc node -v $(($(echo "$window_json" | jq '.rectangle.x') - center_x)) \
	$(($(echo "$window_json" | jq '.rectangle.y') - center_y))
