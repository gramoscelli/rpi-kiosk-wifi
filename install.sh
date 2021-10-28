#!/bin/bash

# -------------------- capturing the source folder ---------------------------

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

# -------------------- doing a packages upgrade ---------------------------

sudo apt clean
sudo apt autoremove -y
sudo apt update
sudo apt upgrade -y

# -------------------- installing x11 server ---------------------------

sudo apt install -y x11-apps xinit xserver-xorg xinit xserver-xorg-video-fbdev x11-xserver-utils unclutter
sudo apt install -y chromium-browser --no-install-recommends

# -------------------- installing tools and web server ---------------------------

sudo apt install -y xdotool unclutter sed
sudo apt install -y php7.3 php7.3-fpm nginx --no-install-recommends

# -------------------- installing wifi tools and wifi site ---------------------------

[ -f /usr/bin/chwifi.sh ] || sudo ln -s $DIR/bin/chwifi.sh /usr/bin/chwifi.sh
[ -f /usr/bin/listssid.sh ] || sudo ln -s $DIR/bin/listssid.sh /usr/bin/listssid.sh
[ -d /var/www/html/start ] || sudo ln -s  $DIR/webpage /var/www/html/start
cmp --silent $DIR/nginx/site-default /etc/nginx/sites-enabled/default  || sudo cp $DIR/nginx/site-default /etc/nginx/sites-enabled/default
sudo systemctl restart nginx

# -------------------- installing kisok service ---------------------------

[ -f /home/pi/kiosk.sh ] || cp $DIR/kiosk/kiosk.sh /home/pi/kiosk.sh
[ -f /lib/systemd/system/kiosk.service ]  || sudo cp $DIR/kiosk/kiosk.service /lib/systemd/system/kiosk.service
[ -f /lib/systemd/system/startx.service ]  || sudo cp $DIR/startx/startx.service /lib/systemd/system/startx.service
sudo grep -q "www-data" /etc/sudoers || sudo bash -c 'echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers'
sudo systemctl enable kiosk.service

echo "finish intallation. Please reboot..."

