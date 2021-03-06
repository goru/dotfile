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

# tmux
if type tmux >/dev/null && [ -z "${TMUX}" ]; then
  if [ -z "$(tmux ls 2>/dev/null | grep -v attached)" ]; then
    tmux
  else
    tmux ls
  fi
fi
