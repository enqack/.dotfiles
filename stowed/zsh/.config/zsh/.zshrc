#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|
#


# Enable colors
autoload -U colors && colors
export TERM="xterm-256color"

# Enable vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr '!'
zstyle ':vcs_info:*' unstagedstr '?'
zstyle ':vcs_info:git*' formats "%B%{$fg[red]%}{ %{$fg[blue]%}%b%{$reset_color%} %m%u%c%{$fg[red]%}%B}"

function precmd {
  vcs_info
}

function get_start_time() {
  cmd_timer=$(date +%s%3N)
}

function calc_exec_time() {
  if [ $cmd_timer ]; then
    local now=$(date +%s%3N)
    local d_ms=$(($now - $cmd_timer))
    local d_s=$((d_ms / 1000))
    local ms=$((d_ms % 1000))
    local s=$((d_s % 60))
    local m=$(((d_s / 60) % 60))
    local h=$((d_s / 3600))

    if ((h > 0)); then elapsed=${h}h${m}m
    elif ((m > 0)); then elapsed=${m}m${s}s
    elif ((s >= 10)); then elapsed=${s}.$((ms / 100))s
    elif ((s > 0)); then elapsed=${s}.$((ms / 10))s
    else elapsed=${ms}ms
    fi

    unset cmd_timer
  else
    elapsed=0
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec get_start_time
add-zsh-hook precmd calc_exec_time

setopt prompt_subst
PROMPT='%B%{$fg[red]%}[%{$fg[green]%}%D %T%{$fg[red]%}][%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]${vcs_info_msg_0_}%b
%{$fg[yellow]%}(rc: %? et: ${elapsed} )%{$reset_color%}'

if [[ $USER == 'root' ]]; then
    PROMPT="$PROMPT # "
else
    PROMPT="$PROMPT $ "
fi

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$XDG_DATA_HOME/zsh/history

# Mail notification
MAILCHECK=1
MAILPATH=$HOME/.maildir
autoload checkmail

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select cache-path ${XDG_CACHE_HOME}/zsh/zcompcache
zmodload zsh/complist
compinit -d ${XDG_CACHE_HOME}/zsh/zcompdump
_comp_options+=(globdots)               # Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=5

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Home and end key binding
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent
[ -f "$HOME/.config/zsh/shortcutrc" ] && source "$HOME/.config/zsh/shortcutrc"
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"

# Load zsh-syntax-highlighting settings
[ -f "$HOME/.config/zsh/highlightingrc" ] && source "$HOME/.config/zsh/highlightingrc"

# Load zsh-autosuggestions if existent
[ -f "/usr/share/zsh/site-functions/zsh-autosuggestions.zsh" ] && source "/usr/share/zsh/site-functions/zsh-autosuggestions.zsh"

# Load zsh-autosuggestions settings
[ -f "$HOME/.config/zsh/autosuggestionsrc" ] && source "$HOME/.config/zsh/autosuggestionsrc"

