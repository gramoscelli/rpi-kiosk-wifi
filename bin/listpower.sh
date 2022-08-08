#!/bin/bash

DEV=$(iw dev | awk 'FNR == 2 {print $2}')

iwlist $DEV scan | egrep 'Quality' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/^.*\(level=.*dBm\).*$/\1/' | sed 's/level=//g' | sed 's/ dBm//g'
