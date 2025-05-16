#!/bin/bash

# Theme directory
THEME_DIR="$HOME/.config/kitty/themes"

# Get list of theme files, remove .conf extension
THEMES=$(ls "$THEME_DIR"/*.conf | xargs -n 1 basename | sed 's/\.conf$//')

# Show Rofi menu and let user pick a theme
CHOSEN_THEME=$(echo -e "$THEMES" | rofi -dmenu -p "Choose Kitty Theme")

# If user selected a theme
if [[ -n "$CHOSEN_THEME" ]]; then
    # Copy selected theme to active config
    cp "$THEME_DIR/$CHOSEN_THEME.conf" "$HOME/.config/kitty/rof-theme.conf"

    # Apply new theme to all running Kitty instances
    kitty @ set-colors --all "$HOME/.config/kitty/rof-theme.conf"

    # Send SIGUSR1 to all Kitty instances to force reload config
    pkill -USR1 kitty
fi
