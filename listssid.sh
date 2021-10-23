#!/bin/bash

iwlist wlan0 scan | egrep 'ESSID' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/ESSID://g' | sed 's/"//g'
