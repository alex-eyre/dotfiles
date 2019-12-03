export XDG_CONFIG_HOME=$HOME/.config
export XDG_RUNTIME_DIR=/tmp
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$XDG_DATA_HOME/tmp

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export HISTFILE="$XDG_DATA_HOME"/zsh/history
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export DOTFILES=$HOME/.local/dotfiles
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/share/latex/bin/x86_64-linux
export PATH=$(pyenv root)/bin:$PATH
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android

export DOTNET_CLI_TELEMETRY_OPTOUT=1 # Microsoft can fuck off
