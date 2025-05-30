polybar-msg cmd quit

displays=$(xrandr | grep connected | awk '{print$1}')
for d in $displays
do
        MONITOR=$d polybar &
done
