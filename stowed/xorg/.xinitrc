#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Here Bspwm is kept as default
session=${2:-gnome-bspwm}

case $session in
  gnome         ) exec dbus-launch --sh-syntax --exit-with-session gnome-session;;
  bspwm         ) exec dbus-launch --sh-syntax --exit-with-session bspwm;;
  gnome-bspwm   ) exec dbus-launch --sh-syntax --exit-with-session gnome-session-bspwm;;
  i3|i3wm       ) exec dbus-launch --sh-syntax --exit-with-session i3;;
  qtile         ) exec dbus-launch --sh-syntax --exit-with-session qtile;;
  openbox       ) exec dbus-launch --sh-syntax --exit-with-session openbox-session;;
  xfce|xfce4    ) exec dbus-launch --sh-syntax --exit-with-session startxfce4;;
  # No known session, try to run it as command
  *             ) exec dbus-launch --sh-syntax --exit-with-session $2;;
esac
