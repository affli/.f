#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/local/etc/X11/xinit/.Xresources
sysmodmap=/usr/local/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /usr/local/etc/X11/xinit/xinitrc.d ] ; then
        for f in /usr/local/etc/X11/xinit/xinitrc.d/?*.sh ; do
                [ -x "$f" ] && . "$f"
        done
        unset f
fi

#while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
#	do
#		sleep 1
#done &
export LANG=en_US.UTF-8
export TERM=urxvtcd
export QT_QPA_PLATFORMTHEME=qt5ct
export MOZ_USE_OMTC=1

setxkbmap -layout us,ru -variant ,winkeys -option grp:caps_toggle &
urxvtd -q -f -o &
$HOME/.fehbg &
compton -cCfGb --detect-rounded-corners --vsync opengl-swc --sw-opti --paint-on-overlay --xinerama-shadow-crop --backend xr_glx_hybrid --glx-no-stencil --glx-use-copysubbuffermesa --xrender-sync &
exec $1
