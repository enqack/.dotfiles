#!/bin/sh

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep X || startx "${XDG_CONFIG_HOME}/X11/xinitrc"
fi
