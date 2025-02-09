#!/bin/bash

THEME_DIR="$HOME/.config/kitty/themes"
# TARGET_THEME="$HOME/.config/kitty/rof-theme.conf"
ROFI_THEME="$HOME/.config/rofi/styles/kitty-theme.rasi"

# Get list of themes without .conf extension

THEMES=$(ls "$THEME_DIR"/*.conf | xargs -n 1 basename | sed 's/\.conf$//')

# Show rofi menu with custom style
CHOSEN_THEME=$(echo "$THEMES" | rofi -dmenu -p "Choose a Kitty Theme" -theme "$ROFI_THEME")

# If a theme is selected
if [[ -n "$CHOSEN_THEME" ]]; then
    # Copy selected theme to active config
    cp "$THEME_DIR/$CHOSEN_THEME.conf" "$HOME/.config/kitty/theme.conf"

    # Apply new theme to all running Kitty instances
    kitty @ set-colors --all "$HOME/.config/kitty/theme.conf"

    # Send SIGUSR1 to all Kitty instances to force reload config
    pkill -USR1 kitty
fi
