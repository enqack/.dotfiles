export PANEL_FIFO="/tmp/panel-fifo"
#export PATH=$PATH:/path/to/panel/scripts
PANEL_HEIGHT=24
PANEL_FONT_FAMILY="-*-terminus-medium-r-normal-*-12-*-*-*-c-*-*-1"
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT_FAMILY

if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep X || startx "${XDG_CONFIG_HOME}/X11/xinitrc"
fi
