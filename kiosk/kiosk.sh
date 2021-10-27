#!/bin/bash
xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

sudo su - pi X &
# sleep 5
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://127.0.0.1/start/ --disable-web-security --user-data-dir="/home/pi/" &


while true; do
   xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
   sleep 10
done


