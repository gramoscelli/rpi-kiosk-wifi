#!/bin/bash

sudo apt install php
sudo ln -s $(pwd)/bin/chwifi.sh /usr/bin/chwifi.sh
sudo ln -s $(pwd)/bin/listssid.sh /usr/bin/listssid.sh
sudo ln -s  $(pwd)/webpage /var/www/html/start
sudo bash -c 'echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers'

echo "Instalación terminada"
