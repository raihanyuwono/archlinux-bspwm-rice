#!/usr/bin/env bash
#
## Terminate already running bar instances
## If all your bars have ipc enabled, you can use 
#polybar-msg cmd quit
## Otherwise you can use the nuclear option:
killall -q polybar

# wait until processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#polybar example >>/tmp/polybar1.log 2>&1 &
#polybar bar_main 2>&1 | tee -a /tmp/polybar1.log & disown

# Launch bar
polybar bar_main &

if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
    echo "connected"
    polybar bar_external &
fi
echo "Bars launched..."
