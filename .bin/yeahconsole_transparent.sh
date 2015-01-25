#!/bin/sh

# taken from http://ubuntuforums.org/showthread.php?t=1051300

# start yeahconsole
yeahconsole &

# wait a little until all the windows are created
sleep 1

# get yeahconsole window id
id=$(xwininfo -root -tree | grep yeahconsole -B 2 | head -1 | perl -p -e 's/^ *(0x.*?) .*$/$1/g')

# make transparent!
# value is between 0 (invisible) and 2^32 (fully opaque)
xprop -id "$id" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY 3994967296 
