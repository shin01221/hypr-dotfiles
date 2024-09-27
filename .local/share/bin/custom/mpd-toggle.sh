#!/bin/bash
flag=/home/shin/.config/hypr/mpd-toggle/flag.txt
if [ $(cat $flag) -eq 1 ]; then
	echo 0 >$flag
	pkill mpd
else
	echo 1 >$flag
	systemctl --now --user start mpd-mpris
fi
