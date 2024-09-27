#!/bin/bash

# almost=$(mpc --format %file%)

# echo "$almost" >>/media/Music/some_stuff.txt
#name=$(head -n 1 /home/apple/Music/some_stuff.txt)
name=$(mpc --format %file% | head -n 1)

# rm /home/apple/Music/some_stuff.txt

ffmpeg -i "/media/Music/$name" /media/Music/image.jpg

imv /media/Music/image.jpg

rm /media/Music/image.jpg
