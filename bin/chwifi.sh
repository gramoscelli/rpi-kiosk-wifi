#!/bin/bash

SSID=$1
WIFIPASS=$2

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"


sudo cp $DIR/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf

echo "SSID: $SSID"
sudo sed -i -e"s/SSID/$SSID/g" /etc/wpa_supplicant/wpa_supplicant.conf

echo "Password: $WIFIPASS"
sudo sed -i -e"s/password/$WIFIPASS/g" /etc/wpa_supplicant/wpa_supplicant.conf

sudo systemctl daemon-reload
sudo systemctl restart dhcpcd

