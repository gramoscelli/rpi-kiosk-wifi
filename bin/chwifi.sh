#!/bin/bash

SSID=$1
WIFIPASS=$2


sudo cp $(pwd)/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf

echo "SSID: $SSID"
sudo sed -i -e"s/SSID/$SSID/g" /etc/wpa_supplicant/wpa_supplicant.conf

echo "Password: $WIFIPASS"
sudo sed -i -e"s/password/$WIFIPASS/g" /etc/wpa_supplicant/wpa_supplicant.conf

sudo systemctl daemon-reload
sudo systemctl restart dhcpcd

