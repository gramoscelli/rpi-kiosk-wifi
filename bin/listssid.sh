#!/bin/bash

DEV=$(iw dev | awk 'FNR == 2 {print $2}')

nmcli dev wifi list | awk -F'  +'  '{if (NR!=1) {print $3}}'
