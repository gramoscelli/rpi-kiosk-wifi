#!/bin/bash

sudo apt install -y php
sudo ln -s $(pwd)/bin/chwifi.sh /usr/bin/chwifi.sh
sudo ln -s $(pwd)/bin/listssid.sh /usr/bin/listssid.sh
sudo ln -s  $(pwd)/webpage /var/www/html/start
cp $(pwd)/bin/kiosk.sh /home/pi/kiosk.sh
sudo bash -c 'echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers'

echo "Instalación terminada"
