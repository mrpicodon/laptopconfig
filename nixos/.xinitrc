#!/bin/sh
#
# ~/.xinitrc
# Chih-Kang Huang
# Executed by startx (run your window manager from here)
# 26/02/2015

if [ -d /etc/X11/xinit/xinitrc.d ]; then
for f in /etc/X11/xinit/xinitrc.d/*; do
[ -x "$f" ] && . "$f"
done
unset f
fi

# Ibus Input methode in libreoffice
ibus-daemon --xim -dr

# Ibus Input methode
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# disable touchpad for 1 secs while typing
syndaemon -d -k -i 1

# Define Default graphical terminal
export TERMINAL=urxvt

# xterm and rxvt-unicode settings
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
