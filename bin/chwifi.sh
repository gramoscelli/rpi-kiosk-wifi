#!/bin/bash

SSID=$1
WIFIPASS=$2

echo "SSID: $SSID"
sudo sed -i -e"s/^\tssid=.*/\tssid=\"$SSID\"/" /etc/wpa_supplicant/wpa_supplicant.conf

echo "Password: $WIFIPASS"
sudo sed -i -e"s/^\tpsk=.*/\tpsk=\"$WIFIPASS\"/" /etc/wpa_supplicant/wpa_supplicant.conf

reboot

