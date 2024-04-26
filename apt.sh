#!/bin/bash
packages_string=$(apt list --upgradable 2>&1 | sed -r 's/\/.+//' | sed 's/.*\.//')
echo $packages_string
echo
packages_array=($(echo $packages_string | tr ' ' '\n'))
declare -a msgs=${packages_array[@]}
for i in "${msgs[@]}"
do
    echo $i
done
n=${#packages_array[@]}
#echo
#msgs[@]="Устанавливается "${packages_array[@]}
#echo ${msgs[@]}
#for (( k=0; k < n; k++ ))
#do
#msgs[k]="Устанавливается "${packages_array[k]}
#echo ${msgs[k]}
#{commands[k]}="apt install -y "${packages_array[k]}
#echo ${commands[k]}
#done

#j=0
#while [ "$j" -lt "$n" ]; do
#    pct=$(( j * 100 / n ))
#    echo XXX
#    echo $j
#    echo "${msgs[j]}"
#    echo XXX
#    echo "$pct"
#    eval "${commands[j]}"
#    j=$((j + 1))
#    sleep 1s
#done | whiptail --title "Gauge" --gauge "Please wait..." 10 60 0