#!/bin/bash
COMMAND=$1

screen_count=$(/home/frank/utils/cortile dbus -property Workplace | jq '.Data.ScreenCount')
active_window_id=$(xdotool getwindowfocus)
active_window_screen=""

check_args(){
        if [[ -z $COMMAND || ( "$COMMAND" != 'next' && "$COMMAND" != 'prev' ) ]]; then
                echo "Usage: cortile-move-to-monitor.sh [prev|next]"
                exit 1
        fi
}

get_active_window_screen() {
        active_window_screen=$(/home/frank/utils/cortile dbus -property Clients | jq --argjson ACTIVE "$active_window_id" '.Data.Values.[] | select(.Window.Id==$ACTIVE) | .Latest.Location.Screen')
}

go_next_screen () {
        local target_screen=$((active_window_screen+1))
        if [[ "$target_screen" -ge "$screen_count" ]]; then
                exit 0
                # target_screen=0 # or exit 0
        fi
        /home/frank/utils/cortile dbus -method WindowToScreen "$active_window_id" "$target_screen"
}


go_prev_screen () {
        local target_screen=$((active_window_screen-1))
        if [[ "$target_screen" -lt 0 ]]; then
                exit 0
                # target_screen=$((screen_count-1)) # or exit 0
        fi
        /home/frank/utils/cortile dbus -method WindowToScreen "$active_window_id" "$target_screen"
}

main () {
        check_args
        get_active_window_screen
        if [[ "$COMMAND" == "next" ]]; then
                go_next_screen 
        else
                go_prev_screen
        fi
}

main
