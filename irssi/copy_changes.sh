#!/usr/bin/env sh
/usr/bin/env gpg2 --encrypt -r "alexeeyre@gmail.com" --output $DOTFILES/irssi/config.gpg $HOME/.irssi/config
