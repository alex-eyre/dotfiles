exec dockd --daemon &
exec picom -bcCGf -i 0.8 -e 0.8 --no-fading-openclose --sw-opti &
exec nitrogen --set-tiled $HOME/images/falcon\ heavy.jpg &
exec prime-offload &
exec xrdb -load $XDG_CONFIG_HOME/X11/xresources &
killall notification-daemon &> /dev/null
statnot $XDG_CONFIG_HOME/statnot/statnot.py &
monitor init &
exec dwm
