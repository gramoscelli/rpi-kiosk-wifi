#!/bin/bash
xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/$USER/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/$USER/.config/chromium/Default/Preferences

WIDTH=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
HEIGHT=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)


/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://127.0.0.1/start/ --disable-web-security --user-data-dir="/home/$USER/" --window-position=0,0 --window-size="$WIDTH,$HEIGHT"  --no-sandbox &

while true; do
   xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
   sleep 10
done


xrandr --current | grep '*' | uniq | awk '{print }' | cut -d 'x' -f2
