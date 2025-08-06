OS_NAME="$(uname -s)"

# keybind
# emacs style keybind
bindkey -e
if [ "${OS_NAME}" = "Linux" ]; then
  # enable delete key
  bindkey "^[[3~" delete-char
fi

# completion
autoload -U compinit
compinit -u
# ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# prompt
if [ "${OS_NAME}" = "Linux" ]; then
  autoload -U promptinit
  promptinit
  prompt gentoo
fi
if [ "${OS_NAME}" = "Darwin" ]; then
  export PROMPT="%B%F{green}%n@%m%k %B%F{blue}%1~ %# %b%f%k"
fi

# history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# color
if [ "${OS_NAME}" = "Linux" ]; then
  eval "$(dircolors -b /etc/DIR_COLORS)"
  alias ls='ls --color=auto'
  alias grep='grep --colour=auto'
fi
if [ "${OS_NAME}" = "Darwin" ]; then
  export LSCOLORS=ExgxcxdxCxegedabagacad
  alias ls='ls -Gh'
  alias grep='grep --color=auto'
fi

# anyenv
if type anyenv >/dev/null; then
  eval "$(anyenv init -)"
fi

# PATH
if [ -d ~/local/Android/Sdk/emulator ]; then
  PATH=~/local/Android/Sdk/emulator:$PATH
fi
if [ -d ~/local/Android/Sdk/platform-tools ]; then
  PATH=~/local/Android/Sdk/platform-tools:$PATH
fi
if [ -d ~/local/Android/Sdk/cmdline-tools/latest/bin ]; then
  PATH=~/local/Android/Sdk/cmdline-tools/latest/bin:$PATH
fi

# hyprland
if [ -d /run/user/`id -u`/hypr ]; then
  HYPRLAND_INSTANCE_SIGNATURE="$(ls -1t /run/user/`id -u`/hypr | head -1)"
fi

# tmux
if type tmux >/dev/null && [ -z "${TMUX}" ]; then
  if [ -z "$(tmux ls 2>/dev/null | grep -v attached)" ]; then
    tmux
  else
    tmux ls
  fi
fi
