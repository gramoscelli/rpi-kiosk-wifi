#!/bin/bash

# -------------------- capturing the source folder ---------------------------

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
MY_USER="$USER"
# -------------------- installing kisok service ---------------------------

[ -f /usr/bin/kiosk.sh ] || sudo cp $DIR/kiosk/kiosk.sh /usr/bin/kiosk.sh
[ -f /lib/systemd/system/kiosk.service ]  || sudo cp $DIR/kiosk/kiosk.service /lib/systemd/system/kiosk.service
[ -f /lib/systemd/system/startx.service ]  || sudo cp $DIR/startx/startx.service /lib/systemd/system/startx.service
sudo grep -q "www-data" /etc/sudoers || sudo bash -c 'echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers'
sudo sed -i "s/USER/$USER/g" /lib/systemd/system/kiosk.service
sudo systemctl enable kiosk.service

echo "finish intallation. Please reboot..."

