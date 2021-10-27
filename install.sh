#!/bin/bash

sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y
sudo apt-get clean
sudo apt-get autoremove -y
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install xdotool unclutter sed
sudo apt install -y php7.3 php7.3-fpm nginx --no-install-recommends

sudo ln -s $(pwd)/bin/chwifi.sh /usr/bin/chwifi.sh
sudo ln -s $(pwd)/bin/listssid.sh /usr/bin/listssid.sh
sudo ln -s  $(pwd)/webpage /var/www/html/start
sudo cp $(pwd)/nginx/site-default /etc/nginx/sites-enabled/default

cp $(pwd)/kiosk/kiosk.sh /home/pi/kiosk.sh
cp $(pwd)/kiosk/.xinitrc /home/pi/.xinitrc
sudo bash -c 'echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers'
sudo cp $(pwd)/kiosk/kiosk.service /lib/systemd/system/kiosk.service
sudo systemctl enable kiosk.service

echo "Instalación terminada"
echo "Ejecute:"
echo "$ sudo raspi-config"
echo "para habilitar el autologin en consola"

