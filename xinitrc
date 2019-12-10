exec start-pulseaudio-x11 &
exec feh --bg-fill --no-fehbg $HOME/images/mountains.jpg &
exec xrdb -load $XDG_CONFIG_HOME/X11/xresources &
exec statnot $XDG_CONFIG_HOME/statnot/statnot.py &
exec xcalib $HOME/.local/share/LP156WF6_SPK1.icm &
exec dwm
