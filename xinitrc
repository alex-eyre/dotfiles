exec setxkbmap -layout us -variant dvp &
# exec picom --active-opacity 0.8 -i 0.8 &
exec nitrogen --set-auto $HOME/images/mountains.jpg &
exec xrdb -load $XDG_CONFIG_HOME/X11/xresources &
sxhkd -m 1 &
exec xcalib $HOME/.local/share/LP156WF6_SPK1.icm &
bspwm
