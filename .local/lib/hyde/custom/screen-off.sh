#!/bin/bash
swayidle -w \
    timeout 800 'hyprctl dispatch dpms off' \
    resume 'hyprctl dispatch dpms on'
# timeout 600 'swaylock' \ to lock screen after certain time
# timeout 3600 'systemctl suspend'   to add suspend after certain time
