autoload -Uz compinit
autoload -U bashcompinit
bashcompinit
_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#_comp_files )); then
	  compinit -i -C
  else
	  compinit -i
fi
unset _comp_files
source <(antibody init)

function restart_polybar(){
	killall polybar > /dev/null
	polybar -c $HOME/.config/polybar/config.ini status_top &!
}

function t() {
	cd $(mktemp -d /tmp/$1.XXXX)
}

alias gcommit="GIT_COMMITER_EMAIL=alex.eyre@cambridgeconsultants.com git commit"
alias gcommit_personal="GIT_COMMITER_EMAIL=alexeeyre@gmail.com git commit"

ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

# Tmux
if [ "$TERM" != "eterm-color" ]; then
    ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_AUTOCONNECT=true
    ZSH_TMUX_AUTOQUIT=true
    export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
    ZSH_TMUX_CONFIG=$HOME/.config/tmux/tmux.conf
    antibody bundle robbyrussell/oh-my-zsh path:plugins/tmux
fi

# Completions for exa
antibody bundle ogham/exa path:contrib/completions.zsh kind:fpath
ZSH_DISABLE_COMPFIX=true

# Ergonomic aliases
antibody bundle robbyrussell/oh-my-zsh folder:plugins/common-aliases

antibody bundle lukechilds/zsh-better-npm-completion

# Replace the ls binds with exa ones
antibody bundle alex-eyre/zsh-aliases-exa

# Git extensions
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:lib/git.zsh


# Vim
if [ "$TERM" != "eterm-color" ]; then
    bindkey -v
    MODE_CURSOR_VICMD="#fc20bb block"
    MODE_CURSOR_VIINS="#fc20bb blinking bar"
    MODE_CURSOR_SEARCH="#fc20bb steady underline"
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
    bindkey -v '^?' backward-delete-char
    antibody bundle softmoth/zsh-vim-mode
    export KEYTIMEOUT=1
fi


# # Prompt
# SPACESHIP_RUST_SYMBOL="\ue7a8"
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_PROMPT_SEPARATE_LINE=false
# SPACESHIP_CHAR_SYMBOL="\ufb26"
# SPACESHIP_CHAR_SUFFIX="] "
# SPACESHIP_CHAR_PREFIX="["
# SPACESHIP_GIT_SHOW=false
# SPACESHIP_GIT_BRANCH_SHOW=false
# SPACESHIP_GIT_STATUS_SHOW=false
# antibody bundle denysdovhan/spaceship-prompt
AGKOZAK_MULTILINE=0
AGKOZAK_MULTILINE=0
AGKOZAK_PROMPT_CHAR=( λ %# : )

antibody bundle agkozak/agkozak-zsh-prompt
