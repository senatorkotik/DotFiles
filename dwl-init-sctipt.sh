#!/bin/sh

#Environment
export XDG_RUNTIME_DIR=/run/user/1000
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark
#export XKB_DEFAULT_LAYOUT="us,ru"
#export XKB_DEFAULT_OPTIONS="grp:ctrl_shift_toggle"

#Audio system
pipewire &
pipewire-pulse &
wireplumber &

#Language
#setxkbmap -layout us,ru -option grp:alt_shift_toggle

#Status Bar
someblocks -p | dwlb -status-stdin all

do=true
while $do || [ -f /tmp/restart_dwl ]; do
	do=false
	rm -rf /tmp/restart_dwl > /dev/null 2>&1
	dwl
done
