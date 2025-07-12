#!/bin/bash
COMMAND=$1

screen_count=$(/home/frank/utils/cortile dbus -property Workplace | jq '.Data.ScreenCount')

check_args(){
        if [[ -z $COMMAND || ( "$COMMAND" != 'next' && "$COMMAND" != 'prev' ) ]]; then
                echo "Usage: cortile-move-to-monitor.sh [prev|next]"
                exit 1
        fi
}

get_active_window_screen() {
        local active_window_screen=$(/home/frank/utils/cortile dbus -property Clients | jq '.Data.Values.[] | select(.Window.Id == 90177539) | .Latest.Location.Screen')

        echo $active_window_screen
}

go_next_screen () {
        local window_id="$1"
        local window_screen="$2"
        local target_screen=$((window_screen+1))
        if [[ "$target_screen" -ge "$screen_count" ]]; then
                exit 0
                # target_screen=0 # or exit 0
        fi
        /home/frank/utils/cortile dbus -method WindowToScreen "$window_id" "$target_screen"
}


go_prev_screen () {
        local window_id="$1"
        local window_screen="$2"
        local target_screen=$((window_screen-1))
        if [[ "$target_screen" -lt 0 ]]; then
                exit 0
                # target_screen=$((screen_count-1)) # or exit 0
        fi
        /home/frank/utils/cortile dbus -method WindowToScreen "$window_id" "$target_screen"
}

main () {
        check_args
        local active_window_id=$(xdotool getwindowfocus)
        local active_window_screen=$(get_active_window_screen)
        if [[ "$COMMAND" == "next" ]]; then
                go_next_screen $active_window_id $active_window_screen 
        else
                go_prev_screen $active_window_id $active_window_screen
        fi
}

main
