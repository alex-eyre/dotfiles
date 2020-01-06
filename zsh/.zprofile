if [ "$(tty)" = /dev/tty1 ]; then
    export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
    export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
    exec startx
fi

export PATH="$HOME/.cargo/bin:$PATH"
