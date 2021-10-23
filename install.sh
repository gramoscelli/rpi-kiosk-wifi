#!/bin/bash

sudo apt install php
sudo ln -s /usr/bin/chwifi.sh ./bin/chwifi.sh
sudo ln -s /usr/bin/listssid.sh ./bin/listssid.sh
sudo rm -r /var/www/html
sudo ln -s /var/www/html ./webpage
echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

echo "Instalación terminada"
