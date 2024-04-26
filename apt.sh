#!/bin/bash
packages_string=$(apt list --upgradable 2>&1 | sed -r 's/\/.+//' | sed 's/.*\.//')
echo $packages_string
echo
packages_array=($(echo $packages_string | tr ' ' '\n'))
for i in "${packages_array[@]}"
do
    echo $i
done
n=${#packages_array[@]}
j=0
while [ "$j" -lt "$n" ]; do
    pct=$(( j * 100 / n ))
    echo XXX
    echo $j
    echo "${msgs[j]}"
    echo XXX
    echo "$pct"
    eval "${commands[j]}"
    j=$((j + 1))
    sleep 1s
done | whiptail --title "Gauge" --gauge "Please wait..." 10 60 0