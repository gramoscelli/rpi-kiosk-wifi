#!/bin/bash

iwlist wlan0 scan | egrep 'Quality' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/^.*\(level=.*dBm\).*$/\1/' | sed 's/level=//g' | sed 's/ dBm//g'
