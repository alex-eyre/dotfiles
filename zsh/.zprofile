if [ "$(tty)" = /dev/tty1 ]; then
    exec startx
fi

export PATH="$HOME/.cargo/bin:$PATH"
