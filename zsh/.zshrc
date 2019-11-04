cd $HOME
autoload -Uz compinit
_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#_comp_files )); then
	  compinit -i -C
  else
	  compinit -i
fi
unset _comp_files
source <(antibody init)

alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"

ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

alias sxiv_raw="/usr/bin/sxiv"
alias sxiv="sxiv -ar"

# Tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=true
antibody bundle robbyrussell/oh-my-zsh path:plugins/tmux

#VIM is the way my friends
bindkey -v
export KEY_TIMEOUT=0
antibody bundle robbyrussell/oh-my-zsh path:plugins/vi-mode

# z/fasd init
eval "$(fasd --init posix-alias zsh-hook)"
# Completions for exa
antibody bundle ogham/exa path:contrib/completions.zsh kind:fpath
ZSH_DISABLE_COMPFIX=true
# Ergonomic aliases
antibody bundle robbyrussell/oh-my-zsh folder:plugins/common-aliases
# Replace the ls binds with exa ones
antibody bundle alex-eyre/zsh-aliases-exa

# Git extensions
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:lib/git.zsh

# Prompt
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL="\ufb26"
SPACESHIP_CHAR_SUFFIX="] "
SPACESHIP_CHAR_PREFIX="["
SPACESHIP_GIT_SHOW=false
SPACESHIP_GIT_BRANCH_SHOW=false
SPACESHIP_GIT_STATUS_SHOW=false
antibody bundle denysdovhan/spaceship-prompt
spaceship_vi_mode_enable
setopt correct

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
