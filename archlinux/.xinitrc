#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

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
# export TERMINAL=konsole

# add ~/bin to PATH
PATH=$PATH:~/bin

# xterm settings
[[ -f ~/.Xresources ]] && xrdb  ~/.Xresources
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
# exec startkde
# exec openbox-kde-session
# exec awesome
# multiple DE ou WM
# Here i3 is kept as default

session=${1:-i3}

case $session in 
	i3|i3wm 	) exec i3;;
	kde 		) exec startkde;;
	# No known session, try to run it as command
	*) exec $1;;
esac	

# avoid PulseAudio overwrite ALSA
restore_alsa() {
 while [ -z "$(pidof pulseaudio)" ]; do
  sleep 0.5
 done
 alsactl -f /var/lib/alsa/asound.state restore 
}
restore_alsa &

