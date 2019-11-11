# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source $HOME/.cargo/env
export DOTFILES=$HOME/.local/dotfiles
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$(ruby -e 'puts Gem.user_dir')/bin
export PATH=$PATH:$HOME/.local/share/latex/bin/x86_64-linux
export XDG_CONFIG_HOME=$HOME/.config
