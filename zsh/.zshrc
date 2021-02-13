# keybind
# emacs style keybind
bindkey -e
# enable delete key
bindkey "^[[3~" delete-char

# completion
autoload -U compinit
compinit

# prompt
autoload -U promptinit
promptinit
prompt gentoo

# history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# color
eval "$(dircolors -b /etc/DIR_COLORS)"
alias ls='ls --color=auto'
alias grep='grep --colour=auto'

# tmux
if type tmux >/dev/null && [ -z "$TMUX" ]; then
  if [ -z "$(tmux ls 2>/dev/null | grep -v attached)" ]; then
    tmux
  else
    tmux ls
  fi
fi
