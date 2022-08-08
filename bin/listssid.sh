#!/bin/bash

DEV=$(iw dev | awk 'FNR == 2 {print $2}')

iwlist $DEV scan | egrep 'ESSID' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/ESSID://g' | sed 's/"//g'
