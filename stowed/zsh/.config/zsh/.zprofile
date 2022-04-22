#!/bin/sh

if [[ "$(tty)" == "/dev/tty1" ]]; then
  pgrep X || sxa
fi
