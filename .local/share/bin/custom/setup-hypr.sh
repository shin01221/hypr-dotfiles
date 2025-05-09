#!/bin/bash

sed -i '/^[[:space:]]*include[[:space:]]\+current-theme\.conf/s/^/#/' ~/.config/kitty/kitty.conf
mv ~/.config/kitty/theme.conf-bu ~/.config/kitty/theme.conf
