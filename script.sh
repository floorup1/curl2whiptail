#!/bin/bash
curl https://raw.githubusercontent.com/floorup1/curl2whiptail/main/file --limit-rate 500K -o file-curl.test 2>&1 -# | stdbuf -oL tr '\r' '\n' | stdbuf -oL tr -d '\-#%= ' | stdbuf -oL tr -s ',' '.' | stdbuf -oL cut -d . -f 1 | whiptail --gauge "Downloading" 6 60 0
wget -O file-wget.test https://raw.githubusercontent.com/floorup1/curl2whiptail/main/file 2>&1 | stdbuf -oL tr '\r' '\n' | stdbuf -oL sed -r 's/%.+//' | stdbuf -oL sed 's/.*\.//' | stdbuf -oL tr -d ' ' | whiptail --gauge "Downloading" 6 60 0
#sudo apt list --upgradable 2>&1 | stdbuf -oL sed -r 's/\/.+//'