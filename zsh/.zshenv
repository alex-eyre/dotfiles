export XDG_RUNTIME_DIR=/tmp/runtime-alex
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$XDG_DATA_HOME/tmp

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export HISTFILE="$XDG_DATA_HOME"/zsh/history
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export DOTFILES=$HOME/.local/dotfiles
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/share/latex/bin/x86_64-linux
export PATH=$(pyenv root)/bin:$PATH
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
# export QT_QPA_PLATFORMTHEME=gtk2

export BROWSER=chromium
export SURFRAW_graphical_browser=$BROWSER


export DOTNET_CLI_TELEMETRY_OPTOUT=1 # Microsoft can fuck off
