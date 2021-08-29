typeset -U PATH path

export PATH="$PATH:$HOME/.scripts"

# set GOPATH
export GOPATH="$HOME/Projects/go"

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Fixing Paths
export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"
export XSERVERRC="${XDG_CONFIG_HOME}/X11/xserverrc"
export ZDOTDIR="${HOME}/.config/zsh"
export GEM_PATH="${XDG_DATA_HOME}/ruby/gems"
export GEM_SPEC_CACHE="${XDG_DATA_HOME}/ruby/specs"
export GEM_HOME="${XDG_DATA_HOME}/ruby/gems"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export GOPATH="${XDG_DATA_HOME}/go"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/ripgrep/ripgreprc"
export VSCODE_PORTABLE="${XDG_DATA_HOME}/vscode"
export VIMINIT=":source ${XDG_CONFIG_HOME}/vim/vimrc"
